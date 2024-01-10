using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.OperadorCoordinador;
using TransportationCore.Data.Dtos.OperadorSucursal;
using TransportationCore.Data.Dtos.Sucursal;
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarOperadoresPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class OperadorCoordinadorController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public OperadorCoordinadorController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            this._context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }

        [HttpGet("{idEmpleado}")]
        public async Task<ActionResult> GetCoordinadoresAsignadas(long idEmpleado)
        {
            if (_context.Empleados == null)
            {
                return NotFound();
            }

            var coordinadorAsignados = await (from e in _context.Empleados
                                              join ec in _context.EmpleadoCoordinadores
                                              on e.IdEmpleado equals ec.IdCoordinador
                                              where ec.IdOperador == idEmpleado
                                              select new
                                              {
                                                  IdCoordinador = e.IdEmpleado,
                                                  NombreCoordinador = e.Nombres

                                              }).ToListAsync();

            return Ok(coordinadorAsignados);

        }

        [HttpPost]
        public async Task<ActionResult> PostOperadorCoordinar(OperadorCoordinadorDto operadorCoordinarDto)
        {

            var operadorCoordinar = mapper.Map<EmpleadoCoordinador>(operadorCoordinarDto);
            _context.EmpleadoCoordinadores.Add(operadorCoordinar);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteOperadorCoordinador(OperadorCoordinadorDto operadorCoordinadorDto)
        {
            await softDeleteService.SoftDelete<EmpleadoCoordinador>(operadorCoordinadorDto.IdOperador, operadorCoordinadorDto.IdCoordinador);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

    }
}
