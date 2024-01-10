using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.MarcaVehiculo
{
    public class MarcaVehiculoCrearDto
    {
        [Required(ErrorMessage = "El campo IdTipo es obligatorio.")]
        public int? IdTipo { get; set; }

        [Required(ErrorMessage = "El campo Marca es obligatorio.")]
        public string Marca { get; set; }
    }
}
