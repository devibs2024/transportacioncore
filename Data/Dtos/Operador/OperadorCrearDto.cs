using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Operador
{
    public class OperadorCrearDto
    {
        [Required(ErrorMessage = "El número de contrato es requerido.")]
        public decimal NumeroContrato { get; set; }

        [Required(ErrorMessage = "Los nombres son requeridos.")]
        public string Nombres { get; set; } = null!;

        public string? ApellidoMaterno { get; set; }
        public string? ApellidoPaterno { get; set; }

        [Required(ErrorMessage = "La dirección es requerida.")]
        public string Direccion { get; set; } = null!;

        [Required(ErrorMessage = "El municipio es requerido.")]
        public int IdMunicipio { get; set; }

        [Required(ErrorMessage = "El teléfono es requerido.")]
        [Phone(ErrorMessage = "El formato del teléfono es inválido.")]
        public string Telefono { get; set; } = null!;

        [Required(ErrorMessage = "El correo electrónico es requerido.")]
        [EmailAddress(ErrorMessage = "El formato del correo electrónico es inválido.")]
        public string Correo { get; set; } = null!;

        [Required(ErrorMessage = "El salario es requerido.")]
        public decimal Salario { get; set; }

        [Required(ErrorMessage = "El tipo de empleado es requerido.")]
        public int? IdSegmento { get; set; }

        public decimal? SMG { get; set; }
    }
}
