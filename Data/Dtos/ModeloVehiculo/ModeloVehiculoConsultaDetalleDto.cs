using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using TransportationCore.Data.Dtos.Vehiculo;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.ModeloVehiculo
{
    public class ModeloVehiculoConsultaDetalleDto
    {      
        public int? IdMarca { get; set; }
        public int IdModelo { get; set; }       
        public string? Modelo { get; set; }        
        public bool? Activo { get; set; }
        
    }
}
