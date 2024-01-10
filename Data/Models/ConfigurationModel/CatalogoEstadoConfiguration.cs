using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CatalogoEstadoConfiguration : IEntityTypeConfiguration<CatalogoEstado>
    {
        public void Configure(EntityTypeBuilder<CatalogoEstado> entity)
        {
            entity.HasKey(e => e.IdEstado);

            entity.ToTable("tbl_CatalogoEstado");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
            entity.Property(e => e.NombreEstado).HasMaxLength(30);

            entity.HasMany(d => d.Municipios)
                .WithOne(p => p.Estado)
                .HasForeignKey(d => d.IdEstado)
                .HasConstraintName("FK_Municipio_Estado")
                 .OnDelete(DeleteBehavior.Restrict);

            entity.HasMany(d => d.Clientes)
                .WithOne(p => p.Estado)
                .HasForeignKey(d => d.IdEstado)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_Clientes_Estado")
                 .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
