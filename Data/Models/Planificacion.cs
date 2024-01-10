using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using TransportationCore.Data.Interfaces;
using TransportationCore.Enumeradores;

namespace TransportationCore.Data.Models
{
    public class Planificacion : ISoftDeletable
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public decimal IdPlanificacion { get; set; }
        public DateTime FechaDesde { get; set; }
        public DateTime FechaHasta { get; set; }
        public string Comentario { get; set; } = string.Empty;
        public long IdCoordinador { get; set; }

        public int FrecuenciaId { get; set; }
        public int EstatusPlanificacionId { get; set; }

        public ICollection<DetallePlanificacion> DetallesPlanificacion { get; set; }
        public ICollection<EjecucionPlanificacion> EjecucionesPlanificacion { get; set; }
        public Empleado Coordinador { get; set; }

        public bool IsDeleted { get; set; }

        public Planificacion()
        {
            this.EstatusPlanificacionId = (int)EnumEstatusPlanificacion.Pendiente;
        }
    }
}
