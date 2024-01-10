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
using NuGet.Versioning;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.OperadorVehiculo;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "AsignarVehiculoPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class OperadorVehiculoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public OperadorVehiculoController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            _softDeleteService = softDeleteService;
        }

        [HttpGet("{idEmpleado}")]
        public async Task<ActionResult<IEnumerable<OperadorVehiculoConsultaDto>>> GetVehiculoOperadores(long idEmpleado)
        {
            if (_context.VehiculoOperadores == null)
            {
                return NotFound();
            }
            var operadorVehiculo = await _context.VehiculoOperadores.Include(x => x.Vehiculo)
                .Include(x => x.Vehiculo.MarcaVehiculo).Include(x => x.Vehiculo.ModeloVehiculo)
                .Include(x => x.Vehiculo.TipoVehiculo)
                .Where(x => x.IdEmpleado == idEmpleado).ToListAsync();

            var operadorVehiculoDto = mapper.Map<IEnumerable<OperadorVehiculoConsultaDto>>(operadorVehiculo);
            return operadorVehiculoDto.ToList();
        }

        [HttpGet("{idEmpleado},{idVehiculo}")]
        public async Task<ActionResult<OperadorVehiculoConsultaDto>> GetVehiculoOperador(long idEmpleado, long idVehiculo)
        {
            if (_context.VehiculoOperadores == null)
            {
                return NotFound();
            }

            var vehiculoOperador = await _context.VehiculoOperadores
                .Include(x => x.Vehiculo)
                .Include(x => x.Vehiculo.MarcaVehiculo)
                .Include(x => x.Vehiculo.ModeloVehiculo)
                .Include(x => x.Vehiculo.TipoVehiculo)
                .Include(x => x.Empleado)
                .FirstOrDefaultAsync(x => x.IdVehiculo == idVehiculo && x.IdEmpleado == idEmpleado);


            if (vehiculoOperador == null)
            {
                return NotFound();
            }

            var vehiculoOperadorDto = mapper.Map<OperadorVehiculoConsultaDto>(vehiculoOperador);
            return vehiculoOperadorDto;
        }

        [HttpPut("{idEmpleado},{idVehiculo}")]
        public async Task<IActionResult> PutVehiculoOperador(long idEmpleado, long idVehiculo, OperadorVehiculoUpdateDto vehiculoOperadorDto)
        {
            if (idEmpleado != vehiculoOperadorDto.IdEmpleado || idVehiculo != vehiculoOperadorDto.IdVehiculo)
            {
                return BadRequest();
            }

            if(VehiculoPlacaExists(idVehiculo,vehiculoOperadorDto.NombreVehiculo))
                return BadRequest(new ErrorResponse("Este numero de placa existe para otro vehiculo"));

            var vehiculo = mapper.Map<Vehiculo>(vehiculoOperadorDto);

            _context.Entry(vehiculo).State = EntityState.Modified;


            try
            {
                await _context.SaveChangesAsync();

                var vehiculoOperador = mapper.Map<VehiculoOperador>(vehiculoOperadorDto);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VehiculoOperadorExists(idVehiculo))
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
        public async Task<ActionResult> PostVehiculoOperador(OperadorVehiculoCrearDto vehiculoOperadorDto)
        {
            if (_context.VehiculoOperadores == null)
            {
                return NotFound(new ErrorResponse("El vehiculo no existe."));
            }

            if (VehiculoPlacaExists(0,vehiculoOperadorDto.NombreVehiculo))
                return BadRequest(new ErrorResponse("Este numero de placa existe para otro vehiculo"));

            var vehiculo = mapper.Map<Vehiculo>(vehiculoOperadorDto);

            _context.Vehiculos.Add(vehiculo);
            await _context.SaveChangesAsync();

            var vehiculoOperador = mapper.Map<VehiculoOperador>(vehiculoOperadorDto);
            vehiculoOperador.IdVehiculo = vehiculo.IdVehiculo;
            _context.VehiculoOperadores.Add(vehiculoOperador);

            await _context.SaveChangesAsync();
            return Ok(vehiculoOperadorDto.IdEmpleado);
        }


        [HttpDelete("{idEmpleado},{idVehiculo}")]
        public async Task<IActionResult> DeleteVehiculoOperador(long idEmpleado, long idVehiculo)
        {  
            await _softDeleteService.SoftDelete<Vehiculo>(idVehiculo);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool VehiculoOperadorExists(long vehiculo)
        {
            return (_context.VehiculoOperadores?.Any(e => e.IdVehiculo == vehiculo)).GetValueOrDefault();
        }

        private bool VehiculoPlacaExists(long vehiculo, string placa)
        {
            return (_context.Vehiculos?.Any(e => e.IdVehiculo != vehiculo && e.NombreVehiculo == placa)).GetValueOrDefault();
        }
    }
}
