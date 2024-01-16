using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TransportationCore.Data.Models.ConfigurationModel
{

    public class ProcesoNominaConfiguration : IEntityTypeConfiguration<ProcesoNomina>
    {
        public void Configure(EntityTypeBuilder<ProcesoNomina> entity)
        {
           
            entity.HasKey(e => e.IdProcesoNomina);

            entity.ToTable("tbl_ProcesoNomina");

            entity.Property(e => e.Procesado).HasDefaultValue(false);

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
            
        }
    }

    public class ComprobanteNominaConfiguration : IEntityTypeConfiguration<ComprobanteNomina>
    {
        public void Configure(EntityTypeBuilder<ComprobanteNomina> entity)
        {

            entity.HasKey(e => e.IdComprobanteNomina);

            entity.ToTable("tbl_ComprobanteNomina");

            entity.Property(e => e.IsDeleted).HasDefaultValue(false);

        }
    }

}
