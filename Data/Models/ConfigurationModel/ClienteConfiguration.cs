using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class ClienteConfiguration : IEntityTypeConfiguration<Cliente>
    {
        public void Configure(EntityTypeBuilder<Cliente> entity)
        {
            entity.HasKey(e => e.IdCliente);
            entity.ToTable("tbl_Cliente");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.Property(e => e.NombreCliente).HasMaxLength(100);
            entity.Property(e => e.Tarifa).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.TarifaConAyudante).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.TarifaHoraAdicional).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.TarifaSpot).HasColumnType("decimal(18, 2)");
        }
    }
}
