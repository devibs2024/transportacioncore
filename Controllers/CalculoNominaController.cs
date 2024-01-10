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

namespace TransportationCore.Controllers
{
    //[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[Controller]")]
    [ApiController]
    [ValidateModel]
    public class CalculoNominaController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper maper;
        private readonly ISoftDeleteService _softDeleteService;

        public CalculoNominaController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        { 
            _context = context;
            this.maper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        [HttpGet("{FechaIni},{FechaEnd},{IdOperador},{IdTienda}", Name = "GetCalculoNomina")]
        public async Task<ActionResult<CalculoNominaDto>> GetCalculoNomina(DateTime fechaIni, DateTime fechaEnd, long IdOperador, long IdTienda)
        {
            string parametro = $" @IdOperador = {IdOperador}";

            if (fechaIni == null)
            {
                parametro += $", @FechaIni = {fechaIni}";
            }

            if (fechaEnd == null)
            {
                parametro += $", @FechaEnd = {fechaEnd}";
            }

            if (IdTienda > 0)
            {
                parametro += $", @IdTienda = {IdTienda}";
            }

            var resultado = await _context.Set<CalculoNominaDto>().FromSqlRaw($"CalculoNominaProductividad" + parametro).ToListAsync();

            if (resultado.Count == 0)
                return BadRequest(new ErrorResponse("No existen calculos de nomina segun los criterios de busqueda"));

            var dias = resultado.GroupBy(d => new { d.IdPlanificacion, d.IdOperador, d.IdCoordinador, d.Dia})
                .Select(g => new CollectionDays
                { 
                    IdPlanificacion = g.Key.IdPlanificacion,
                    IdOperador = g.Key.IdOperador,
                    IdCoordinador = g.Key.IdCoordinador,
                    NroDia = g.Key.Dia,
                    
                }).ToList();
            
            var PivotCalculoNomina = resultado.GroupBy(d => new { d.IdPlanificacion, d.IdOperador, d.NombreOperador, d.Salario, d.Banco, d.IdCoordinador, d.NombreCoordinador, d.IdTienda, d.NombreTienda, d.ZonaSted, d.Fecha, d.Dia, d.HoraInicio, d.HoraFin, d.Horas, d.SubTotal, d.Gasolina, d.HorasExtra, d.MinutosRetraso, d.DescuentoRetraso, d.PagoSMG, d.DescuentoSted, d.TotalPagar})
                .Select(g => new PivotResult
                { 
                    IdPlanificacion = g.Key.IdPlanificacion,
                    IdOperador = g.Key.IdOperador,
                    NombreOperador = g.Key.NombreOperador,
                    Salario = g.Key.Salario,
                    Banco = g.Key.Banco,
                    IdCoordinador = g.Key.IdCoordinador,
                    NombreCoordinador = g.Key.NombreCoordinador,
                    NombreTienda = g.Key.NombreTienda,
                    ZonaSted = g.Key.ZonaSted,
                    Fecha = g.Key.Fecha,
                    Dia = g.Key.Dia,
                    HoraInicio = g.Key.HoraInicio,
                    HoraFin = g.Key.HoraFin,
                    Horas = g.Key.Horas,
                    SubTotal = g.Key.SubTotal,
                    Gasolina = g.Key.Gasolina,
                    HorasExtra = g.Key.HorasExtra,
                    MinutosRetraso = g.Key.MinutosRetraso,
                    DescuentoRetraso = g.Key.DescuentoRetraso,
                    PagoSMG = g.Key.PagoSMG,
                    DescuentoSted = g.Key.DescuentoSted,
                    TotalPagar = g.Key.TotalPagar
                }).ToList();

            return Ok(PivotCalculoNomina);
            
        }

        [HttpGet("{IdCoordinador}", Name = "GetCalculosNominaByIdCoordinador")]
        public async Task<ActionResult> GetCalculosNominaByIdCoordinador(long IdCoordinador)
        {
            if (_context.CalculoNominaDto == null)
            {
                return NotFound();
            }

            var calculoNominaCoordinador = await (from ejecucion in _context.EjecucionesPlanificacion
                                                  join detplanificacion in _context.DetallesPlanificacion
                                                  on ejecucion.IdPlanificacion equals detplanificacion.IdPlanificacion
                                                  join tienda in _context.Tiendas
                                                  on ejecucion.IdTienda equals tienda.IdTienda
                                                  join zonasted in _context.ZonasSted
                                                  on tienda.IdZonaSted equals zonasted.IdZonaSted
                                                  join cte in _context.Clientes
                                                  on zonasted.IdCliente equals cte.IdCliente
                                                  join estado in _context.Estados
                                                  on tienda.IdEstado equals estado.IdEstado
                                                  join empleado in _context.Empleados
                                                  on ejecucion.IdOperador equals empleado.IdEmpleado
                                                  join tarjeta in _context.AsignacionTarjeta
                                                  on empleado.IdEmpleado equals tarjeta.IdEmpleado
                                                  join ctaempleado in _context.EmpleadoCuentaBancaria
                                                  on empleado.IdEmpleado equals ctaempleado.IdEmpleado
                                                  join bancos in _context.Bancos
                                                  on ctaempleado.IdBanco equals bancos.IdBanco
                                                  join plan in _context.Planificaciones
                                                  on detplanificacion.IdPlanificacion equals plan.IdPlanificacion
                                                  where plan.IdCoordinador == IdCoordinador
                                                  select new
                                                  {
                                                      ejecucion.IdOperador,
                                                      empleado.Nombres,
                                                      empleado.Salario,
                                                      ctaempleado.CuentaBancaria,
                                                      bancos.NombreBanco,
                                                      plan.IdCoordinador,
                                                      tienda.NombreTienda,
                                                      zonasted.NombreZona,
                                                      ejecucion.Fecha,
                                                      ejecucion.HoraInicio,
                                                      ejecucion.HoraFin,
                                                      ejecucion.MontoCombustible,
                                                      ejecucion.MontoHorasExtras,
                                                      empleado.SMG
                                                  }
                                                  ).ToListAsync();

            return Ok(calculoNominaCoordinador);
        }       
    }
}
