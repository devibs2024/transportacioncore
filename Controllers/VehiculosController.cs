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
using TransportationCore.Data.Dtos.Sucursal;
using TransportationCore.Data.Dtos.Vehiculo;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "AsignarVehiculoPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class VehiculosController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public VehiculosController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this._softDeleteService = softDeleteService;
            _context.UserEmail = "Ambiorix.Liriano@gmail.com";
        }



        [HttpGet]
        public async Task<ActionResult<IEnumerable<VehiculoConsultaDto>>> GetVehiculos()
        {
            if (_context.Vehiculos == null)
            {
                return NotFound();
            }
            var vehiculo = await _context.Vehiculos.Include(x => x.TipoVehiculo)
                          .Include(x => x.MarcaVehiculo).Include(x => x.ModeloVehiculo).ToListAsync();
            var vehiculoDto = mapper.Map<List<VehiculoConsultaDto>>(vehiculo);

            return vehiculoDto;
        }



        [HttpGet("{id}")]
        public async Task<ActionResult<VehiculoConsultaDto>> GetVehiculo(long id)
        {
            if (_context.Vehiculos == null)
            {
                return NotFound();
            }
            var vehiculo = await _context.Vehiculos.Include(x => x.TipoVehiculo).Include(x => x.MarcaVehiculo)
                          .Include(x => x.ModeloVehiculo).FirstOrDefaultAsync(x => x.IdVehiculo == id);
            var vehiculoDto = mapper.Map<VehiculoConsultaDto>(vehiculo);

            if (vehiculo == null)
            {
                return NotFound();
            }

            return vehiculoDto;
        }



        [HttpPut("{id}")]
        public async Task<IActionResult> PutVehiculo(long id, VehiculoActualizarDto vehiculoDto)
        {
            if (id != vehiculoDto.IdVehiculo)
            {
                return BadRequest();
            }


            if (VehiculoNameExist(vehiculoDto.IdVehiculo, vehiculoDto.NombreVehiculo))
            {
                return NotFound(new ErrorResponse("Este numero de placa o nombre de vehiculo existe."));
            }

            var vehiculo = mapper.Map<Vehiculo>(vehiculoDto);
            _context.Entry(vehiculo).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VehiculoExists(id))
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
        public async Task<ActionResult> PostVehiculo(VehiculoCrearDto vehiculoDto)
        {

            var vehiculo = mapper.Map<Vehiculo>(vehiculoDto);

            if (VehiculoNameExist(0, vehiculoDto.NombreVehiculo))
            {
                return NotFound(new ErrorResponse("Este numero de placa o nombre de vehiculo existe."));
            }

            _context.Vehiculos.Add(vehiculo);
            await _context.SaveChangesAsync();

            return Ok(vehiculo.IdVehiculo);
        }



        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVehiculo(long id)
        {
            await _softDeleteService.SoftDelete<Vehiculo>(id);
            return Ok("El registro se elimino correctamente.");
        }


        private bool VehiculoExists(long id)
        {
            return (_context.Vehiculos?.Any(e => e.IdVehiculo == id)).GetValueOrDefault();
        }

        private bool VehiculoNameExist(long id, string name)
        {
            if (id == 0)
                return (_context.Vehiculos?.Any(e => e.NombreVehiculo == name)).GetValueOrDefault();
            else
                return (_context.Vehiculos?.Any(e => e.IdVehiculo != id 
                                                  && e.NombreVehiculo == name)
                                                ).GetValueOrDefault();
        }
    }
}
