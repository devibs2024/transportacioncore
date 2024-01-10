using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class GerenteSubGerente : ISoftDeletable
    {
        public long IdGerente { get; set; }
        public long IdSubGerente { get; set; }
               
        public virtual ContactoCliente Contacto { get; set; }

        public bool IsDeleted { get; set; }     
    }
}
