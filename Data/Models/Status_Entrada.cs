using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class Status_Entrada : ISoftDeletable
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int status_Entrada { get; set; }

        public string Descripcion { get; set; }

        public bool IsDeleted { get; set; }
    }
}
