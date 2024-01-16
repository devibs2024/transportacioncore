using Audit.Core;
using Audit.EntityFramework;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System.Text.RegularExpressions;
using TransportationCore.Data.Dtos.Planificacion;
using TransportationCore.Data.Dtos.Tienda;
using TransportationCore.Data.Models;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using TransportationCore.Data.Models.ConfigurationModel;
using TransportationCore.Data.Interfaces;
using System.Linq.Expressions;
using Newtonsoft.Json;
using System.Security.Claims;
using TransportationCore.Data.Utilidades;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using TransportationCore.Enumeradores;
using TransportationCore.Data.Dtos.Productividad;
using TransportationCore.Data.Dtos.Reportes;
using TransportationCore.Data.Dtos.Nomina;

namespace TransportationCore.Data
{
    public class ApplicationDbContext : IdentityDbContext<IdentityUser>
    {
        #region Declaracion de entidades
        public virtual DbSet<AsignacionTarjeta> AsignacionTarjeta { get; set; } = null!;
        public virtual DbSet<CatalogoBancos> Bancos { get; set; } = null!;
        public virtual DbSet<CatalogoDias> Dias { get; set; } = null!;
        public virtual DbSet<CatalogoTipoVehiculos> TipoVehiculos { get; set; } = null!;
        public virtual DbSet<CatalogoMarcaVehiculos> MarcaVehiculos { get; set; } = null!;
        public virtual DbSet<CatalogoModeloVehiculos> ModeloVehiculos { get; set; } = null!;
        public virtual DbSet<DetalleTarjeta> DetalleTarjeta { get; set; } = null!;
        public virtual DbSet<Empleado> Empleados { get; set; } = null!;
        public virtual DbSet<EmpleadoCuentaBancaria> EmpleadoCuentaBancaria { get; set; } = null!;
        public virtual DbSet<Horarios> Horarios { get; set; } = null!;

        public virtual DbSet<Vehiculo> Vehiculos { get; set; } = null!;
        public virtual DbSet<VehiculoOperador> VehiculoOperadores { get; set; } = null!;
        public virtual DbSet<CatalogoMunicipio> Municipios { get; set; } = null!;
        public virtual DbSet<CatalogoEstado> Estados { get; set; } = null!;
        public virtual DbSet<Formato> Formatos { get; set; } = null!;
        public virtual DbSet<Cliente> Clientes { get; set; } = null!;
        public virtual DbSet<EmpleadoCoordinador> EmpleadoCoordinadores { get; set; } = null!;
        public virtual DbSet<Zona> Zonas { get; set; } = null!;
        public virtual DbSet<CoordinadorCliente> CoordinadorClientes { get; set; } = null!;
        public virtual DbSet<HorarioEmpleado> HorarioEmpleados { get; set; } = null!;

        public virtual DbSet<FormatoCliente> FormatoClientes { get; set; } = null!;
        public virtual DbSet<MunicipioCliente> MunicipioClientes { get; set; } = null!;

        public virtual DbSet<ValidateUserAccount> ValidateUserAccounts { get; set; } = null!;
        public virtual DbSet<ContactoCliente> ContactoClientes { get; set; } = null!;
        public virtual DbSet<SubDirectorCoordinador> SubDirectorCoordinador { get; set; } = null!;
        public virtual DbSet<DirectorSubDirector> DirectorSubDirector { get; set; } = null!;
        public virtual DbSet<CheckIn_CkeckOut> CheckIn_CkeckOut { get; set; } = null!;

        public virtual DbSet<Tienda> Tiendas { get; set; } = null!;
        public virtual DbSet<ZonaSted> ZonasSted { get; set; } = null!;
        public virtual DbSet<GerenteSubGerente> GerenteSubGerentes { get; set; } = null!;

        public DbSet<DetallePlanificacion> DetallesPlanificacion { get; set; }
        public DbSet<EjecucionPlanificacion> EjecucionesPlanificacion { get; set; }
        public DbSet<Planificacion> Planificaciones { get; set; }
        public DbSet<TarifasTipoVehiculo> TarifasTipoVehiculos { get; set; } = null!;
        public DbSet<TiendaCoordinador> TiendaCoordinador { get; set; } = null!;

