using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CatalogoMunicipioConfiguration : IEntityTypeConfiguration<CatalogoMunicipio>
    {
        public void Configure(EntityTypeBuilder<CatalogoMunicipio> entity)
        {
            entity.HasKey(e => e.IdMunicipio);

            entity.ToTable("tbl_CatalogoMunicipio");

            entity.Property(e => e.NombreMunicipio).HasMaxLength(30);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasMany(d => d.Empleados)
                .WithOne(p => p.Municipio)
                .HasForeignKey(d => d.IdMunicipio)
                .HasConstraintName("FK_Empleados_Municipio")
                 .OnDelete(DeleteBehavior.Restrict);

            entity.HasMany(d => d.Clientes)
                .WithOne(p => p.Municipio)
                .HasForeignKey(d => d.IdMunicipio)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_Clientes_Municipio")
                 .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
