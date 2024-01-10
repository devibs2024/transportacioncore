using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.TipoVehiculo
{
    public class TipoVehiculoCrearDto
    {

        [Required(ErrorMessage = "El nombre del tipo de vehículo es obligatorio.")]
        [StringLength(50, ErrorMessage = "El nombre del tipo de vehículo no puede exceder los 50 caracteres.")]
        public string? TipoVehiculo { get; set; }
    }
}
