using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class AsignacionTarjetaConfiguration : IEntityTypeConfiguration<AsignacionTarjeta>
    {
        public void Configure(EntityTypeBuilder<AsignacionTarjeta> entity)
        {
            entity.HasKey(e => e.IdTarjeta);

            entity.ToTable("tbl_AsignacionTarjeta");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
            entity.Property(e => e.NumTarjeta).HasMaxLength(50);

            entity.Property(e => e.NumeroInterno).HasMaxLength(50);

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.AsignacionTarjetas)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK_AsignacionTarjeta_Empleados")
                 .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
