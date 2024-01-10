using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Dtos.Bancos;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.CuentaBancaria
{
    public class CuentaBancariaConsultaDto
    {
        public long? IdEmpleado { get; set; }

        [Required(ErrorMessage = "El ID del banco es un campo requerido.")]
        public int IdBanco { get; set; }
        public string BancoDesc { get { return this.Bancos.NombreBanco; } }
        [Required(ErrorMessage = "El ID de la cuenta es un campo requerido.")]
        public long IdCuenta { get; set; }
        [MaxLength(19), MinLength(19)]       
        [RegularExpression(@"^\d{18}$", ErrorMessage = "El número de cuenta bancaria debe tener entre 18 dígitos.")]
        public string? CuentaBancaria { get; set; }
        [Required]
        public bool? CuentaPrincipal { get; set; }

        public bool? Activa { get; set; }
              
        public string Estatus
        {
            get
            {
                String estatus = "No definido";
                if (this.Activa == null)
                {
                    return estatus;
                }
                else if (this.Activa == true)
                {
                    estatus = "Activa";
                }
                else
                {
                    estatus = "Inactiva";
                }

                return estatus;

            }
        }
        [JsonIgnore]
        [Required(ErrorMessage = "La información del banco es un campo requerido.")]
        public BancosConsultaDto Bancos { get; set; }
    }
}
