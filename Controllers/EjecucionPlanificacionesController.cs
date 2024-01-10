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
            ejecucionPlanificacion.MontoCombustible = await GetMontoDiarioCombustible(ejecucionPlanificacion.IdOperador);

            if (await ValidarHorario(ejecucionPlanificacion.IdOperador, ejecucionPlanificacion.Fecha
                                   , ejecucionPlanificacion.HoraInicio, ejecucionPlanificacion.HoraFin, 0))
            {
                return BadRequest(new ErrorResponse($"Conflicto de turnos para el empleado {ejecucionPlanificacion.IdOperador}, en la fecha {ejecucionPlanificacion.Fecha}. No se pueden asignar turnos que se crucen."));
            }
            else if (await ValidarDetallePlanificacion(ejecucionPlanificacion.IdPlanificacion, ejecucionPlanificacion.Fecha) == false)
            {
                return BadRequest(new ErrorResponse("La fecha del detalle no coincide con el rango de la planificacion."));
            }

            await _context.EjecucionesPlanificacion.AddAsync(ejecucionPlanificacion);
            _context.SaveChanges();

            return NoContent();
        }

        private async Task<decimal> GetMontoDiarioCombustible(long idOperador)
        {
            var tarjeta = await _context.AsignacionTarjeta.FirstOrDefaultAsync(x=>x.IdEmpleado == idOperador);

            if (tarjeta == null) return 0;

            return tarjeta.MontoDiario;
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
            ejecucionPlanificacion.MontoCombustible = await GetMontoDiarioCombustible(ejecucionPlanificacion.IdOperador);

            if (await ValidarHorario(ejecucionPlanificacion.IdOperador, ejecucionPlanificacion.Fecha
                            , ejecucionPlanificacion.HoraInicio, ejecucionPlanificacion.HoraFin
                            , ejecucionPlanificacion.IdEjecucionPlanificacion))
            {
                return BadRequest(new ErrorResponse("No es posible asignarle este horario al operador, favor validar."));
            }
            else if (await ValidarDetallePlanificacion(ejecucionPlanificacion.IdPlanificacion, ejecucionPlanificacion.Fecha) == false)
            {
                return BadRequest(new ErrorResponse("La fecha del detalle no coincide con el rango de la planificacion."));
            }



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

        private async Task<bool> ValidarHorario(long IdOperador, DateTime Fecha, TimeSpan start, TimeSpan end, decimal IdDetalle)
        {

            if (IdDetalle == 0)
            {
                var detallesPlanificacion = await _context.EjecucionesPlanificacion
                                                           .Where(dp => dp.IdOperador == IdOperador
                                                                     && dp.Fecha == Fecha).ToListAsync();

                foreach (var detalle in detallesPlanificacion)
                {
                    if ((start >= detalle.HoraInicio && start < detalle.HoraFin)
                     || (end > detalle.HoraInicio && end <= detalle.HoraFin)
                     || (start <= detalle.HoraInicio && end >= detalle.HoraFin))
                    {
                        return true;
                    }
                }
            }
            else
            {
                var detallesPlanificacion = await _context.EjecucionesPlanificacion
                                                          .Where(dp => dp.IdOperador == IdOperador
                                                                    && dp.Fecha == Fecha
                                                                    && dp.IdEjecucionPlanificacion != IdDetalle).ToListAsync();

                foreach (var detalle in detallesPlanificacion)
                {
                    if ((start >= detalle.HoraInicio && start < detalle.HoraFin)
                     || (end > detalle.HoraInicio && end <= detalle.HoraFin)
                     || (start <= detalle.HoraInicio && end >= detalle.HoraFin))
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        private async Task<bool> ValidarDetallePlanificacion(decimal IdPlanificacion, DateTime Fecha)
        {

            var planificacion = await _context.Planificaciones.AnyAsync(p => p.IdPlanificacion == IdPlanificacion
                                                                     && p.FechaDesde <= Fecha
                                                                     && p.FechaHasta >= Fecha);

            return planificacion;
        }

    }
}
