using System.ComponentModel.DataAnnotations.Schema;
using System.Security.Permissions;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class DetallePlanificacion : ISoftDeletable
    {
        public decimal IdPlanificacion { get; set; }
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public decimal IdDetallePlanificacion { get; set; }
        public long IdOperador { get; set; }
        public int IdTienda { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public bool Descanso { get; set; }
               
        public Planificacion Planificacion { get; set; }
        public Empleado Operador { get; set; }
        [ForeignKey("IdTienda")]
        public Tienda Tienda { get; set; }

        public bool IsDeleted { get; set; }      
    }
}
