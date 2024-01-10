namespace TransportationCore.Data.Dtos.ZonaSted
{
    public class ZonaStedUpdateDto
    {
        public int IdZonaSted { get; set; }
        public string NombreZona { get; set; } = string.Empty;
        public string ClaveDET { get; set; } = string.Empty;
        public bool Activa { get; set; } = true;
        public long IdCliente { get; set; }
    }
}
