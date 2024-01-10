using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class ContactoClienteConfiguration : IEntityTypeConfiguration<ContactoCliente>
    {
        public void Configure(EntityTypeBuilder<ContactoCliente> entity)
        {
            entity.HasKey(e => e.IdContacto);

            entity.ToTable("tbl_ContactoCliente");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Cliente)
                   .WithMany(p => p.ContactoCliente)
                   .HasForeignKey(d => d.IdCliente)
                   .HasConstraintName("FK_Contacto_Cliente")
                   .OnDelete(DeleteBehavior.Restrict);

        }
    }
}
