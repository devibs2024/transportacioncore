using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TransportationCore.Data.Dtos.PlanificacionEjecucion
{
    public class EjecucionPlanificacionCrearDto
    {
        public decimal IdPlanificacion { get; set; }
        public decimal IdDetallePlanificacion { get; set; }
        public long IdOperador { get; set; }
        public int IdTienda { get; set; }
        public DateTime Fecha { get; set; }
        [Range(0, 23, ErrorMessage = "El valor del campo HoraE debe estar entre 0 y 23.")]
        public int HoraE { get; set; }

        [Range(0, 59, ErrorMessage = "El valor del campo MinutoE debe estar entre 0 y 59.")]
        public int MinutoE { get; set; }

        [Range(0, 23, ErrorMessage = "El valor del campo HoraF debe estar entre 0 y 23.")]
        public int HoraF { get; set; }

        [Range(0, 59, ErrorMessage = "El valor del campo MinutoF debe estar entre 0 y 59.")]
        public int MinutoF { get; set; }
        public bool Descanso { get; set; }
        public decimal IncentivoFactura { get; set; }
        public decimal DescuentoTardanza { get; set; }
        public decimal MontoHorasExtras { get; set; }
        public int TipoRegistro { get; set; }
        public string Justificacion { get; set; }
        public decimal MontoCombustible { get; set; }
        public long IdVehiculo { get; set; }
        public int IdTipoVehiculo { get; set; }
        public long IdTarjeta { get; set; }
    }
}
