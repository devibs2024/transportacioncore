using System.ComponentModel.DataAnnotations;

namespace transportacion.Data.Dtos.TarifaTipoVehiculoUpdateDto
{
    public class TarifaTipoVehiculoUpdateDto
    {   
        public int IdTarifa { get; set; } 
        
        public decimal Tarifa { get; set; }
        public bool Activa { get; set; } = false;
        public bool Principal { get; set; } = false;
        public int IdTipoVehiculo { get; set; }
        
    }
}