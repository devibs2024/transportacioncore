using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class DirectorSubDirector : ISoftDeletable
    {
        public long IdDirector { get; set; }
        public long IdSubDirector { get; set; }

        public virtual Empleado Empleado { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
