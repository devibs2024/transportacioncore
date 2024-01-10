using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class DetalleTarjetaConfiguration : IEntityTypeConfiguration<DetalleTarjeta>
    {
        public void Configure(EntityTypeBuilder<DetalleTarjeta> entity)
        {
            entity.HasKey(e => e.IdDetalleTarjeta);
            entity.ToTable("tbl_DetalleTarjeta");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.Property(e => e.FechaDispension).HasColumnType("datetime");
            entity.Property(e => e.Importe).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Cordinador)
                .WithMany(p => p.DetalleTarjetaCordinador)
                .HasForeignKey(d => d.IdCordinador)
                .HasConstraintName("FK_DetalleTarjeta_Coordinador")
                 .OnDelete(DeleteBehavior.Restrict);

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.DetalleTarjetaEmpleado)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK_DetalleTarjeta_Empleado")
                 .OnDelete(DeleteBehavior.Restrict);

            entity.HasOne(d => d.Tarjeta)
                .WithMany(p => p.DetalleTarjetas)
                .HasForeignKey(d => d.IdTarjeta)
                .HasConstraintName("FK_DetalleTarjeta_AsignacionTarjeta")
                 .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
