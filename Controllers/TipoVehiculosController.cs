using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using TransportationCore.Data;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Dtos.TipoVehiculo;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using TransportationCore.Data.Models;
using TransportationCore.CustomError;
using TransportationCore.Data.Utilidades;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Controllers
{
   // ////[Authorize(Policy = "AsignarVehiculoPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class TipoVehiculosController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public TipoVehiculosController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this._softDeleteService = softDeleteService;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<TipoVehiculoConsultaDetalleDto>>> GetTipoVehiculo()
        {
            if (_context.TipoVehiculos == null)
            {
                return NotFound();
            }


            var tipoVehiculo = await _context.TipoVehiculos.Include(x=> x.Tarifas).Include(x => x.MarcaVehiculos)                                                                                                                      
                                                           .ThenInclude(marca => marca.ModeloVehiculos).ToListAsync();

            var tipoVehiculoDto = mapper.Map<List<TipoVehiculoConsultaDetalleDto>>(tipoVehiculo);

            return tipoVehiculoDto;
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<TipoVehiculoConsultaDetalleDto>> GetTipoVehiculo(int id)
        {
            if (_context.TipoVehiculos == null)
            {
                return NotFound();
            }
            var tipoVehiculo = await _context.TipoVehiculos.Include(x=> x.Tarifas).Include(x => x.MarcaVehiculos)
                                                           .ThenInclude(marca => marca.ModeloVehiculos)
                                                           .FirstAsync(b => b.IdTipoVehiculo == id);

            if (tipoVehiculo == null)
            {
                return NotFound();
            }

            var tipoVehiculoDto = mapper.Map<TipoVehiculoConsultaDetalleDto>(tipoVehiculo);

            return tipoVehiculoDto;
        }


        //
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTipoVehiculo(int id, TipoVehiculoUpdateDto tipoVehiculoDto)
        {
            if (id != tipoVehiculoDto.IdTipoVehiculo)
            {
                return BadRequest();
            }

            if (TipoVehiculoNameExist(tipoVehiculoDto.IdTipoVehiculo, tipoVehiculoDto.TipoVehiculo))
            {
                return NotFound(new ErrorResponse("El tipo de vehiculo ya existe, favor validar."));
            }

            var tipoveh = mapper.Map<CatalogoTipoVehiculos>(tipoVehiculoDto);

            _context.Entry(tipoveh).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TipoVehiExists(id))
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
        public async Task<ActionResult> PostTipoVehiculo(TipoVehiculoCrearDto tipoVehiculoDto)
        {
            var tipoveh = mapper.Map<CatalogoTipoVehiculos>(tipoVehiculoDto);
            tipoveh.Activo = true;

            if (TipoVehiculoNameExist(0, tipoVehiculoDto.TipoVehiculo))
            {
                return NotFound(new ErrorResponse("El tipo de vehiculo ya existe, favor validar."));
            }

            _context.TipoVehiculos.Add(tipoveh);
            await _context.SaveChangesAsync();

            return Ok(tipoveh.IdTipoVehiculo);
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTipoVehiculo(int id)
        {            
            await _softDeleteService.SoftDelete<CatalogoTipoVehiculos>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool TipoVehiExists(int id)
        {
            return (_context.TipoVehiculos?.Any(e => e.IdTipoVehiculo == id)).GetValueOrDefault();
        }

        private bool TipoVehiculoNameExist(long id, string name)
        {
            if (id == 0)
                return (_context.TipoVehiculos?.Any(e => e.TipoVehiculo == name)).GetValueOrDefault();
            else
                return (_context.TipoVehiculos?.Any(e => e.IdTipoVehiculo != id
                                                  && e.TipoVehiculo == name)
                                                ).GetValueOrDefault();
        }
    }
}
