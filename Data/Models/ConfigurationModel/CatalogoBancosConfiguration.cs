using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CatalogoBancosConfiguration : IEntityTypeConfiguration<CatalogoBancos>
    {
        public void Configure(EntityTypeBuilder<CatalogoBancos> entity)
        {
            entity.HasKey(e => e.IdBanco);
            entity.ToTable("tbl_CatalogoBancos");
            entity.Property(e => e.NombreBanco).HasMaxLength(50);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
        }
    }
}
