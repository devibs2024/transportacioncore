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
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Dias;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class DiasController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;

        public DiasController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            this.mapper = mapper;
        }

       
        [HttpGet]
        public async Task<ActionResult<IEnumerable<DiasConsultaDto>>> GetDias()
        {
          if (_context.Dias == null)
          {
              return NotFound();
          }

          var catalogoDias = await _context.Dias.ToListAsync();

            var diasConsultaDto = mapper.Map<List<DiasConsultaDto>>(catalogoDias);
            return diasConsultaDto;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<DiasConsultaDto>> GetCatalogoDias(int id)
        {
          if (_context.Dias == null)
          {
              return NotFound();
          }
            var catalogoDias = await _context.Dias.FindAsync(id);

            var diasConsultaDto = mapper.Map<DiasConsultaDto>(catalogoDias);

            if (catalogoDias == null)
            {
                return NotFound();
            }

            return diasConsultaDto;
        }
                
    }
}
