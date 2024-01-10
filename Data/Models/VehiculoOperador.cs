using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class VehiculoOperador : ISoftDeletable
    {
        public long IdVehiculo { get; set; }
        public long IdEmpleado { get; set; }
      
        public virtual Empleado Empleado { get; set; } = null!;
        public virtual Vehiculo Vehiculo { get; set; } = null!;

        public bool IsDeleted { get; set; }  = false;
    }
}
