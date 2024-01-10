using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class FormatoCliente : ISoftDeletable
    {
        public int IdFormato { get; set; }
        public long IdCliente { get; set; }

        public virtual Formato Formato { get; set; }
        public virtual Cliente Cliente { get; set; }

        public bool IsDeleted { get; set; }  = false; 
    }
}
