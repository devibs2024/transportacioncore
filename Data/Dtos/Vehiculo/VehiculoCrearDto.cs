
using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Vehiculo
{
    public class VehiculoCrearDto
    {
        [Required(ErrorMessage = "El nombre del vehículo es requerido.")]
        public string NombreVehiculo { get; set; } = null!;

        [Required(ErrorMessage = "El id del tipo de vehículo es requerido.")]
        public int? IdTipoVehiculo { get; set; }

        [Required(ErrorMessage = "El id de la marca del vehículo es requerido.")]
        public int? IdMarcaVehiculo { get; set; }

        [Required(ErrorMessage = "El id del modelo del vehículo es requerido.")]
        public int? IdModeloVehiculo { get; set; }

        [Range(0, int.MaxValue, ErrorMessage = "La emisión del vehículo debe ser un número entero positivo.")]
        public int? EmisionVehiculo { get; set; }

        [Required(ErrorMessage = "Se debe especificar si el vehículo pertenece o no a la empresa.")]
        public bool? VehiculoEmpresa { get; set; }
        public decimal Tarifa { get; set; }
    }
}
