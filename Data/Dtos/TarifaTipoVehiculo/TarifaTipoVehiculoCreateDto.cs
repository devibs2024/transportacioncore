using System.ComponentModel.DataAnnotations;

namespace transportacion.Data.Dtos.TarifaTipoVehiculoCreateDto
{
    public class TarifaTipoVehiculoCreateDto
    {   
        [Required(ErrorMessage = "El campo tarifa es obligatorio.")]
        public decimal Tarifa { get; set; }
        public bool Principal { get; set; } = true;

        [Required(ErrorMessage = "El campo IdTipoVehiculo es obligatorio.")]
        public int IdTipoVehiculo { get; set; }
        
    }
}