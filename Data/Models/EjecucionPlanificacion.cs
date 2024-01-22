using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using TransportationCore.Data.Interfaces;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TransportationCore.Data.Models
{
    public class EjecucionPlanificacion : ISoftDeletable
    {
        public decimal IdPlanificacion { get; set; }
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public decimal IdEjecucionPlanificacion { get; set; }
        public decimal IdDetallePlanificacion { get; set; }
        public long IdOperador { get; set; }
        public int IdTienda { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public bool Descanso { get; set; }
        public decimal IncentivoFactura { get; set; }
        public decimal DescuentoTardanza { get; set; }
        public decimal MontoHorasExtras { get; set; }
        public int TipoRegistro { get; set; }
        [MaxLength(250)]
        public string Justificacion { get; set; }
              
        public Planificacion Planificacion { get; set; }  
        public Empleado Operador { get; set; }
        [ForeignKey("IdTienda")]
        public Tienda Tienda { get; set; }

        public decimal MontoCombustible { get; set; }
        public long IdVehiculo { get; set; }
        public int? IdTipoVehiculo { get; set; }
        public long IdTarjeta { get; set; }

        public long? IdProcesoNomina { get; set; }
        public long? IdComprobanteNomina { get; set; }

        public bool IsDeleted { get; set; }      
    }
}
