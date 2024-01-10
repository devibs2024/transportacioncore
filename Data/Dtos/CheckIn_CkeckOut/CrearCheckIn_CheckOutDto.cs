using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.CheckIn_CkeckOut
{
    public class CrearCheckIn_CheckOutDto
    {
        [Required(ErrorMessage = "El IdEmpleado es obligatorio.")]
        public long IdEmpleado { get; set; }

       public int? IdSucursal { get; set; }

        public int? IdSucursalActual { get; set; }

       // public DateTime Fecha { get; set; }
        public List<string> Image { get; set; }


    }
}
