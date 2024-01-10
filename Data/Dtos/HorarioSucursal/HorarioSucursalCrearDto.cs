using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.HorarioSucursal
{
    public class HorarioSucursalCrearDto
    {
        [Required(ErrorMessage = "El campo IdHorario es requerido")]
        public long IdHorario { get; set; }

        [Required(ErrorMessage = "El campo IdSucursal es requerido")]
        public int IdSucursal { get; set; }
    }
}
