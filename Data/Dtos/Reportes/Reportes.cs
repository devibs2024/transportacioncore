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

        public long IdTienda { get; set; }
        public string Tienda { get; set; }

        public long IdOperador { get; set; }
        public string Operador { get; set; }

    }


}
