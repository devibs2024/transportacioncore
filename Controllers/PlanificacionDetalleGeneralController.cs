using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Planificacion;
using TransportationCore.Data.Dtos.Tienda;
using TransportationCore.Data.Models;
using TransportationCore.Enumeradores;
using TransportationCore.Data.Dtos.Reportes;

namespace TransportationCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class PlanificacionDetalleGeneralController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PlanificacionDetalleGeneralController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("{IdPlanificacion},{IdDetalle}")]
        public async Task<ActionResult<PlanificacionConsultaDetalleDto>> GetDetallePlanificacion(decimal IdPlanificacion, decimal IdDetalle)
        {
            string parametro = $" @IdPlanificacion = {IdPlanificacion}";

            if (IdDetalle > 0)
            {
                parametro += $", @IdDetallePlanificacion = {IdDetalle}";
            }

            var resultado = await _context.Set<PlanificacionConsultaDetalleDto>()
                .FromSqlRaw($"PlanificacionDetalleGetByParameter" + parametro).ToListAsync();



            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen registros segun los criterios de busqueda"));

            return Ok(resultado);
        }
        [HttpGet("{IdPlanificacion}")]
        public async Task<ActionResult<PlanificacionConsultaDetalleDto>> GetDetallePlanificacion(decimal IdPlanificacion)
        {
            string parametro = $" @IdPlanificacion = {IdPlanificacion}";
                       
            var resultado = await _context.Set<PlanificacionConsultaDetalleDto>()
                .FromSqlRaw($"PlanificacionDetalleGetByParameter" + parametro).ToListAsync();


            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen registros segun los criterios de busqueda"));


            List<ReporteDetallePlanificacion> reporteDetallePlanificaciones = new List<ReporteDetallePlanificacion>();

            foreach (var planificacion in resultado.GroupBy(p => new { p.IdPlanificacion, p.Fecha , p.IdCoordinador, p.NombreCoordinador}))
            {
                ReporteDetallePlanificacion reporteDetallePlanificacion = new ReporteDetallePlanificacion
                {
                    IdCoordinador = planificacion.Key.IdCoordinador,
                    NombreCoordinador = planificacion.Key.NombreCoordinador,
                    IdPlanificacion = planificacion.Key.IdPlanificacion,
                    Fecha = planificacion.Key.Fecha
                };

                foreach (var tienda in planificacion.GroupBy(p => new { p.IdTienda, p.NombreTienda }))
                {
                    ListaTiendas listaTiendas = new ListaTiendas
                    {
                        IdTienda = tienda.Key.IdTienda,
                        NombreTienda = tienda.Key.NombreTienda,
                        Total = tienda.Count()
                    };

                    foreach (var operador in tienda.GroupBy(p => new { p.IdDetallePlanificacion, p.IdOperador, p.NombreOperador, p.HoraInicio, p.HoraFin }))
                    {
                        DetalleOperadores detalleOperadores = new DetalleOperadores
                        {
                            IdDetallePlanificacion = operador.Key.IdDetallePlanificacion,
                            IdOperador = operador.Key.IdOperador,
                            NombreOperador = operador.Key.NombreOperador,
                            HoraInicio = operador.Key.HoraInicio,
                            HoraFin = operador.Key.HoraFin
                        };

                        listaTiendas.Operadores.Add(detalleOperadores);
                    }

                    reporteDetallePlanificacion.Tiendas.Add(listaTiendas);
                }

                reporteDetallePlanificaciones.Add(reporteDetallePlanificacion);
            }

            return Ok(reporteDetallePlanificaciones);
        }        
    }
}
