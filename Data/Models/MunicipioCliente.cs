using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class MunicipioCliente : ISoftDeletable
    {
        public int IdMunicipio { get; set; }
        public long IdCliente { get; set; }

        public virtual CatalogoMunicipio Municipio { get; set; }
        public virtual Cliente Cliente { get; set; }

        public bool IsDeleted { get; set; }      
    }
}
