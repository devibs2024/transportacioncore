namespace TransportationCore.Data.Dtos.Nomina
{
    public class PivotResult
    {
        public long IdPlanificacion { get; set; }

        public DateTime FechaIni { get; set; }
        public DateTime FechaEnd { get; set; }

        public Int32 IdCoordinador { get; set; }
        public string Coordinador { get; set; } = string.Empty;

        public Int32 IdOperador { get; set; }
        public string Operador { get; set; } = string.Empty;
        public decimal Salario { get; set; }
        public string Banco { get; set; } = string.Empty;
        
        public Int32 IdTienda { get; set; }
        public string Tienda { get; set; } = string.Empty;
        public string ZonaSted { get; set; } = string.Empty;
        
        public DateTime Fecha { get; set; }
        public Int32 Dia { get; set; }

        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public Int32 Horas { get; set; }
        
        public decimal SubTotal { get; set; }
        public decimal Gasolina { get; set; }
        public decimal HorasExtra { get; set; }
        public decimal MinutosRetardo { get; set; }
        public decimal DescuentoRetardo { get; set; }
        public decimal PagoSMG { get; set; }
        public decimal DescuentoSted { get; set; }
        public decimal TotalPagar { get; set; }
        
        public string Accion { get; set; }
    }

    public class CollectionDays
    {
        public long IdPlanificacion { get; set; }
        public Int32 IdCoordinador { get; set; }
        public Int32 IdOperador { get; set; }        
        public Int32 IdTienda { get; set; }
        public Int32 NroDia { get; set; }
        public string Accion { get; set; }
    }
}
