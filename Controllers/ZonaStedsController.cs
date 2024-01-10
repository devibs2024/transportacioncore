using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.ZonaSted;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class ZonaStedsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public ZonaStedsController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this._softDeleteService = softDeleteService;
            _context.UserEmail = "Ambiorix.Liriano@gmail.com";
        }

        // GET: api/ZonaSteds
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ZonaStedConsultaDto>>> GetZonasSted()
        {
            if (_context.ZonasSted == null)
            {
                return NotFound(new ErrorResponse("No existe registros."));
            }

            var zonaSted = await _context.ZonasSted.ToListAsync();
            var zonaStedDto = mapper.Map<List<ZonaStedConsultaDto>>(zonaSted);

            return zonaStedDto;
        }

        // GET: api/ZonaSteds/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ZonaStedConsultaDto>> GetZonaSted(int id)
        {
            if (_context.ZonasSted == null)
            {
                return NotFound();
            }
            var zonaSted = await _context.ZonasSted.FindAsync(id);

            if (zonaSted == null)
            {
                return NotFound(new ErrorResponse("No existe registros."));
            }


            var zonaStedDto = mapper.Map<ZonaStedConsultaDto>(zonaSted);

            return zonaStedDto;
        }

        // PUT: api/ZonaSteds/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutZonaSted(int id, ZonaStedUpdateDto zonaStedDto)
        {
            if (id != zonaStedDto.IdZonaSted)
            {
                return BadRequest(new ErrorResponse("El id enviado no es igual con al del modelo. "));
            }

            if (ZonaStedNameExistsByCliente(zonaStedDto.IdZonaSted, zonaStedDto.IdCliente, zonaStedDto.NombreZona))
            {
                return NotFound(new ErrorResponse("Este nombre de Zona Sted, ya existe para este cliente."));
            }

            var zonaSted = mapper.Map<ZonaSted>(zonaStedDto);
            _context.Entry(zonaSted).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ZonaStedExists(id))
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

        // POST: api/ZonaSteds
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ZonaSted>> PostZonaSted(ZonaStedCrearDto zonaStedDto)
        {
            if (_context.ZonasSted == null)
            {
                return NotFound(new ErrorResponse("No existe registros."));
            }

            if (ZonaStedNameExistsByCliente(0, zonaStedDto.IdCliente, zonaStedDto.NombreZona))
            {
                return NotFound(new ErrorResponse("Este nombre de Zona Sted, ya existe para este cliente."));
            }

            var zonaSted = mapper.Map<ZonaSted>(zonaStedDto);

            _context.ZonasSted.Add(zonaSted);
            await _context.SaveChangesAsync();

            return Ok(zonaSted.IdZonaSted);
        }

        // DELETE: api/ZonaSteds/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteZonaSted(int id)
        {
            await _softDeleteService.SoftDelete<ZonaSted>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool ZonaStedExists(int id)
        {
            return (_context.ZonasSted?.Any(e => e.IdZonaSted == id)).GetValueOrDefault();
        }

        private bool ZonaStedNameExistsByCliente(int IdzonaSted, long cliente, string name)
        {
            if (IdzonaSted == 0)
                return (_context.ZonasSted?.Any(e => e.NombreZona == name
                                                  && e.IdCliente == cliente)
                                                ).GetValueOrDefault();

            else
                return (_context.ZonasSted?.Any(e => e.NombreZona == name
                                                  && e.IdCliente == cliente
                                                  && e.IdZonaSted != IdzonaSted)
                                                ).GetValueOrDefault();
        }
    }
}
