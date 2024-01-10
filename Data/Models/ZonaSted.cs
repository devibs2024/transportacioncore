using System.ComponentModel.DataAnnotations.Schema;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class ZonaSted : ISoftDeletable
    {
        public int IdZonaSted { get; set; }
        public string NombreZona { get; set; } = string.Empty;
        public string ClaveDET { get; set; } = string.Empty;
        public bool Activa { get; set; } = true;
        public long IdCliente { get; set; }

        public virtual ICollection<Tienda> Tiendas { get; set; }
        [ForeignKey("IdCliente")]
        public Cliente Cliente { get; set; }

        public bool IsDeleted { get; set; }     

    }
}
