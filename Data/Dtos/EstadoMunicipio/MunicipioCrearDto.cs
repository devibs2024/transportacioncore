using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.EstadoMunicipio
{
    public class MunicipioCrearDto
    {

        [Required(ErrorMessage = "El nombre del municipio es un campo requerido.")]
        public string NombreMunicipio { get; set; }

        [Required(ErrorMessage = "El id del estado es un campo requerido.")]
        public int IdEstado { get; set; }
    }
}
