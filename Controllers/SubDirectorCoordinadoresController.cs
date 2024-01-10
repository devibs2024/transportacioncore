using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.DirectorCoordinadores;
using TransportationCore.Data.Dtos.OperadorCoordinador;
using TransportationCore.Data.Dtos.OperadorSucursal;
using TransportationCore.Data.Dtos.Sucursal;
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "EditarDirectoresPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class SubDirectorCoordinadoresController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public SubDirectorCoordinadoresController(ApplicationDbContext context, IMapper mapper,ISoftDeleteService softDeleteService)
        {
            this._context = context;
            this.mapper = mapper;
            _softDeleteService = softDeleteService;
        }

        [HttpGet("{IdSubDirector}")]
        public async Task<ActionResult> GetCoordinadoresAsignados(long IdSubDirector)
        {
            if (_context.Empleados == null)
            {
                return NotFound();
            }

            var coordinadorAsignados = await (from e in _context.Empleados
                                             join ec in _context.SubDirectorCoordinador
                                             on e.IdEmpleado equals ec.IdCoordinador 
                                             where ec.IdSubDirector == IdSubDirector
                                             select new
                                             {
                                                   IdCoordinador =  e.IdEmpleado,
                                               NombreCoordinador =  e.Nombres          
                                               
                                             }).ToListAsync();

            return Ok(coordinadorAsignados);

        }

        [HttpPost]
        public async Task<ActionResult> PostCoordinarAignado(SubDirectorCoordinadoresDto subDirectorCoordinarDto)
        {
            var subDirectorCoordinar = mapper.Map<SubDirectorCoordinador>(subDirectorCoordinarDto);
            _context.SubDirectorCoordinador.Add(subDirectorCoordinar);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteCoordinadorAsignado(SubDirectorCoordinadoresDto subDirectorCoordinarDto)
        {
            await _softDeleteService.SoftDelete<SubDirectorCoordinador>(subDirectorCoordinarDto.IdSubDirector, subDirectorCoordinarDto.IdCoordinador);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

    }
}
