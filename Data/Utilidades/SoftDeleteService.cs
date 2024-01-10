using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using NuGet.Protocol;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Cliente;
using TransportationCore.Data.Dtos.UserAccount;
using TransportationCore.Data.Models;
//
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using TransportationCore.Data.Dtos.ValidateUserAccount;
using NuGet.Common;
using Newtonsoft.Json.Linq;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Utilidades
{
    public class SoftDeleteService : ISoftDeleteService
    {
        private readonly ApplicationDbContext _context;       

        public SoftDeleteService(ApplicationDbContext context)
        {
            _context = context;           
        }

        public async Task SoftDelete<TEntity>(params object[] keyValues) where TEntity : class, ISoftDeletable
        {
            var entity = await _context.Set<TEntity>().FindAsync(keyValues);
            if (entity == null)
            {
                throw new EntityNotFoundException($"La entidad {typeof(TEntity).Name} con ID {keyValues} no se encontró.");
            }

            entity.IsDeleted = true;         

            _context.Entry(entity).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }
    }

}
