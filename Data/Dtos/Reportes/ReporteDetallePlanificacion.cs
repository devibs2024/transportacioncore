namespace TransportationCore.Data.Dtos.Reportes
{
    public class ReporteDetallePlanificacion
    {
        public decimal IdPlanificacion { get; set; } 
        public long IdCoordinador { get; set; }
        public string NombreCoordinador { get; set; } = string.Empty;
        public DateTime Fecha { get; set; }
        public List<ListaTiendas> Tiendas { get; set; } = new List<ListaTiendas>();

    }

    public class ListaTiendas
    {
        public int IdTienda { get; set; }
        public string NombreTienda { get; set; } = string.Empty;
        public int Total { get; set; }
        public List<DetalleOperadores> Operadores { get; set; } = new List<DetalleOperadores>();
    }

    public class DetalleOperadores
    {
        public long IdOperador { get; set; }
        public decimal IdDetallePlanificacion { get; set; }
        public string NombreOperador { get; set; } = string.Empty;
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
    }
}
