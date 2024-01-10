using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using TransportationCore.Data;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using TransportationCore.CustomError;
using TransportationCore.Data.Utilidades;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class EstadosController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public EstadosController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<EstadoConsultaDto>>> GetEstados()
        {
            if (_context.Estados == null)
            {
                return NotFound();
            }

            var estados = await _context.Estados.ToListAsync();

            var estadosDto = mapper.Map<List<EstadoConsultaDto>>(estados);

            return estadosDto;
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<EstadoConsultaDto>> GetEstado(int id)
        {
            if (_context.Estados == null)
            {
                return NotFound();
            }
            var estado = await _context.Estados.FirstAsync(b => b.IdEstado == id);

            if (estado == null)
            {
                return NotFound();
            }

            var estadoDto = mapper.Map<EstadoConsultaDto>(estado);

            return estadoDto;
        }


        //
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEstado(int id, EstadoUpdateDto estadoDto)
        {
            if (id != estadoDto.IdEstado)
            {
                return BadRequest();
            }

            if (EstadoNombreExists(estadoDto.IdEstado, estadoDto.NombreEstado))
            {
                return NotFound(new ErrorResponse("El nombre del estado ya existe."));
            }

            var estado = mapper.Map<CatalogoEstado>(estadoDto);

            _context.Entry(estado).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EstadoExists(id))
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
        public async Task<ActionResult> PostEstado(EstadoCrearDto estadoDto)
        {
            if(EstadoNombreExists(0, estadoDto.NombreEstado))
            {
                return NotFound(new ErrorResponse("El nombre del estado ya existe."));
            }

            var estado = mapper.Map<CatalogoEstado>(estadoDto);
            estado.Activo = true;

            _context.Estados.Add(estado);
            await _context.SaveChangesAsync();

            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEstado(int id)
        {
            await softDeleteService.SoftDelete<CatalogoEstado>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool EstadoExists(int id)
        {
            return (_context.Estados?.Any(e => e.IdEstado == id)).GetValueOrDefault();
        }

        private bool EstadoNombreExists(int id, string name)
        {
            if (id == 0)
                return (_context.Estados?.Any(e => e.NombreEstado == name)).GetValueOrDefault();
            else
                return (_context.Estados?.Any(e => e.IdEstado != id && e.NombreEstado == name)).GetValueOrDefault();
        }
    }
}