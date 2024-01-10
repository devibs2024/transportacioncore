using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TransportationCore.Data.Dtos.ContactoCliente
{
    public class ContactoClienteCrearDto
    {
       
        [Required(ErrorMessage = "El IdCliente es obligatorio.")]
        public long IdCliente { get; set; }

        [Required(ErrorMessage = "El nombre del contacto es obligatorio.")]
        [StringLength(100, ErrorMessage = "El nombre del contacto no puede tener más de 100 caracteres.")]
        public string Nombre { get; set; }

        public string email { get; set; }

        [Required(ErrorMessage = "El campo Telefono es obligatorio.")]
        [Phone(ErrorMessage = "El número de teléfono es inválido.")]
        public string telefono { get; set; }

        public string? telefono2 { get; set; }
     
        public bool Activo { get; set; }
        public int TipoContacto { get; set; }
    }
}
