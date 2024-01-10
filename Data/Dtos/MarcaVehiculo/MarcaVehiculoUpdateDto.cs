using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.MarcaVehiculo
{
    public class MarcaVehiculoUpdateDto
    {
        [Required(ErrorMessage = "El campo IdTipo es obligatorio.")]
        public int? IdTipo { get; set; }

        public int IdMarca { get; set; }

        [Required(ErrorMessage = "El campo Marca es obligatorio.")]
        public string Marca { get; set; }
        public bool? Activo { get; set; } = true;
    }
}
