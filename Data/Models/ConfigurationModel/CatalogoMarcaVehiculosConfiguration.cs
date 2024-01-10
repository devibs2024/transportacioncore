using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CatalogoMarcaVehiculosConfiguration : IEntityTypeConfiguration<CatalogoMarcaVehiculos>
    {
        public void Configure(EntityTypeBuilder<CatalogoMarcaVehiculos> entity)
        {
            entity.HasKey(e => e.IdMarca);
            entity.ToTable("tbl_CatalogoVehiculoMarca");
            entity.Property(e => e.Marca).HasMaxLength(50);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.TipoVehiculos)
                .WithMany(p => p.MarcaVehiculos)
                .HasForeignKey(d => d.IdTipo)
                .HasConstraintName("FK_VehiculoMarca_TipoVehiculo")
                 .OnDelete(DeleteBehavior.Restrict);

            entity.HasMany(d => d.ModeloVehiculos)
              .WithOne(p => p.MarcaVehiculos)
              .HasForeignKey(p => p.IdMarca)
              .HasConstraintName("FK_VehiculoModelo_VehiculoMarca")
               .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
