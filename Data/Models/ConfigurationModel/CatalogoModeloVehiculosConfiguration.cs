using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CatalogoModeloVehiculosConfiguration : IEntityTypeConfiguration<CatalogoModeloVehiculos>
    {
        public void Configure(EntityTypeBuilder<CatalogoModeloVehiculos> entity)
        {
            entity.HasKey(e => e.IdModelo);
            entity.ToTable("tbl_CatalogoVehiculoModelo");
            entity.Property(e => e.Modelo).HasMaxLength(50);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
        }
    }
}
