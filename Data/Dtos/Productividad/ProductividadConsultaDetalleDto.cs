namespace TransportationCore.Data.Dtos.Productividad
{
    public class ProductividadConsultaDetalleDto
    {
        public decimal IdEjecucionPlanificacion { get; set; }
        public decimal IdDetallePlanificacion { get; set; }
        public decimal IdPlanificacion { get; set; }
        public long IdCliente { get; set; }
        public string NombreCliente { get; set; }
        public long IdOperador { get; set; }
        public string NombreOperador { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan HoraInicioPlanificacion { get; set; }
        public TimeSpan HoraFinPlanificacion { get; set; }
        public bool Descanso { get; set; }
        public int IdTienda { get; set; }
        public string NombreTienda { get; set; }
        public TimeSpan HoraInicioEjecucion { get; set; }
        public TimeSpan HoraFinEjecucion { get; set; }
        public decimal IncentivoFactura { get; set; }
        public decimal DescuentoTardanza { get; set; }
        public decimal MontoHorasExtras { get; set; }
        public int TardanzaEnMinutos { get; set; }
        public int HorasExtrasEnMinutos { get; set; }
        public string Justificacion { get; set; }
        public int Dia { get; set; }
        public int Spot { get; set; }
        public string NombreEstado { get; set; }
        public int IdEstado { get; set; }

        public decimal? Salario { get; set; }
        public decimal? MontoDiario { get; set; }
        public string? NumTarjeta { get; set; }
        public decimal? SMG { get; set; }
        public decimal? SubTotal { get; set; }
        public string? CuentaBancaria { get; set; }
        public int? IdBanco { get; set; }
        public string? NombreBanco { get; set; }
        public string? Accion { get;set; }

        public long? IdVehiculo { get; set; }
        public string? NombreVehiculo { get; set; } = string.Empty;
        public int? IdTipoVehiculo { get; set; }
        public long? IdTarjeta { get; set; }

    }

}
