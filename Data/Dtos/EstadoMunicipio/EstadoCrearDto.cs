using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.EstadoMunicipio
{
    public class EstadoCrearDto
    {
        [Required(ErrorMessage = "El nombre del estado es un campo requerido.")]
        public string NombreEstado { get; set; }
        public int IdZona { get; set; }
    }
}
