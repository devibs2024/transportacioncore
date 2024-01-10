using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class EmpleadoCuentaBancaria : ISoftDeletable
    {
        public long? IdEmpleado { get; set; }
        public int IdBanco { get; set; }
        public long IdCuenta { get; set; }
        public string CuentaBancaria { get; set; } = string.Empty;
        public bool? Activa { get; set; }
        public bool? CuentaPrincipal {  get; set; }

        public virtual CatalogoBancos Bancos { get; set; } = null!;
        public virtual Empleado? Empleados { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
