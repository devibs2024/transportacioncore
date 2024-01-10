namespace TransportationCore.Data.Dtos.Reportes
{
    public class ReporteVechiculosExtraUtilizadosDto
    {
        public DateTime DateIni { get; set; }

        public DateTime DateEnd { get; set; }

        public long IdCliente { get; set; }

        public string NombreCliente { get; set; } = string.Empty;

        public long IdTienda { get; set; }

        public string NombreTienda { get; set; } = string.Empty;

        public long IdTipoVehiculo { get; set; }

        public string NombreTipoVehiculo { get; set; } = string.Empty;

        public int UnidadesSpot { get; set; }

        public int Dia { get; set; }

        public int TotalUtilizadas { get; set; }

        public int TotalUnidadesSpot { get; set; }

        public int TotalUnidadesUtilizadas { get; set; }

        public int TotalGeneral { get; set; }

        public List<ListaTiendas> Tiendas { get; set; } = new List<ListaTiendas>();

        public List<ListaClientes> Clientes { get; set; } = new List<ListaClientes>();

        public List<ListaTipoVehiculos> TipoVehiculos { get; set; } = new List<ListaTipoVehiculos>();

        public string? Accion { get; set; }
    }

    public class ListaClientes
    {
        public long IdCliente { get; set; }
        public string NombreCliente { get; set; } = string.Empty;
    }

    public class ListaTipoVehiculos
    {
        public long IdTipoVehiculo { get; set; }

        public string TipoVehiculo { get; set; } = string.Empty;
    }
}
