namespace TransportationCore.Data.Dtos.ModeloVehiculo
{
    public class ModeloVehiculoUpdateDto
    {
        public int? IdMarca { get; set; }
        public int IdModelo { get; set; }
        public string? Modelo { get; set; }
        public bool? Activo { get; set; }
    }
}
