﻿using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Dtos.Nomina
{
    public class ComprobanteNominaDto
    {
        [Key]
        public decimal IdComprobanteNomina { get; set; }

        public decimal IdProcesoNomina { get; set; }

        [Required(ErrorMessage = "El campo IdPlanificacion es obligatorio.")]
        public decimal IdPlanificacion { get; set; }

        public DateTime Fecha { get; set; }
        public DateTime FechaIni { get; set; }
        public DateTime FechaEnd { get; set; }

        [Required(ErrorMessage = "El campo IdCoordinador es obligatorio.")]
        public Int32 IdCoordinador { get; set; }
        public string Coordinador { get; set; } = string.Empty;

        public Int32 IdOperador { get; set; }
        public string Operador { get; set; } = string.Empty;

        public Int32 IdSegmento { get; set; }
        public string Segmento { get; set; } = string.Empty;
        public Boolean Spot { get; set; }

        public string Tarjeta { get; set; } = string.Empty;
        public Int32 IdBanco { get; set; }
        public string Banco { get; set; } = string.Empty;

        public decimal Salario { get; set; }
        public decimal SMG { get; set; }

        public Int32 IdCliente { get; set; }
        public string Cliente { get; set; } = string.Empty;

        public Int32 IdTienda { get; set; }
        public string Tienda { get; set; } = string.Empty;
        public Int32 IdZonaSted { get; set; }
        public string ZonaSted { get; set; } = string.Empty;

        public Int32 Dias { get; set; }
        public Int32 Descansos { get; set; }
        public Int32 Faltas { get; set; }

        public decimal SubTotal1 { get; set; }
        public decimal Descuento { get; set; }
        public decimal Bono { get; set; }
        public decimal Gasolina { get; set; }
        public decimal SubTotal2 { get; set; }
        public decimal Total { get; set; }
        public decimal STED { get; set; }
        public decimal Pago { get; set; }

        public string Accion { get; set; } = string.Empty;
    }


}
