using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class VehiculoConfiguration : IEntityTypeConfiguration<Vehiculo>
    {
        public void Configure(EntityTypeBuilder<Vehiculo> entity)
        {
            entity.HasKey(e => e.IdVehiculo);
            entity.ToTable("tbl_Vehiculo");

            entity.Property(e => e.NombreVehiculo).HasMaxLength(50);
            entity.Property(e => e.Tarifa).HasColumnType("decimal(18, 2)");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.MarcaVehiculo)
                                    .WithMany(p => p.Vehiculos)
                                    .HasForeignKey(d => d.IdMarcaVehiculo)
                                    .HasConstraintName("FK_Vehiculo_Marca")
                                     .OnDelete(DeleteBehavior.Restrict);

            entity.HasOne(d => d.ModeloVehiculo)
                                    .WithMany(p => p.Vehiculos)
                                    .HasForeignKey(d => d.IdModeloVehiculo)
                                    .HasConstraintName("FK_Vehiculo_Modelo")
                                     .OnDelete(DeleteBehavior.Restrict);

            entity.HasOne(d => d.TipoVehiculo)
                                    .WithMany(p => p.Vehiculos)
                                    .HasForeignKey(d => d.IdTipoVehiculo)
                                    .HasConstraintName("FK_Vehiculo_TipoVehiculo")
                                     .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
