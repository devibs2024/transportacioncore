
using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.CheckIn_CkeckOut
{
    public class UpdateCheckIn_CheckOut
    {
        [Required(ErrorMessage = "El ID del check es un campo requerido.")]
        public long IdCheck { get; set; }


    
        public int? IdSucursal { get; set; }

        public int? IdSucursalActual { get; set; }

        public DateTime CheckOut { get; set; }

        [Required(ErrorMessage = "La hora de Check out es obligatoria")]

        public DateTime CheckIn { get; set; }

        public string status_Entrada { get; set; }

        public string CheckIn_Photo_Path { get; set; }

        public string? CheckOut_Photo_Path { get; set; }


    }
}
