using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class HorariosConfiguration : IEntityTypeConfiguration<Horarios>
    {
        public void Configure(EntityTypeBuilder<Horarios> entity)
        {
            entity.HasKey(e => e.IdHorario);

            entity.ToTable("tbl_Horario");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Dias)
                .WithMany(p => p.Horarios)
                .HasForeignKey(d => d.IdDia)
                .HasConstraintName("FK_Horario_Dias")
                 .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
