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
using TransportationCore.Data.Utilidades;
using TransportationCore.Enumeradores;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Dtos.Reportes;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System.Reflection.Metadata;


namespace TransportationCore.Controllers
{
    //[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]

    public class ReportesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public ReportesController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        [HttpGet("{IdTienda},{IdCoordinador}", Name = "GetReporteGasolina")]
        public async Task<ActionResult<ReporteConsumoGasolinaDto>> GetReporteGasolina(long IdTienda,  DateTime fechaIni, DateTime fechaEnd, long IdCoordinador)
        {
            string parametro = $"@IdTienda = {IdTienda}";

            if (fechaIni == null)
            {
                parametro += $", @FechaIni = {fechaIni}";
            }
            else
            {
                parametro += $", @FechaIni = {fechaIni}";
            }

            if (fechaEnd == null)
            {
                parametro += $", @FechaEnd = {fechaEnd}";
            }
            else
            {
                parametro += $", @FechaEnd = {fechaEnd}";
            }            

            if (IdCoordinador > 0)
            {
                parametro += $", @IdCoordinador = {IdCoordinador}";
            }
            var resultado = await _context.Set<ReporteConsumoGasolinaDto>()
                     .FromSqlRaw($"ReporteImporteCombustibleAsignado" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen registros segun los criterios de busqueda"));

            var pivotResult = resultado.GroupBy(d => new { d.Tiendas, d.NombreTienda, d.NombreOperador, d.NumeroTarjeta, d.Importe, d.FechaDispercion })
                .Select(g => new PivoteResult
                {
                    NombreTienda = g.Key.NombreTienda,
                    NombreOperador = g.Key.NombreOperador,
                    NumeroTarjeta = g.Key.NumeroTarjeta,
                    Importe = g.Key.Importe,
                    FechaDispercion = g.Key.FechaDispercion
                }).ToList();

            return Ok(pivotResult);

        }

        [HttpGet("{FechaInicio},{FechaFin},{IdCliente},{IdTienda},{IdTipoVehiculo}", Name = "GetReporteVehiculosUtilizados")]
        public async Task<ActionResult<ReporteVechiculosExtraUtilizadosDto>> GetReporteVehiculosUtilizados(DateTime? fechaIni, DateTime? fechaEnd, long IdCliente, long IdTienda, long IdTipoVehiculo)
        {
            string parametro = $"@IdCliente = {IdCliente}";

            if (!fechaIni.HasValue)
            {
                parametro = $"@FechaIni = {fechaIni}";
            }

            if (!fechaEnd.HasValue)
            {
                parametro = $", @FechaEnd = {fechaEnd}";
            }

            if (IdTienda == 0)
            {
                parametro = $", @IdTienda = {IdTienda}";
            }

            if (IdCliente == 0)
            {
                parametro = $", @IdCliente = {IdCliente}";
            }

            if (IdTipoVehiculo == 0)
            {
                parametro = $", IdTipoVehiculo = {IdTipoVehiculo}";
            }

            var resultado = await _context.Set<ReporteVechiculosExtraUtilizadosDto>()
                .FromSqlRaw($"ReporteVehiculosExtraUtilizados" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen registros segun los criterios de busqueda"));

            var dias = resultado.GroupBy(d => new { d.IdCliente, d.IdTienda, d.IdTipoVehiculo, d.Dia, d.Accion })
                .Select(g => new CollectionsDays
                {
                    IdCliente = g.Key.IdCliente,
                    IdTienda = g.Key.IdTienda,
                    IdTipoVehiculo = g.Key.IdTipoVehiculo,
                    NroDia = g.Key.Dia,
                    Accion = g.Key.Accion
                }).ToList();

            var pivotResult = resultado.GroupBy(d => new { d.IdCliente, d.NombreCliente, d.IdTienda, d.NombreTienda, d.IdTipoVehiculo, d.NombreTipoVehiculo, d.UnidadesSpot, d.TotalUtilizadas, d.TotalUnidadesSpot, d.TotalUnidadesUtilizadas, d.TotalGeneral })
                .Select(g => new PivotResultUnidades
                {
                    IdCliente = g.Key.IdCliente,
                    NombreCliente = g.Key.NombreCliente,
                    IdTienda = g.Key.IdTienda,
                    NombreTienda = g.Key.NombreTienda,
                    IdTipoVehiculo = g.Key.IdTipoVehiculo,
                    NombreTipoVehiculo = g.Key.NombreTipoVehiculo,
                    UnidadesSpot = g.Key.UnidadesSpot,
                    lstDias = dias.Where(x => x.IdTienda == g.Key.IdTienda && x.IdCliente == g.Key.IdCliente).ToList()

                }).ToList();

            return Ok(pivotResult);
        }


    }
}
