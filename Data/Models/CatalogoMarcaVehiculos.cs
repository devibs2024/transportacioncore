using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class CatalogoMarcaVehiculos : ISoftDeletable
    {
        public CatalogoMarcaVehiculos()
        {
            ModeloVehiculos = new HashSet<CatalogoModeloVehiculos>();
            Vehiculos = new HashSet<Vehiculo>();
        }

        public int? IdTipo { get; set; }
        public int IdMarca { get; set; }
        public string? Marca { get; set; }
        public bool? Activo { get; set; }

        public virtual CatalogoTipoVehiculos? TipoVehiculos { get; set; }
        public virtual ICollection<CatalogoModeloVehiculos> ModeloVehiculos { get; set; }
        public virtual ICollection<Vehiculo> Vehiculos { get; set; }

        public bool IsDeleted { get; set; }
    }
}
