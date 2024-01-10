using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.CheckIn_CkeckOut
{
    public class ConsultaCheckIn_CkeckOutDto
    {
        public long IdEmpleado { get; set; }

  
        public long IdCheck { get; set; }

      

        [Required(ErrorMessage = "La hora de Check In es obligatoria")]
        public DateTime CheckIn { get; set; }


        public int? IdSucursal { get; set; }

        public int? IdSucursalActual { get; set; }

        public string? CheckOut_Photo_Path { get; set; }

        public string? CheckIn_Photo_Path { get; set; }

        public DateTime? CheckOut { get; set; }

        public DateTime Fecha { get; set; }

        public string status_Entrada {get; set;}
    }
}
