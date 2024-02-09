using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;
using TransportationCore.Enumeradores;

namespace TransportationCore.Data.Models
{
    public class Empleado : ISoftDeletable
    {
        public Empleado()
        {
            AsignacionTarjetas = new HashSet<AsignacionTarjeta>();
            DetalleTarjetaCordinador = new HashSet<DetalleTarjeta>();
            DetalleTarjetaEmpleado = new HashSet<DetalleTarjeta>();
            EmpleadoCuentasBancarias = new HashSet<EmpleadoCuentaBancaria>();
            VehiculosOperadores = new HashSet<VehiculoOperador>();
            HorarioEmpleados = new HashSet<HorarioEmpleado>();
            SMG = 0;
         }


        public long IdEmpleado { get; set; }
        public string NumeroContrato { get; set; }
        public string Nombres { get; set; } = null!;
        public string? ApellidoMaterno { get; set; }
        public string? ApellidoPaterno { get; set; }
        public string Direccion { get; set; } = null!;      
        public int IdMunicipio { get; set; }
        public string Telefono { get; set; } = null!;
        public string Correo { get; set; } = null!;
        public decimal? Salario { get; set; }
        public int? IdTipoEmpleado { get; set; }
        public int? IdSegmento { get; set; }
        public decimal? SMG { get; set; }


        public virtual ICollection<AsignacionTarjeta> AsignacionTarjetas { get; set; }
        public virtual ICollection<DetalleTarjeta> DetalleTarjetaCordinador { get; set; }
        public virtual ICollection<DetalleTarjeta> DetalleTarjetaEmpleado { get; set; }
        public virtual ICollection<EmpleadoCuentaBancaria> EmpleadoCuentasBancarias { get; set; }
        public virtual ICollection<VehiculoOperador> VehiculosOperadores { get; set; }

        public virtual ICollection <CheckIn_CkeckOut> CheckIn_CkeckOut { get; set; }

        //public virtual ICollection<Empleado> Coordinadores { get; set; }
        //public virtual ICollection<Empleado> Empleados { get; set; }
        public virtual ICollection<HorarioEmpleado> HorarioEmpleados{ get; set; }       
        public virtual ICollection<EmpleadoCoordinador> EmpleadoCoordinadores { get; set; }
        public virtual ICollection<SubDirectorCoordinador> SubDirectorCoordinadores { get; set; }
        public virtual ICollection<DirectorSubDirector> DirectorSubDirectores { get; set; }
        public virtual IEnumerable<CoordinadorCliente> CoordinadorCliente { get; set; }
        //public virtual IEnumerable<RegistroEntrada> RegistroEntrada { get; set; }

        public virtual CatalogoMunicipio Municipio { get; set; }
        public virtual ICollection<EjecucionPlanificacion> EjecucionPlanificacion { get; set; }
        public virtual ICollection<DetallePlanificacion> DetallePlanificacion { get; set; }
        public virtual ICollection<Planificacion> Planificacion { get; set; }


        public virtual ICollection<TiendaCoordinador> TiendaCoordinadores { get; set; }

        public bool IsDeleted { get; set; }      
    }
}
