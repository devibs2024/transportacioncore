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
using TransportationCore.Data.Models;
using TransportationCore.Enumeradores;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "AsignarVehiculoPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class AsignacionarVehiculoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly int operador;
        private readonly IMapper mapper;

        public AsignacionarVehiculoController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            this.mapper = mapper;
            this.operador = (int)EnumTipoEmpleado.Operador;
        }

        [HttpGet("{idVehiculo}")]
        public async Task<ActionResult> GetAsignarVehiculo(int idVehiculo)
        {

            var empleadosAsignados = await (from p in _context.Empleados
                                            join e in _context.VehiculoOperadores
                                            on p.IdEmpleado equals e.IdEmpleado
                                            join x in _context.Vehiculos
                                            on e.IdVehiculo equals x.IdVehiculo
                                            where x.IdVehiculo == idVehiculo
                                            && p.IdTipoEmpleado == operador
                                            && x.VehiculoEmpresa == true
                                            select new
                                            {
                                                p.IdEmpleado,
                                                p.Nombres,
                                                p.ApellidoMaterno,
                                                p.ApellidoPaterno
                                            }).ToListAsync();

            return Ok(empleadosAsignados);
        }


        [HttpPost("{idEmpleado},{idVehiculo}")]
        public async Task<ActionResult> PostAsignarVehiculo(long idEmpleado, long idVehiculo)
        {
            if (_context.VehiculoOperadores == null)
            {
                return NotFound(new ErrorResponse("El registro no existe"));
            }

            if (VehiculoOperadorExists(idEmpleado, idVehiculo))
                return BadRequest(new ErrorResponse("Este vehiculo ya esta asignado a este operador."));


            if (ValidarAsignacionVehiculoInterno(idEmpleado, idVehiculo))
                return BadRequest(new ErrorResponse("Este vehiculo no puede ser asingado a este operador."));

            VehiculoOperador vehiculoOperador = new VehiculoOperador();
            vehiculoOperador.IdEmpleado = idEmpleado;
            vehiculoOperador.IdVehiculo = idVehiculo;

            _context.VehiculoOperadores.Add(vehiculoOperador);

            await _context.SaveChangesAsync();


            return Ok(vehiculoOperador.IdEmpleado);
        }

        private bool VehiculoOperadorExists(long empleado, long vehiculo)
        {
            return (_context.VehiculoOperadores?.Any(e => e.IdVehiculo == vehiculo && e.IdEmpleado == empleado)).GetValueOrDefault();
        }

        private bool ValidarAsignacionVehiculoInterno(long empleado, long vehiculo)
        {

            var empleadosAsignados = _context.Empleados.Where(x => x.IdEmpleado == empleado
                                           && x.IdSegmento == (int) EnumSegmentoEmpleado.Interno 
                                           && x.IdTipoEmpleado == operador).ToListAsync();


            var vehiculoInterno = _context.Vehiculos.Where(x => x.IdVehiculo == vehiculo
                                          && x.VehiculoEmpresa == true).ToListAsync();

            return ((empleadosAsignados != null) && (vehiculoInterno != null));
        }

    }
}
