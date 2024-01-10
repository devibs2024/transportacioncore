using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Formato;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FormatosController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;

        public FormatosController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            this.mapper= mapper;
        }

        

        [HttpGet]
        public async Task<ActionResult<IEnumerable<FormatoConsultaDto>>> GetFormatos()
        {
          if (_context.Formatos == null)
          {
              return NotFound();
          }
            var formato = await _context.Formatos.ToListAsync();
            var formatoDto = mapper.Map<List<FormatoConsultaDto>>(formato);
            return formatoDto;
        }

        

        [HttpGet("{id}")]
        public async Task<ActionResult<FormatoConsultaDto>> GetFormato(int id)
        {
          if (_context.Formatos == null)
          {
              return NotFound();
          }
            var formato = await _context.Formatos.FindAsync(id);
            var formatoDto = mapper.Map<FormatoConsultaDto>(formato);

            if (formato == null)
            {
                return NotFound();
            }

            return formatoDto;
        }


    }
}
