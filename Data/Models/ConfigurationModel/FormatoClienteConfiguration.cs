using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class FormatoClienteConfiguration : IEntityTypeConfiguration<FormatoCliente>
    {
        public void Configure(EntityTypeBuilder<FormatoCliente> entity)
        {
            entity.HasKey(e => new
            {
                e.IdFormato,
                e.IdCliente
            });

            entity.ToTable("tbl_FormatoCliente");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Cliente)
                .WithMany(p => p.FormatoClientes)
                .HasForeignKey(d => d.IdCliente)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_FormatoCliente_Cliente");

            entity.HasOne(d => d.Formato)
                .WithMany(p => p.FormatoClientes)
                .HasForeignKey(d => d.IdFormato)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_FormatoCliente_Formato");
        }
    }
}
