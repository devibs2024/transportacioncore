using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class Cliente : ISoftDeletable
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long IdCliente { get; set; }
        public long Clave { get; set; }
        public string NombreCliente { get; set; }
        public int? IdEstado { get; set; }
        public int? IdMunicipio { get; set; }
        public int? IdZona { get; set; }
        //public int? IdFormato { get; set; }
        public decimal? Tarifa { get; set; }
        public decimal? TarifaHoraAdicional { get; set; }
        public decimal? TarifaConAyudante { get; set; }
        public decimal? TarifaSpot { get; set; }


        public virtual CatalogoEstado Estado { get; set; }
        public virtual CatalogoMunicipio Municipio { get; set; }
        //public virtual Formato Formato { get; set; }
        [ForeignKey("IdZona")]
        public virtual Zona Zona { get; set; }
        public virtual IEnumerable<CoordinadorCliente> CoordinadorCliente { get; set; }    
        public virtual ICollection<FormatoCliente> FormatoClientes { get; set; }
        public virtual ICollection<MunicipioCliente> MunicipioClientes { get; set; }
        public virtual ICollection<ContactoCliente> ContactoCliente { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
