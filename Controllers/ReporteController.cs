using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
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
//using TransportationCore.Data.Dtos.Productividad;
using TransportationCore.Data.Dtos.Nomina;
using Microsoft.AspNetCore.Http.HttpResults;
using TransportationCore.Data.Dtos.Vehiculo;
using TransportationCore.Data.Dtos.Reportes;
using Newtonsoft.Json;

namespace TransportationCore.Controllers
{
    //[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[Controller]")]
    [ApiController]
    [ValidateModel]
    public class ReporteController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public ReporteController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        [HttpGet("[action]/{fechaIni},{fechaEnd},{IdCoordinador},{IdOperador},{IdTienda}", Name = "Gasolina")]
        public async Task<ActionResult<ReporteGasolinaDto>> Gasolina(DateTime fechaIni, DateTime fechaEnd, long IdCoordinador, long IdOperador, long IdTienda)
        {
            string parametro = "";

            parametro += $" @IdCoordinador = {IdCoordinador}";

            if (fechaIni != null) parametro += $", @FechaIni = '{FechaBD(fechaIni)}'";
            if (fechaEnd != null) parametro += $", @FechaEnd = '{FechaBD(fechaEnd)}'";

            if (IdOperador > 0) parametro += $", @IdOperador = {IdOperador}";
            if (IdTienda > 0) parametro += $", @IdTienda = {IdTienda}";

            var resultado = await _context.Set<ReporteGasolinaDto>().FromSqlRaw($"ReporteGasolina" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen calculos de nomina segun los criterios de busqueda"));

            return Ok(resultado);

        }

        [HttpGet("[action]/{fechaIni},{fechaEnd},{IdCoordinador},{IdCliente},{IdTienda},{IdTipoVehiculo}", Name = "VehiculosExtra")]
        public async Task<ActionResult<ReporteVehiculosExtraDto>> VehiculosExtra(DateTime fechaIni, DateTime fechaEnd, long IdCliente, long IdCoordinador, long IdTienda, long IdTipoVehiculo)
        {
            string parametro = "";

            parametro += $" @IdCoordinador = {IdCoordinador}";

            if (fechaIni != null) parametro += $", @FechaIni = '{FechaBD(fechaIni)}'";
            if (fechaEnd != null) parametro += $", @FechaEnd = '{FechaBD(fechaEnd)}'";

            if (IdCliente > 0) parametro += $", @IdCliente = {IdCliente}";
            if (IdTienda > 0) parametro += $", @IdTienda = {IdTienda}";
            if (IdTipoVehiculo > 0) parametro += $", @IdTipoVehiculo = {IdTipoVehiculo}";

            var resultado = await _context.Set<ReporteVehiculosExtraDto>().FromSqlRaw($"ReporteVehiculosExtra" + parametro).ToListAsync();

            foreach (var row in resultado)
                row.ListDias = JsonConvert.DeserializeObject<List<ReporteDias>>(row.JsonUnidades);

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen calculos de nomina segun los criterios de busqueda"));

            return Ok(resultado);

        }

        [HttpGet("[action]/{fechaIni},{fechaEnd},{IdCoordinador},{IdTienda},{IdTipoVehiculo}", Name = "ComparativoPagos")]
        public async Task<ActionResult<ReporteComparativoPagosDto>> ComparativoPagos(DateTime fechaIni, DateTime fechaEnd, long IdCoordinador, long IdTienda, long IdTipoVehiculo)
        {
            string parametro = "";

            parametro += $" @IdCoordinador = {IdCoordinador}";

            if (fechaIni != null) parametro += $", @FechaIni = '{FechaBD(fechaIni)}'";
            if (fechaEnd != null) parametro += $", @FechaEnd = '{FechaBD(fechaEnd)}'";

            if (IdTienda > 0) parametro += $", @IdTienda = {IdTienda}";
            if (IdTipoVehiculo > 0) parametro += $", @IdTipoVehiculo = {IdTipoVehiculo}";

            var resultado = await _context.Set<ReporteComparativoPagosDto>().FromSqlRaw($"ReporteComparativoPagos" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen calculos de nomina segun los criterios de busqueda"));

            return Ok(resultado);

        }

        private string FechaBD(DateTime pFecha)
        {

            string _Fecha = string.Empty;

            int Año = pFecha.Year;
            int Mes = pFecha.Month;
            int Dia = pFecha.Day;

            int Hora = pFecha.Hour;
            int Minuto = pFecha.Minute;
            int Segundo = pFecha.Second;

            int Milisegundo = pFecha.Millisecond;

            _Fecha =
                    String.Format("{0:0000}", Año) + "-" +
                    String.Format("{0:00}", Mes) + "-" +
                    String.Format("{0:00}", Dia) + "T" +
                    String.Format("{0:00}", Hora) + ":" +
                    String.Format("{0:00}", Minuto) + ":" +
                    String.Format("{0:00}", Segundo) + "." +
                    String.Format("{0:000}", Milisegundo);

            return _Fecha;

        }

    }
}
