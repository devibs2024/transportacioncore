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
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "AsignarTCPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class AsignacionTarjetasController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public AsignacionTarjetasController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }

        [HttpGet("{idEmpleado}")]
        public async Task<ActionResult<IEnumerable<TarjetaAsignacionConsultaDto>>> GetAsignacionTarjeta(long idEmpleado)
        {
            if (_context.AsignacionTarjeta == null)
            {
                return NotFound();
            }

            var asignacionTarjeta = await _context.AsignacionTarjeta.Where(x => x.IdEmpleado == idEmpleado).ToListAsync();
            var tarjetaAsingacionDto = mapper.Map<IEnumerable<TarjetaAsignacionConsultaDto>>(asignacionTarjeta);


            return tarjetaAsingacionDto.ToList();

        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutAsignacionTarjeta(long id, TarjetaAsignacionUpdateDto tarjetaAsignacionUpdateDto)
        {
            if (id != tarjetaAsignacionUpdateDto.IdTarjeta)
            {
                return BadRequest();
            }

            var asignacionTarjeta = await _context.AsignacionTarjeta.FirstOrDefaultAsync(x => x.IdTarjeta == tarjetaAsignacionUpdateDto.IdTarjeta);

            if (asignacionTarjeta == null) { return NotFound(new ErrorResponse("El registro no existe.")); }

            asignacionTarjeta.MontoDiario = tarjetaAsignacionUpdateDto.MontoDiario;


            _context.Entry(asignacionTarjeta).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AsignacionTarjetaExists(id))
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
        public async Task<ActionResult> PostAsignacionTarjeta(TarjetaAsignacionCreacionDto tarjetaAsignacionCreacionDto)
        {
            if (_context.AsignacionTarjeta == null)
            {
                return NotFound(new ErrorResponse("La tarjeta no existe."));
            }

            if (NumTarjetaExists(tarjetaAsignacionCreacionDto.NumTarjeta))
            {
                return BadRequest(new ErrorResponse("Este numero de tarjeta está siendo utilizado, favor validar."));
            }

            //Solo una tarjeta de gasolina por operador:
            var tarjetaOperador = await _context.AsignacionTarjeta.FirstOrDefaultAsync(x =>
                                 x.IdEmpleado == tarjetaAsignacionCreacionDto.IdEmpleado);

            if (tarjetaOperador != null) return BadRequest(new ErrorResponse("Este operador ya tiene una Tarjeta Asignada."));


            /* if (tarjetaAsignacionCreacionDto.TarjetaPrincipal == true)
             {
                 var tarjetaBanco = await _context.AsignacionTarjeta.FirstOrDefaultAsync(x =>
                                   x.IdEmpleado == tarjetaAsignacionCreacionDto.IdEmpleado && x.TarjetaPrincipal == true);

                 if (tarjetaBanco != null)
                 {
                     tarjetaBanco.TarjetaPrincipal = false;
                     _context.Entry(tarjetaBanco).State = EntityState.Modified;
                     await _context.SaveChangesAsync();
                 }
             }
             */


            var asignacionTarjeta = mapper.Map<AsignacionTarjeta>(tarjetaAsignacionCreacionDto);
            asignacionTarjeta.Activa = true;
            asignacionTarjeta.TarjetaPrincipal = true;

            _context.AsignacionTarjeta.Add(asignacionTarjeta);
            await _context.SaveChangesAsync();

            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAsignacionTarjeta(long id)
        {
            await softDeleteService.SoftDelete<AsignacionTarjeta>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool AsignacionTarjetaExists(long id)
        {
            return (_context.AsignacionTarjeta?.Any(e => e.IdTarjeta == id)).GetValueOrDefault();
        }

        private bool NumTarjetaExists(string tarjeta)
        {
            return (_context.AsignacionTarjeta?.Any(e => e.NumTarjeta.Trim().ToUpper() == tarjeta.Trim().ToUpper())).GetValueOrDefault();
        }

    }
}
