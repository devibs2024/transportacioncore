namespace TransportationCore.Data.Dtos.Tienda
{
    public class TiendaConsultaDto
    {
        public int IdTienda { get; set; }
        public string NombreTienda { get; set; }
        public decimal NumUnidades { get; set; }
        public decimal UnidadesMaximas { get; set; }
        public decimal Tarifa { get; set; }
        public decimal TarifaDescanso { get; set; }
        public string SubGerente { get; set; }
        public string EmailSubGerente { get; set; }
        public string TelefonoSubGerente { get; set; }
        public string Telefono2SubGerente { get; set; }
        public string Gerente { get; set; }
        public string EmailGerente { get; set; }
        public string TelefonoGerente { get; set; }
        public string Telefono2Gerente { get; set; }
        public string NombreZona { get; set; }
        public string ClaveDET { get; set; }
        public string NombreEstado { get; set; }
        public string NombreCliente { get; set; }
        public int? CntEmpleadosInterno { get; set; }
        public int? CntEmpleadosExterno { get; set; }
        public int? CntEmpleadosSpot { get; set; }
    }
}
