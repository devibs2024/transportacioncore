using System.ComponentModel.DataAnnotations;

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
