using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using TransportationCore.Data.Models;

namespace TransportationCore.Data.Dtos.Horario
{
    public class HorarioConsultaDto
    {
        public HorarioConsultaDto()
        {
            Dias = new CatalogoDias();
        }

        public long IdHorario { get; set; }

        [Required(ErrorMessage = "El campo IdDia es requerido.")]
        public int IdDia { get; set; }

        public string DescrDia { get { return this.Dias.Descripcion; } }

        [DataType(DataType.Time)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:hh\\:mm}")]
        public TimeSpan? HoraInicio { get; set; }

        [DataType(DataType.Time)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:hh\\:mm}")]
        public TimeSpan? HoraFin { get; set; }

        public bool? Activo { get; set; }

        [JsonIgnore]
        public CatalogoDias Dias { get; set; }
    }
}
