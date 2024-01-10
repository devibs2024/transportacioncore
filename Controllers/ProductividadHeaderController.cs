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
//using TransportationCore.Data.Dtos.Reportes;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System.Reflection.Metadata;
using TransportationCore.Data.Dtos.Productividad;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class ProductividadHeaderController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public ProductividadHeaderController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        [HttpGet("{IdPlanificacion},{IdOperador}", Name = "GetDetalleProductividad")]
        public async Task<ActionResult<ProductividadConsultaDetalleDto>> GetDetalleProductividad(decimal IdPlanificacion, long IdOperador)
        {
            string parametro = $" @IdPlanificacion = {IdPlanificacion}";

            if (IdOperador > 0)
            {
                parametro += $", @IdOperador = {IdOperador}";
            }

            var resultado = await _context.Set<ProductividadConsultaDetalleDto>()
                .FromSqlRaw($"ProductividadGetByOperador" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen registros segun los criterios de busqueda"));

            var dias = resultado.GroupBy(d => new { d.IdPlanificacion, d.IdOperador, d.Dia, d.Accion })
            .Select(g => new CollectionsDays
            {
                IdPlanificacion = g.Key.IdPlanificacion,
                IdOperador = g.Key.IdOperador,
                NroDia = g.Key.Dia,
                Accion = g.Key.Accion
            })
            .ToList();

            var pivoteResult = resultado.GroupBy(d => new { d.IdPlanificacion, d.IdOperador, d.NombreOperador, d.NombreTienda, d.IdTienda, d.IdCliente, d.NombreCliente, d.Spot, d.IdEstado, d.NombreEstado })
            .Select(g => new PivoteResult
            {
                IdPlanificacion = g.Key.IdPlanificacion,
                IdOperador = g.Key.IdOperador,
                NombreOperador = g.Key.NombreOperador,
                NombreTienda = g.Key.NombreTienda,
                IdTienda = g.Key.IdTienda,
                IdCliente = g.Key.IdCliente,
                NombreCliente = g.Key.NombreCliente,
                Spot = g.Key.Spot,
                IdEstado = g.Key.IdEstado,
                NombreEstado = g.Key.NombreEstado,
                lstDias = dias.Where(x => x.IdOperador == g.Key.IdOperador 
                                  && x.IdPlanificacion == g.Key.IdPlanificacion).ToList()
            })
            .ToList();

            return Ok(pivoteResult);
        }

        [HttpGet("{IdCoordinador}", Name = "GetProductividad")]
        public async Task<ActionResult<ProductividadConsultaHeaderDto>> GetProductividad(long IdCoordinador)
        {
            string parametro = string.Empty;

            if (IdCoordinador != 0)
                parametro = $" @IdCoordinador = {IdCoordinador}";

            var resultado = await _context.Set<ProductividadConsultaHeaderDto>()
                .FromSqlRaw($"PlanificacionGetByCoordinador" + parametro).ToListAsync();


            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen registros segun los criterios de busqueda"));


            return Ok(resultado);
        }

    }
}
