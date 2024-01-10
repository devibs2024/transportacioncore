using System;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public partial class CatalogoDias : ISoftDeletable
    {
        public CatalogoDias()
        {
            Horarios = new HashSet<Horarios>();
        }

        public int IdDia { get; set; }
        public string? Descripcion { get; set; }
        public string? Siglas { get; set; }

        public virtual ICollection<Horarios> Horarios { get; set; }

        public bool IsDeleted { get; set; }
    }
}
