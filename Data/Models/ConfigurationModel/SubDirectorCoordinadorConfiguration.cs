using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class SubDirectorCoordinadorConfiguration : IEntityTypeConfiguration<SubDirectorCoordinador>
    {
        public void Configure(EntityTypeBuilder<SubDirectorCoordinador> entity)
        {
            entity.HasKey(e => new
            {
                e.IdSubDirector,
                e.IdCoordinador
            });

            entity.ToTable("tbl_SubDirectorCoordinador");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.SubDirectorCoordinadores)
                .HasForeignKey(d => d.IdSubDirector)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_DirectorCoordinador_Director");

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.SubDirectorCoordinadores)
                .HasForeignKey(d => d.IdCoordinador)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_SubDirectorCoordinador_Coordinador");
        }
    }
}
