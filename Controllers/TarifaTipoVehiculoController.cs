using System;
using System.Data;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.Data;
using TransportationCore.Data.Models;
using transportacion.Data.Dtos.TarifaTipoVehiculoConsultaDto;
using transportacion.Data.Dtos.TarifaTipoVehiculoCreateDto;
using transportacion.Data.Dtos.TarifaTipoVehiculoUpdateDto;
using TransportationCore.CustomError;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using TransportationCore.Data.Dtos.MarcaVehiculo;
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Utilidades;
using TransportationCore.Data.Interfaces;

namespace transportacion.Controllers
{
    ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class TarifaTipoVehiculoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public TarifaTipoVehiculoController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper= mapper;
            _softDeleteService = softDeleteService;
        }

        [HttpGet]
        public async Task<ActionResult<List<TarifaTipoVehiculoConsultaDto>>> GetTarifaTipoVehiculo()
        {
            try
            {
                var data = await _context.TarifasTipoVehiculos.Include(p=> p.TipoVehiculos).ToListAsync(); 
                
                if(data.Count > 0) 
                {
                    var TarifasTipoVehiculoMap = mapper.Map<List<TarifaTipoVehiculoConsultaDto>>(data);
                    return Ok(TarifasTipoVehiculoMap);
                }

                return NotFound(new ErrorResponse("No existen registros de tarifa tipo vehiculos!"));
            }
            catch (Exception ex)
            {
                return BadRequest(new ErrorResponse($"Error {ex.Message}"));
            }
        }

        [HttpGet]
        [Route("{idTipo:int}")]
        public async Task<ActionResult<TarifaTipoVehiculoConsultaDto>> GetTarifaTipoVehiculo(int idTipo)
        {
            try
            {
                var data = await _context.TarifasTipoVehiculos
                                         .Include(p=> p.TipoVehiculos)                                        
                                         .FirstOrDefaultAsync(p => p.IdTipoVehiculo == idTipo 
                                                                && p.Principal == true 
                                                                && p.Activa == true);

                if (data != null) 
                {
                    var TarifasTipoVehiculoMap = mapper.Map<TarifaTipoVehiculoConsultaDto>(data);

                return Ok(TarifasTipoVehiculoMap);
                }

                return NotFound();
            }
            catch (Exception ex)
            {
                return BadRequest(new ErrorResponse($"Error {ex.Message}"));
            }
        }

        [HttpPost]
        [Route("TarifaTipoVehiculoPost")]
        public async Task<ActionResult<TarifaTipoVehiculoCreateDto>> CreateTarifaVehiculo(TarifaTipoVehiculoCreateDto dto)
        {
            if(dto == null) return BadRequest(new ErrorResponse("Los datos a almacenar estan vacios, favor introducirlos"));
           
            if (dto.Principal == true)
            {
                var tarifa = await _context.TarifasTipoVehiculos.FirstOrDefaultAsync(x =>
                                  x.IdTipoVehiculo == dto.IdTipoVehiculo && x.Principal == true);

                if (tarifa != null)
                {
                    tarifa.Principal = false;
                    _context.Entry(tarifa).State = EntityState.Modified;
                    await _context.SaveChangesAsync();
                }
            }

            var tarifasTipoVehiculoMapper = mapper.Map<TarifasTipoVehiculo>(dto);
            tarifasTipoVehiculoMapper.Activa = true;

            _context.Add(tarifasTipoVehiculoMapper);
            
            try
            {
                await _context.SaveChangesAsync();
                return Ok(new { message = "Registro almacenado exitosamente!" });
            }
            catch (Exception ex)
            {
                return BadRequest(new ErrorResponse($"Error - {ex.Message}"));
            }
        
        }
        [HttpPut]
        [Route("TarifaTipoVehiculoUpdate")]
        public async Task<ActionResult<TarifaTipoVehiculoUpdateDto>> UpdateTarifaVehiculo([FromBody] TarifaTipoVehiculoUpdateDto dto)
        {
            if(dto.IdTarifa <= 0) return NotFound(new ErrorResponse("Registro invalido. No existe!"));

            var tarifaData = await _context.TarifasTipoVehiculos.Where(t=> t.IdTarifa == dto.IdTarifa).FirstOrDefaultAsync();

            if(tarifaData == null) return BadRequest(new ErrorResponse("Registro nulo. Favor Verificar!"));

            tarifaData.IdTarifa = dto.IdTarifa;
            tarifaData.IdTipoVehiculo = dto.IdTipoVehiculo;
            tarifaData.Principal = dto.Principal;
            tarifaData.Tarifa = dto.Tarifa;
            tarifaData.Activa = dto.Activa;
            
            _context.Entry(tarifaData).State = EntityState.Modified;
            
            try
            {
                await _context.SaveChangesAsync();
                return Ok(new { message = "Registro actualizado exitosamente!" });
            }
            catch (Exception ex)
            {
                return BadRequest(new ErrorResponse($"Error - {ex.Message}"));
            }
        
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTarifaTipoVehiculo(int id)
        {            
            await _softDeleteService.SoftDelete<TarifasTipoVehiculo>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }
    }
}