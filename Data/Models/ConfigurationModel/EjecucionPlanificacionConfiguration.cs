using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class EjecucionPlanificacionConfiguration : IEntityTypeConfiguration<EjecucionPlanificacion>
    {
        public void Configure(EntityTypeBuilder<EjecucionPlanificacion> entity)
        {
            entity.ToTable("tbl_EjecucionPlanificacion");
            entity.HasKey(e => new { e.IdPlanificacion, e.IdEjecucionPlanificacion });

            entity.Property(e => e.IdEjecucionPlanificacion).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.IdDetallePlanificacion).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.IdOperador).HasColumnName("IdOperador");
            entity.Property(e => e.IdTienda).HasColumnName("IdTienda");
            entity.Property(e => e.Fecha).HasColumnType("date");
            entity.Property(e => e.HoraInicio).HasColumnType("time(7)");
            entity.Property(e => e.HoraFin).HasColumnType("time(7)");
            entity.Property(e => e.Descanso);

            entity.Property(e => e.TipoRegistro).HasColumnName("TipoRegistro"); 
            entity.Property(e => e.MontoHorasExtras).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.IncentivoFactura).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.DescuentoTardanza).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.MontoCombustible).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.Justificacion).HasColumnName("Justificacion");

            entity.Property(e => e.IdVehiculo).HasColumnName("IdVehiculo");
            entity.Property(e => e.IdTipoVehiculo).HasColumnName("IdTipoVehiculo");
            entity.Property(e => e.IdTarjeta).HasColumnName("IdTarjeta");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Planificacion)
                .WithMany(p => p.EjecucionesPlanificacion)
                .HasForeignKey(d => d.IdPlanificacion)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_Ejecucion_Planificacion");

            entity.HasOne(d => d.Operador)
               .WithMany(p => p.EjecucionPlanificacion)
               .HasForeignKey(d => d.IdOperador)
               .OnDelete(DeleteBehavior.Restrict)
               .HasConstraintName("FK_EjecucionPlanificacion_Operador");
        }
    }
}
