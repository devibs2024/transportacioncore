using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using TransportationCore.Data.Dtos.MarcaVehiculo;
using TransportationCore.Data.Dtos.Vehiculo;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.ModeloVehiculo
{
    public class ModeloVehiculoConsultaDto
    {
        [Display(Name = "Id Marca")]
        public int? IdMarca { get; set; }

        [Display(Name = "Id Modelo")]
        public int IdModelo { get; set; }

        [Display(Name = "Modelo")]
        public string? Modelo { get; set; }

        [Display(Name = "Activo")]
        public bool? Activo { get; set; }
       
        public virtual MarcaVehiculoConsultaDto MarcaVehiculos { get; set; }
    }
}
