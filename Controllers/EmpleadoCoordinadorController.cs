using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data.Models;
using TransportationCore.Data;
using TransportationCore.CustomError;
using System.Security.Cryptography.Xml;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using AutoMapper;
using TransportationCore.Data.Dtos.Planificacion;
using TransportationCore.Data.Utilidades;
using TransportationCore.Enumeradores;
using TransportationCore.Data.Interfaces;
//using TransportationCore.Data.Dtos.Reportes;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System.Reflection.Metadata;
//using TransportationCore.Data.Dtos.Productividad;
using TransportationCore.Data.Dtos.Nomina;
using Microsoft.AspNetCore.Http.HttpResults;
using TransportationCore.Data.Dtos.Operador;
using TransportationCore.Data.Dtos.OperadorCoordinador;

namespace TransportationCore.Controllers
{
    //[Authorize(Policy = "EditarPlanificacionPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[Controller]")]
    [ApiController]
    [ValidateModel]
    public class EmpleadoCoordinadorController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper maper;
        private readonly ISoftDeleteService _softDeleteService;

        public EmpleadoCoordinadorController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.maper = mapper;
            _context.UserEmail = "";
            _softDeleteService = softDeleteService;
        }

        [HttpGet("{CoordinadorId}", Name = "GetEmpleadosCoordinador")]
        public async Task<ActionResult> GetEmpleadosCoordinador(long CoordinadorId)
        {
            if (_context.EmpleadoCoordinadores == null)
            {
                return NotFound();
            }

            var empleadosCoordinadores = await (from empcoordinador in _context.EmpleadoCoordinadores
                                                join empleados in _context.Empleados
                                                on empcoordinador.IdOperador equals empleados.IdEmpleado
                                                where empcoordinador.IdCoordinador == CoordinadorId
                                                select new
                                                {
                                                    empcoordinador.IdOperador,
                                                    empleados.Nombres

                                                }).ToListAsync();

            return Ok(empleadosCoordinadores);
        }


    }
}
