using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class CoordinadorCliente : ISoftDeletable
    {
        public long IdCoordinador { get; set; }
        public long IdCliente { get; set; }

        public virtual Cliente Cliente { get; set; }
        public virtual Empleado Coordinador { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
