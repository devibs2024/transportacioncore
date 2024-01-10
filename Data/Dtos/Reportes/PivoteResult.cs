namespace TransportationCore.Data.Dtos.Reportes
{
    public class PivoteResult
    {
        public long IdTienda { get; set; }
        public string NombreTienda { get; set; } = string.Empty;
        public long IdCoordinador { get; set; }
        public string NombreCoordinador { get; set; } = string.Empty;
        public string NombreOperador { get; set; } = string.Empty;
        public string NumeroTarjeta { get; set; } = string.Empty;
        public Decimal Importe { get; set; }
        public DateTime FechaDispercion { get; set; }
    }

    public class PivotResultUnidades
    {
        public DateTime FechaIni { get; set; }
        public DateTime FechaEnd { get; set; }
        public long IdCliente { get; set; }
        public string NombreCliente { get; set; } = string.Empty;
        public long IdTienda { get; set; }
        public string NombreTienda { get; set; } = string.Empty;
        public long IdTipoVehiculo { get; set; }
        public string NombreTipoVehiculo { get; set; } = string.Empty;
        public int UnidadesSpot { get; set; }
        public int TotalUtilizadas { get; set; }
        public int TotalUnidadesSpot { get; set; }
        public int TotalUnidadesUtilizdas { get; set; }
        public int TotalGeneral { get; set; }
        public List<CollectionsDays> lstDias { get; set; } = new List<CollectionsDays>();
    }

    public class CollectionsDays
    {
        public decimal IdPlanificacion { get; set; }
        public long IdCliente { get; set; }
        public long IdTienda { get; set; }
        public long IdTipoVehiculo { get; set; }
        public long IdOperador { get; set; }
        public int NroDia { get; set; }
        public string Accion { get; set; }

    }
}
