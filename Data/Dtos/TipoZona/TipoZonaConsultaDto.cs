namespace TransportationCore.Data.Dtos.TipoZona
{
    public class TipoZonaConsultaDto
    {
        public int IdTipoZona { get; set; }
        public string DescripcionTipoZona { get; set; }
        public bool Estado { get; set; } = true!;
    }
}
