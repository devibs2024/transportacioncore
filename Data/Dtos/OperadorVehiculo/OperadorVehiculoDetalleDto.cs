using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Dtos.MarcaVehiculo;
using TransportationCore.Data.Dtos.ModeloVehiculo;
using TransportationCore.Data.Dtos.Operador;
using TransportationCore.Data.Dtos.TipoVehiculo;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.OperadorVehiculo
{
    public class OperadorVehiculoDetalleDto
    {
        public long IdVehiculo { get; set; }

        [Required(ErrorMessage = "El nombre del vehículo es requerido.")]
        public string NombreVehiculo { get; set; } = null!;

        public int? IdTipoVehiculo { get; set; }
        public string TipoVehiculoDescr { get { return (this.TipoVehiculo != null ? this.TipoVehiculo.TipoVehiculo : string.Empty); } }

        [Required(ErrorMessage = "La marca del vehículo es requerida.")]
        public int? IdMarcaVehiculo { get; set; }
        public string MarcaVehiculoDescr { get { return (this.MarcaVehiculo != null ? this.MarcaVehiculo.Marca : string.Empty); } }

        [Required(ErrorMessage = "El modelo del vehículo es requerido.")]
        public int? IdModeloVehiculo { get; set; }
        public string ModeloVehiculoDescr { get { return (this.ModeloVehiculo != null ? this.ModeloVehiculo.Modelo : string.Empty); } }

        [Range(0, int.MaxValue, ErrorMessage = "La emisión del vehículo debe ser mayor o igual a cero.")]
        public int? EmisionVehiculo { get; set; }

        public bool? VehiculoEmpresa { get; set; }
        public decimal Tarifa { get; set; }
        [JsonIgnore]
        public TipoVehiculoConsultaDto TipoVehiculo { get; set; }
        [JsonIgnore]
        public  MarcaVehiculoConsultaDto MarcaVehiculo { get; set; }
        [JsonIgnore]
        public  ModeloVehiculoConsultaDto ModeloVehiculo { get; set; }

        [JsonIgnore]
        public OperadorConsultaMinDto Empleado { get; set; }

    }
}
