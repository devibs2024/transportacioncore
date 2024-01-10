using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class EmpleadoCoordinador : ISoftDeletable
    {
        public long IdOperador { get; set; }
        public long IdCoordinador { get; set; }

        public virtual Empleado Empleado { get; set; }

        public bool IsDeleted { get; set; }  = false; 
    }
}
