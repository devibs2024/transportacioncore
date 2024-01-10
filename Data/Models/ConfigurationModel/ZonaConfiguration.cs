using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class ZonaConfiguration : IEntityTypeConfiguration<Zona>
    {
        public void Configure(EntityTypeBuilder<Zona> entity)
        {
            entity.HasKey(e => e.IdZona);

            entity.ToTable("tbl_Zona");

            entity.Property(e => e.ClaveDET).HasMaxLength(50);
            entity.Property(e => e.NombreZona).HasMaxLength(30);

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);


            entity.HasMany(d => d.Estados)
                .WithOne(p => p.Zona)
                .HasForeignKey(d => d.IdZona)
                .HasConstraintName("FK_Estados_Zona")
                .OnDelete(DeleteBehavior.Restrict);

        }
    }
}
