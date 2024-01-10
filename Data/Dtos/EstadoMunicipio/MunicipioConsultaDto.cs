using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.EstadoMunicipio
{
    public class MunicipioConsultaDto
    {
        [Required(ErrorMessage = "El ID del municipio es un campo requerido.")]
        public int IdMunicipio { get; set; }

        [Required(ErrorMessage = "El nombre del municipio es un campo requerido.")]
        public string NombreMunicipio { get; set; }
        public bool Activo { get; set; } = true!;

        [Required(ErrorMessage = "El estado del municipio es un campo requerido.")]
        public EstadoConsultaDto Estado { get; set; }
        

    }
}
