using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using TransportationCore.Data;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Dtos.Cliente;
using TransportationCore.Data.Models;
using TransportationCore.Data.Dtos.Sucursal;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using TransportationCore.CustomError;
using TransportationCore.Data.Models.ConfigurationModel;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class MunicipioController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public MunicipioController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<MunicipioConsultaDto>>> GetMunicipio()
        {
            if (_context.Municipios == null)
            {
                return NotFound();
            }

            var municipio = await _context.Municipios.Include(x => x.Estado).ToListAsync();

            var municipioDto = mapper.Map<List<MunicipioConsultaDto>>(municipio);

            return municipioDto;
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<MunicipioConsultaDto>> GetMunicipio(int id)
        {
            if (_context.Municipios == null)
            {
                return NotFound();
            }
            var municipio = await _context.Municipios.FirstAsync(b => b.IdMunicipio == id);

            if (municipio == null)
            {
                return NotFound();
            }

            var municipioDto = mapper.Map<MunicipioConsultaDto>(municipio);

            return municipioDto;
        }


        //
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMunicipio(int id, MunicipioUpdateDto municipioDto)
        {
            if (id != municipioDto.IdMunicipio)
            {
                return BadRequest();
            }

            if (MunicipioNameExists(municipioDto.IdMunicipio, municipioDto.NombreMunicipio))
            {
                return NotFound(new ErrorResponse("Este nombre de municipio ya existe."));
            }

            var municipio = mapper.Map<CatalogoMunicipio>(municipioDto);

            _context.Entry(municipio).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MunicipioExists(id))
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
        public async Task<ActionResult> PostMunicipio(MunicipioCrearDto municipioDto)
        {
            var municipio = mapper.Map<CatalogoMunicipio>(municipioDto);
            municipio.Activo = true;

            if (MunicipioNameExists(0, municipio.NombreMunicipio))
            {
                return NotFound(new ErrorResponse("Este nombre de municipio ya existe."));
            }

            _context.Municipios.Add(municipio);
            await _context.SaveChangesAsync();

            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMunicipio(int id)
        {
            await softDeleteService.SoftDelete<CatalogoMunicipio>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool MunicipioExists(long id)
        {
            return (_context.Municipios?.Any(e => e.IdMunicipio == id)).GetValueOrDefault();
        }

        private bool MunicipioNameExists(int id, string name)
        {
            if (id == 0)
                return (_context.Municipios?.Any(e => e.NombreMunicipio == name)).GetValueOrDefault();
            else
                return (_context.Municipios?.Any(e => e.IdMunicipio != id && e.NombreMunicipio == name)).GetValueOrDefault();
        }

    }
}
