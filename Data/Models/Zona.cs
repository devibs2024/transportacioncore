using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class Zona : ISoftDeletable
    {   
        public int IdZona { get; set; }
        public string NombreZona { get; set; }
        public string ClaveDET { get; set; }      
        public bool Activa { get; set; } = true;
      
        public virtual ICollection<CatalogoEstado> Estados { get; set; }

        public bool IsDeleted { get; set; }  = false; 
    }
}