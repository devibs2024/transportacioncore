using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class CatalogoBancos : ISoftDeletable
    {
        public CatalogoBancos()
        {
            EmpleadoCuentasBancarias = new HashSet<EmpleadoCuentaBancaria>();
        }

        public int IdBanco { get; set; }
        public string? NombreBanco { get; set; }
        public bool? Activo { get; set; }

        public virtual ICollection<EmpleadoCuentaBancaria> EmpleadoCuentasBancarias { get; set; }

        public bool IsDeleted { get; set; }      
    }
}
