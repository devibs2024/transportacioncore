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

namespace TransportationCore.Controllers
{
    //[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[Controller]")]
    [ApiController]
    [ValidateModel]
    public class NominaController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public NominaController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        [HttpGet("[action]/{IdPlanificacion},{fechaIni},{fechaEnd},{IdCoordinador},{IdOperador},{IdTienda}", Name = "Calculo")]
        public async Task<ActionResult<ComprobanteNominaDto>> Calculo(long IdPlanificacion, DateTime fechaIni, DateTime fechaEnd, long IdCoordinador, long IdOperador, long IdTienda)
        {
            string parametro = "";

            parametro += $" @IdPlanificacion = {IdPlanificacion}";

            if (fechaIni != null) parametro += $", @FechaIni = '{FechaBD(fechaIni)}'";
            if (fechaEnd != null) parametro += $", @FechaEnd = '{FechaBD(fechaEnd)}'";

            if (IdCoordinador > 0) parametro += $", @IdCoordinador = {IdCoordinador}";
            if (IdOperador > 0) parametro += $", @IdOperador = {IdOperador}";
            if (IdTienda > 0) parametro += $", @IdTienda = {IdTienda}";

            var resultado = await _context.Set<ComprobanteNominaDto>().FromSqlRaw($"CalculoNominaProductividad" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen calculos de nomina segun los criterios de busqueda"));

            return Ok(resultado);

        }

        [HttpGet("[action]/{IdProcesoNomina},{IdPlanificacion},{fechaIni},{fechaEnd},{IdCoordinador},{IdOperador},{IdTienda}", Name = "Consulta")]
        public async Task<ActionResult<ComprobanteNominaDto>> Consulta(long IdProcesoNomina, long IdPlanificacion, DateTime fechaIni, DateTime fechaEnd, long IdCoordinador, long IdOperador, long IdTienda)
        {
            string parametro = "";

            parametro += $" @IdPlanificacion = {IdPlanificacion}";

            if (fechaIni != null) parametro += $", @FechaIni = '{FechaBD(fechaIni)}'";
            if (fechaEnd != null) parametro += $", @FechaEnd = '{FechaBD(fechaEnd)}'";

            if (IdProcesoNomina > 0) parametro += $", @IdProcesoNomina = {IdProcesoNomina}";
            if (IdCoordinador > 0) parametro += $", @IdCoordinador = {IdCoordinador}";
            if (IdOperador > 0) parametro += $", @IdOperador = {IdOperador}";
            if (IdTienda > 0) parametro += $", @IdTienda = {IdTienda}";

            var resultado = await _context.Set<ComprobanteNominaDto>().FromSqlRaw($"ConsultaNominaProductividad" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen procesos de nomina segun los criterios de busqueda"));

            return Ok(resultado);

        }

        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> Pago(long id, ProcesoNominaPagoDto ProcesoNominaDto)
        {
            if (id != ProcesoNominaDto.IdProcesoNomina)
            {
                return BadRequest();
            }

            var ProcesoNomina = mapper.Map<ProcesoNomina>(ProcesoNominaDto);
            _context.Entry(ProcesoNomina).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProcesoNominaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        private bool ProcesoNominaExists(long id)
        {
            return (_context.Vehiculos?.Any(e => e.IdVehiculo == id)).GetValueOrDefault();
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
