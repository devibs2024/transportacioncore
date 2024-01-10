using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using TransportationCore.Data.Interfaces;

namespace TransportationCore.Data.Models
{
    public class CheckIn_CkeckOut : ISoftDeletable
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long IdCheck { get; set; }
       
        public long IdEmpleado { get; set; }

        public string CheckIN { get; set; }
        
        public string? CheckIn_Photo_Path { get; set; }
        public string? CheckIn_PhotoPerfil_Path { get; set; }
        public string? CheckIn_PhotoCarroExterior_Path { get; set; }
        public string? CheckIn_PhotoCarroInterior_Path { get; set; }

        public string status_Entrada { get; set; }

        public int IdSucursal { get; set; }

        public int? IdSucursalActual { get; set; }   

        public string? CheckOut { get; set; }

        public DateTime Fecha { get; set; }

        public string? CheckOut_Photo_Perfil { get; set; }
        public string? CheckOut_Photo2_Uniforme { get; set; }

        public string? CheckOut_Photo3_Factura { get; set; }

        public int width { get; set; }
        public int height { get; set; }

        public virtual Empleado Empleados { get; set; }
    
        public bool IsDeleted { get; set; }      
    }
}
