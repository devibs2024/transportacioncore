using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CoordinadorClienteConfiguration : IEntityTypeConfiguration<CoordinadorCliente>
    {
        public void Configure(EntityTypeBuilder<CoordinadorCliente> entity)
        {
            entity.HasKey(e => new
            {
                e.IdCoordinador,
                e.IdCliente
            });

            entity.ToTable("tbl_CoordinadorCliente");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Coordinador)
                .WithMany(p => p.CoordinadorCliente)
                .HasForeignKey(d => d.IdCoordinador)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_CoordinadorCliente_Coordinador");

            entity.HasOne(d => d.Cliente)
                .WithMany(p => p.CoordinadorCliente)
                .HasForeignKey(d => d.IdCliente)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_CoordinadorCliente_Cliente");
        }
    }
}
