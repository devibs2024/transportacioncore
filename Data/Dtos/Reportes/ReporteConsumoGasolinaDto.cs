namespace TransportationCore.Data.Dtos.Reportes
{
    public class ReporteConsumoGasolinaDto
    {
        public long IdTienda { get; set; }
        public long IdCoordinador { get; set; }
        public DateTime FechaIni { get; set; }
        public DateTime FechaEnd { get; set; }
        public long IdOperador { get; set; }
        public string NombreTienda { get; set; } = string.Empty;        
        public string NombreOperador { get; set; } = string.Empty;                
        public string NumeroTarjeta { get; set; } = string.Empty;
        public Decimal Importe { get; set; }
        public DateTime FechaDispercion { get; set; }

        public List<ListaTiendas> Tiendas { get; set; } = new List<ListaTiendas>();

        public List<ListaCoordinadores> Coordinadores { get; set; } = new List<ListaCoordinadores>();
    }

    public class ListaCoordinadores
    {
        public long IdCoordinador { get; set; }

        public string NombreCoordinador { get; set; } = string.Empty;
    }
}
