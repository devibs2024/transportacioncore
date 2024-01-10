using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Sucursal
{
    public class SucursalUpdateDto
    {
        [Required(ErrorMessage = "El Id de sucursal es requerido.")]
        public int IdSucursal { get; set; }

        [StringLength(50, ErrorMessage = "El nombre de la sucursal debe tener como máximo {1} caracteres.")]
        public string? NombreSucursal { get; set; }

        [Required(ErrorMessage = "El Id de zona es requerido.")]
        public int IdZona { get; set; }

        [Required(ErrorMessage = "El número de unidades es requerido.")]
        [Range(1, 99999, ErrorMessage = "El número de unidades debe ser un valor entre {1} y {2}.")]
        public decimal NumUnidades { get; set; }

        [Required(ErrorMessage = "El número de unidades máximas es requerido.")]
        [Range(1, 99999, ErrorMessage = "El número de unidades máximas debe ser un valor entre {1} y {2}.")]
        public decimal UnidadesMaximas { get; set; }

        [Required(ErrorMessage = "La tarifa es requerida.")]
        [Range(0, 99999, ErrorMessage = "La tarifa debe ser un valor entre {1} y {2}.")]
        public decimal Tarifa { get; set; }

        [Required(ErrorMessage = "La tarifa de descanso es requerida.")]
        [Range(0, 99999, ErrorMessage = "La tarifa de descanso debe ser un valor entre {1} y {2}.")]
        public decimal TarifaDescanso { get; set; }

        public bool? Activa { get; set; }
    }
}
