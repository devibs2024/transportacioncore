using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.CuentaBancaria
{
    public class CuentaBancariaUpdateDto
    {
        public long? IdEmpleado { get; set; }

        [Required(ErrorMessage = "El ID del banco es un campo requerido.")]
        public int IdBanco { get; set; }

        [Required(ErrorMessage = "El ID de la cuenta bancaria es un campo requerido.")]
        public long IdCuenta { get; set; }

        
        [RegularExpression(@"^\d{18}$", ErrorMessage = "El número de cuenta bancaria debe tener 18 dígitos.")]
        public string CuentaBancaria { get; set; }  =  string.Empty;
        [RegularExpression(@"^\d{18}$", ErrorMessage = "El número de cuenta bancaria debe tener 18 dígitos.")]
        public string CuentaBancariaAnterior { get; set; } = string.Empty;

        public bool? Activa { get; set; }

        public bool? CuentaPrincipal { get; set; }
    }
}
