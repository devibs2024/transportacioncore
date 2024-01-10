using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{
    public class ValidateUserAccountConfiguration : IEntityTypeConfiguration<ValidateUserAccount>
    {
        public void Configure(EntityTypeBuilder<ValidateUserAccount> entity)
        {
            entity.HasKey(e => e.IdValidarCuenta);
            entity.ToTable("tbl_ValidateUserAccount");
            entity.Property(e => e.TipoCodigo).HasMaxLength(50);
            entity.Property(e => e.fechaExpiracion).HasColumnType("datetime");
        }
    }
}
