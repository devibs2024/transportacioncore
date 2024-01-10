using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using System.Linq;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.HorarioEmpleado;
using TransportationCore.Data.Dtos.OperadorCoordinador;
using TransportationCore.Data.Dtos.OperadorSucursal;
using TransportationCore.Data.Dtos.Sucursal;
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadoHorariosController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;

        public EmpleadoHorariosController(ApplicationDbContext context, IMapper mapper)
        {
            this._context = context;
            this.mapper = mapper;
        }

        [HttpGet("{idEmpleado}")]
        public async Task<ActionResult> GetHorariosAsignados(long idEmpleado)
        {
            if (_context.HorarioEmpleados == null)
            {
                return NotFound();
            }

            var horariosAsignados = await (from h in _context.Horarios
                                           join he in _context.HorarioEmpleados
                                           on h.IdHorario equals he.IdHorario
                                           join e in _context.Empleados
                                           on he.IdEmpleado equals e.IdEmpleado
                                           join d in _context.Dias
                                           on h.IdDia equals d.IdDia
                                           where e.IdEmpleado == idEmpleado
                                           select new
                                           {
                                               h.IdHorario,
                                               e.IdEmpleado,
                                               e.Nombres,
                                               d.Descripcion,
                                               h.HoraInicio,
                                               h.HoraFin

                                           }).ToListAsync();

            return Ok(horariosAsignados);

        }

        [HttpPost]
        public async Task<ActionResult> PostEmpleadoHorario(HorarioEmpleadoDto horarioEmpleadoDto)
        {
            if (_context.HorarioEmpleados == null)
            {
                return Problem("Entity set 'ApplicationDbContext.AsignacionTarjeta'  is null.");
            }

            if(ValidarHorario(horarioEmpleadoDto)) return BadRequest("El horario es invalido");

            var horarioEmpleado = mapper.Map<HorarioEmpleado>(horarioEmpleadoDto);
            _context.HorarioEmpleados.Add(horarioEmpleado);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteEmpleadoHorario(HorarioEmpleadoDto horarioEmpleadoDto)
        {
            if (_context.HorarioEmpleados == null)
            {
                return NotFound();
            }
            var horarioEmpleado = await _context.HorarioEmpleados
                .FirstOrDefaultAsync(x => x.IdEmpleado == horarioEmpleadoDto.IdEmpleado
                                       && x.IdHorario == horarioEmpleadoDto.IdHorario);

            if (horarioEmpleado == null)
            {
                return NotFound();
            }

            _context.HorarioEmpleados.Remove(horarioEmpleado);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ValidarHorario(HorarioEmpleadoDto horarioEmpleadoDto)
        {
            //Validar que el horario no exista
            var horarioActual = _context.Horarios.FirstOrDefault(x => x.IdHorario == horarioEmpleadoDto.IdHorario);

            if (horarioActual != null)
            {
                var horariosAsignados = (from h in _context.Horarios
                                         join he in _context.HorarioEmpleados
                                         on h.IdHorario equals he.IdHorario
                                         where he.IdEmpleado == horarioEmpleadoDto.IdEmpleado
                                         && h.IdDia == horarioActual.IdDia
                                         select new Horarios { 
                                             
                                             IdDia = h.IdDia,
                                             IdHorario = h.IdHorario,
                                             HoraInicio = h.HoraInicio,
                                             HoraFin = h.HoraFin
                                         
                                         });

                foreach (var item in horariosAsignados)
                {
                    if (item.IdHorario == horarioActual.IdHorario) return true;


                    if (horarioActual.HoraInicio > item.HoraInicio && horarioActual.HoraInicio < item.HoraFin) return true;
                    if (horarioActual.HoraFin > item.HoraInicio && horarioActual.HoraFin < item.HoraFin) return true;
                }
            }
                       

            return false;
        }

    }
}
