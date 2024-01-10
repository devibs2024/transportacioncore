using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Tarjeta
{
    public class TarjetaAsignacionCreacionDto
    {
        [Required]
        public long? IdEmpleado { get; set; }
        [RegularExpression(@"^\d{16}$", ErrorMessage = "El número de cuenta bancaria debe tener 16 dígitos.")]
        public string? NumTarjeta { get; set; }
        public decimal MontoDiario { get; set; }

        [Required(ErrorMessage = "El campo NumeroInterno es obligatorio.")]
        public string? NumeroInterno { get; set; }
    }
}
