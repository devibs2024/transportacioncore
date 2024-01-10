using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class Horarios : ISoftDeletable
    {
        public Horarios()
        {
            HorarioEmpleados = new HashSet<HorarioEmpleado>();
        }

        public long IdHorario { get; set; }
        public int IdDia { get; set; }
        public TimeSpan? HoraInicio { get; set; }
        public TimeSpan? HoraFin { get; set; }
        public bool? Activo { get; set; }

        public virtual CatalogoDias Dias { get; set; } = null!;

        public virtual ICollection<HorarioEmpleado> HorarioEmpleados { get; set; }

        public bool IsDeleted { get; set; }  = false; 
    }
}
