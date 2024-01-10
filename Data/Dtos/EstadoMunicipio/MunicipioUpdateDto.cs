using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.EstadoMunicipio
{
    public class MunicipioUpdateDto
    {
        [Required(ErrorMessage = "El ID del municipio es un campo requerido.")]
        public int IdMunicipio { get; set; }

        [Required(ErrorMessage = "El nombre del municipio es un campo requerido.")]
        public string NombreMunicipio { get; set; }

        [Required(ErrorMessage = "El estado del municipio es un campo requerido.")]
        public int IdEstado { get; set; }

        [Required(ErrorMessage = "Activo del municipio es un campo requerido.")]
        public bool Activo { get; set; } = true!;

    }
}
