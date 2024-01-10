using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class DirectorSubDirectorConfiguration : IEntityTypeConfiguration<DirectorSubDirector>
    {
        public void Configure(EntityTypeBuilder<DirectorSubDirector> entity)
        {
            entity.HasKey(e => new
            {
                e.IdSubDirector,
                e.IdDirector
            });

            entity.ToTable("tbl_DirectorSubDirector");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.DirectorSubDirectores)
                .HasForeignKey(d => d.IdSubDirector)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_DirectorSubDirector_SubDirector");

            entity.HasOne(d => d.Empleado)
                .WithMany(p => p.DirectorSubDirectores)
                .HasForeignKey(d => d.IdDirector)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_DirectorSubDirector_Director");
        }
    }
}
