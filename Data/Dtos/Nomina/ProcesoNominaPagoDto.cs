using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Nomina
{

    public class ProcesoNominaPagoDto
    {

        [Required(ErrorMessage = "El campo IdProcesoNomina es obligatorio.")]
        [Key]
        public decimal IdProcesoNomina { get; set; }

        [Required(ErrorMessage = "El campo IdPlanificacion es obligatorio.")]
        public decimal IdPlanificacion { get; set; }

        [Required(ErrorMessage = "El campo IdCoordinador es obligatorio.")]
        public Int32 IdCoordinador { get; set; }
        public Int32 IdOperador { get; set; }
        public Int32 IdTienda { get; set; }

        public DateTime FechaIni { get; set; }
        public DateTime FechaEnd { get; set; }

        public bool Procesado { get; set; } = false;

    }

}
