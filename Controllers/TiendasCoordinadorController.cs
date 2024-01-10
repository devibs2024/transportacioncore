using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Tienda;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;
using TransportationCore.Enumeradores;

namespace TransportationCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class TiendasCoordinadorController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly ISoftDeleteService _softDeleteService;

        public TiendasCoordinadorController(ApplicationDbContext context, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this._softDeleteService = softDeleteService;
        }

        [HttpPost("{idCoordinador},{idTienda}")]
        public async Task<ActionResult<Tienda>> PostTienda(long idCoordinador, int idTienda)
        {
            if (TiendaExists(idCoordinador, idTienda))
                return BadRequest(new ErrorResponse("Esta tienda ya esta asociada a este coordinador."));

            TiendaCoordinador tiendaCoordinador = new TiendaCoordinador();
            tiendaCoordinador.IdTienda = idTienda;
            tiendaCoordinador.IdCoordinador = idCoordinador;

            _context.TiendaCoordinador.Add(tiendaCoordinador);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpDelete("{idCoordinador},{idTienda}")]
        public async Task<IActionResult> DeleteTienda(long idCoordinador, int idTienda)
        {
            await _softDeleteService.SoftDelete<TiendaCoordinador>(idCoordinador, idTienda);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
          
        }

        private bool TiendaExists(long idCoordinador, int idTienda)
        {
            return (_context.TiendaCoordinador.Any(e => e.IdTienda == idTienda
                                                     && e.IdCoordinador == idCoordinador));
        }

        [HttpGet("{Id},{Tipo}", Name = "GetTiendasByParameters")]
        public async Task<List<TiendaDetalleAsignacionDto>> GetTiendasByParameters(long Id, int Tipo)
        {
            string parametro = string.Empty;

            switch (Tipo)
            {
                case (int)EnumTiendasAsignadasParametros.Tienda:
                    parametro = $" @IdTienda = {Id}";
                    break;

                case (int)EnumTiendasAsignadasParametros.Coordinador:
                    parametro = $" @IdCoordinador = {Id}";
                    break;

                case (int)EnumTiendasAsignadasParametros.ZonaStead:
                    parametro = $" @IdZonaSted = {Id}";
                    break;
                case (int)EnumTiendasAsignadasParametros.Cliente:
                    parametro = $" @IdCliente = {Id}";
                    break;
                default:
                    parametro = string.Empty;
                    break;
            }


            var resultado = await _context.Set<TiendaDetalleAsignacionDto>()
                .FromSqlRaw($"TiendasGetByParameter" + parametro).ToListAsync();


            return resultado;
        }

        [HttpGet("{IdZonaSted}", Name = "GetTiendasByZonaSted")]
        public async Task<ActionResult> GetTiendasByZonaSted(int IdZonaSted)
        {

            if (_context.Tiendas == null)
            {
                return NotFound();
            }

            var tiendasDisponibles = await (from tienda in _context.Tiendas
                                            join zona in _context.ZonasSted
                                            on tienda.IdZonaSted equals zona.IdZonaSted
                                            where zona.IdZonaSted == IdZonaSted                                            
                                            select new
                                            {
                                                tienda.IdTienda,
                                                tienda.NombreTienda,
                                                tienda.IdZonaSted

                                            }).ToListAsync();

            //.IgnoreQueryFilters()

            return Ok(tiendasDisponibles);
        }

    }
}
