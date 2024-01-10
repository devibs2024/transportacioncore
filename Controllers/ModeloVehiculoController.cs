using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using TransportationCore.Data;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Dtos.ModeloVehiculo;
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
    public class ModeloVehiculoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public ModeloVehiculoController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }


        [HttpGet("IdMarca")]
        public async Task<ActionResult<IEnumerable<ModeloVehiculoConsultaDto>>> GetModeloVehiculo(int IdMarca)
        {
            if (_context.ModeloVehiculos == null)
            {
                return NotFound();
            }

            var modeloVehiculo = await _context.ModeloVehiculos.Include(x => x.MarcaVehiculos).Where(x => x.IdMarca == IdMarca).ToListAsync();

            var modeloVehiculoDto = mapper.Map<List<ModeloVehiculoConsultaDto>>(modeloVehiculo);

            return modeloVehiculoDto;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ModeloVehiculoConsultaDto>>> GetModeloVehiculo()
        {
            if (_context.ModeloVehiculos == null)
            {
                return NotFound();
            }

            var modeloVehiculo = await _context.ModeloVehiculos.Include(x => x.MarcaVehiculos).ToListAsync();

            var modeloVehiculoDto = mapper.Map<List<ModeloVehiculoConsultaDto>>(modeloVehiculo);

            return modeloVehiculoDto;
        }


        [HttpGet("{IdMarca},{IdModelo}")]
        public async Task<ActionResult<ModeloVehiculoConsultaDto>> GetModeloVehiculo(int IdMarca, int IdModelo)
        {
            if (_context.ModeloVehiculos == null)
            {
                return NotFound();
            }
            var modeloVehiculo = await _context.ModeloVehiculos.Include(x => x.Vehiculos).FirstOrDefaultAsync(b => b.IdModelo == IdModelo && b.IdMarca == IdMarca);

            if (modeloVehiculo == null)
            {
                return NotFound();
            }

            var modeloVehiculoDto = mapper.Map<ModeloVehiculoConsultaDto>(modeloVehiculo);

            return modeloVehiculoDto;
        }


        //
        [HttpPut("{id}")]
        public async Task<IActionResult> PutModeloVehiculo(int id, ModeloVehiculoUpdateDto modeloVehiculoDto)
        {
            if (id != modeloVehiculoDto.IdModelo)
            {
                return BadRequest();
            }

            if (ModeloVehiNameExists(modeloVehiculoDto.IdModelo, modeloVehiculoDto.Modelo))
            {
                return Ok(new ErrorResponse("El nombre del modelo ya existe."));
            }

            var modelveh = mapper.Map<CatalogoModeloVehiculos>(modeloVehiculoDto);

            _context.Entry(modelveh).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ModeloVehiExists(id))
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
        public async Task<ActionResult> PostModeloVehiculo(ModeloVehiculoCrearDto modeloVehiculoDto)
        {
            if (ModeloVehiNameExists(0, modeloVehiculoDto.Modelo))
            {
                return Ok(new ErrorResponse("El nombre del modelo ya existe."));
            }

            var modelveh = mapper.Map<CatalogoModeloVehiculos>(modeloVehiculoDto);
            modelveh.Activo = true;

            _context.ModeloVehiculos.Add(modelveh);
            await _context.SaveChangesAsync();

            return Ok(modelveh.IdModelo);
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteModeloVehiculo(int id)
        {
            await softDeleteService.SoftDelete<CatalogoModeloVehiculos>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool ModeloVehiExists(int id)
        {
            return (_context.ModeloVehiculos?.Any(e => e.IdModelo == id)).GetValueOrDefault();
        }

        private bool ModeloVehiNameExists(int id, string name)
        {
            if (id == 0)
                return (_context.ModeloVehiculos?.Any(e => e.Modelo == name)).GetValueOrDefault();
            else
                return (_context.ModeloVehiculos?.Any(e => e.IdModelo != id && e.Modelo == name)).GetValueOrDefault();
        }

    }
}
