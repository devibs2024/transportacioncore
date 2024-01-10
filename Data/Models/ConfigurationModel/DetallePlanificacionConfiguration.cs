using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class DetallePlanificacionConfiguration : IEntityTypeConfiguration<DetallePlanificacion>
    {
        public void Configure(EntityTypeBuilder<DetallePlanificacion> entity)
        {
            entity.ToTable("tbl_DetallePlanificacion");
            entity.HasKey(e => new { e.IdPlanificacion, e.IdDetallePlanificacion });

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.Property(e => e.IdDetallePlanificacion).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.IdOperador).HasColumnName("IdOperador");
            entity.Property(e => e.IdTienda).HasColumnName("IdTienda");
            entity.Property(e => e.Fecha).HasColumnType("date");
            entity.Property(e => e.HoraInicio).HasColumnType("time(7)");
            entity.Property(e => e.HoraFin).HasColumnType("time(7)");
            entity.Property(e => e.Descanso);

            entity.HasOne(d => d.Planificacion)
                .WithMany(p => p.DetallesPlanificacion)
                .HasForeignKey(d => d.IdPlanificacion)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_Detalle_Planificacion");

            entity.HasOne(d => d.Operador)
            .WithMany(p => p.DetallePlanificacion)
            .HasForeignKey(d => d.IdOperador)
            .OnDelete(DeleteBehavior.Restrict)
            .HasConstraintName("FK_DetallePlanificacion_Operador");
        }
    }
}
