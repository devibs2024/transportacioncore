using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class CatalogoTipoVehiculos : ISoftDeletable
    {
        public CatalogoTipoVehiculos()
        {
            MarcaVehiculos = new HashSet<CatalogoMarcaVehiculos>();
            Vehiculos = new HashSet<Vehiculo>();
        }

        public int IdTipoVehiculo { get; set; }
        public string? TipoVehiculo { get; set; }
        public bool? Activo { get; set; }

        public virtual ICollection<CatalogoMarcaVehiculos> MarcaVehiculos { get; set; }
        public virtual ICollection<Vehiculo> Vehiculos { get; set; }
        public virtual ICollection<TarifasTipoVehiculo> Tarifas { get; set; }

        public bool IsDeleted { get; set; }
    }
}
