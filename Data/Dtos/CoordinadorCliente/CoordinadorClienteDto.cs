using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.CoordinadorCliente
{
    public class CoordinadorClienteDto
    {
        [Required(ErrorMessage = "El ID del cliente es un campo requerido.")]
        public long IdCliente { get; set; }

        [Required(ErrorMessage = "El ID del coordinador es un campo requerido.")]
        public long IdCoordinador { get; set; }
    }
}
