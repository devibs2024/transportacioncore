using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Zona
{
    public class ZonaConsultaDto
    {
        [Required(ErrorMessage = "El campo IdZona es requerido.")]
        public int IdZona { get; set; }

        [Required(ErrorMessage = "El campo ClaveDET es requerido.")]
        public string ClaveDET { get; set; }

        public string NombreZona { get; set; }


        [Required(ErrorMessage = "El campo Estado es requerido.")]
        public bool Activa { get; set; } = true;
    }
}
