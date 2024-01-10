using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Vehiculo
{
    public class VehiculoActualizarDto
    {
        [Required(ErrorMessage = "El campo IdVehiculo es obligatorio.")]
        public long IdVehiculo { get; set; }

        [Required(ErrorMessage = "El campo NombreVehiculo es obligatorio.")]
        public string NombreVehiculo { get; set; } = null!;

        [Required(ErrorMessage = "El campo IdTipoVehiculo es obligatorio.")]
        public int? IdTipoVehiculo { get; set; }

        [Required(ErrorMessage = "El campo IdMarcaVehiculo es obligatorio.")]
        public int? IdMarcaVehiculo { get; set; }

        [Required(ErrorMessage = "El campo IdModeloVehiculo es obligatorio.")]
        public int? IdModeloVehiculo { get; set; }

        public int? EmisionVehiculo { get; set; }

        [Required(ErrorMessage = "El campo VehiculoEmpresa es obligatorio.")]
        public bool? VehiculoEmpresa { get; set; }
        public decimal Tarifa { get; set; }
    }
}
