namespace TransportationCore.Data.Dtos.ContactoCliente
{
    public class GerenteSubGerenteConsultaDto
    {
        public long IdCliente { get; set; }
        public long IdGerente { get; set; }
        public string NombreGerente { get; set; } = string.Empty;
        public string Telefono1Gerente { get; set; } = string.Empty;
        public string Telefono2Gerente { get; set; } = string.Empty;
        public string EmailGerente { get; set; } = string.Empty;
        public int TipoContactoGerente { get; set; }
        public bool EstatusGerente { get; set; }

        public long IdSubGerente { get; set; }
        public string NombreSubGerente { get; set; } = string.Empty;
        public string Telefono1SubGerente { get; set; } = string.Empty;
        public string Telefono2SubGerente { get; set; } = string.Empty;
        public string EmailSubGerente { get; set; } = string.Empty;
        public int TipoContactoSubGerente { get; set; }
        public bool EstatusSubGerente { get; set; }

    }
}
