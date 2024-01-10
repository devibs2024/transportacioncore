using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class AsignacionTarjeta : ISoftDeletable
    {
        public AsignacionTarjeta()
        {
            DetalleTarjetas = new HashSet<DetalleTarjeta>();
        }

        public long IdTarjeta { get; set; }
        [Required]
        public long? IdEmpleado { get; set; }
        //[CreditCard]

        public string? NumTarjeta { get; set; }
        public string? NumeroInterno { get; set; }
        public bool? Activa { get; set; }
        public bool TarjetaPrincipal { get; set; }
        public decimal MontoDiario { get; set; }


        public virtual Empleado? Empleado { get; set; }
        public virtual ICollection<DetalleTarjeta> DetalleTarjetas { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
