using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Productividad
{
    public class ProductividadConsultaHeaderDto
    {
        public decimal IdPlanificacion { get; set; }
        public long IdCoordinador { get; set; }
        public string Coordinador { get; set; }

        public DateTime FechaDesde { get; set; }
        public DateTime FechaHasta { get; set; }
       
        public int FrecuenciaId { get; set; }
        public string Frecuencia { get; set; }
        public int EstatusPlanificacionId { get; set; }
        public string Estatus { get; set; }
       
    }
}
