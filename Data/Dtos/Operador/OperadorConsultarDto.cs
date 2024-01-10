using Microsoft.IdentityModel.Tokens;
using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Dtos.CuentaBancaria;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Models;
using TransportationCore.Enumeradores;

namespace TransportationCore.Data.Dtos.Operador
{
    public class OperadorConsultarDto
    {

        [Required(ErrorMessage = "El campo IdEmpleado es obligatorio.")]
        public long IdEmpleado { get; set; }

        [Required(ErrorMessage = "El campo NumeroContrato es obligatorio.")]
        public decimal NumeroContrato { get; set; }

        [Required(ErrorMessage = "El campo Nombres es obligatorio.")]
        public string Nombres { get; set; } = null!;

        public string? ApellidoMaterno { get; set; }
        public string? ApellidoPaterno { get; set; }

        [Required(ErrorMessage = "El campo Direccion es obligatorio.")]
        public string Direccion { get; set; } = null!;

        [Required(ErrorMessage = "El campo IdMunicipio es obligatorio.")]
        public int IdMunicipio { get; set; }

        [Required(ErrorMessage = "El campo Telefono es obligatorio.")]
        [Phone(ErrorMessage = "El número de teléfono es inválido.")]
        public string Telefono { get; set; } = null!;

        [Required(ErrorMessage = "El campo Correo es obligatorio.")]
        [EmailAddress(ErrorMessage = "El correo electrónico es inválido.")]
        public string Correo { get; set; } = null!;

        [Required(ErrorMessage = "El campo Salario es obligatorio.")]
        public decimal Salario { get; set; }

        public int? IdTipoEmpleado { get; set; }
        public int? IdSegmento { get; set; }
        public string SegmentoEmpleado
        {
            get
            {
                string value = "No definido";
                if (this.IdSegmento != null)
                {
                    if (this.IdSegmento == (int)EnumSegmentoEmpleado.Interno) value = "Empleado interno";
                    else if (this.IdSegmento == (int)EnumSegmentoEmpleado.Externo) value = "Empleado externo";
                    else if (this.IdSegmento == (int)EnumSegmentoEmpleado.Spot) value = "Empleado Spot";                   
                }

                return value;
            }
        }

        [Required(ErrorMessage = "El campo Municipio es obligatorio.")]
        public MunicipioConsultaDto Municipio { get; set; }

        public decimal? SMG { get; set; }

        public string FullName
        {
            get
            {
                string apellidos = ApellidoPaterno.IsNullOrEmpty() ? string.Empty : ApellidoPaterno.Trim();

                if (apellidos.Trim() != string.Empty) apellidos += " ";

                apellidos += ApellidoMaterno.IsNullOrEmpty() ? string.Empty : ApellidoMaterno.Trim();
                string nombreCompleto = $"{Nombres} {apellidos}";

                return nombreCompleto;
            }
        }

        public virtual ICollection<CuentaBancariaConsultaDto> EmpleadoCuentasBancarias { get; set; }
    }
}
