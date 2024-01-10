using Microsoft.Extensions.Options;

namespace TransportationCore.GeneralClass
{
    public static class ListaPermisos
    {
        public static readonly List<string> Permisos = new List<string>
        {
            "Asignar TC",
            "Administrador",
            "Acciones Usuario",
            "Asignar Cuenta",
            "Editar Clientes",
            "Asignar Vehiculo",
            "Editar Contactos",
            "Editar Operadores",
            "Editar Directores",
            "Reportes Generales",
            "Check In / Chek Out",
            "Editar Planificacion",
            "Editar Coordinadores",
            "Reportes Administrativos",
            "Editar Catalogos Generales"       
        };
    }

    public class PermisosRoles
    {
        public string RoleName { get; set; }
        public List<string> Permissions { get; set; }
    }

    public class Permisos
    {
        public string Type { get; set; }
        public string Value { get; set; }
    }
}
