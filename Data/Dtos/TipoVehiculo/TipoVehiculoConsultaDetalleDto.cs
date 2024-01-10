using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Dtos.MarcaVehiculo;
using TransportationCore.Data.Models;
using transportacion.Data.Dtos.TarifaTipoVehiculoConsultaDto;

namespace TransportationCore.Data.Dtos.TipoVehiculo
{
    public class TipoVehiculoConsultaDetalleDto
    {
       
        public int IdTipoVehiculo { get; set; }      
        public string? TipoVehiculo { get; set; }
        public bool? Activo { get; set; }
       
        public ICollection<MarcaVehiculoConsultaDetalleDto> MarcaVehiculos { get; set; }
        public ICollection<TarifaTipoVehiculoConsultaDto> Tarifas { get; set; }
    }
}
