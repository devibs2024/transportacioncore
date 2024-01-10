namespace TransportationCore.Enumeradores
{

    public enum EnumTipoEmpleado
    {
        Operador = 1, Coordinador = 2, SubDirector = 3, Director = 4
    }

    public enum EnumSegmentoEmpleado
    {
        Interno = 1, Externo = 2, Spot = 3
    }

    public enum EnumTipoRegistro
    {
        RegistroManual = 1,
        RegistroAutomatico = 2
    }

    public enum EnumTiendasAsignadasParametros
    {
        Tienda = 1,
        ZonaStead = 2,
        Coordinador = 3, 
        Cliente = 4,
    }

    public enum AuditAction
    {       
        Create = 1,
        Update = 2,
        Delete = 3,      
        Login = 4
    }

    public enum EnumFrecuencia
    {
       Semanal = 1, 
       Quincenal = 2, 
       Mensual = 3
    }

    public enum EnumEstatusPlanificacion
    {
        Pendiente = 1,
        EnProceso = 2,
        Completado = 3      
    }
}
