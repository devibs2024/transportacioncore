using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class DetalleTarjeta : ISoftDeletable
    {
        public int IdDetalleTarjeta { get; set; }
        public long? IdTarjeta { get; set; }
        public long? IdEmpleado { get; set; }
        public decimal? Importe { get; set; }
        public DateTime? FechaDispension { get; set; }
        public int? IdSucursal { get; set; }
        public long? IdCordinador { get; set; }

        public virtual Empleado? Cordinador { get; set; }
        public virtual Empleado? Empleado { get; set; }       
        public virtual AsignacionTarjeta? Tarjeta { get; set; }

        public bool IsDeleted { get; set; }      
    }
}
