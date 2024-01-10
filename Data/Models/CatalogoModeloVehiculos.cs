using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class CatalogoModeloVehiculos : ISoftDeletable
    {
        public CatalogoModeloVehiculos()
        {
            Vehiculos = new HashSet<Vehiculo>();
        }

        public int? IdMarca { get; set; }
        public int IdModelo { get; set; }
        public string? Modelo { get; set; }
        public bool? Activo { get; set; }

        public virtual CatalogoMarcaVehiculos? MarcaVehiculos { get; set; }
        public virtual ICollection<Vehiculo> Vehiculos { get; set; }

        public bool IsDeleted { get; set; }
    }
}
