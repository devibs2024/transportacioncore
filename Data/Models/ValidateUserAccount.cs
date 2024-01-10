using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class ValidateUserAccount : ISoftDeletable
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int IdValidarCuenta { get; set; }
        public long? IdEmpleado { get; set; } //
        public string CorreoEmpleado { get; set; }
        public string CodigoVerficacion { get; set; }
        public DateTime fechaExpiracion { get; set; }
        public string TipoCodigo { get; set; }

        public bool IsDeleted { get; set; }  = false; 
    }
}
