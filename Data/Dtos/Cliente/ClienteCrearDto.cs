
using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Cliente
{
    public class ClienteCrearDto
    {
        [Required(ErrorMessage = "La clave es un campo requerido.")]
        public long Clave { get; set; }

        [Required(ErrorMessage = "El nombre del cliente es un campo requerido.")]
        public string NombreCliente { get; set; }

        public int? IdEstado { get; set; }

        public int? IdMunicipio { get; set; }

       
        public int? IdZona { get; set; }

        //public int? IdFormato { get; set; }

        [Range(0, Double.MaxValue, ErrorMessage = "La tarifa debe ser un número positivo.")]
        public decimal? Tarifa { get; set; }

        [Range(0, Double.MaxValue, ErrorMessage = "La tarifa por hora adicional debe ser un número positivo.")]
        public decimal? TarifaHoraAdicional { get; set; }

        [Range(0, Double.MaxValue, ErrorMessage = "La tarifa con ayudante debe ser un número positivo.")]
        public decimal? TarifaConAyudante { get; set; }

        [Range(0, Double.MaxValue, ErrorMessage = "La tarifa spot debe ser un número positivo.")]
        public decimal? TarifaSpot { get; set; }

    }
}
