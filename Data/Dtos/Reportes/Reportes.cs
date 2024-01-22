using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Reportes
{

    public class ReporteGasolinaDto
    {

        [Key]
        public long Row { get; set; }

        public long IdCoordinador { get; set; }
        
        public long IdTienda { get; set; }
        
        public long IdOperador { get; set; }
        
    }

   public class ReporteVehiculosExtraDto
    {

        [Key]
        public long Row { get; set; }

        public long IdCoordinador { get; set; }
        
        public long IdTienda { get; set; }
        
        public long IdOperador { get; set; }
        
    }
    

}
