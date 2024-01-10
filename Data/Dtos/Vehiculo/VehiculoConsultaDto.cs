using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using TransportationCore.Data.Dtos.MarcaVehiculo;
using TransportationCore.Data.Dtos.ModeloVehiculo;
using TransportationCore.Data.Dtos.TipoVehiculo;

namespace TransportationCore.Data.Dtos.Vehiculo
{
    public class VehiculoConsultaDto
    {
        public long IdVehiculo { get; set; }

        [Required(ErrorMessage = "El nombre del vehículo es requerido")]
        public string NombreVehiculo { get; set; } = null!;

        [Required(ErrorMessage = "El Id del tipo de vehículo es requerido")]
        public int? IdTipoVehiculo { get; set; }
        public string TipoVehiculoDescr { get { return (this.TipoVehiculo != null ? this.TipoVehiculo.TipoVehiculo : string.Empty); } }

        [Required(ErrorMessage = "El Id de la marca del vehículo es requerido")]
        public int? IdMarcaVehiculo { get; set; }
        public string MarcaVehiculoDescr { get { return (this.MarcaVehiculo != null ? this.MarcaVehiculo.Marca : string.Empty); } }

        [Required(ErrorMessage = "El Id del modelo del vehículo es requerido")]
        public int? IdModeloVehiculo { get; set; }
        public string ModeloVehiculoDescr { get { return (this.ModeloVehiculo != null ? this.ModeloVehiculo.Modelo : string.Empty); } }

        public int? EmisionVehiculo { get; set; }

        [Required(ErrorMessage = "Se debe especificar si el vehículo es propiedad de la empresa")]
        public bool? VehiculoEmpresa { get; set; }       

        [JsonIgnore]
        public TipoVehiculoConsultaDto TipoVehiculo { get; set; }
        [JsonIgnore]
        public MarcaVehiculoConsultaDto MarcaVehiculo { get; set; }
        [JsonIgnore]
        public ModeloVehiculoConsultaDto ModeloVehiculo { get; set; }
    }
}
