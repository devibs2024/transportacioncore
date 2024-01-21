using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Models;
using TransportationCore.Data;
using TransportationCore.CustomError;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using AutoMapper;
using TransportationCore.Data.Dtos.PlanificacionEjecucion;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Dtos.PlanificacionDetalle;
using TransportationCore.Data.Utilidades;
using TransportationCore.Enumeradores;
using Microsoft.CodeAnalysis.VisualBasic.Syntax;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class EjecucionPlanificacionesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;

        public EjecucionPlanificacionesController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            this.mapper = mapper;
        }

        // GET: api/DetallePlanificaciones
        [HttpGet("{IdPlanificacion}")]
        public async Task<ActionResult<IEnumerable<EjecucionPlanificacion>>> GetDetallesPlanificacion(decimal IdPlanificacion)
        {
            var ejecucionPlanificacion = await _context.EjecucionesPlanificacion
                                                      .Where(c => c.IdPlanificacion == IdPlanificacion)
                                                      .ToListAsync();


            return Ok(ejecucionPlanificacion);
        }

        // GET: api/DetallePlanificaciones/{id}
        [HttpGet("{IdPlanificacion},{IdDetalle}")]
        public async Task<ActionResult<EjecucionPlanificacion>> GetDetallePlanificacion(decimal IdPlanificacion, decimal IdDetalle)
        {
            var ejecucionPlanificacion = await _context.EjecucionesPlanificacion
                                                       .FirstOrDefaultAsync(dp => dp.IdEjecucionPlanificacion == IdDetalle
                                                                               && dp.IdPlanificacion == IdPlanificacion);

            if (ejecucionPlanificacion == null)
            {
                return NotFound(new ErrorResponse("Detalle de planificación no encontrado."));
            }

            return Ok(ejecucionPlanificacion);
        }

        [HttpPost]
        public async Task<ActionResult> CreateEjecucionPlanificacion([FromBody] EjecucionPlanificacionCrearDto ejecucionPlanificacionDto)
        {

            var ejecucionPlanificacion = mapper.Map<EjecucionPlanificacion>(ejecucionPlanificacionDto);

            TimeSpan inicio = new TimeSpan(ejecucionPlanificacionDto.HoraE, ejecucionPlanificacionDto.MinutoE, 00);
            TimeSpan salida = new TimeSpan(ejecucionPlanificacionDto.HoraF, ejecucionPlanificacionDto.MinutoF, 00);
            ejecucionPlanificacion.TipoRegistro = (int)EnumTipoRegistro.RegistroManual;
            ejecucionPlanificacion.HoraInicio = inicio;
            ejecucionPlanificacion.HoraFin = salida;

            //### VALIDACIÓN DE FECHAS DE PLANIFICACION

            var planificacion = await _context.Planificaciones.AnyAsync(p => p.IdPlanificacion == ejecucionPlanificacion.IdPlanificacion && p.FechaDesde <= ejecucionPlanificacion.Fecha && p.FechaHasta >= ejecucionPlanificacion.Fecha);
            if (planificacion == false)
                return BadRequest(new ErrorResponse("La fecha del detalle no coincide con el rango de la planificacion."));

            //### VALIDACIÓN DETALLE DE PLANIFICACION

            if (ejecucionPlanificacion.IdDetallePlanificacion == 0)
            {
                var detalle = await _context.DetallesPlanificacion.FirstOrDefaultAsync(x => x.IdPlanificacion == ejecucionPlanificacion.IdPlanificacion && x.IdOperador == ejecucionPlanificacion.IdOperador && x.IdTienda == ejecucionPlanificacion.IdTienda && x.Fecha == ejecucionPlanificacion.Fecha);
                if (detalle != null)
                    ejecucionPlanificacion.IdDetallePlanificacion = detalle.IdDetallePlanificacion;
            }

            if (ejecucionPlanificacion.IdDetallePlanificacion == 0)
                return BadRequest(new ErrorResponse("No hay detalle de planificacion para este registro."));

            //### VALIDACION DE REGISTRO EN EL DIA

            var ejecucion = await _context.EjecucionesPlanificacion.AnyAsync(x => x.IdOperador == ejecucionPlanificacion.IdOperador && x.IdTienda == ejecucionPlanificacion.IdTienda && x.Fecha == ejecucionPlanificacion.Fecha);
            if (ejecucion == true)
                return BadRequest(new ErrorResponse("La fecha de ejecución ya ha sido registrada anteriormente."));

            //### TARJETA DE GASOLNA VIGENTE 

            var tarjeta = await _context.AsignacionTarjeta.FirstOrDefaultAsync(x => x.IdEmpleado == ejecucionPlanificacion.IdOperador && x.IsDeleted == false && x.TarjetaPrincipal == true);
            if (tarjeta == null)
            {
                ejecucionPlanificacion.MontoCombustible = 0;
                ejecucionPlanificacion.IdTarjeta = 0;
            }
            else
            {
                ejecucionPlanificacion.IdTarjeta = tarjeta.IdTarjeta;
                ejecucionPlanificacion.MontoCombustible = tarjeta.MontoDiario;
            }

            //### VEHICULO UTILIZADO

            if (ejecucionPlanificacion.IdVehiculo == 0)
            {
                var vehiculoasig = await _context.VehiculoOperadores.FirstOrDefaultAsync(x => x.IdEmpleado == ejecucionPlanificacion.IdOperador);
                if (vehiculoasig != null)
                {
                    ejecucionPlanificacion.IdVehiculo = vehiculoasig.IdVehiculo;
                }
            }

            if (ejecucionPlanificacion.IdVehiculo > 0)
            {
                var vehiculo = await _context.Vehiculos.FirstOrDefaultAsync(x => x.IdVehiculo == ejecucionPlanificacion.IdVehiculo);
                if (vehiculo != null)
                {
                    ejecucionPlanificacion.IdTipoVehiculo = vehiculo.IdTipoVehiculo;
                }
            }

            if (ejecucionPlanificacion.IdVehiculo == 0)
                return BadRequest(new ErrorResponse("Se requiere el vehiculo utilizado."));

            if (ejecucionPlanificacion.IdTipoVehiculo == 0)
                return BadRequest(new ErrorResponse("Se requiere el tipo de vehiculo utilizado."));

            await _context.EjecucionesPlanificacion.AddAsync(ejecucionPlanificacion);
            _context.SaveChanges();

            return NoContent();
        }

        // PUT: api/DetallePlanificaciones/{id}
        [HttpPut("{IdDetalle}")]
        public async Task<IActionResult> UpdateEjecucionPlanificacion(decimal IdDetalle, [FromBody] EjecucionPlanificacionUpdateDto ejecucionPlanificacionDto)
        {
            if (IdDetalle != ejecucionPlanificacionDto.IdEjecucionPlanificacion)
            {
                return BadRequest(new ErrorResponse("El ID proporcionado no coincide con el ID del detalle de planificación."));
            }

            var ejecucionPlanificacion = mapper.Map<EjecucionPlanificacion>(ejecucionPlanificacionDto);
            TimeSpan inicio = new TimeSpan(ejecucionPlanificacionDto.HoraE, ejecucionPlanificacionDto.MinutoE, 00);
            TimeSpan salida = new TimeSpan(ejecucionPlanificacionDto.HoraF, ejecucionPlanificacionDto.MinutoF, 00);
            ejecucionPlanificacion.HoraInicio = inicio;
            ejecucionPlanificacion.HoraFin = salida;

            //### VALIDACIÓN DE FECHAS DE PLANIFICACION

            var planificacion = await _context.Planificaciones.AnyAsync(p => p.IdPlanificacion == ejecucionPlanificacion.IdPlanificacion && p.FechaDesde <= ejecucionPlanificacion.Fecha && p.FechaHasta >= ejecucionPlanificacion.Fecha);
            if (planificacion == false)
                return BadRequest(new ErrorResponse("La fecha del detalle no coincide con el rango de la planificacion."));

            //### VALIDACIÓN DETALLE DE PLANIFICACION

            if (ejecucionPlanificacion.IdDetallePlanificacion == 0)
            {
                var detalle = await _context.DetallesPlanificacion.FirstOrDefaultAsync(x => x.IdPlanificacion == ejecucionPlanificacion.IdPlanificacion && x.IdOperador == ejecucionPlanificacion.IdOperador && x.IdTienda == ejecucionPlanificacion.IdTienda && x.Fecha == ejecucionPlanificacion.Fecha);
                if (detalle != null)
                    ejecucionPlanificacion.IdDetallePlanificacion = detalle.IdDetallePlanificacion;
            }

            if (ejecucionPlanificacion.IdDetallePlanificacion == 0)
                return BadRequest(new ErrorResponse("No hay detalle de planificacion para este registro."));

            //### VALIDACION DE REGISTRO EN EL DIA

            var ejecucion = await _context.EjecucionesPlanificacion.AnyAsync(x => x.IdOperador == ejecucionPlanificacion.IdOperador && x.IdTienda == ejecucionPlanificacion.IdTienda && x.Fecha == ejecucionPlanificacion.Fecha && x.IdEjecucionPlanificacion != ejecucionPlanificacion.IdEjecucionPlanificacion);
            if (ejecucion == true)
                return BadRequest(new ErrorResponse("La fecha de ejecución ya ha sido registrada anteriormente."));

            //### TARJETA DE GASOLNA VIGENTE 

            var tarjeta = await _context.AsignacionTarjeta.FirstOrDefaultAsync(x => x.IdEmpleado == ejecucionPlanificacion.IdOperador && x.IsDeleted == false && x.TarjetaPrincipal == true);
            if (tarjeta == null)
            {
                ejecucionPlanificacion.MontoCombustible = 0;
                ejecucionPlanificacion.IdTarjeta = 0;
            }
            else
            {
                ejecucionPlanificacion.IdTarjeta = tarjeta.IdTarjeta;
                ejecucionPlanificacion.MontoCombustible = tarjeta.MontoDiario;
            }

            //### VEHICULO UTILIZADO

            if (ejecucionPlanificacion.IdVehiculo == 0)
            {
                var vehiculoasig = await _context.VehiculoOperadores.FirstOrDefaultAsync(x => x.IdEmpleado == ejecucionPlanificacion.IdOperador);
                if (vehiculoasig != null)
                {
                    ejecucionPlanificacion.IdVehiculo = vehiculoasig.IdVehiculo;
                }
            }

            if (ejecucionPlanificacion.IdVehiculo > 0)
            {
                var vehiculo = await _context.Vehiculos.FirstOrDefaultAsync(x => x.IdVehiculo == ejecucionPlanificacion.IdVehiculo);
                if (vehiculo != null)
                {
                    ejecucionPlanificacion.IdTipoVehiculo = vehiculo.IdTipoVehiculo;
                }
            }

            if (ejecucionPlanificacion.IdVehiculo == 0)
                return BadRequest(new ErrorResponse("Se requiere el vehiculo utilizado."));

            if (ejecucionPlanificacion.IdTipoVehiculo == 0)
                return BadRequest(new ErrorResponse("Se requiere el tipo de vehiculo utilizado."));


            _context.Entry(ejecucionPlanificacion).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DetallePlanificacionExists(IdDetalle))
                {
                    return NotFound(new ErrorResponse("Detalle de planificación no encontrado."));
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }


        private bool DetallePlanificacionExists(decimal IdDetalle)
        {
            return _context.EjecucionesPlanificacion.Any(dp => dp.IdEjecucionPlanificacion == IdDetalle);
        }

    }
}
