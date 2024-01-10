using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class EstatusRegistroEnt : ISoftDeletable
    {
        public int IdEstatus { get; set; }
        public string Estatus { get; set; } = string.Empty;

        public bool IsDeleted { get; set; }  = false; 
    }
}
