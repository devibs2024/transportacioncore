using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class ZonaStedConfiguration : IEntityTypeConfiguration<ZonaSted>
    {
        public void Configure(EntityTypeBuilder<ZonaSted> entity)
        {
            entity.HasKey(e => e.IdZonaSted);

            entity.ToTable("tbl_ZonaSted");

            entity.Property(e => e.NombreZona).HasMaxLength(30);
            entity.Property(e => e.ClaveDET).HasMaxLength(50);

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasMany(d => d.Tiendas)
              .WithOne(p => p.ZonaSted)
              .HasForeignKey(d => d.IdZonaSted)
              .HasConstraintName("FK_ZonaSted_Tienda")
               .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
