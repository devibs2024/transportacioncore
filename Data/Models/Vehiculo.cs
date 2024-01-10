using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class Vehiculo : ISoftDeletable
    {
        public Vehiculo()
        {
            VehiculosOperadores = new HashSet<VehiculoOperador>();
        }

        public long IdVehiculo { get; set; }
        public string NombreVehiculo { get; set; } = null!;
        public int? IdTipoVehiculo { get; set; }
        public int? IdMarcaVehiculo { get; set; }
        public int? IdModeloVehiculo { get; set; }
        public int? EmisionVehiculo { get; set; }
        public bool? VehiculoEmpresa { get; set; }
        public decimal Tarifa { get; set; }
       
        public virtual CatalogoMarcaVehiculos? MarcaVehiculo { get; set; }
        public virtual CatalogoModeloVehiculos? ModeloVehiculo { get; set; }
        public virtual CatalogoTipoVehiculos? TipoVehiculo { get; set; }
        public virtual ICollection<VehiculoOperador> VehiculosOperadores { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
