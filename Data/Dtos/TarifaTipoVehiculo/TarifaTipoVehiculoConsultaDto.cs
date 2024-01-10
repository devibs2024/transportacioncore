using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Models;
using TransportationCore.Data.Dtos.TipoVehiculo;

namespace transportacion.Data.Dtos.TarifaTipoVehiculoConsultaDto
{
    public class TarifaTipoVehiculoConsultaDto
    {
        public int IdTarifa { get; set; }   
        public decimal Tarifa { get; set; }
        public bool Activa { get; set; } = false;
        public bool Principal { get; set; } = false;

        public int IdTipoVehiculo { get; set; }
        public TipoVehiculoConsultaDetalleDto? TipoVehiculos { get; set; }

    }
}