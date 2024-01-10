using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.ValidateUserAccount
{
    public class CodigoValidateUserAccountDto
    {
        //Dto para validar Códigos
        [Required]
        public string CorreoEmpleado { get; set; }
        [Required]
        public string CodigoVerficacion { get; set; }
    }
}
