using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class HorarioEmpleado : ISoftDeletable
    {
        public long IdHorario { get; set; }
        public long IdEmpleado { get; set; }

        public virtual Horarios Horario { get; set; }
        public virtual Empleado Empleado { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
