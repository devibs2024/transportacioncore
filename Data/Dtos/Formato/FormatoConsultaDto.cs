using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Formato
{
    public class FormatoConsultaDto
    {
        [Required(ErrorMessage = "El ID del formato es requerido.")]
        public int IdFormato { get; set; }

        [Required(ErrorMessage = "La descripción del formato es requerida.")]
        public string DescripcionFormato { get; set; }

        [Required(ErrorMessage = "El estado del formato es requerido.")]
        public bool Estado { get; set; }
    }
}
