using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Models;
using TransportationCore.Data;
using TransportationCore.CustomError;
using System.Security.Cryptography.Xml;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using AutoMapper;
using TransportationCore.Data.Dtos.Planificacion;
using TransportationCore.Data.Utilidades;
using TransportationCore.Enumeradores;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Dtos.Tarjeta;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class PlanificacionesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public PlanificacionesController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        // GET: api/Planificaciones
        [HttpGet]
        public IActionResult GetPlanificaciones()
        {
            var planificaciones = _context.Planificaciones.Include(x => x.Coordinador).ToList();
            return Ok(planificaciones);
        }

        // GET: api/Planificaciones/{id}
        [HttpGet("{id}")]
        public IActionResult GetPlanificacion(decimal id)
        {
            var planificacion = _context.Planificaciones.Include(x => x.Coordinador).FirstOrDefault(p => p.IdPlanificacion == id);

            if (planificacion == null)
            {
                return NotFound(new ErrorResponse("Planificación no encontrada."));
            }

            return Ok(planificacion);
        }

        // GET: api/Planificaciones/{id}
        [HttpGet("{IdCoordinador},{IdPlanificacion}")]
        public ActionResult GetPlanificacion(long IdCoordinador, decimal IdPlanificacion)
        {

            var planificaciones = _context.Planificaciones.Include(x => x.Coordinador).Where(x => x.IdCoordinador == IdCoordinador).ToList();

            return Ok(planificaciones);
        }

        [HttpPost]
        public IActionResult CreatePlanificacion([FromBody] PlanificacionCrearDto planificacionDto)
        {
            var existePlanificacion = _context.Planificaciones.Any(p =>
                p.IdCoordinador == planificacionDto.IdCoordinador &&
                p.FechaDesde <= planificacionDto.FechaHasta &&
                p.FechaHasta >= planificacionDto.FechaDesde
            );

            if (existePlanificacion)
            {
                return BadRequest(new ErrorResponse("Ya existe una planificación para el coordinador y el rango de fechas especificado."));
            }
            else
            {
                if (planificacionDto.FechaDesde < DateTime.Now)
                {
                    return BadRequest(new ErrorResponse("No es posible agregar una planificacion, con fecha pasada"));
                }
                else if (planificacionDto.FechaHasta < planificacionDto.FechaDesde)
                {
                    return BadRequest(new ErrorResponse("La fecha proporcionada no es valida, favor validar."));
                }
                else if (planificacionDto.FrecuenciaId == (int)EnumFrecuencia.Semanal)
                {
                    if (planificacionDto.FechaHasta > planificacionDto.FechaDesde.AddDays(6)
                    || planificacionDto.FechaHasta <= planificacionDto.FechaDesde.AddDays(5))
                    {
                        return BadRequest(new ErrorResponse("La fechas proporcionadas no son validas, segun la frecuencia especificada."));
                    }
                }
                else if (planificacionDto.FrecuenciaId == (int)EnumFrecuencia.Quincenal)
                {
                    if (planificacionDto.FechaHasta > planificacionDto.FechaDesde.AddDays(14)
                    || planificacionDto.FechaHasta <= planificacionDto.FechaDesde.AddDays(13))
                    {
                        return BadRequest(new ErrorResponse("La fechas proporcionadas no son validas, segun la frecuencia especificada."));
                    }
                }
            }

            var planificacion = mapper.Map<Planificacion>(planificacionDto);

            _context.Planificaciones.Add(planificacion);
            _context.SaveChanges();

            return Ok(planificacion.IdPlanificacion);
        }

        // PUT: api/Planificaciones/{id}
        [HttpPut("{id}")]
        public IActionResult UpdatePlanificacion(decimal id, [FromBody] PlanificacionUpdateDto planificacionDto)
        {
            if (id != planificacionDto.IdPlanificacion)
            {
                return BadRequest(new ErrorResponse("El ID proporcionado no coincide con el ID de la planificación."));
            }

            var existePlanificacion = _context.Planificaciones.Any(p =>
               p.IdCoordinador == planificacionDto.IdCoordinador &&
               p.FechaDesde <= planificacionDto.FechaHasta &&
               p.FechaHasta >= planificacionDto.FechaDesde &&
               p.IdPlanificacion != planificacionDto.IdPlanificacion
           );

            if (existePlanificacion)
            {
                return BadRequest(new ErrorResponse("Ya existe una planificación para el coordinador y el rango de fechas especificado."));
            }
            else
            {
                if (planificacionDto.FechaDesde < DateTime.Now)
                {
                    return BadRequest(new ErrorResponse("No es posible agregar una planificacion, con fecha pasada"));
                }
                else if (planificacionDto.FechaHasta < planificacionDto.FechaDesde)
                {
                    return BadRequest(new ErrorResponse("La fecha proporcionada no es valida, favor validar."));
                }
                else if (planificacionDto.FrecuenciaId == (int)EnumFrecuencia.Semanal)
                {
                    if (planificacionDto.FechaHasta > planificacionDto.FechaDesde.AddDays(6)
                    || planificacionDto.FechaHasta <= planificacionDto.FechaDesde.AddDays(5))
                    {
                        return BadRequest(new ErrorResponse("La fechas proporcionadas no son validas, segun la frecuencia especificada."));
                    }
                }
                else if (planificacionDto.FrecuenciaId == (int)EnumFrecuencia.Quincenal)
                {
                    if (planificacionDto.FechaHasta > planificacionDto.FechaDesde.AddDays(14)
                    || planificacionDto.FechaHasta <= planificacionDto.FechaDesde.AddDays(13))
                    {
                        return BadRequest(new ErrorResponse("La fechas proporcionadas no son validas, segun la frecuencia especificada."));
                    }
                }
            }

            var planificacion = mapper.Map<Planificacion>(planificacionDto);
            _context.Entry(planificacion).State = EntityState.Modified;

            try
            {
                _context.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PlanificacionExists(id))
                {
                    return NotFound(new ErrorResponse("Planificación no encontrada."));
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // PUT: api/Planificaciones/{id}
        [HttpPut("{idPlanificacion},{idEstatus}")]
        public IActionResult UpdateEstatusPlanificacion(decimal idPlanificacion, int idEstatus)
        {
            var planificacion = _context.Planificaciones
                                       .FirstOrDefault(x => x.IdPlanificacion == idPlanificacion
                                                        && x.EstatusPlanificacionId != idEstatus);

            if (planificacion != null)
            {
                planificacion.EstatusPlanificacionId = idEstatus;
                _context.Entry(planificacion).State = EntityState.Modified;

                try
                {
                    _context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PlanificacionExists(idPlanificacion))
                    {
                        return NotFound(new ErrorResponse("Planificación no encontrada."));
                    }
                    else
                    {
                        throw;
                    }
                }
            }

            return NoContent();
        }

        // DELETE: api/Planificaciones/{id}
        [HttpDelete("{id}")]
        public async Task<ActionResult> DeletePlanificacion(decimal id)
        {
            await _softDeleteService.SoftDelete<Planificacion>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool PlanificacionExists(decimal id)
        {
            return _context.Planificaciones.Any(p => p.IdPlanificacion == id);
        }
    }
}
