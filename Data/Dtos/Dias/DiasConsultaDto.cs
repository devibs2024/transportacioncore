using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Dias
{
    public class DiasConsultaDto
    {
        [Required(ErrorMessage = "El ID del día es un campo requerido.")]
        public int IdDia { get; set; }

        [StringLength(50, ErrorMessage = "La descripción no puede tener más de 50 caracteres.")]
        public string? Descripcion { get; set; }

        [StringLength(5, ErrorMessage = "Las siglas no pueden tener más de 5 caracteres.")]
        public string? Siglas { get; set; }
    }
}
