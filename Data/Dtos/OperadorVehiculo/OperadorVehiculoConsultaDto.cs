using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using TransportationCore.Data.Dtos.Operador;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.OperadorVehiculo
{
    public class OperadorVehiculoConsultaDto
    {
        [Required(ErrorMessage = "El campo IdEmpleado es obligatorio.")]
        public long IdEmpleado { get; set; }

        //[Required(ErrorMessage = "El campo Tarifa es obligatorio.")]
        //public decimal Tarifa { get; set; }

        [Required(ErrorMessage = "El campo VehiculoPropio es obligatorio.")]
        public bool VehiculoPropio { get; set; }
      
        [Required(ErrorMessage = "El campo Vehiculo es obligatorio.")]
        public OperadorVehiculoDetalleDto Vehiculo { get; set; } = null!;
        public OperadorConsultaMinDto Empleado { get; set; } = null!;
    }
}
