using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.TipoVehiculo
{
    public class TipoVehiculoUpdateDto
    {

        [Required(ErrorMessage = "El Id del tipo de vehículo es obligatorio.")]
        public int IdTipoVehiculo { get; set; }

        [Required(ErrorMessage = "El nombre del tipo de vehículo es obligatorio.")]
        [StringLength(50, ErrorMessage = "El nombre del tipo de vehículo no puede exceder los 50 caracteres.")]
        public string? TipoVehiculo { get; set; }
        public bool? Activo { get; set; }
    }
}
