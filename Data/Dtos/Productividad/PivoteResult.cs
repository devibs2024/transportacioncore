namespace TransportationCore.Data.Dtos.Productividad
{
    public class PivoteResult
    {
        public decimal IdPlanificacion { get; set; }
        public long IdOperador { get; set; }
        public string NombreOperador { get; set; }
        public string NombreTienda { get; set; }
        public int IdTienda { get; set; }
        public long IdCliente { get; set; }
        public string NombreCliente { get; set; }
        public int Spot { get; set; }
        public int IdEstado { get; set; }
        public string NombreEstado { get; set; }
        // Propiedades para los días del pivote
        public List<CollectionsDays> lstDias { get; set; }
    }

    public class PivoteNomina
    {
        public decimal? IdPlanificacion { get; set; }
        public long IdOperador { get; set; }
        public string? NombreOperador { get; set; }
        public int Spot { get; set; }
        public int IdBanco { get; set; }
        public string? NombreBanco { get; set; }
        public string? NumTarjeta { get; set; }
        public decimal? Salario { get; set; }
        public decimal DescuentoTardanza { get; set; }
        public decimal IncentivoFactura { get; set; }
        public decimal? MontoGasolina { get; set; }
        public decimal? SMG { get; set; }
        public string? CuentaBancaria { get; set; }
        public int Dias { get; set; }
        public decimal? SubTotal1 { get; set; }
        public decimal? SubTotal2 { get; set; }
        public decimal? Total { get; set; }
    }

    public class CollectionsDays
    {
        public decimal IdPlanificacion { get; set; }
        public long IdOperador { get; set; }
        public int NroDia { get; set; }
        public string Accion { get; set; }

    }
}
