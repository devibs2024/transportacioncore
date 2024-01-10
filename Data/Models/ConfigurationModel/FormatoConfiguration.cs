using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class FormatoConfiguration : IEntityTypeConfiguration<Formato>
    {
        public void Configure(EntityTypeBuilder<Formato> entity)
        {
            entity.HasKey(e => e.IdFormato);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.ToTable("tbl_Formato");
            entity.Property(e => e.DescripcionFormato).HasMaxLength(30);
        }
    }
}
