using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml;
using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Zona;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class ZonasController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public ZonasController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _softDeleteService = softDeleteService;
            _context.UserEmail = "Ambiorix.Liriano@gmail.com";
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<ZonaConsultaDto>>> GetZonas()
        {
            if (_context.Zonas == null)
            {
                return NotFound();
            }
            var zona = await _context.Zonas.ToListAsync();
            var zonaDto = mapper.Map<List<ZonaConsultaDto>>(zona);
            return zonaDto;
        }



        [HttpGet("{id}")]
        public async Task<ActionResult<ZonaConsultaDto>> GetZona(int id)
        {
            if (_context.Zonas == null)
            {
                return NotFound();
            }
            var zona = await _context.Zonas.FindAsync(id);
            var zonaDto = mapper.Map<ZonaConsultaDto>(zona);

            if (zona == null)
            {
                return NotFound();
            }

            return zonaDto;
        }



        [HttpPut("{id}")]
        public async Task<IActionResult> PutZona(int id, ZonaUpdateDto zonaDto)
        {
            if (id != zonaDto.IdZona)
            {
                return BadRequest();
            }

            if (ZonaNameExist(zonaDto.IdZona, zonaDto.NombreZona))
            {
                return NotFound(new ErrorResponse("Este nombre de zona, ya existe."));
            }

            var zona = mapper.Map<Zona>(zonaDto);
            _context.Entry(zona).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ZonaExists(id))
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
        public async Task<ActionResult> PostZona(ZonaCrearDto zonaDto)
        {
            var zona = mapper.Map<Zona>(zonaDto);

            if (ZonaNameExist(0, zonaDto.NombreZona))
            {
                return NotFound(new ErrorResponse("Este nombre de zona, ya existe."));
            }


            _context.Zonas.Add(zona);
            await _context.SaveChangesAsync();

            return NoContent();
        }



        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteZona(int id)
        {
            await _softDeleteService.SoftDelete<Zona>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool ZonaExists(int id)
        {
            return (_context.Zonas?.Any(e => e.IdZona == id)).GetValueOrDefault();
        }

        private bool ZonaNameExist(int Idzona, string name)
        {
            if (Idzona == 0)
                return (_context.Zonas?.Any(e => e.NombreZona == name)
                                                ).GetValueOrDefault();

            else
                return (_context.Zonas?.Any(e => e.NombreZona == name
                                              && e.IdZona != Idzona)
                                                ).GetValueOrDefault();
        }
    }
}
