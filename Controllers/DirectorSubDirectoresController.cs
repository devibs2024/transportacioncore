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
using TransportationCore.Data.Dtos.DirectorSubDirectores;
using TransportationCore.Data.Dtos.OperadorCoordinador;
using TransportationCore.Data.Dtos.OperadorSucursal;
using TransportationCore.Data.Dtos.Sucursal;
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "EditarDirectoresPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class DirectorSubDirectoresController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public DirectorSubDirectoresController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            this._context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }

        [HttpGet("{IdDirector}")]
        public async Task<ActionResult> GetSubDirectoresAsignados(long IdDirector)
        {
            if (_context.Empleados == null)
            {
                return NotFound();
            }

            var subDirectorAsignados = await (from e in _context.Empleados
                                             join ec in _context.DirectorSubDirector
                                             on e.IdEmpleado equals ec.IdSubDirector 
                                             where ec.IdDirector == IdDirector
                                             select new
                                             {
                                                   IdSubDirector =  e.IdEmpleado,
                                               NombreSubDirector =  e.Nombres          
                                               
                                             }).ToListAsync();

            return Ok(subDirectorAsignados);

        }

        [HttpPost]
        public async Task<ActionResult> PostDirectorSubCoordinador(DirectorSubDirectoresDto directorSubDirectorDto)
        {
            var directorSubDirector = mapper.Map<DirectorSubDirector>(directorSubDirectorDto);
            _context.DirectorSubDirector.Add(directorSubDirector);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteSubDirectorAsociado(DirectorSubDirectoresDto directorSubDirectorDto)
        {
            await softDeleteService.SoftDelete<DirectorSubDirector>(directorSubDirectorDto.IdSubDirector, directorSubDirectorDto.IdDirector);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

    }
}
