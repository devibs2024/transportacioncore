using AutoMapper;
using TransportationCore.Data.Dtos.Bancos;
using TransportationCore.Data.Dtos.Cliente;
using TransportationCore.Data.Dtos.CoordinadorCliente;
using TransportationCore.Data.Dtos.CuentaBancaria;
using TransportationCore.Data.Dtos.Dias;
using TransportationCore.Data.Dtos.EstadoCliente;
using TransportationCore.Data.Dtos.EstadoMunicipio;
using TransportationCore.Data.Dtos.Formato;
using TransportationCore.Data.Dtos.FormatoCliente;
using TransportationCore.Data.Dtos.Horario;
using TransportationCore.Data.Dtos.HorarioEmpleado;
using TransportationCore.Data.Dtos.HorarioSucursal;
using TransportationCore.Data.Dtos.MarcaVehiculo;
using TransportationCore.Data.Dtos.ModeloVehiculo;
using TransportationCore.Data.Dtos.MunicipioCliente;
using TransportationCore.Data.Dtos.Operador;
using TransportationCore.Data.Dtos.OperadorCoordinador;
using TransportationCore.Data.Dtos.OperadorSucursal;
using TransportationCore.Data.Dtos.OperadorVehiculo;
using TransportationCore.Data.Dtos.Sucursal;
using TransportationCore.Data.Dtos.Tarjeta;
using TransportationCore.Data.Dtos.TipoVehiculo;
using TransportationCore.Data.Dtos.TipoZona;
using TransportationCore.Data.Dtos.ValidateUserAccount;
using TransportationCore.Data.Dtos.Vehiculo;
using TransportationCore.Data.Dtos.Zona;
using TransportationCore.Data.Dtos.CheckIn_CkeckOut;
using TransportationCore.Data.Dtos.Status_Entrada;
using TransportationCore.Data.Dtos.ContactoCliente;
using transportacion.Data.Dtos.TarifaTipoVehiculoConsultaDto;
using TransportationCore.Data.Models;
using transportacion.Data.Dtos.TarifaTipoVehiculoCreateDto;
using transportacion.Data.Dtos.TarifaTipoVehiculoUpdateDto;
using TransportationCore.Data.Dtos.Tienda;
using TransportationCore.Data.Dtos.Planificacion;
using TransportationCore.Data.Dtos.PlanificacionDetalle;
using TransportationCore.Data.Dtos.PlanificacionEjecucion;
using TransportationCore.Data.Dtos.ZonaSted;
using TransportationCore.Data.Dtos.GerenteSubGerente;
using TransportationCore.Data.Dtos.Nomina;
using TransportationCore.Data.Dtos.Reportes;

