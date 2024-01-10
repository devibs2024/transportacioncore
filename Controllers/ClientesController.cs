using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Cliente;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "EditarClientePolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public ClientesController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper= mapper;
            this.softDeleteService = softDeleteService;
        }

        

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ClienteConsultaDto>>> GetClientes()
        {
          if (_context.Clientes == null)
          {
              return NotFound();
          }

            var cliente = await _context.Clientes.ToListAsync();
            var clienteDto = mapper.Map<List<ClienteConsultaDto>>(cliente);
            return clienteDto;
        }

        

        [HttpGet("{id}")]
        public async Task<ActionResult<ClienteConsultaDto>> GetCliente(long id)
        {
          if (_context.Clientes == null)
          {
              return NotFound();
          }
            var cliente = await _context.Clientes.FindAsync(id);
            var clienteDto = mapper.Map<ClienteConsultaDto>(cliente);

            if (cliente == null)
            {
                return NotFound();
            }

            return clienteDto;
        }

        

        [HttpPut("{id}")]
        public async Task<IActionResult> PutCliente(long id, ClienteUpdateDto clienteDto)
        {
            if (id != clienteDto.IdCliente)
            {
                return BadRequest();
            }

            if (ValidarNumeroClaveCte(id, clienteDto.Clave))
                return BadRequest(new ErrorResponse("El numero de contrato, ya existe favor validar."));

            var cliente = mapper.Map<Cliente>(clienteDto);
            _context.Entry(cliente).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClienteExists(id))
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

        [HttpPost]
        public async Task<ActionResult> PostCliente(ClienteCrearDto clienteDto)
        {
            if (ValidarNumeroClaveCte(0, clienteDto.Clave))
                return BadRequest(new ErrorResponse("El numero de contrato, ya existe favor validar."));

            var cliente = mapper.Map<Cliente>(clienteDto);

            _context.Clientes.Add(cliente);
            await _context.SaveChangesAsync();

            return Ok(cliente.IdCliente);
        }              

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCliente(long id)
        {           
            await softDeleteService.SoftDelete<Cliente>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool ClienteExists(long id)
        {
            return (_context.Clientes?.Any(e => e.IdCliente == id)).GetValueOrDefault();
        }

        private bool ValidarNumeroClaveCte(long idCliente, long clave)
        {
            return (_context.Clientes?.Any(e => e.Clave == clave && e.IdCliente != idCliente)).GetValueOrDefault();
        }
    }
}
