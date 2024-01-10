using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class CatalogoEstado : ISoftDeletable
    {
        public CatalogoEstado()
        {
            Municipios = new HashSet<CatalogoMunicipio>();
            Clientes = new HashSet<Cliente>();
        }

        public int IdEstado { get; set; }
        public string NombreEstado { get; set; }
        public bool Activo { get; set; } = true!;
        public int IdZona { get; set; }

        public virtual ICollection<CatalogoMunicipio> Municipios { get; set; }
        public virtual ICollection<Cliente> Clientes { get; set; }
        public virtual ICollection<Tienda> Tiendas { get; set; }
        public virtual Zona Zona { get; set; }

        public bool IsDeleted { get; set; }
    }
}
