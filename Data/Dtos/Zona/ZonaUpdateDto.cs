using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Zona
{
    public class ZonaUpdateDto
    {
        [Required(ErrorMessage = "El campo IdZona es obligatorio.")]
        public int IdZona { get; set; }

        [Required(ErrorMessage = "El campo ClaveDET es obligatorio.")]
        public string ClaveDET { get; set; }

        public string NombreZona { get; set; }

        public bool Activa { get; set; } = true!;

    }
}
