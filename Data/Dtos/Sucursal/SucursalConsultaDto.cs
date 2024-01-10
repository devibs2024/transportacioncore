using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Sucursal
{
    public class SucursalConsultaDto
    {
        public int IdSucursal { get; set; }

        [StringLength(50, ErrorMessage = "El nombre de la sucursal no puede tener más de 50 caracteres")]
        public string? NombreSucursal { get; set; }

        [Required(ErrorMessage = "El id de la zona es requerido")]
        public int IdZona { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "El número de unidades debe ser mayor o igual a cero")]
        public decimal NumUnidades { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "Las unidades máximas deben ser mayor o igual a cero")]
        public decimal UnidadesMaximas { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "La tarifa debe ser mayor o igual a cero")]
        public decimal Tarifa { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "La tarifa de descanso debe ser mayor o igual a cero")]
        public decimal TarifaDescanso { get; set; }

        [Required(ErrorMessage = "El estado de la sucursal es requerido")]
        public bool? Activa { get; set; }

        public string Estatus
        {
            get
            {
                string estatus = "No definido";
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

            set { }
        }
    }
}
