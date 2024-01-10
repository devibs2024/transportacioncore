using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class PlanificacionConfiguration : IEntityTypeConfiguration<Planificacion>
    {
        public void Configure(EntityTypeBuilder<Planificacion> entity)
        {
            entity.ToTable("tbl_Planificacion");
            entity.HasKey(e => e.IdPlanificacion);
            entity.Property(e => e.IdPlanificacion).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.FechaDesde).HasColumnType("date");
            entity.Property(e => e.FechaHasta).HasColumnType("date");
            entity.Property(e => e.Comentario).HasMaxLength(50);
            entity.Property(e => e.IdCoordinador).HasColumnName("IdCoordinador");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Coordinador)
                .WithMany(p => p.Planificacion)
                .HasForeignKey(d => d.IdCoordinador)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_Planificacion_Coordinador");
        }
    }
}
