using System.ComponentModel.DataAnnotations.Schema;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class Tienda : ISoftDeletable
    {
        public int IdTienda { get; set; }
        public string NombreTienda { get; set; } = string.Empty;
        public long IdSubGerente { get; set; }       
        public int IdEstado { get; set; }
        public int IdZonaSted { get; set; }
        public decimal NumUnidades { get; set; } = 0;
        public decimal UnidadesMaximas { get; set; } = 0;
        public decimal Tarifa { get; set; }
        public decimal TarifaDescanso { get; set; }
        public bool? Activa { get; set; }       
        public int? CntEmpleadosInterno { get; set; }
        public int? CntEmpleadosExterno { get; set; }
        public int? CntEmpleadosSpot { get; set; }


        public CatalogoEstado Estado { get; set; }
        [ForeignKey("IdZonaSted")]
        public ZonaSted ZonaSted { get; set; }

        public virtual ICollection<EjecucionPlanificacion> EjecucionPlanificacion { get; set; }
        public virtual ICollection<DetallePlanificacion> DetallePlanificacion { get; set; }
        public virtual ICollection<TiendaCoordinador> TiendaCoordinadores { get; set; }


        public bool IsDeleted { get; set; }     
    }
}
