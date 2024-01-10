using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using TransportationCore.Data;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Dtos.MarcaVehiculo;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using TransportationCore.Data.Dtos.TipoVehiculo;
using TransportationCore.Data.Models;
using TransportationCore.CustomError;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Controllers
{
    // ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class MarcaVehiculoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public MarcaVehiculoController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }


        [HttpGet("{IdTipoVehiculo}")]
        public async Task<ActionResult<IEnumerable<MarcaVehiculoConsultaDto>>> GetMarcaVehiculo(int IdTipoVehiculo)
        {
            if (_context.MarcaVehiculos == null)
            {
                return NotFound();
            }

            var marchaVehiculo = await _context.MarcaVehiculos.Include(x => x.TipoVehiculos).Where(x => x.IdTipo == IdTipoVehiculo).ToListAsync();

            var marchaVehiculoDto = mapper.Map<List<MarcaVehiculoConsultaDto>>(marchaVehiculo);

            return marchaVehiculoDto;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<MarcaVehiculoConsultaDto>>> GetMarcaVehiculo()
        {
            if (_context.MarcaVehiculos == null)
            {
                return NotFound();
            }

            var marchaVehiculo = await _context.MarcaVehiculos.Include(x => x.TipoVehiculos).ToListAsync();

            var marchaVehiculoDto = mapper.Map<List<MarcaVehiculoConsultaDto>>(marchaVehiculo);

            return marchaVehiculoDto;
        }

        [HttpGet("{IdTipoVehiculo},{IdMarca}")]
        public async Task<ActionResult<MarcaVehiculoConsultaDto>> GetMarcaVehiculo(int IdTipoVehiculo, int IdMarca)
        {
            if (_context.MarcaVehiculos == null)
            {
                return NotFound();
            }
            var marchaVehiculo = await _context.MarcaVehiculos.Include(x => x.ModeloVehiculos)
                                .FirstOrDefaultAsync(b => b.IdMarca == IdMarca && b.IdTipo == IdTipoVehiculo);

            if (marchaVehiculo == null)
            {
                return NotFound();
            }

            var marchaVehiculoDto = mapper.Map<MarcaVehiculoConsultaDto>(marchaVehiculo);

            return marchaVehiculoDto;
        }


        //
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMarcaVehiculo(int id, MarcaVehiculoUpdateDto marcaVehiculoDto)
        {
            if (MarcaVehiNameExists(marcaVehiculoDto.IdMarca, marcaVehiculoDto.Marca))
            {
                return NotFound(new ErrorResponse("El nombre de la marca existe."));
            }

            if (id != marcaVehiculoDto.IdMarca)
            {
                return BadRequest();
            }

            var marcaVeh = mapper.Map<CatalogoMarcaVehiculos>(marcaVehiculoDto);

            _context.Entry(marcaVeh).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MarcaVehiExists(id))
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
        public async Task<ActionResult> PostMarcaVehiculo(MarcaVehiculoCrearDto marcaVehiculoDto)
        {
            if (MarcaVehiNameExists(0, marcaVehiculoDto.Marca))
            {
                return NotFound(new ErrorResponse("El nombre de la marca existe."));
            }

            var marcaveh = mapper.Map<CatalogoMarcaVehiculos>(marcaVehiculoDto);
            marcaveh.Activo = true;

            _context.MarcaVehiculos.Add(marcaveh);
            await _context.SaveChangesAsync();

            return Ok(marcaveh.IdMarca);
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMarcaVehiculo(int id)
        {
            await softDeleteService.SoftDelete<CatalogoMarcaVehiculos>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool MarcaVehiExists(int id)
        {
            return (_context.MarcaVehiculos?.Any(e => e.IdMarca == id)).GetValueOrDefault();
        }

        private bool MarcaVehiNameExists(int id, string name)
        {
            if (id == 0)
                return (_context.MarcaVehiculos?.Any(e => e.Marca == name)).GetValueOrDefault();
            else
                return (_context.MarcaVehiculos?.Any(e => e.IdMarca != id && e.Marca == name)).GetValueOrDefault();
        }

    }
}
