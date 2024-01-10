using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CatalogoTipoVehiculosConfiguration : IEntityTypeConfiguration<CatalogoTipoVehiculos>
    {
        public void Configure(EntityTypeBuilder<CatalogoTipoVehiculos> entity)
        {
            entity.HasKey(e => e.IdTipoVehiculo);
            entity.ToTable("tbl_CatalogoTipoVehiculo");
            entity.Property(e => e.TipoVehiculo).HasMaxLength(50);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
        }
    }
}
