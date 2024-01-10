using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Tienda;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;

namespace TransportationCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [ValidateModel]
    public class TiendasController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService _softDeleteService;

        public TiendasController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this._softDeleteService = softDeleteService;
        }        

        // GET: api/Tiendas
        [HttpGet("{IdCliente}")]
        public async Task<ActionResult> GetTiendas(long IdCliente)
        {
            var result = await (from tiendas in _context.Tiendas
                                join subGerente in _context.ContactoClientes
                                on tiendas.IdSubGerente equals subGerente.IdContacto
                                join grtSub in _context.GerenteSubGerentes
                                on subGerente.IdContacto equals grtSub.IdSubGerente
                                join gerente in _context.ContactoClientes
                                on grtSub.IdGerente equals gerente.IdContacto
                                join zonasSted in _context.ZonasSted
                                on tiendas.IdZonaSted equals zonasSted.IdZonaSted
                                join estados in _context.Estados
                                on tiendas.IdEstado equals estados.IdEstado
                                join clientes in _context.Clientes
                                on zonasSted.IdCliente equals clientes.IdCliente
                                where clientes.IdCliente == subGerente.IdCliente
                                && clientes.IdCliente == gerente.IdCliente
                                && clientes.IdCliente == IdCliente

                                select new
                                {
                                    tiendas.IdTienda,
                                    tiendas.NombreTienda,
                                    tiendas.NumUnidades,
                                    tiendas.UnidadesMaximas,
                                    tiendas.Tarifa,
                                    tiendas.TarifaDescanso,
                                    tiendas.Activa,
                                    tiendas.CntEmpleadosExterno,
                                    tiendas.CntEmpleadosInterno,
                                    tiendas.CntEmpleadosSpot,

                                    zonasSted.IdZonaSted,
                                    zonasSted.NombreZona,
                                    zonasSted.ClaveDET,

                                    clientes.IdCliente,
                                    clientes.NombreCliente,

                                    IdSubGerente = subGerente.IdContacto,
                                    SubGerente = subGerente.Nombre,
                                    EmailSubGerente = subGerente.email,
                                    TelefonoSubGerente = subGerente.telefono,
                                    Telefono2SubGerente = subGerente.telefono2,

                                    IdGerente = gerente.IdContacto,
                                    Gerente = gerente.Nombre,
                                    EmailGerente = gerente.email,
                                    TelefonoGerente = gerente.telefono,
                                    Telefono2Gerente = gerente.telefono2,

                                    estados.IdEstado,
                                    estados.NombreEstado

                                }).ToListAsync();

            //.IgnoreQueryFilters()

            if (result.Count == 0)
                return NotFound(new ErrorResponse("No existen registros"));

            //var tienda = await _context.Tiendas.ToListAsync();
            //var tiendaDto = mapper.Map<List<TiendaDetalleDto>>(tienda);

            return Ok(result);
        }

        // GET: api/Tiendas/5
        [HttpGet("{IdCliente},{idTienda}")]
        public async Task<ActionResult<TiendaDetalleDto>> GetTienda(long IdCliente, int idTienda)
        {
            var result = await (from tiendas in _context.Tiendas                               
                                join subGerente in _context.ContactoClientes
                                on tiendas.IdSubGerente equals subGerente.IdContacto
                                join grtSub in _context.GerenteSubGerentes
                                on subGerente.IdContacto equals grtSub.IdSubGerente
                                join gerente in _context.ContactoClientes
                                on grtSub.IdGerente equals gerente.IdContacto
                                join zonasSted in _context.ZonasSted
                                on tiendas.IdZonaSted equals zonasSted.IdZonaSted
                                join estados in _context.Estados
                                on tiendas.IdEstado equals estados.IdEstado
                                join clientes in _context.Clientes
                                on zonasSted.IdCliente equals clientes.IdCliente
                                where tiendas.IdTienda == idTienda
                                && clientes.IdCliente == subGerente.IdCliente
                                && clientes.IdCliente == gerente.IdCliente
                                && clientes.IdCliente == IdCliente
                                select new
                                {
                                    tiendas.IdTienda,
                                    tiendas.NombreTienda,
                                    tiendas.NumUnidades,
                                    tiendas.UnidadesMaximas,
                                    tiendas.Tarifa,
                                    tiendas.TarifaDescanso,
                                    tiendas.Activa,
                                    tiendas.CntEmpleadosExterno,
                                    tiendas.CntEmpleadosInterno, 
                                    tiendas.CntEmpleadosSpot, 
                                    
                                    zonasSted.IdZonaSted,
                                    zonasSted.NombreZona,
                                    zonasSted.ClaveDET,

                                    clientes.IdCliente,
                                    clientes.NombreCliente,

                                    IdSubGerente = subGerente.IdContacto,
                                    SubGerente = subGerente.Nombre,
                                    EmailSubGerente = subGerente.email,
                                    TelefonoSubGerente = subGerente.telefono,
                                    Telefono2SubGerente = subGerente.telefono2,

                                    IdGerente = gerente.IdContacto,
                                    Gerente = gerente.Nombre,
                                    EmailGerente = gerente.email,
                                    TelefonoGerente = gerente.telefono,
                                    Telefono2Gerente = gerente.telefono2,

                                    estados.IdEstado,
                                    estados.NombreEstado

                                }).ToListAsync();

            //.IgnoreQueryFilters()

            if (result.Count == 0)
                return NotFound(new ErrorResponse("No existen registros"));

            //var tienda = await _context.Tiendas.FirstOrDefaultAsync(x=> x.IdTienda == idTienda);
            //var tiendaDto = mapper.Map<TiendaDetalleDto>(tienda);

            return Ok(result);

        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutTienda(int id, TiendaUpdateDto tiendaDto)
        {
            if (id != tiendaDto.IdTienda)
            {
                return BadRequest(new ErrorResponse("El id de la tienda no coincide"));
            }

            if (TiendaNameExist(tiendaDto.IdTienda, tiendaDto.NombreTienda))
            {
                return BadRequest(new ErrorResponse("Este nombre de tienda ya existe."));
            }

            var tienda = mapper.Map<Tienda>(tiendaDto);

            _context.Entry(tienda).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TiendaExists(id))
                {
                    return NotFound(new ErrorResponse("El id tienda no es valido"));
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<Tienda>> PostTienda(TiendaCrearDto tiendaDto)
        {
            var tienda = mapper.Map<Tienda>(tiendaDto);

            if(TiendaNameExist(0, tienda.NombreTienda))
            {
                return BadRequest(new ErrorResponse("Este nombre de tienda ya existe."));
            }

            _context.Tiendas.Add(tienda);
            await _context.SaveChangesAsync();

            return Ok(tienda.IdTienda);
        }

        // DELETE: api/Tiendas/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTienda(int id)
        {           
            await _softDeleteService.SoftDelete<Tienda>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        private bool TiendaExists(int id)
        {
            return (_context.Tiendas?.Any(e => e.IdTienda == id)).GetValueOrDefault();
        }

        private bool TiendaNameExist(long id, string name)
        {
            if (id == 0)
                return (_context.Tiendas?.Any(e => e.NombreTienda == name)).GetValueOrDefault();
            else
                return (_context.Tiendas?.Any(e => e.IdTienda != id
                                                  && e.NombreTienda == name)
                                                ).GetValueOrDefault();
        }
    }
}
