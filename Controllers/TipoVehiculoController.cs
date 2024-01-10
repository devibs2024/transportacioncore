using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using TransportationCore.Data;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Dtos.TipoVehiculo;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
   // ////[Authorize(Policy = "AsignarVehiculoPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class TipoVehiculoController: ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;

        public TipoVehiculoController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            this.mapper = mapper;
            
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<TipoVehiculoConsultaDto>>> GetTipoVehiculo()
        {
            if (_context.TipoVehiculos == null)
            {
                return NotFound();
            }

            var tipoVehiculo = await _context.TipoVehiculos.Include(x=> x.Tarifas)
                                                           .Include(x=> x.MarcaVehiculos).ToListAsync();

            var tipoVehiculoDto = mapper.Map<List<TipoVehiculoConsultaDto>>(tipoVehiculo);

            return tipoVehiculoDto;
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<TipoVehiculoConsultaDto>> GetTipoVehiculo(int id)
        {
            if (_context.TipoVehiculos == null)
            {
                return NotFound();
            }
            var tipoVehiculo = await _context.TipoVehiculos.Include(x=>x.Tarifas).FirstAsync(b => b.IdTipoVehiculo == id);

            if (tipoVehiculo == null)
            {
                return NotFound();
            }

            var tipoVehiculoDto = mapper.Map<TipoVehiculoConsultaDto>(tipoVehiculo);

            return tipoVehiculoDto;
        }
    }
}
