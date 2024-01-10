using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using System.Xml.Linq;
using TransportationCore.Data.Dtos.ModeloVehiculo;
using TransportationCore.Data.Dtos.TipoVehiculo;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.MarcaVehiculo
{
    public class MarcaVehiculoConsultaDto
    {
        // Data annotation para especificar que el campo IdTipo es opcional
        [Display(Name = "Identificador de Tipo")]
        public int? IdTipo { get; set; }

        // Data annotation para especificar el nombre a mostrar del campo IdMarca
        [Display(Name = "Identificador de Marca")]
        public int IdMarca { get; set; }

        // Data annotation para especificar el nombre a mostrar del campo Marca y que no sea nulo
        [Required(ErrorMessage = "El campo Marca es obligatorio.")]
        [Display(Name = "Marca")]
        public string Marca { get; set; }

        // Data annotation para especificar que el campo Activo es opcional y con valor por defecto en true
        [Display(Name = "Activo")]
        public bool? Activo { get; set; } = true;
         
        [JsonIgnore]      
        public virtual ICollection<ModeloVehiculoConsultaDto> ModeloVehiculos { get; set; }
        public virtual TipoVehiculoConsultaDto TipoVehiculos { get; set; }
    }
}
