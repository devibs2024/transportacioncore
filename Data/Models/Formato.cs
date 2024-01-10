using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class Formato : ISoftDeletable
    {       

        public int IdFormato { get; set; }
        public string DescripcionFormato { get; set; }
        public bool Estado { get; set; } = true!;

        //public virtual ICollection<Cliente> Clientes { get; set; }
        public virtual ICollection<FormatoCliente> FormatoClientes { get; set; }

        public bool IsDeleted { get; set; }  = false; 
    }
}
