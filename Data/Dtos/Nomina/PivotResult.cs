namespace TransportationCore.Data.Dtos.Nomina
{
    public class PivotResult
    {
        public DateTime FechaIni { get; set; }
        public DateTime FechaEnd { get; set; }
        public Decimal IdPlanificacion { get; set; }
        public long IdCoordinador { get; set; }
        public long IdOperador { get; set; }
        public long IdTienda { get; set; }
        public string NombreOperador { get; set; } = string.Empty;
        public decimal Salario { get; set; }
        public string Banco { get; set; } = string.Empty;
        public string NombreCoordinador { get; set; } = string.Empty;
        public string NombreTienda { get; set; } = string.Empty;
        public string ZonaSted { get; set; } = string.Empty;
        public DateTime Fecha { get; set; }
        public int Dia { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public int Horas { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Gasolina { get; set; }
        public decimal HorasExtra { get; set; }
        public int MinutosRetraso { get; set; }
        public decimal DescuentoRetraso { get; set; }
        public decimal PagoSMG { get; set; }
        public decimal DescuentoSted { get; set; }
        public decimal TotalPagar { get; set; }
        public string Accion { get; set; }
    }

    public class CollectionDays
    {
        public decimal IdPlanificacion { get; set; }
        public long IdOperador { get; set; }
        public long IdCoordinador { get; set; }
        public int NroDia { get; set; }
        public string Accion { get; set; }
    }
}
