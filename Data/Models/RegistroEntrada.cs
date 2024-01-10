using TransportationCore.Data.Interfaces;
using TransportationCore.Enumeradores;

namespace TransportationCore.Data.Models
{
    public class RegistroEntrada : ISoftDeletable
    {
        public decimal IdRegistroEntrada { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan HoraEntrada { get; set; }
        public TimeSpan HoraSalida { get; set; }
        public decimal CantidadHoras { get; set; }
        public EnumTipoRegistro TipoRegistro { get; set; }
        public long IdHorario {get;set;}
        public long IdEmpleado { get;set;}

        public bool IsDeleted { get; set; }  = false;
    }
}
