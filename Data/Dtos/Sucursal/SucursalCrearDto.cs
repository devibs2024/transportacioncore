using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Sucursal
{
    public class SucursalCrearDto
    {
        [Required(ErrorMessage = "El campo NombreSucursal es requerido.")]
        [StringLength(50, ErrorMessage = "El campo NombreSucursal debe tener una longitud máxima de 50 caracteres.")]
        public string? NombreSucursal { get; set; }

        [Required(ErrorMessage = "El campo IdZona es requerido.")]
        public int IdZona { get; set; }

        [Required(ErrorMessage = "El campo NumUnidades es requerido.")]
        [Range(0, int.MaxValue, ErrorMessage = "El campo NumUnidades debe ser un número positivo.")]
        public decimal NumUnidades { get; set; }

        [Required(ErrorMessage = "El campo UnidadesMaximas es requerido.")]
        [Range(0, int.MaxValue, ErrorMessage = "El campo UnidadesMaximas debe ser un número positivo.")]
        public decimal UnidadesMaximas { get; set; }

        [Required(ErrorMessage = "El campo Tarifa es requerido.")]
        [Range(0, double.MaxValue, ErrorMessage = "El campo Tarifa debe ser un número positivo.")]
        public decimal Tarifa { get; set; }

        [Required(ErrorMessage = "El campo TarifaDescanso es requerido.")]
        [Range(0, double.MaxValue, ErrorMessage = "El campo TarifaDescanso debe ser un número positivo.")]
        public decimal TarifaDescanso { get; set; }
    }
}
