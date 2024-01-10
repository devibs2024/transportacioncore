using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class MunicipioClienteConfiguration : IEntityTypeConfiguration<MunicipioCliente>
    {
        public void Configure(EntityTypeBuilder<MunicipioCliente> entity)
        {
            entity.HasKey(e => new
            {
                e.IdMunicipio,
                e.IdCliente
            });

            entity.ToTable("tbl_MunicipioCliente");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Cliente)
                .WithMany(p => p.MunicipioClientes)
                .HasForeignKey(d => d.IdCliente)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_MunicipioCliente_Cliente");

            entity.HasOne(d => d.Municipio)
                .WithMany(p => p.MunicipioClientes)
                .HasForeignKey(d => d.IdMunicipio)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_MunicipioCliente_Formato");
        }
    }
}
