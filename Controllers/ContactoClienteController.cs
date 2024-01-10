using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel;
using TransportationCore.CustomError;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Cliente;
using TransportationCore.Data.Dtos.ContactoCliente;
using TransportationCore.Data.Interfaces;
using TransportationCore.Data.Models;
using TransportationCore.Data.Utilidades;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarClientePolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class ContactoClienteController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly ISoftDeleteService softDeleteService;

        public ContactoClienteController(ApplicationDbContext context, IMapper mapper, ISoftDeleteService softDeleteService)
        {
            _context = context;
            this.mapper = mapper;
            this.softDeleteService = softDeleteService;
        }


        [HttpGet("{cliente}")]
        public async Task<ActionResult<IEnumerable<ContactoClienteDetalleDto>>> GetContactoClientes(long cliente)
        {
            if (_context.ContactoClientes == null)
            {
                return NotFound();
            }


            var ContactoAsociados = await (from gerentes in _context.ContactoClientes
                                           join gtesub in _context.GerenteSubGerentes
                                           on gerentes.IdContacto equals gtesub.IdGerente
                                           join subgerente in _context.ContactoClientes
                                           on gtesub.IdSubGerente equals subgerente.IdContacto
                                           where gerentes.IdCliente == cliente
                                           && subgerente.IdCliente == cliente
                                           select new GerenteSubGerenteConsultaDto
                                           {
                                               IdCliente = gerentes.IdCliente,
                                               IdGerente = gerentes.IdContacto,
                                               NombreGerente = gerentes.Nombre,
                                               Telefono1Gerente = gerentes.telefono,
                                               Telefono2Gerente = gerentes.telefono2,
                                               EmailGerente = gerentes.email,
                                               TipoContactoGerente = gerentes.TipoContacto,
                                               EstatusGerente = gerentes.Activo,


                                               IdSubGerente = subgerente.IdContacto,
                                               NombreSubGerente = subgerente.Nombre,
                                               Telefono1SubGerente = subgerente.telefono,
                                               Telefono2SubGerente = subgerente.telefono2,
                                               EmailSubGerente = subgerente.email,
                                               TipoContactoSubGerente = subgerente.TipoContacto,
                                               EstatusSubGerente = subgerente.Activo


                                           }).OrderBy(x => x.IdGerente).ToListAsync();



            var ContactosIndependientes = await (from Contactos in _context.ContactoClientes
                                                 where Contactos.IdCliente == cliente
                                                 && !_context.GerenteSubGerentes.Any(gsg => gsg.IdGerente == Contactos.IdContacto
                                                                                      || gsg.IdSubGerente == Contactos.IdContacto)
                                                 select new ContactoClienteConsultaDto
                                                 {
                                                     IdCliente = Contactos.IdCliente,
                                                     IdContacto = Contactos.IdContacto,
                                                     Nombre = Contactos.Nombre,
                                                     telefono = Contactos.telefono,
                                                     telefono2 = Contactos.telefono2,
                                                     email = Contactos.email,
                                                     TipoContacto = Contactos.TipoContacto,
                                                     Activo = Contactos.Activo
                                                 }).ToListAsync();


            var result = GenerarListaContactos(ContactoAsociados, ContactosIndependientes);

            return Ok(result);
        }

        private List<ContactoClienteDetalleDto> GenerarListaContactos(List<GerenteSubGerenteConsultaDto> contactoAsociados, List<ContactoClienteConsultaDto> contactosIndependientes)
        {
            Dictionary<long, ContactoClienteDetalleDto> dicContactos = new Dictionary<long, ContactoClienteDetalleDto>();

            foreach (var gerente in contactoAsociados)
            {
                if (!dicContactos.ContainsKey(gerente.IdGerente))
                {
                    dicContactos[gerente.IdGerente] = new ContactoClienteDetalleDto
                    {
                        IdContacto = gerente.IdGerente,
                        IdCliente = gerente.IdCliente,
                        Nombre = gerente.NombreGerente,
                        Email = gerente.EmailGerente,
                        Telefono = gerente.Telefono1Gerente,
                        Telefono2 = gerente.Telefono2Gerente,
                        Activo = gerente.EstatusGerente,
                        TipoContacto = gerente.TipoContactoGerente,

                        SubGerentes = new List<ContactoClienteConsultaDto>()
                    };
                }

                dicContactos[gerente.IdGerente].SubGerentes.Add(new ContactoClienteConsultaDto
                {
                    IdContacto = gerente.IdSubGerente,
                    IdCliente = gerente.IdCliente,
                    Nombre = gerente.NombreSubGerente,
                    email = gerente.EmailSubGerente,
                    telefono = gerente.Telefono1SubGerente,
                    telefono2 = gerente.Telefono2SubGerente,
                    Activo = gerente.EstatusSubGerente,
                    TipoContacto = gerente.TipoContactoSubGerente
                });
            }

            List<ContactoClienteDetalleDto> Lstcontactos = new List<ContactoClienteDetalleDto>(dicContactos.Values);

            foreach (var contacto in contactosIndependientes)
            {
                Lstcontactos.Add(new ContactoClienteDetalleDto
                {
                    IdContacto = contacto.IdContacto,
                    IdCliente = contacto.IdCliente,
                    Nombre = contacto.Nombre,
                    Email = contacto.email,
                    Telefono = contacto.telefono,
                    Telefono2 = contacto.telefono2,
                    Activo = contacto.Activo,
                    TipoContacto = contacto.TipoContacto
                });
            }

            return Lstcontactos;
        }

        [HttpGet("{cliente},{contacto}")]
        public async Task<ActionResult<ContactoClienteConsultaDto>> GetContactoClientes(long cliente, long contacto)
        {
            if (_context.ContactoClientes == null)
            {
                return NotFound();
            }

            var ContactoAsociados = await (from gerentes in _context.ContactoClientes
                                           join gtesub in _context.GerenteSubGerentes
                                           on gerentes.IdContacto equals gtesub.IdGerente
                                           join subgerente in _context.ContactoClientes
                                           on gtesub.IdSubGerente equals subgerente.IdContacto
                                           where gerentes.IdCliente == cliente
                                           && subgerente.IdCliente == cliente
                                           && gerentes.IdContacto == contacto
                                           select new GerenteSubGerenteConsultaDto
                                           {
                                               IdCliente = gerentes.IdCliente,
                                               IdGerente = gerentes.IdContacto,
                                               NombreGerente = gerentes.Nombre,
                                               Telefono1Gerente = gerentes.telefono,
                                               Telefono2Gerente = gerentes.telefono2,
                                               EmailGerente = gerentes.email,
                                               TipoContactoGerente = gerentes.TipoContacto,
                                               EstatusGerente = gerentes.Activo,


                                               IdSubGerente = subgerente.IdContacto,
                                               NombreSubGerente = subgerente.Nombre,
                                               Telefono1SubGerente = subgerente.telefono,
                                               Telefono2SubGerente = subgerente.telefono2,
                                               EmailSubGerente = subgerente.email,
                                               TipoContactoSubGerente = subgerente.TipoContacto,
                                               EstatusSubGerente = subgerente.Activo

                                           }).ToListAsync();



            var ContactosIndependientes = await (from Contactos in _context.ContactoClientes
                                                 where Contactos.IdCliente == cliente && Contactos.IdContacto == contacto
                                                 && !_context.GerenteSubGerentes.Any(gsg => gsg.IdGerente == Contactos.IdContacto
                                                                                      || gsg.IdSubGerente == Contactos.IdContacto)
                                                 select new ContactoClienteConsultaDto
                                                 {
                                                     IdCliente = Contactos.IdCliente,
                                                     IdContacto = Contactos.IdContacto,
                                                     Nombre = Contactos.Nombre,
                                                     telefono = Contactos.telefono,
                                                     telefono2 = Contactos.telefono2,
                                                     email = Contactos.email,
                                                     TipoContacto = Contactos.TipoContacto,
                                                     Activo = Contactos.Activo

                                                 }).ToListAsync();


            var result = GenerarListaContactos(ContactoAsociados, ContactosIndependientes);

            return Ok(result);
        }

        [HttpPost]

        public async Task<ActionResult> PostContacto(ContactoClienteCrearDto ContactoDto)
        {
            if (ContactoClienteNombreExists(0, ContactoDto.Nombre))
            {
                return NotFound(new ErrorResponse("Este nombre de contacto ya existe."));
            }

            var contacto = mapper.Map<ContactoCliente>(ContactoDto);

            _context.ContactoClientes.Add(contacto);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteContacto(long id)
        {
            await softDeleteService.SoftDelete<ContactoCliente>(id);
            return Ok(new ErrorResponse("El registro se elimino correctamente."));
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutContacto(long id, ContactoClienteUpdateDto clienteDto)
        {
            if (id != clienteDto.IdContacto)
            {
                return BadRequest();
            }

            if (ContactoClienteNombreExists(clienteDto.IdContacto, clienteDto.Nombre))
            {
                return NotFound(new ErrorResponse("Este nombre de contacto ya existe."));
            }

            var contacto = mapper.Map<ContactoCliente>(clienteDto);
            _context.Entry(contacto).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ContactoClienteExists(id))
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

        private bool ContactoClienteExists(long id)
        {
            return (_context.ContactoClientes?.Any(e => e.IdContacto == id)).GetValueOrDefault();

        }

        private bool ContactoClienteNombreExists(long id, string name)
        {
            if (id == 0)
                return (_context.ContactoClientes?.Any(e => e.Nombre == name)).GetValueOrDefault();
            else
                return (_context.ContactoClientes?.Any(e => e.IdContacto != id && e.Nombre == name)).GetValueOrDefault();
        }
    }
}
