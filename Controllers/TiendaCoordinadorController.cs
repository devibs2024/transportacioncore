using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data;
using TransportationCore.CustomError;
using AutoMapper;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Dtos.Nomina;
using Microsoft.AspNetCore.Http.HttpResults;
using TransportationCore.Data.Dtos.Operador;
using TransportationCore.Data.Dtos.OperadorCoordinador;


namespace TransportationCore.Controllers
{
    //[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[Controller]")]
    [ApiController]
    [ValidateModel]

    public class TiendaCoordinadorController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public TiendaCoordinadorController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        [HttpGet("{CoordinadorId}", Name = "GetTiendaCoordinador")]
        public async Task<ActionResult> GetTiendaCoordinador(long CoordinadorId)
        {
            if (_context.TiendaCoordinador == null)
            {
                return NotFound();
            }

            var tiendaCoordinador = await (from storecoor in _context.TiendaCoordinador
                                           join store in _context.Tiendas
                                           on storecoor.IdTienda equals store.IdTienda
                                           join employee in _context.Empleados
                                           on storecoor.IdCoordinador equals employee.IdEmpleado
                                           where storecoor.IdCoordinador == CoordinadorId 
                                           select new
                                           {
                                               storecoor.IdTienda,
                                               store.NombreTienda

                                           }).ToListAsync();

            return Ok(tiendaCoordinador);
        }
    }
}