        public virtual DbSet<TiendaDetalleAsignacionDto> TiendaDetalleAsignacionDto { get; set; } = null!;
        public virtual DbSet<PlanificacionConsultaDetalleDto> PlanificacionConsultaDetalleDto { get; set; } = null!;
        public virtual DbSet<ProductividadConsultaHeaderDto> ProductividadConsultaHeaderDtos { get; set; } = null!;
        public virtual DbSet<ProductividadConsultaDetalleDto> ProductividadConsultaDetalleDtos { get; set; } = null!;
        public virtual DbSet<ReporteConsumoGasolinaDto> ReporteConsumoGasolinaDtos { get; set; } = null!;
        public virtual DbSet<ReporteVechiculosExtraUtilizadosDto> ReporteVechiculosExtraUtilizadosDtos { get; set; } = null!;
      
        public virtual DbSet<ProcesoNominaDto> ProcesoNominaDto { get; set; } = null!;
        public virtual DbSet<ProcesoNominaPagoDto> ProcesoNominaPagoDto { get; set; } = null!;
        public virtual DbSet<ComprobanteNominaDto> ComprobanteNominaDto { get; set; } = null!;

        public DbSet<AuditLog> AuditLogs { get; set; }
        #endregion

        public string UserEmail { get; set; } = string.Empty;

        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new ZonaConfiguration());
            modelBuilder.ApplyConfiguration(new TiendaConfiguration());
            modelBuilder.ApplyConfiguration(new ClienteConfiguration());
            modelBuilder.ApplyConfiguration(new FormatoConfiguration());
            modelBuilder.ApplyConfiguration(new ZonaStedConfiguration());
            modelBuilder.ApplyConfiguration(new EmpleadoConfiguration());
            modelBuilder.ApplyConfiguration(new HorariosConfiguration());
            modelBuilder.ApplyConfiguration(new VehiculoConfiguration());

            modelBuilder.ApplyConfiguration(new CatalogoDiasConfiguration());
            modelBuilder.ApplyConfiguration(new DetalleTarjetaConfiguration());
            modelBuilder.ApplyConfiguration(new CatalogoBancosConfiguration());
            modelBuilder.ApplyConfiguration(new CatalogoEstadoConfiguration());
            modelBuilder.ApplyConfiguration(new FormatoClienteConfiguration());
            modelBuilder.ApplyConfiguration(new CheckInCkeckOutConfiguration());
            modelBuilder.ApplyConfiguration(new ContactoClienteConfiguration());
            modelBuilder.ApplyConfiguration(new HorarioEmpleadoConfiguration());

            modelBuilder.ApplyConfiguration(new MunicipioClienteConfiguration());
            modelBuilder.ApplyConfiguration(new VehiculoOperadorConfiguration());
            modelBuilder.ApplyConfiguration(new CatalogoMunicipioConfiguration());
            modelBuilder.ApplyConfiguration(new GerenteSubGerenteConfiguration());
            modelBuilder.ApplyConfiguration(new AsignacionTarjetaConfiguration());
            modelBuilder.ApplyConfiguration(new CoordinadorClienteConfiguration());
            modelBuilder.ApplyConfiguration(new EmpleadoCoordinadorConfiguration());

            modelBuilder.ApplyConfiguration(new DirectorSubDirectorConfiguration());
            modelBuilder.ApplyConfiguration(new CatalogoTipoVehiculosConfiguration());
            modelBuilder.ApplyConfiguration(new EmpleadoCuentaBancariaConfiguration());
            modelBuilder.ApplyConfiguration(new CatalogoMarcaVehiculosConfiguration());
            modelBuilder.ApplyConfiguration(new SubDirectorCoordinadorConfiguration());
            modelBuilder.ApplyConfiguration(new CatalogoModeloVehiculosConfiguration());

            modelBuilder.ApplyConfiguration(new PlanificacionConfiguration());
            modelBuilder.ApplyConfiguration(new TarifasTipoVehiculoConfiguration());
            modelBuilder.ApplyConfiguration(new ValidateUserAccountConfiguration());
            modelBuilder.ApplyConfiguration(new DetallePlanificacionConfiguration());
            modelBuilder.ApplyConfiguration(new EjecucionPlanificacionConfiguration());
            modelBuilder.ApplyConfiguration(new TiendaCoordinadorConfiguration());

            modelBuilder.ApplyConfiguration(new ProcesoNominaConfiguration());
            modelBuilder.ApplyConfiguration(new ComprobanteNominaConfiguration());


            base.OnModelCreating(modelBuilder);

            foreach (var entityType in modelBuilder.Model.GetEntityTypes())
            {
                if (typeof(ISoftDeletable).IsAssignableFrom(entityType.ClrType))
                {
                    modelBuilder.Entity(entityType.ClrType).HasQueryFilter(CreateSoftDeleteFilter(entityType.ClrType));
                }
            }

