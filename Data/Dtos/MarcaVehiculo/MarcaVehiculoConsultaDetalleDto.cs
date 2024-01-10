using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using System.Xml.Linq;
using TransportationCore.Data.Dtos.ModeloVehiculo;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.MarcaVehiculo
{
    public class MarcaVehiculoConsultaDetalleDto
    {
              
        public int IdTipo { get; set; }      
        public int IdMarca { get; set; }      
        public string Marca { get; set; }        
        public bool? Activo { get; set; } = true;
                
        public virtual ICollection<ModeloVehiculoConsultaDetalleDto> ModeloVehiculos { get; set; }
    }
}
