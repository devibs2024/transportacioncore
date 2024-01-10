using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.OperadorVehiculo
{
    public class OperadorVehiculoUpdateDto
    {
        [Required(ErrorMessage = "El Id del vehículo es requerido.")]
        public long IdVehiculo { get; set; }

        [Required(ErrorMessage = "El nombre del vehículo es requerido.")]
        public string NombreVehiculo { get; set; }

        public int? IdTipoVehiculo { get; set; }

        public int? IdMarcaVehiculo { get; set; }

        public int? IdModeloVehiculo { get; set; }

        [Range(1950, 2100, ErrorMessage = "El año de emisión debe estar entre 1950 y 2100.")]
        public int? EmisionVehiculo { get; set; }

        public bool? VehiculoEmpresa { get; set; }

        [Required(ErrorMessage = "El Id del empleado es requerido.")]
        public long IdEmpleado { get; set; }

        [Required(ErrorMessage = "La tarifa es requerida.")]
        [Range(0, double.MaxValue, ErrorMessage = "La tarifa debe ser un número positivo.")]
        public decimal Tarifa { get; set; }

        [Required(ErrorMessage = "La propiedad VehiculoPropio es requerida.")]
        public bool VehiculoPropio { get; set; }
    }
}
