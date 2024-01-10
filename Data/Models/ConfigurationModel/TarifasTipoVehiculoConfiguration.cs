using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class TarifasTipoVehiculoConfiguration : IEntityTypeConfiguration<TarifasTipoVehiculo>
    {
        public void Configure(EntityTypeBuilder<TarifasTipoVehiculo> entity)
        {
            entity.ToTable("tbl_TarifasTipoVehiculo");

            entity.HasKey(e => e.IdTarifa);

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

            entity.Property(e => e.Tarifa).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.Activa);
            entity.Property(e => e.Principal);

            entity.HasOne(d => d.TipoVehiculos)
                .WithMany(p => p.Tarifas)
                .HasForeignKey(d => d.IdTipoVehiculo)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_Tarifa_TipoVehiculo");
        }
    }
}
