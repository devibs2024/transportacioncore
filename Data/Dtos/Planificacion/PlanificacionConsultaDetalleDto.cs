using TransportationCore.Data.Dtos.Tienda;
using Microsoft.AspNetCore.OpenApi;
using Microsoft.AspNetCore.Http.HttpResults;

namespace TransportationCore.Data.Dtos.Planificacion
{
    public class PlanificacionConsultaDetalleDto 
    {
        public long IdCliente { get; set; }
        public string NombreCliente { get; set; } = string.Empty;
        public long Clave { get; set; }
        public int IdZona { get; set; }
        public string NombreZonaSted { get; set; } = string.Empty;
        public int IdZonaSted { get; set; }
        public string ClaveDET { get; set; } = string.Empty;
        public long IdSubGerente { get; set; }
        public int IdEstado { get; set; }
        public int IdTienda { get; set; }
        public string NombreTienda { get; set; } = string.Empty;
        public decimal NumUnidades { get; set; }
        public decimal Tarifa { get; set; }
        public decimal TarifaDescanso { get; set; }
        public decimal UnidadesMaximas { get; set; }
        public string SubGerente { get; set; } = string.Empty;
        public string EmailSubGerente { get; set; } = string.Empty;
        public string Tel1SubGerente { get; set; } = string.Empty;
        public string Tel2SubGerente { get; set; } = string.Empty;
        public string Gerente { get; set; } = string.Empty;
        public string EmailGerente { get; set; } = string.Empty;
        public string Tel1Gerente { get; set; } = string.Empty;
        public string Tel2Gerente { get; set; } = string.Empty;
        public string NombreEstado { get; set; } = string.Empty;
        public string NombreZona { get; set; } = string.Empty;
        public long IdCoordinador { get; set; }
        public string NombreCoordinador { get; set; } = string.Empty;
        public decimal IdPlanificacion { get; set; }
        public DateTime FechaDesde { get; set; }
        public DateTime FechaHasta { get; set; }
        public string Comentario { get; set; }
        public decimal IdDetallePlanificacion { get; set; }
        public long IdOperador { get; set; }
        public string NombreOperador { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public DateTime Fecha { get; set; }
        public bool Descanso { get; set; }
    }

}


