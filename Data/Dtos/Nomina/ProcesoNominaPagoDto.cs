using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Nomina
{

    public class ProcesoNominaPagoDto
    {
        [Required(ErrorMessage = "El campo IdProcesoNomina es obligatorio.")]
        [Key]
        public decimal IdProcesoNomina { get; set; }

        public bool Procesado { get; set; } = true;

    }

}
