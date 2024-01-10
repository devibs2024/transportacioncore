namespace TransportationCore.Data.Dtos.Planificacion
{
    public class PlanificacionUpdateDto
    {
        public decimal IdPlanificacion { get; set; }
        public DateTime FechaDesde { get; set; }
        public DateTime FechaHasta { get; set; }
        public string Comentario { get; set; } = string.Empty;
        public long IdCoordinador { get; set; }

        public int FrecuenciaId { get; set; }
        public int EstatusPlanificacionId { get; set; }
    }
}
