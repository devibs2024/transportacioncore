using TransportationCore.Enumeradores;

namespace TransportationCore.Data.Dtos.Planificacion
{
    public class PlanificacionCrearDto
    {        
        public DateTime FechaDesde { get; set; }
        public DateTime FechaHasta { get; set; }
        public string Comentario { get; set; } = string.Empty;
        public long IdCoordinador { get; set; }

        public int FrecuenciaId { get; set; }

    }
}