            modelBuilder.Entity<TiendaDetalleAsignacionDto>().HasNoKey().ToView("TiendasGetByParameter");
            modelBuilder.Entity<PlanificacionConsultaDetalleDto>().HasNoKey().ToView("PlanificacionDetalleGetByParameter");

            modelBuilder.Entity<ProductividadConsultaHeaderDto>().HasNoKey().ToView("PlanificacionGetByCoordinador");
            modelBuilder.Entity<ProductividadConsultaDetalleDto>().HasNoKey().ToView("ProductividadConsultaDetalleDto");
            modelBuilder.Entity<ReporteVechiculosExtraUtilizadosDto>().HasNoKey().ToView("ReporteVehiculosExtraUtilizados");
            modelBuilder.Entity<ReporteConsumoGasolinaDto>().HasNoKey().ToView("ReporteImporteCombustibleAsignado");
            modelBuilder.Entity<ComprobanteNominaDto>().HasNoKey().ToView("CalculoNominaProductividad");
            modelBuilder.Entity<ComprobanteNominaDto>().HasNoKey().ToView("ConsultaNominaProductividad");


        }

        private static LambdaExpression CreateSoftDeleteFilter(Type type)
        {
            var parameter = Expression.Parameter(type, "e");
            var property = Expression.Property(parameter, nameof(ISoftDeletable.IsDeleted));
            var falseValue = Expression.Constant(false);
            var condition = Expression.Equal(property, falseValue);

            var lambda = Expression.Lambda(condition, parameter);
            return lambda;
        }

        public override async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
        {

            var addedEntities = ChangeTracker.Entries()
                               .Where(x => x.State == EntityState.Added)
                               .ToList();

            var modifiedEntities = ChangeTracker.Entries()
                                  .Where(x => x.State == EntityState.Modified)
                                  .ToList();

            var now = DateTime.UtcNow;

            // Crear una lista para almacenar los registros de auditoría
            var auditLogs = new List<AuditLog>();

            foreach (var entry in addedEntities)
            {
                var auditLog = CreateAuditLog(entry, AuditAction.Create, UserEmail, now);
                if (auditLog != null)
                {
                    auditLogs.Add(auditLog);
                }
            }

            foreach (var entry in modifiedEntities)
            {
                var deleteTable = entry.Entity as ISoftDeletable;

                if (deleteTable != null)
                {
                    if (deleteTable.IsDeleted == true)
                    {
                        var auditLog = CreateAuditLog(entry, AuditAction.Delete, UserEmail, now);
                        if (auditLog != null)
                        {
                            auditLogs.Add(auditLog);
                        }
                    }
                    else
                    {
                        var auditLog = CreateAuditLog(entry, AuditAction.Update, UserEmail, now);
                        if (auditLog != null)
                        {
                            auditLogs.Add(auditLog);
                        }
                    }
                }
            }


            AuditLogs.AddRange(auditLogs);
            return await base.SaveChangesAsync(cancellationToken);
        }

        private AuditLog CreateAuditLog(EntityEntry entry, AuditAction actionType, string userEmail, DateTime timestamp)
        {
            var keyProperties = entry.Metadata.FindPrimaryKey().Properties.Select(p => p.PropertyInfo).ToList();
            var keyValue = string.Join("_", keyProperties.Select(p => p.GetValue(entry.Entity)));

            var originalValues = GetOriginalValues(entry) ?? "{}";

            return new AuditLog
            {
                TableName = entry.Metadata.GetTableName(),
                EntityId = keyValue,
                ActionType = actionType.ToString(),
                UserId = userEmail,
                OldValues = actionType.ToString() == "Updated" ? originalValues : "{}",
                NewValues = GetNewValues(entry),
                ActionDate = timestamp
            };
        }

        private string GetOriginalValues(EntityEntry entry)
        {
            var originalValues = new Dictionary<string, object>();

            foreach (var property in entry.Properties)
            {
                if (property.IsModified)
                {
                    originalValues[property.Metadata.Name] = property.OriginalValue;
                }
            }

            return originalValues.Count > 0 ? JsonConvert.SerializeObject(originalValues) : null;
        }

        private string GetNewValues(EntityEntry entry)
        {
            var newValues = new Dictionary<string, object>();

            foreach (var property in entry.Properties)
            {
                if (property.IsModified || entry.State == EntityState.Added)
                {
                    newValues[property.Metadata.Name] = property.CurrentValue;
                }
            }

            return newValues.Count > 0 ? JsonConvert.SerializeObject(newValues) : null;
        }

    }
}
