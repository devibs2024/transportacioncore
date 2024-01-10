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
using TransportationCore.Data.Dtos.MunicipioCliente;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class MunicipioClientesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public MunicipioClientesController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }

        
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MunicipioClienteDto>>> GetMunicipioClientes()
        {
          if (_context.MunicipioClientes == null)
          {
              return NotFound();
          }
            var municipioCliente = await _context.MunicipioClientes.ToListAsync();
            var municipioClienteDto = mapper.Map<List<MunicipioClienteDto>>(municipioCliente);
            return municipioClienteDto;
        }

        
        [HttpGet("{id}")]
        public async Task<ActionResult<MunicipioClienteDto>> GetMunicipioCliente(int id)
        {
          if (_context.MunicipioClientes == null)
          {
              return NotFound();
          }
            var municipioCliente = await _context.MunicipioClientes.FindAsync(id);
            var municipioClienteDto = mapper.Map<MunicipioClienteDto>(municipioCliente);

            if (municipioCliente == null)
            {
                return NotFound();
            }

            return municipioClienteDto;
        }

        

        [HttpPut("{id}")]
        public async Task<IActionResult> PutMunicipioCliente(int id, MunicipioClienteDto municipioClienteDto)
        {
            if (id != municipioClienteDto.IdMunicipio)
            {
                return BadRequest();
            }

            var municipioCliente = mapper.Map<MunicipioCliente>(municipioClienteDto);
            _context.Entry(municipioCliente).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MunicipioClienteExists(id))
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
        public async Task<ActionResult> PostMunicipioCliente(MunicipioClienteDto municipioClienteDto)
        {
            var municipioCliente = mapper.Map<MunicipioCliente>(municipioClienteDto);
            _context.MunicipioClientes.Add(municipioCliente);
            await _context.SaveChangesAsync();

            return NoContent();
        }


        

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMunicipioCliente(int id)
        {
            await softDeleteService.SoftDelete<MunicipioCliente>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool MunicipioClienteExists(int id)
        {
            return (_context.MunicipioClientes?.Any(e => e.IdMunicipio == id)).GetValueOrDefault();
        }
    }
}
