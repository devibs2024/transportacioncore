using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.Reportes
{

    public class ReporteGasolinaDto
    {

        [Key]
        public long Row { get; set; }

        public long IdCoordinador { get; set; }
        public string Coordinador { get; set; }

        public long IdTienda { get; set; }
        public string Tienda { get; set; }

        public long IdOperador { get; set; }
        public string Operador { get; set; }

        public long IdTarjeta { get; set; }
        public string Tarjeta { get; set; }

        public decimal Importe { get; set; }
        public DateTime FechaDispersion { get; set; }


    }

    public class ReporteVehiculosExtraDto
    {

        [Key]
        public long Row { get; set; }

        public long IdCoordinador { get; set; }
        public string Coordinador { get; set; }

        public long IdCliente { get; set; }
        public string Cliente { get; set; }

        public long IdTienda { get; set; }
        public string Tienda { get; set; }

        public long IdTipoVehiculo { get; set; }
        public string TipoVehiculo { get; set; }

        public int UnidadesSpot { get; set; }
        public int TotalUnidadesSolicitadas { get; set; }
        public int TotalUnidadesSpot { get; set; }
        public int TotalUnidades { get; set; }
        public int TotalUnidadesGeneral { get; set; }

        public string JsonUnidades { get; set; }
        public List<ReporteDias> ListDias { get; set; }

    }

    public class ReporteComparativoPagosDto
    {

        [Key]
        public long Row { get; set; }

        public long IdCoordinador { get; set; }
        public string Coordinador { get; set; }

        public long IdCliente { get; set; }
        public string Cliente { get; set; }

        public long IdOperador { get; set; }
        public string Operador { get; set; }

        public long IdTienda { get; set; }
        public string Tienda { get; set; }

        public long IdZonaSted { get; set; }
        public string ZonaSted { get; set; }
        public long IdEstado { get; set; }
        public string Estado { get; set; }

        public long IdTipoVehiculo { get; set; }
        public string TipoVehiculo { get; set; }
        public decimal TarifaVehiculo { get; set; }

        public int NoUnidades { get; set; }
        public int Dias { get; set; }

        public decimal TarifaCliente { get; set; }
        public decimal TarifaAyudante { get; set; }
        public decimal TarifaHoraExtra { get; set; }
        
        public int UnidadesSpot { get; set; }
        public decimal TarifaSpot { get; set; }

        public decimal TotalCliente { get; set; }
        
        public decimal Salario { get; set; }
        public decimal Gasolina { get; set; }
        public decimal DescuentoSted { get; set; }
        public decimal Total { get; set; }
        public decimal TotalGeneral { get; set; }
    }

    public class ReporteDias
    {
        [Key]
        public long Row { get; set; }

        public int Anio { get; set; }
        public int Mes { get; set; }
        public int Dia { get; set; }

        public int Spot { get; set; }
        public int Sol { get; set; }
        public int Tot { get; set; }

    }

}
