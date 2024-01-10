using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.EstadoCliente
{
    public class EstadoClienteDto
    {
        [Required(ErrorMessage = "El ID del estado es un campo requerido.")]
        public int IdEstado { get; set; }

        [Required(ErrorMessage = "El ID del cliente es un campo requerido.")]
        public long IdCliente { get; set; }
    }
}
