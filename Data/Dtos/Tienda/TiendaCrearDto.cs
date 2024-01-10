﻿namespace TransportationCore.Data.Dtos.Tienda
{
    public class TiendaCrearDto
    {       
        public string NombreTienda { get; set; } = string.Empty;
        public long IdSubGerente { get; set; }
        public int IdEstado { get; set; }
        public int IdZonaSted { get; set; }
        public decimal NumUnidades { get; set; } = 0;
        public decimal UnidadesMaximas { get; set; } = 0;
        public decimal Tarifa { get; set; }
        public decimal TarifaDescanso { get; set; }
        public bool? Activa { get; set; }
        public int? CntEmpleadosInterno { get; set; }
        public int? CntEmpleadosExterno { get; set; }
        public int? CntEmpleadosSpot { get; set; }
    }
}
