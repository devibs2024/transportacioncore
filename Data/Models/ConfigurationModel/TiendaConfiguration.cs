using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class TiendaConfiguration : IEntityTypeConfiguration<Tienda>
    {
        public void Configure(EntityTypeBuilder<Tienda> entity)
        {
            entity.HasKey(e => e.IdTienda);
            entity.ToTable("tbl_Tienda");

            entity.Property(e => e.NombreTienda).HasMaxLength(30);
            entity.Property(e => e.NumUnidades).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.UnidadesMaximas).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.Tarifa).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.TarifaDescanso).HasColumnType("decimal(18, 2)");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Estado)
              .WithMany(p => p.Tiendas)
              .HasForeignKey(d => d.IdEstado)
              .HasConstraintName("FK_Tienda_Estado")
               .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
