using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class TarifasTipoVehiculo : ISoftDeletable
    {
        public int IdTarifa { get; set; }   
        public decimal Tarifa { get; set; }
        public bool Activa { get; set; }
        public bool Principal { get; set; }

        public int IdTipoVehiculo { get; set; }
        public CatalogoTipoVehiculos TipoVehiculos { get; set; }

        public bool IsDeleted { get; set; }  = false; 
    }
}
