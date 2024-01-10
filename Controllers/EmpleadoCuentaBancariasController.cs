using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.CuentaBancaria;
using TransportationCore.Data.Dtos.DirectorSubDirectores;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "AsignarCuentaPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class EmpleadoCuentaBancariasController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public EmpleadoCuentaBancariasController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }

        [HttpGet("{idEmpleado}")]
        public async Task<ActionResult<IEnumerable<CuentaBancariaConsultaDto>>> GetEmpleadoCuentaBancaria(long idEmpleado)
        {
            if (_context.EmpleadoCuentaBancaria == null)
            {
                return NotFound();
            }

            var cuentaBancaria = await _context.EmpleadoCuentaBancaria.Include(x => x.Bancos).Where(x => x.IdEmpleado == idEmpleado).ToListAsync();
            var cuentaBancariaDto = mapper.Map<List<CuentaBancariaConsultaDto>>(cuentaBancaria);
            return cuentaBancariaDto;
        }

        [HttpPost]
        public async Task<ActionResult> PostEmpleadoCuentaBancaria(CuentaBancariaCrearDto cuentaBancariaDto)
        {
            if (_context.EmpleadoCuentaBancaria == null)
            {
                return BadRequest(new ErrorResponse("La cuenta no existe"));
            }

            if (EmpleadoCuentaBancariaExists(cuentaBancariaDto.CuentaBancaria))
            {
                return BadRequest(new ErrorResponse("Este numero de cuenta esta siendo utilizado, favor validar."));
            }

            if (EmpleadoValidaCuentaBancariaCantidad(cuentaBancariaDto.IdEmpleado) > 1)
            {
                return BadRequest(new ErrorResponse("No es posible agregar esta cueta, ya que actualmente posee la cantidad de cuentas maxima permitida."));
            }


            if (cuentaBancariaDto.CuentaPrincipal == true)
            {
                var cuentaBanco = await _context.EmpleadoCuentaBancaria.FirstOrDefaultAsync(x =>
                                  x.IdEmpleado == cuentaBancariaDto.IdEmpleado && x.CuentaPrincipal == true);

                if (cuentaBanco != null)
                {
                    cuentaBanco.CuentaPrincipal = false;
                    _context.Entry(cuentaBanco).State = EntityState.Modified;
                    await _context.SaveChangesAsync();
                }
            }

            var cuentaBancaria = mapper.Map<EmpleadoCuentaBancaria>(cuentaBancariaDto);
            cuentaBancaria.Activa = true;

            _context.EmpleadoCuentaBancaria.Add(cuentaBancaria);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpPut("{idCuenta}")]
        public async Task<IActionResult> PutEmpleadoCuentaBancaria(long idCuenta, CuentaBancariaUpdateDto cuentaBancariaDto)
        {
            if (idCuenta != cuentaBancariaDto.IdCuenta)
            {
                return BadRequest();
            }

            if (cuentaBancariaDto.CuentaBancaria != cuentaBancariaDto.CuentaBancariaAnterior)
                if (EmpleadoCuentaBancariaExists(cuentaBancariaDto.CuentaBancaria))
                {
                    return BadRequest(new ErrorResponse("Este numero de cuenta esta siendo utilizado, favor validar."));
                }

            if (cuentaBancariaDto.CuentaPrincipal == true)
                await foreach (var cuentas in _context.EmpleadoCuentaBancaria
                    .Where(x => x.IdEmpleado == cuentaBancariaDto.IdEmpleado &&
                                x.IdCuenta != cuentaBancariaDto.IdCuenta)
                    .AsAsyncEnumerable())
                {
                    cuentas.CuentaPrincipal = false;
                }

            await _context.SaveChangesAsync();

            var cuentaBancaria = mapper.Map<EmpleadoCuentaBancaria>(cuentaBancariaDto);
            _context.Entry(cuentaBancaria).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmpleadoCuentaBancariaExists(idCuenta))
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

        [HttpDelete("{idCuenta}")]
        public async Task<IActionResult> DeleteEmpleadoCuentaBancaria(long idCuenta)
        {            
            await softDeleteService.SoftDelete<EmpleadoCuentaBancaria>(idCuenta);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool EmpleadoCuentaBancariaExists(long idCuenta)
        {
            return (_context.EmpleadoCuentaBancaria?.Any(e => e.IdCuenta == idCuenta)).GetValueOrDefault();
        }

        private bool EmpleadoCuentaBancariaExists(string numCuenta)
        {
            return (_context.EmpleadoCuentaBancaria?.Any(e => e.CuentaBancaria.Trim().ToUpper() == numCuenta.Trim().ToUpper())).GetValueOrDefault();
        }

        private int EmpleadoValidaCuentaBancariaCantidad(long IdEmpleado)
        {
            var cuentas = _context.EmpleadoCuentaBancaria.Where(e => e.IdEmpleado == IdEmpleado).ToList();

            return cuentas.Count;
        }
    }
}
