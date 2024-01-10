using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class EmpleadoCoordinadorConfiguration : IEntityTypeConfiguration<EmpleadoCoordinador>
    {
        public void Configure(EntityTypeBuilder<EmpleadoCoordinador> entity)
        {
            entity.HasKey(e => new
            {
                e.IdOperador,
                e.IdCoordinador
            });

            entity.ToTable("tbl_EmpleadoCoordinador");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.EmpleadoCoordinadores)
                .HasForeignKey(d => d.IdOperador)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_EmpleadoCoordinador_Empleados");

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.EmpleadoCoordinadores)
                .HasForeignKey(d => d.IdCoordinador)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_EmpleadoCoordinador_Coordinador");
        }
    }
}
