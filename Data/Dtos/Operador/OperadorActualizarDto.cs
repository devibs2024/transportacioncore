using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Operador
{
    public class OperadorActualizarDto
    {
        [Required(ErrorMessage = "El campo IdEmpleado es obligatorio.")]
        public long IdEmpleado { get; set; }

        [Required(ErrorMessage = "El campo NumeroContrato es obligatorio.")]
        public decimal NumeroContrato { get; set; }

        [Required(ErrorMessage = "El campo Nombres es obligatorio.")]
        public string Nombres { get; set; } = null!;

        public string? ApellidoMaterno { get; set; }
        public string? ApellidoPaterno { get; set; }

        [Required(ErrorMessage = "El campo Direccion es obligatorio.")]
        public string Direccion { get; set; } = null!;

        [Required(ErrorMessage = "El campo IdMunicipio es obligatorio.")]
        public int IdMunicipio { get; set; }

        [Required(ErrorMessage = "El campo Telefono es obligatorio.")]
        [Phone(ErrorMessage = "El campo Telefono debe tener un formato válido.")]
        public string Telefono { get; set; } = null!;

        [Required(ErrorMessage = "El campo Correo es obligatorio.")]
        [EmailAddress(ErrorMessage = "El campo Correo debe tener un formato válido.")]
        public string Correo { get; set; } = null!;

        [Required(ErrorMessage = "El campo Salario es obligatorio.")]
        public decimal Salario { get; set; }

        [Required(ErrorMessage = "El campo Tipo Empleado es obligatorio.")]
        public int? IdSegmento { get; set; }

        public decimal? SMG { get; set; }
    }
}
