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
using TransportationCore.Data.Dtos.FormatoCliente;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class FormatoClientesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public FormatoClientesController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }

        

        [HttpGet]
        public async Task<ActionResult<IEnumerable<FormatoClienteDto>>> GetFormatoClientes()
        {
          if (_context.FormatoClientes == null)
          {
              return NotFound();
          }
            var formatoCliente = await _context.FormatoClientes.ToListAsync();
            var formatoClienteDto = mapper.Map<List<FormatoClienteDto>>(formatoCliente);
            return formatoClienteDto;
        }


        [HttpGet("{idCliente}")]
        public async Task<ActionResult<FormatoClienteDto>> GetFormatoCliente(int idCliente)
        {
            if (_context.FormatoClientes == null)
            {
                return NotFound();
            }

            var formatosAsignados = await (from p in _context.Formatos
                                           join e in _context.FormatoClientes
                                           on p.IdFormato equals e.IdFormato
                                           join x in _context.Clientes
                                           on e.IdCliente equals x.IdCliente
                                           where x.IdCliente == idCliente
                                           select new
                                           {
                                               p.IdFormato,
                                               p.DescripcionFormato,
                                               p.Estado,
                                               x.NombreCliente
                                           }).ToListAsync();

            if (formatosAsignados.Count == 0) 
                return Ok(idCliente);

            return Ok(formatosAsignados);
        }



        [HttpPut("{id}")]
        public async Task<IActionResult> PutFormatoCliente(int id, FormatoClienteDto formatoClienteDto)
        {
            if (id != formatoClienteDto.IdFormato)
            {
                return BadRequest();
            }

            var formatoCliente = mapper.Map<FormatoCliente>(formatoClienteDto);
            _context.Entry(formatoCliente).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FormatoClienteExists(id))
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
        public async Task<ActionResult> PostFormatoCliente(FormatoClienteDto formatoClienteDto)
        {
            if (_context.Clientes == null)
            {
                return Problem("Entity set 'ApplicationDbContext.FormatoCliente'  is null.");
            }
            var formatoCliente = mapper.Map<FormatoCliente>(formatoClienteDto);

            _context.FormatoClientes.Add(formatoCliente);
            await _context.SaveChangesAsync();

            return NoContent();
        }


        
        [HttpDelete("{idFormato},{idCliente}")]
        public async Task<IActionResult> DeleteFormatoCliente(int idFormato, long idCliente)
        {
            await softDeleteService.SoftDelete<FormatoCliente>(idFormato, idCliente);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }


        private bool FormatoClienteExists(int id)
        {
            return (_context.FormatoClientes?.Any(e => e.IdFormato == id)).GetValueOrDefault();
        }
    }
}
