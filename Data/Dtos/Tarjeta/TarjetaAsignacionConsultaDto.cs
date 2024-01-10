using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Dtos.Operador;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.Tarjeta
{
    public class TarjetaAsignacionConsultaDto
    {
        [Required(ErrorMessage = "El campo IdTarjeta es obligatorio.")]
        public long IdTarjeta { get; set; }

        public long? IdEmpleado { get; set; }

        public string NumTarjeta
        {
            get
            {
                string complemento = (_numTarjeta.Length >= 16 ? "********" : "*******");

                return _numTarjeta.Substring(0, 4) + complemento + _numTarjeta.Substring(_numTarjeta.Length - 4, 4);
            }
            set
            {
                _numTarjeta = value;
            }
        }
        private string _numTarjeta; // Variable de respaldo para NumTarjeta
        public string? NumeroInterno { get; set; }

        [Required(ErrorMessage = "El campo Activa es obligatorio.")]
        public bool? Activa { get; set; }
        public bool TarjetaPrincipal { get; set; }
        public decimal MontoDiario { get; set; }
    }

}
