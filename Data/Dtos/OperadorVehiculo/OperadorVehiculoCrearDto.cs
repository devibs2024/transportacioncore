using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.OperadorVehiculo
{
    public class OperadorVehiculoCrearDto
    {
        [Required(ErrorMessage = "El nombre del vehículo es obligatorio")]
        public string NombreVehiculo { get; set; } = null!;

        [Range(1, int.MaxValue, ErrorMessage = "Se debe seleccionar un tipo de vehículo")]
        public int? IdTipoVehiculo { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Se debe seleccionar una marca de vehículo")]
        public int? IdMarcaVehiculo { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Se debe seleccionar un modelo de vehículo")]
        public int? IdModeloVehiculo { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Se debe especificar la emisión del vehículo")]
        public int? EmisionVehiculo { get; set; }

        [Required(ErrorMessage = "Se debe especificar si el vehículo es propiedad de la empresa")]
        public bool? VehiculoEmpresa { get; set; }

        [Required(ErrorMessage = "Se debe especificar el ID del empleado")]
        public long IdEmpleado { get; set; }

        //[Required(ErrorMessage = "Se debe especificar la tarifa del vehículo")]
        //public decimal Tarifa { get; set; }

        [Required(ErrorMessage = "Se debe especificar si el empleado tiene vehículo propio")]
        public bool VehiculoPropio { get; set; }
    }
}
