using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Zona
{
    public class ZonaCrearDto
    {
        

        [Required(ErrorMessage = "El campo ClaveDET es requerido.")]
        public string ClaveDET { get; set; }

        public string NombreZona { get; set; }
    }
}
