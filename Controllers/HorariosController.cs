using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Horario;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HorariosController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;

        public HorariosController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            this.mapper = mapper;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<HorarioConsultaDto>>> GetHorarios()
        {
            if (_context.Horarios == null)
            {
                return NotFound();
            }

            var hoarios = await _context.Horarios.Include(x => x.Dias).ToListAsync();

            var horarioDto = mapper.Map<List<HorarioConsultaDto>>(hoarios);

            return horarioDto;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<HorarioConsultaDto>> GetHorarios(long id)
        {
            if (_context.Horarios == null)
            {
                return NotFound();
            }
            var horarios = await _context.Horarios.Include(x => x.Dias).FirstOrDefaultAsync(x => x.IdDia == id);
            var horarioDto = mapper.Map<HorarioConsultaDto>(horarios);

            if (horarios == null)
            {
                return NotFound();
            }

            return horarioDto;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutHorarios(long id, HorarioUpdateDto horarioDto)
        {
            if (id != horarioDto.IdHorario)
            {
                return BadRequest();
            }


            TimeSpan? inicio = new TimeSpan(horarioDto.HoraE, horarioDto.MinutoE, 00);
            TimeSpan? salida = new TimeSpan(horarioDto.HoraF, horarioDto.MinutoF, 00);

            if (inicio.Value > salida.Value)
                return BadRequest("Horario invalido");

            Horarios horarios = new Horarios();
            horarios.IdHorario = horarioDto.IdHorario;
            horarios.IdDia = horarioDto.IdDia;
            horarios.HoraInicio = inicio;
            horarios.HoraFin = salida;
            horarios.Activo = true;

            if (!HorariosExists(horarios))
            {
                _context.Entry(horarios).State = EntityState.Modified;
                await _context.SaveChangesAsync();
            }
            else
            {
                return BadRequest("Este horario ya existe, para el dia en custion.");
            }

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<Horarios>> PostHorarios(HorarioCrearDto horarioDto)
        {
            if (_context.Horarios == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Horarios'  is null.");
            }

            TimeSpan? inicio = new TimeSpan(horarioDto.HoraE, horarioDto.MinutoE, 00);
            TimeSpan? salida = new TimeSpan(horarioDto.HoraF, horarioDto.MinutoF, 00);

            if (inicio.Value > salida.Value)
                return BadRequest("Horario invalido");

            Horarios horarios = new Horarios();
            horarios.IdDia = horarioDto.IdDia;
            horarios.HoraInicio = inicio;
            horarios.HoraFin = salida;
            horarios.Activo = true;

            if (!HorariosExists(horarios))
            {
                _context.Horarios.Add(horarios);
                await _context.SaveChangesAsync();
            }
            else
            {
                return BadRequest("Este horario ya existe, para el dia en custion.");
            }



            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteHorarios(long id)
        {
            if (_context.Horarios == null)
            {
                return NotFound();
            }
            var horarios = await _context.Horarios.FindAsync(id);
            if (horarios == null)
            {
                return NotFound();
            }

            _context.Horarios.Remove(horarios);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool HorariosExists(Horarios horario)
        {
            var resultado = _context.Horarios.FirstOrDefault(x => x.HoraInicio == horario.HoraInicio
                                                            && x.HoraFin == horario.HoraFin
                                                            && x.IdDia == horario.IdDia);

            return (resultado != null);
        }
    }
}
