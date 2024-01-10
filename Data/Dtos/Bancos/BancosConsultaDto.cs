using System.ComponentModel.DataAnnotations;

using System;

namespace TransportationCore.Data.Dtos.Bancos
{
    public class BancosConsultaDto
    {
        [Required(ErrorMessage = "El IdBanco es obligatorio.")]
        public int IdBanco { get; set; }

        [StringLength(100, ErrorMessage = "El nombre del banco no puede tener más de 100 caracteres.")]
        public string? NombreBanco { get; set; }

        public bool? Activo { get; set; }
        public string Estatus
        {
            get
            {
                String estatus = "No definido";
                if (this.Activo == null)
                {
                    return estatus;
                }
                else if (this.Activo == true)
                {
                    estatus = "Activa";
                }
                else
                {
                    estatus = "Inactiva";
                }

                return estatus;

            }          
        }
    }
}
