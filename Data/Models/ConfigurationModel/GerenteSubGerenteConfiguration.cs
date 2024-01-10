using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class GerenteSubGerenteConfiguration : IEntityTypeConfiguration<GerenteSubGerente>
    {
        public void Configure(EntityTypeBuilder<GerenteSubGerente> entity)
        {
            entity.HasKey(e => new
            {
                e.IdGerente,
                e.IdSubGerente
            });

            entity.ToTable("tbl_GerenteSubGerente");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Contacto)
                   .WithMany(p => p.GerenteSubGerentes)
                   .HasForeignKey(d => d.IdGerente)
                   .HasConstraintName("FK_Contacto_Gerentes")
                    .OnDelete(DeleteBehavior.Restrict);

            entity.HasOne(d => d.Contacto)
                  .WithMany(p => p.GerenteSubGerentes)
                  .HasForeignKey(d => d.IdSubGerente)
                  .HasConstraintName("FK_Contacto_SubGerentes")
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
