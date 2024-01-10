using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CatalogoDiasConfiguration : IEntityTypeConfiguration<CatalogoDias>
    {
        public void Configure(EntityTypeBuilder<CatalogoDias> entity)
        {
            entity.HasKey(e => e.IdDia);
            entity.ToTable("tbl_CatalogoDias");
            entity.Property(e => e.IdDia).ValueGeneratedNever();
            entity.Property(e => e.Descripcion).HasMaxLength(50);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
        }
    }
}
