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
using TransportationCore.Data.Dtos.Reportes;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System.Reflection.Metadata;
using TransportationCore.Data.Dtos.Productividad;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class ProductividadComprobanteController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public ProductividadComprobanteController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        [HttpGet("{IdPlanificacion},{IdOperador}", Name = "GetComprobanteProductividad")]
        public async Task<ActionResult<ProductividadConsultaDetalleDto>> GetComprobanteProductividad(decimal IdPlanificacion, long IdOperador)
        {
            string parametro = $" @IdPlanificacion = {IdPlanificacion}, @IdOperador = {IdOperador}";

            var resultado = await _context.Set<ProductividadConsultaDetalleDto>()
                .FromSqlRaw($"ProductividadGetByOperador" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen registros segun los criterios de busqueda"));


            var pivoteResult = resultado.GroupBy(d => new
            {
                d.IdPlanificacion,
                d.IdOperador,
                d.NombreOperador,
                d.Spot,
                d.IdBanco,
                d.NombreBanco,
                d.NumTarjeta,
                d.Salario,
                d.DescuentoTardanza,
                d.IncentivoFactura,
                d.MontoHorasExtras,
                d.MontoDiario,
                d.SMG,
                d.CuentaBancaria
            })
            .Select(g => new PivoteNomina
            {
                IdPlanificacion = g.Key.IdPlanificacion,
                IdOperador = g.Key.IdOperador,
                NombreOperador = g.Key.NombreOperador,
                Spot = g.Key.Spot,
                NombreBanco = g.Key.NombreBanco,
                NumTarjeta = g.Key.NumTarjeta,
                CuentaBancaria = g.Key.CuentaBancaria,
                Salario = g.Key.Salario,
                Dias = g.Count(),
                SubTotal1 = (g.Key.Salario * g.Count()),
                IncentivoFactura = (g.Key.IncentivoFactura + g.Key.MontoHorasExtras),
                MontoGasolina = g.Key.MontoDiario,
                DescuentoTardanza = g.Key.DescuentoTardanza,
                SubTotal2 = ((g.Key.Salario * g.Count())
                           + (g.Key.IncentivoFactura + g.Key.MontoHorasExtras + g.Key.MontoDiario)
                           - g.Key.DescuentoTardanza),
                SMG = g.Key.SMG,
                Total = ((g.Key.Salario * g.Count())
                           + (g.Key.IncentivoFactura + g.Key.MontoHorasExtras + g.Key.MontoDiario)
                           - g.Key.DescuentoTardanza - g.Key.SMG)
            }).ToList();

            return Ok(pivoteResult);
        }

    }
}
