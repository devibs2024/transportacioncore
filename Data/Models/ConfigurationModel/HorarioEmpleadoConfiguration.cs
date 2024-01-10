using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class HorarioEmpleadoConfiguration : IEntityTypeConfiguration<HorarioEmpleado>
    {
        public void Configure(EntityTypeBuilder<HorarioEmpleado> entity)
        {
            entity.HasKey(e => new
            {
                e.IdHorario,
                e.IdEmpleado
            });

            entity.ToTable("tbl_HorarioEmpleado");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Horario)
                .WithMany(p => p.HorarioEmpleados)
                .HasForeignKey(d => d.IdHorario)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_HorarioEmpleado_Horario");

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.HorarioEmpleados)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_HorarioEmpleado_Empleado");
        }
    }
}
