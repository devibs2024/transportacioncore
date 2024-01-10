using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class TiendaCoordinadorConfiguration : IEntityTypeConfiguration<TiendaCoordinador>
    {
        public void Configure(EntityTypeBuilder<TiendaCoordinador> entity)
        {
            entity.HasKey(e => new
            {               
                e.IdCoordinador,
                e.IdTienda
            });

            entity.ToTable("tbl_TiendaCoordinador");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.HasOne(d => d.Tienda)
                .WithMany(p => p.TiendaCoordinadores)
                .HasForeignKey(d => d.IdTienda)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_TiendaCoordinador_Tienda");

            entity.HasOne(d => d.Coordinador)
                .WithMany(p => p.TiendaCoordinadores)
                .HasForeignKey(d => d.IdCoordinador)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_TiendaCoordinador_Coordinador");
        }
    }
}
