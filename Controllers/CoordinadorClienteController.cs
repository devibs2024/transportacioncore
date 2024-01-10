using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.CoordinadorCliente;
using TransportationCore.Data.Dtos.OperadorSucursal;
using TransportationCore.Data.Dtos.Sucursal;
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarClientePolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class CoordinadorClienteController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public CoordinadorClienteController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            this._context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
            _context.UserEmail = "Ambiorix.Liriano@gmail.com";
        }

        [HttpGet("{idCoordinador}")]
        public async Task<ActionResult> GetClientesAsignados(long idCoordinador)
        {
            if (_context.Clientes == null)
            {
                return NotFound();
            }

            var clientesAsignados = await (from c in _context.Clientes
                                             join cc in _context.CoordinadorClientes
                                             on c.IdCliente equals cc.IdCliente
                                             where cc.IdCoordinador == idCoordinador
                                             select new
                                             {
                                                 c.IdCliente,
                                                 c.NombreCliente,
                                                 cc.IdCoordinador
                                             }).ToListAsync();

            return Ok(clientesAsignados);

        }

        [HttpPost]
        public async Task<ActionResult> PostCoordinadorCliente(CoordinadorClienteDto coordinadorClienteDto)
        {
            if (_context.CoordinadorClientes == null)
            {
                return NotFound(new ErrorResponse("El registro no existe"));
            }

            var coordinadorCliente = mapper.Map<CoordinadorCliente>(coordinadorClienteDto);
            _context.CoordinadorClientes.Add(coordinadorCliente);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteCoordinadorCliente(CoordinadorClienteDto coordinadorClienteDto)
        {
            await softDeleteService.SoftDelete<CoordinadorCliente>(coordinadorClienteDto.IdCoordinador, coordinadorClienteDto.IdCliente);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

    }
}
