using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using System.Xml.Linq;

namespace TransportationCore.Data.Dtos.ValidateUserAccount
{
    public class RecuperarClaveDto
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

    public class RegistroUserAccountDto
    {

        [Required]
        //[EmailAddress]
        [Display(Name = "Correo electrónico")]
        public string Email { get; set; }

    }

}
