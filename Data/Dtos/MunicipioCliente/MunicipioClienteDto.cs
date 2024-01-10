using System.ComponentModel.DataAnnotations;
using TransportationCore.Data.Dtos.EstadoCliente;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.MunicipioCliente
{
    public class MunicipioClienteDto
    {
        [Required(ErrorMessage ="Id Municipio requerido")]
        public int IdMunicipio { get; set; }
        [Required(ErrorMessage = "Id Cliente requerido")]
        public long IdCliente { get; set; }      
    }
}
