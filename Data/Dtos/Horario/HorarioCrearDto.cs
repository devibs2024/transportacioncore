using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Horario
{
    public class HorarioCrearDto
    {
        [Required(ErrorMessage = "El campo IdDia es requerido")]
        public int IdDia { get; set; }

        [Required(ErrorMessage = "El campo HoraE es requerido")]
        [Range(0, 23, ErrorMessage = "La hora debe estar entre 0 y 23")]
        public int HoraE { get; set; }

        [Required(ErrorMessage = "El campo MinutoE es requerido")]
        [Range(0, 59, ErrorMessage = "El minuto debe estar entre 0 y 59")]
        public int MinutoE { get; set; }

        [Required(ErrorMessage = "El campo HoraF es requerido")]
        [Range(0, 23, ErrorMessage = "La hora debe estar entre 0 y 23")]
        public int HoraF { get; set; }

        [Required(ErrorMessage = "El campo MinutoF es requerido")]
        [Range(0, 59, ErrorMessage = "El minuto debe estar entre 0 y 59")]
        public int MinutoF { get; set; }
    }
}
