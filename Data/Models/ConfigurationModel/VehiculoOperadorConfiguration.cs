using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class VehiculoOperadorConfiguration : IEntityTypeConfiguration<VehiculoOperador>
    {
        public void Configure(EntityTypeBuilder<VehiculoOperador> entity)
        {
            entity.HasKey(e => new
            {
                e.IdVehiculo,
                e.IdEmpleado
            });

            entity.ToTable("tbl_VehiculoOperador");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.VehiculosOperadores)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_VehiculoOperador_Empleados");

            entity.HasOne(d => d.Vehiculo)
                .WithMany(p => p.VehiculosOperadores)
                .HasForeignKey(d => d.IdVehiculo)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_VehiculoOperador_Operador");
        }
    }
}
