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
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Bancos;
using TransportationCore.Data.Dtos.Dias;
using TransportationCore.Data.Models;

namespace TransportationCore.Controllers
{
    ////[Authorize(Policy = "EditarCatalogosGeneralesPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class BancoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;

        public BancoController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            this.mapper = mapper;
        }

       
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BancosConsultaDto>>> GetBancos()
        {
          if (_context.Bancos == null)
          {
              return NotFound();
          }

          var catalogoBancos = await _context.Bancos.ToListAsync();

            var catalogoBancosDto = mapper.Map<List<BancosConsultaDto>>(catalogoBancos);
            return catalogoBancosDto;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<BancosConsultaDto>> GetBanco(int id)
        {
          if (_context.Bancos == null)
          {
              return NotFound();
          }
            var catalogoBancos = await _context.Bancos.FindAsync(id);

            var catalogoBancosDto = mapper.Map<BancosConsultaDto>(catalogoBancos);

            if (catalogoBancos == null)
            {
                return NotFound();
            }

            return catalogoBancosDto;
        }
                
    }
}
