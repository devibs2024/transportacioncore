namespace TransportationCore.Data.Dtos.ContactoCliente
{
    public class ContactoClienteDetalleDto
    {
        public long IdContacto { get; set; }
        public long IdCliente { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Telefono { get; set; } = string.Empty;
        public string Telefono2 { get; set; } = string.Empty;
        public bool Activo { get; set; }
        public int TipoContacto { get; set; }
        public List<ContactoClienteConsultaDto> SubGerentes { get; set; } = new List<ContactoClienteConsultaDto>();
              
    }
}