namespace TransportationCore.Data.Utilidades
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<OperadorCrearDto, Empleado>().ReverseMap();
            CreateMap<OperadorActualizarDto, Empleado>().ReverseMap();
            CreateMap<Empleado, OperadorConsultarDto>().ReverseMap();
            CreateMap<Empleado, OperadorConsultaMinDto>().ReverseMap();

            CreateMap<CatalogoMunicipio, MunicipioConsultaDto>().ReverseMap();
            CreateMap<CatalogoMunicipio, MunicipioCrearDto>().ReverseMap();
            CreateMap<CatalogoMunicipio, MunicipioUpdateDto>().ReverseMap();

            CreateMap<CatalogoEstado, EstadoConsultaDto>().ReverseMap();
            CreateMap<CatalogoEstado, EstadoCrearDto>().ReverseMap();
            CreateMap<CatalogoEstado, EstadoUpdateDto>().ReverseMap();


            CreateMap<CatalogoBancos, BancosConsultaDto>().ReverseMap();

            CreateMap<AsignacionTarjeta, TarjetaAsignacionConsultaDto>().ReverseMap();
            CreateMap<AsignacionTarjeta, TarjetaAsignacionCreacionDto>().ReverseMap();
            CreateMap<AsignacionTarjeta, TarjetaAsignacionUpdateDto>().ReverseMap();

            CreateMap<EmpleadoCuentaBancaria, CuentaBancariaConsultaDto>().ReverseMap();
            CreateMap<EmpleadoCuentaBancaria, CuentaBancariaCrearDto>().ReverseMap();
            CreateMap<EmpleadoCuentaBancaria, CuentaBancariaUpdateDto>().ReverseMap();

            CreateMap<CatalogoMarcaVehiculos, MarcaVehiculoConsultaDto>().ReverseMap();

            CreateMap<CatalogoMarcaVehiculos, MarcaVehiculoCrearDto>().ReverseMap();
            CreateMap<CatalogoMarcaVehiculos, MarcaVehiculoUpdateDto>().ReverseMap();

            CreateMap<CatalogoModeloVehiculos, ModeloVehiculoConsultaDto>().ReverseMap();

            CreateMap<CatalogoModeloVehiculos, ModeloVehiculoUpdateDto>().ReverseMap();
            CreateMap<CatalogoModeloVehiculos, ModeloVehiculoCrearDto>().ReverseMap();

            CreateMap<CatalogoTipoVehiculos, TipoVehiculoConsultaDto>().ReverseMap();

            CreateMap<CatalogoTipoVehiculos, TipoVehiculoUpdateDto>().ReverseMap();
            CreateMap<CatalogoTipoVehiculos, TipoVehiculoCrearDto>().ReverseMap();

            CreateMap<VehiculoOperador, OperadorVehiculoConsultaDto>().ReverseMap();
            CreateMap<VehiculoOperador, OperadorVehiculoCrearDto>().ReverseMap();
            CreateMap<VehiculoOperador, OperadorVehiculoUpdateDto>().ReverseMap();

            CreateMap<Vehiculo, OperadorVehiculoDetalleDto>().ReverseMap();
            CreateMap<Vehiculo, OperadorVehiculoCrearDto>().ReverseMap();
            CreateMap<Vehiculo, OperadorVehiculoUpdateDto>().ReverseMap();

            CreateMap<Vehiculo, VehiculoConsultaDto>().ReverseMap();
            CreateMap<Vehiculo, VehiculoCrearDto>().ReverseMap();
            CreateMap<Vehiculo, VehiculoActualizarDto>().ReverseMap();

            CreateMap<EmpleadoCoordinador, OperadorCoordinadorDto>().ReverseMap();
            CreateMap<Formato, FormatoConsultaDto>().ReverseMap();

            CreateMap<Cliente, ClienteConsultaDto>().ReverseMap();
            CreateMap<Cliente, ClienteUpdateDto>().ReverseMap();
            CreateMap<Cliente, ClienteCrearDto>().ReverseMap();

            CreateMap<Zona, ZonaConsultaDto>().ReverseMap();
            CreateMap<Zona, ZonaUpdateDto>().ReverseMap();
            CreateMap<Zona, ZonaCrearDto>().ReverseMap();

            CreateMap<EmpleadoCoordinador, OperadorCoordinadorDto>().ReverseMap();
            CreateMap<CoordinadorCliente, CoordinadorClienteDto>().ReverseMap();

            CreateMap<EmpleadoCoordinador, OperadorCoordinadorDto>().ReverseMap();
            CreateMap<CatalogoDias, DiasConsultaDto>().ReverseMap();


            CreateMap<Horarios, HorarioConsultaDto>().ReverseMap();
            CreateMap<Horarios, HorarioCrearDto>().ReverseMap();
            CreateMap<Horarios, HorarioUpdateDto>().ReverseMap();

            CreateMap<HorarioEmpleado, HorarioEmpleadoDto>().ReverseMap();

            CreateMap<FormatoCliente, FormatoClienteDto>().ReverseMap();
            CreateMap<MunicipioCliente, MunicipioClienteDto>().ReverseMap();

            CreateMap<ValidateUserAccount, ValidateUserAccountDto>().ReverseMap();

            CreateMap<CatalogoMarcaVehiculos, MarcaVehiculoConsultaDto>().ReverseMap();
            CreateMap<CatalogoMarcaVehiculos, MarcaVehiculoConsultaDetalleDto>().ReverseMap();
            CreateMap<CatalogoModeloVehiculos, ModeloVehiculoConsultaDetalleDto>().ReverseMap();
            CreateMap<CatalogoTipoVehiculos, TipoVehiculoConsultaDetalleDto>().ReverseMap();

            CreateMap<CheckIn_CkeckOut, ConsultaCheckIn_CkeckOutDto>().ReverseMap();
            CreateMap<CheckIn_CkeckOut, UpdateCheckIn_CheckOut>().ReverseMap();
            CreateMap<CheckIn_CkeckOut, CrearCheckIn_CheckOutDto>().ReverseMap();

            CreateMap<Status_Entrada, Status_EntradaConsultaDto>().ReverseMap();

            CreateMap<ContactoCliente, ContactoClienteConsultaDto>().ReverseMap();
            CreateMap<ContactoCliente, ContactoClienteCrearDto>().ReverseMap();
            CreateMap<ContactoCliente, ContactoClienteUpdateDto>().ReverseMap();

            CreateMap<TarifasTipoVehiculo, TarifaTipoVehiculoConsultaDto>().ReverseMap();
            CreateMap<TarifasTipoVehiculo, TarifaTipoVehiculoCreateDto>().ReverseMap();
            CreateMap<TarifasTipoVehiculo, TarifaTipoVehiculoUpdateDto>().ReverseMap();

            CreateMap<Tienda, TiendaCrearDto>().ReverseMap();
            CreateMap<Tienda, TiendaUpdateDto>().ReverseMap();
            CreateMap<Tienda, TiendaDetalleDto>().ReverseMap();

            CreateMap<Planificacion, PlanificacionCrearDto>().ReverseMap();
            CreateMap<Planificacion, PlanificacionUpdateDto>().ReverseMap();
            CreateMap<DetallePlanificacion, DetallePlanificacionCrearDto>().ReverseMap();
            CreateMap<DetallePlanificacion, DetallePlanificacionUpdateDto>().ReverseMap();
            CreateMap<EjecucionPlanificacion, EjecucionPlanificacionCrearDto>().ReverseMap();
            CreateMap<EjecucionPlanificacion, EjecucionPlanificacionUpdateDto>().ReverseMap();

            CreateMap<ZonaSted, ZonaStedConsultaDto>().ReverseMap();
            CreateMap<ZonaSted, ZonaStedCrearDto>().ReverseMap();
            CreateMap<ZonaSted, ZonaStedUpdateDto>().ReverseMap();


            CreateMap<GerenteSubGerente, GerenteSubGerenteDto>().ReverseMap();

            CreateMap<ProcesoNomina, ProcesoNominaDto>().ReverseMap();
            CreateMap<ProcesoNomina, ProcesoNominaPagoDto>().ReverseMap();
            CreateMap<ComprobanteNomina, ComprobanteNominaDto>().ReverseMap();

        }
    }
}
