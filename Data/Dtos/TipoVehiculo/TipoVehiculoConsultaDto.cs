using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Dtos.MarcaVehiculo;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.TipoVehiculo
{
    public class TipoVehiculoConsultaDto
    {
        [Required(ErrorMessage = "El Id del tipo de vehículo es obligatorio.")]
        public int IdTipoVehiculo { get; set; }

        [Required(ErrorMessage = "El nombre del tipo de vehículo es obligatorio.")]
        [StringLength(50, ErrorMessage = "El nombre del tipo de vehículo no puede exceder los 50 caracteres.")]
        public string? TipoVehiculo { get; set; }

        public bool? Activo { get; set; }
        [JsonIgnore]
        public ICollection<MarcaVehiculoConsultaDto> MarcaVehiculos { get; set; }
    }
}
