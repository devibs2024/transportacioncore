using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Models;
using TransportationCore.Data;
using TransportationCore.CustomError;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using AutoMapper;
using TransportationCore.Data.Dtos.PlanificacionDetalle;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class DetallePlanificacionesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public DetallePlanificacionesController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }

        // GET: api/DetallePlanificaciones
        [HttpGet("{IdPlanificacion}")]
        public async Task<ActionResult<IEnumerable<DetallePlanificacion>>> GetDetallesPlanificacion(decimal IdPlanificacion)
        {
            var detallesPlanificacion = await _context.DetallesPlanificacion
                                                      .Where(c => c.IdPlanificacion == IdPlanificacion)
                                                      .ToListAsync();


            return Ok(detallesPlanificacion);
        }

        // GET: api/DetallePlanificaciones/{id}
        [HttpGet("{IdPlanificacion},{IdDetalle}")]
        public async Task<ActionResult<DetallePlanificacion>> GetDetallePlanificacion(decimal IdPlanificacion, decimal IdDetalle)
        {
            var detallePlanificacion = await _context.DetallesPlanificacion
                                                     .FirstOrDefaultAsync(dp => dp.IdDetallePlanificacion == IdDetalle
                                                                            && dp.IdPlanificacion == IdPlanificacion);

            if (detallePlanificacion == null)
            {
                return NotFound(new ErrorResponse("Detalle de planificación no encontrado."));
            }

            return Ok(detallePlanificacion);
        }

        // POST: api/DetallePlanificaciones
        [HttpPost]
        public async Task<ActionResult> CreateDetallePlanificacion([FromBody] DetallePlanificacionCrearDto detallePlanificacionDto)
        {
            List<DetallePlanificacion> lstDetalles = new List<DetallePlanificacion>();

            while (detallePlanificacionDto.Fecha <= detallePlanificacionDto.FechaHasta)
            {
                var detallePlanificacion = mapper.Map<DetallePlanificacion>(detallePlanificacionDto);
                TimeSpan inicio = new TimeSpan(detallePlanificacionDto.HoraE, detallePlanificacionDto.MinutoE, 00);
                TimeSpan salida = new TimeSpan(detallePlanificacionDto.HoraF, detallePlanificacionDto.MinutoF, 00);
                detallePlanificacion.HoraInicio = inicio;
                detallePlanificacion.HoraFin = salida;

                if (await ValidarHorario(detallePlanificacion.IdOperador, detallePlanificacion.Fecha
                                       , detallePlanificacion.HoraInicio, detallePlanificacion.HoraFin, 0))
                {
                    return BadRequest(new ErrorResponse($"Conflicto de turnos para el empleado {detallePlanificacion.IdOperador}, en la fecha {detallePlanificacion.Fecha}. No se pueden asignar turnos que se crucen."));
                }
                else if (await ValidarDetallePlanificacion(detallePlanificacion.IdPlanificacion, detallePlanificacion.Fecha) == false)
                {
                    return BadRequest(new ErrorResponse("La fecha del detalle no coincide con el rango de la planificacion."));
                }

                lstDetalles.Add(detallePlanificacion);
                detallePlanificacionDto.Fecha = detallePlanificacionDto.Fecha.AddDays(1);
            }


            await _context.DetallesPlanificacion.AddRangeAsync(lstDetalles);
            _context.SaveChanges();

            return NoContent();
        }

        // PUT: api/DetallePlanificaciones/{id}
        [HttpPut("{IdDetalle}")]
        public async Task<IActionResult> UpdateDetallePlanificacion(decimal IdDetalle, [FromBody] DetallePlanificacionUpdateDto detallePlanificacionDto)
        {
            if (IdDetalle != detallePlanificacionDto.IdDetallePlanificacion)
            {
                return BadRequest(new ErrorResponse("El ID proporcionado no coincide con el ID del detalle de planificación."));
            }

            var detallePlanificacion = mapper.Map<DetallePlanificacion>(detallePlanificacionDto);
            TimeSpan inicio = new TimeSpan(detallePlanificacionDto.HoraE, detallePlanificacionDto.MinutoE, 00);
            TimeSpan salida = new TimeSpan(detallePlanificacionDto.HoraF, detallePlanificacionDto.MinutoF, 00);
            detallePlanificacion.HoraInicio = inicio;
            detallePlanificacion.HoraFin = salida;


            if (await ValidarHorario(detallePlanificacion.IdOperador, detallePlanificacion.Fecha
                            , detallePlanificacion.HoraInicio, detallePlanificacion.HoraFin
                            , detallePlanificacion.IdDetallePlanificacion))
            {
                return BadRequest(new ErrorResponse("No es posible asignarle este horario al operador, favor validar."));
            }
            else if(await ValidarDetallePlanificacion(detallePlanificacion.IdPlanificacion,detallePlanificacion.Fecha) == false)
            {
                return BadRequest(new ErrorResponse("La fecha del detalle no coincide con el rango de la planificacion."));
            }



            _context.Entry(detallePlanificacion).State = EntityState.Modified;

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

        // DELETE: api/DetallePlanificaciones/{id}
        [HttpDelete("{IdPlanificacion},{IdDetalle}")]
        public async Task<IActionResult> DeleteDetallePlanificacion(decimal IdPlanificacion, decimal IdDetalle)
        {
            await softDeleteService.SoftDelete<DetallePlanificacion>(IdPlanificacion, IdDetalle);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool DetallePlanificacionExists(decimal IdDetalle)
        {
            return _context.DetallesPlanificacion.Any(dp => dp.IdDetallePlanificacion == IdDetalle);
        }

        private async Task<bool> ValidarHorario(long IdOperador, DateTime Fecha, TimeSpan start, TimeSpan end, decimal IdDetalle)
        {

            if (IdDetalle == 0)
            {
                var detallesPlanificacion = await _context.DetallesPlanificacion
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
                var detallesPlanificacion = await _context.DetallesPlanificacion
                                                          .Where(dp => dp.IdOperador == IdOperador
                                                                    && dp.Fecha == Fecha
                                                                    && dp.IdDetallePlanificacion != IdDetalle).ToListAsync();

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
