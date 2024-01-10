using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class ContactoCliente : ISoftDeletable
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long IdContacto { get; set; }

        public long IdCliente { get; set; }

        public string Nombre { get; set; } = string.Empty;

        public string email { get; set; } = string.Empty;

        public string telefono { get; set; } = string.Empty;

        public string telefono2 { get; set; } = string.Empty;

        public bool Activo { get; set; }
        public int TipoContacto { get; set; }

        public virtual Cliente Cliente { get; set; }
        public virtual ICollection<GerenteSubGerente> GerenteSubGerentes { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
