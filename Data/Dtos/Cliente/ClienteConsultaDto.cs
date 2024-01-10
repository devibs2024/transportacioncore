using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Cliente
{
    public class ClienteConsultaDto
    {
        [Required(ErrorMessage = "El IdCliente es obligatorio.")]
        public long IdCliente { get; set; }

        [Required(ErrorMessage = "La clave es obligatoria.")]
        public long Clave { get; set; }

        [Required(ErrorMessage = "El nombre del cliente es obligatorio.")]
        [StringLength(100, ErrorMessage = "El nombre del cliente no puede tener más de 100 caracteres.")]
        public string NombreCliente { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "El IdEstado debe ser mayor que cero.")]
        public int? IdEstado { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "El IdMunicipio debe ser mayor que cero.")]
        public int? IdMunicipio { get; set; }

        
        public int? IdZona { get; set; }

        //[Range(1, int.MaxValue, ErrorMessage = "El IdFormato debe ser mayor que cero.")]
        //public int? IdFormato { get; set; }

        [Range(0, 1000000, ErrorMessage = "La tarifa debe estar entre 0 y 1000000.")]
        public decimal? Tarifa { get; set; }

        [Range(0, 1000000, ErrorMessage = "La tarifa de hora adicional debe estar entre 0 y 1000000.")]
        public decimal? TarifaHoraAdicional { get; set; }

        [Range(0, 1000000, ErrorMessage = "La tarifa con ayudante debe estar entre 0 y 1000000.")]
        public decimal? TarifaConAyudante { get; set; }

        [Range(0, 1000000, ErrorMessage = "La tarifa spot debe estar entre 0 y 1000000.")]
        public decimal? TarifaSpot { get; set; }
    }
}
