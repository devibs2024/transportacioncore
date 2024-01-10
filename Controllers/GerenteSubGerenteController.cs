using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.GerenteSubGerente;
using TransportationCore.Data.Dtos.OperadorCoordinador;
using TransportationCore.Data.Dtos.OperadorSucursal;
using TransportationCore.Data.Dtos.Sucursal;
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarOperadoresPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class GerenteSubGerenteController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public GerenteSubGerenteController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            this._context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }

        [HttpGet("{IdCliente}")]
        public async Task<ActionResult> Get(long IdCliente)
        {
            if (_context.ContactoClientes == null)
            {
                return NotFound();
            }

            var GerentesAsociados = await (from e in _context.ContactoClientes
                                              join ec in _context.GerenteSubGerentes
                                              on e.IdContacto equals ec.IdGerente
                                              join e2 in _context.ContactoClientes
                                              on ec.IdSubGerente equals e2.IdContacto
                                              where e.IdCliente == IdCliente
                                           select new
                                              {
                                                  IdGerente = e.IdContacto,
                                                  NombreGerente = e.Nombre,

                                                  IdSubGerente = e2.IdContacto,
                                                  NombreSubGerente = e2.Nombre

                                              }).ToListAsync();

            return Ok(GerentesAsociados);

        }

        [HttpPost]
        public async Task<ActionResult> PostGerenteAsociado(GerenteSubGerenteDto gerenteSubGerenteDto)
        {

            var gerenteSubGerente = mapper.Map<GerenteSubGerente>(gerenteSubGerenteDto);
            _context.GerenteSubGerentes.Add(gerenteSubGerente);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteGerenteAsociado(GerenteSubGerenteDto gerenteSubGerenteDto)
        {
            await softDeleteService.SoftDelete<GerenteSubGerente>(gerenteSubGerenteDto.IdGerente, gerenteSubGerenteDto.IdSubGerente);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

    }
}
