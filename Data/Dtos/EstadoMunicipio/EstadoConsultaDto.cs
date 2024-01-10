using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.EstadoMunicipio
{
    public class EstadoConsultaDto
    {
        [Required(ErrorMessage = "El ID del estado es un campo requerido.")]
        public int IdEstado { get; set; }

        [Required(ErrorMessage = "El nombre del estado es un campo requerido.")]
        public string NombreEstado { get; set; }

        public int IdZona { get; set; }

        public bool Activo { get; set; } = true!;

    }
}
