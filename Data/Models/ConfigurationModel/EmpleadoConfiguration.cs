using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class EmpleadoConfiguration : IEntityTypeConfiguration<Empleado>
    {
        public void Configure(EntityTypeBuilder<Empleado> entity)
        {
            entity.HasKey(e => e.IdEmpleado);
            entity.ToTable("tbl_Empleados");

            entity.Property(e => e.ApellidoMaterno).HasMaxLength(20);
            entity.Property(e => e.ApellidoPaterno).HasMaxLength(20);
            entity.Property(e => e.Correo).HasMaxLength(75);

            entity.Property(e => e.Direccion).HasMaxLength(100);
            entity.Property(e => e.Nombres).HasMaxLength(30);

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            //entity.Property(e => e.NumeroContrato).HasColumnType("numeric(18, 0)");
            entity.Property(e => e.Salario).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.Telefono).HasMaxLength(20);
        }
    }
}
