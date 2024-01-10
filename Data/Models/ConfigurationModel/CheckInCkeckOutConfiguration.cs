using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class CheckInCkeckOutConfiguration : IEntityTypeConfiguration<CheckIn_CkeckOut>
    {
        public void Configure(EntityTypeBuilder<CheckIn_CkeckOut> entity)
        {
            entity.HasKey(e => e.IdCheck);

            entity.ToTable("tbl_CheckIn_CheckOut");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Empleados)
        .WithMany(p => p.CheckIn_CkeckOut)
        .HasForeignKey(d => d.IdEmpleado)
        .HasConstraintName("FK_CheckIn_CheckOut_Empleado")
         .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
