using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace TransportationCore.Data.Dtos.UserAccount
{
    public class UserCredencialsRegistrarDto
    {
        [Required]
        //[EmailAddress]
        [Display(Name = "Correo electrónico")]
        public string Email { get; set; }

        [Required]
        //[EmailAddress]
        [Display(Name = "Confirmar Correo")]
        public string ConfirmarEmail { get; set; }
    }
}
