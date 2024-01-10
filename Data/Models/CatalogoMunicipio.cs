using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class CatalogoMunicipio : ISoftDeletable
    {
        public CatalogoMunicipio()
        {
            Empleados = new HashSet<Empleado>();
            Clientes = new HashSet<Cliente>();
        }

        public int IdMunicipio { get; set; }
        public int IdEstado { get; set; }
        public string NombreMunicipio { get; set; }
        public bool Activo { get; set; } = true!;

        public virtual ICollection<Empleado> Empleados { get; set; }
        public virtual ICollection<Cliente> Clientes { get; set; }
        public virtual ICollection<MunicipioCliente> MunicipioClientes { get; set; }
        public virtual CatalogoEstado Estado { get; set; }

        public bool IsDeleted { get; set; }  = false;
    }
}
