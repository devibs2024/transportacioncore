using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class EmpleadoCuentaBancariaConfiguration : IEntityTypeConfiguration<EmpleadoCuentaBancaria>
    {
        public void Configure(EntityTypeBuilder<EmpleadoCuentaBancaria> entity)
        {
            entity.HasKey(e => e.IdCuenta);
            entity.ToTable("tbl_EmpleadoCuentaBancaria");
            entity.Property(e => e.CuentaBancaria).HasMaxLength(20);

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Bancos)
                .WithMany(p => p.EmpleadoCuentasBancarias)
                .HasForeignKey(d => d.IdBanco)
                .HasConstraintName("FK_EmpleadoCuentaBancaria_Bancos")
                 .OnDelete(DeleteBehavior.Restrict);

            entity.HasOne(d => d.Empleados)
                .WithMany(p => p.EmpleadoCuentasBancarias)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK_EmpleadoCuentaBancaria_Empleados")
                 .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
