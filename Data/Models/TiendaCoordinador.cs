using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class TiendaCoordinador : ISoftDeletable
    {
        public int IdTienda { get; set; }
        public long IdCoordinador { get; set; }

        public Tienda Tienda { get; set; }
        public Empleado Coordinador { get; set; }

        public bool IsDeleted { get; set; }      
    }
}
