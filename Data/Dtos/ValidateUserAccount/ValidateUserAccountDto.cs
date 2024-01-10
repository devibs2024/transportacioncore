namespace TransportationCore.Data.Dtos.ValidateUserAccount
{
    public class ValidateUserAccountDto
    {
        /* Este Dto se usa en el momento en que se generan codigos de:
         Registrar usuario y Recuperación de clave.*/
        public long? IdEmpleado { get; set; }
        public string CorreoEmpleado { get; set; }
        public string CodigoVerficacion { get; set; }
        public DateTime fechaExpiracion { get; set; }
        public string TipoCodigo { get; set; }
    }
}
