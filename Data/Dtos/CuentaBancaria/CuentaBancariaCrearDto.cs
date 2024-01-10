using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.CuentaBancaria
{
    public class CuentaBancariaCrearDto
    {
        public long IdEmpleado { get; set; }

        [Required(ErrorMessage = "El ID del banco es un campo requerido.")]
        public int IdBanco { get; set; }

        [RegularExpression(@"^\d{18}$", ErrorMessage = "El número de cuenta bancaria debe tener 18 dígitos.")]
        public string CuentaBancaria { get; set; } = string.Empty;
        public bool? CuentaPrincipal { get; set; }
    }
}
