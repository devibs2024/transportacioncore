IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'transportation40') BEGIN
    CREATE DATABASE transportation40;
    PRINT 'La base de datos ha sido creada.';
END

USE [transportation40]
GO
/****** Object:  Table [dbo].[tbl_ZonaSted]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ZonaSted](
	[IdZonaSted] [int] IDENTITY(1,1) NOT NULL,
	[NombreZona] [nvarchar](30) NOT NULL,
	[ClaveDET] [nvarchar](50) NOT NULL,
	[Activa] [bit] NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_ZonaSted] PRIMARY KEY CLUSTERED 
(
	[IdZonaSted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AsignacionTarjeta]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AsignacionTarjeta](
	[IdTarjeta] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [bigint] NOT NULL,
	[NumTarjeta] [nvarchar](50) NULL,
	[NumeroInterno] [nvarchar](50) NULL,
	[Activa] [bit] NULL,
	[TarjetaPrincipal] [bit] NOT NULL,
	[MontoDiario] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_AsignacionTarjeta] PRIMARY KEY CLUSTERED 
(
	[IdTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EmpleadoCuentaBancaria]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmpleadoCuentaBancaria](
	[IdCuenta] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [bigint] NULL,
	[IdBanco] [int] NOT NULL,
	[CuentaBancaria] [nvarchar](20) NOT NULL,
	[Activa] [bit] NULL,
	[CuentaPrincipal] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_EmpleadoCuentaBancaria] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CatalogoBancos]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CatalogoBancos](
	[IdBanco] [int] IDENTITY(1,1) NOT NULL,
	[NombreBanco] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CatalogoBancos] PRIMARY KEY CLUSTERED 
(
	[IdBanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tienda]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tienda](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[NombreTienda] [nvarchar](30) NOT NULL,
	[IdSubGerente] [bigint] NOT NULL,
	[IdEstado] [int] NOT NULL,
	[IdZonaSted] [int] NOT NULL,
	[NumUnidades] [decimal](18, 2) NOT NULL,
	[UnidadesMaximas] [decimal](18, 2) NOT NULL,
	[Tarifa] [decimal](18, 2) NOT NULL,
	[TarifaDescanso] [decimal](18, 2) NOT NULL,
	[Activa] [bit] NULL,
	[CntEmpleadosInterno] [int] NULL,
	[CntEmpleadosExterno] [int] NULL,
	[CntEmpleadosSpot] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Tienda] PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetallePlanificacion]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetallePlanificacion](
	[IdPlanificacion] [decimal](18, 0) NOT NULL,
	[IdDetallePlanificacion] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[IdOperador] [bigint] NOT NULL,
	[IdTienda] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
	[Descanso] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_DetallePlanificacion] PRIMARY KEY CLUSTERED 
(
	[IdPlanificacion] ASC,
	[IdDetallePlanificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EjecucionPlanificacion]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EjecucionPlanificacion](
	[IdPlanificacion] [decimal](18, 0) NOT NULL,
	[IdDetallePlanificacion] [decimal](18, 0) NOT NULL,
	[IdOperador] [bigint] NOT NULL,
	[TipoRegistro] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
	[Descanso] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DescuentoTardanza] [decimal](18, 2) NOT NULL,
	[IncentivoFactura] [decimal](18, 2) NOT NULL,
	[MontoHorasExtras] [decimal](18, 2) NOT NULL,
	[IdTienda] [int] NOT NULL,
	[IdEjecucionPlanificacion] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Justificacion] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_tbl_EjecucionPlanificacion] PRIMARY KEY CLUSTERED 
(
	[IdPlanificacion] ASC,
	[IdEjecucionPlanificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CatalogoEstado]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CatalogoEstado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstado] [nvarchar](30) NOT NULL,
	[Activo] [bit] NOT NULL,
	[IdZona] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CatalogoEstado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Cliente]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Cliente](
	[IdCliente] [bigint] IDENTITY(1,1) NOT NULL,
	[Clave] [bigint] NOT NULL,
	[NombreCliente] [nvarchar](100) NOT NULL,
	[IdEstado] [int] NULL,
	[IdMunicipio] [int] NULL,
	[IdZona] [int] NULL,
	[Tarifa] [decimal](18, 2) NULL,
	[TarifaHoraAdicional] [decimal](18, 2) NULL,
	[TarifaConAyudante] [decimal](18, 2) NULL,
	[TarifaSpot] [decimal](18, 2) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Empleados]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Empleados](
	[IdEmpleado] [bigint] IDENTITY(1,1) NOT NULL,
	[NumeroContrato] [numeric](18, 0) NOT NULL,
	[Nombres] [nvarchar](30) NOT NULL,
	[ApellidoMaterno] [nvarchar](20) NULL,
	[ApellidoPaterno] [nvarchar](20) NULL,
	[Direccion] [nvarchar](100) NOT NULL,
	[IdMunicipio] [int] NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Correo] [nvarchar](75) NOT NULL,
	[Salario] [decimal](18, 2) NULL,
	[IdTipoEmpleado] [int] NULL,
	[IdSegmento] [int] NULL,
	[SMG] [decimal](18, 2) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Empleados] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Productividad]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE View [dbo].[vw_Productividad]

As

Select
 Ejecucion.IdDetallePlanificacion
, Ejecucion.IdEjecucionPlanificacion
, Ejecucion.IdPlanificacion
, Ejecucion.IdTienda
, Tda.NombreTienda
, cte.IdCliente
, cte.NombreCliente
, est.IdEstado
, est.NombreEstado
, Ejecucion.IdOperador
, concat_WS(' ',Oper.Nombres,Oper.ApellidoPaterno,Oper.ApellidoMaterno) NombreOperador
, Case Oper.IdSegmento when 3 then 1 else 0 end Spot
, Ejecucion.Fecha
, Isnull(Detalle.HoraInicio, '00:00:00') as HoraInicioPlanificacion
, Ejecucion.HoraInicio as HoraInicioEjecucion
, DATEDIFF(MINUTE, Isnull(Detalle.HoraInicio,'00:00:00'), Ejecucion.HoraInicio) AS TardanzaEnMinutos
, IsNull(Detalle.HoraFin,'00:00:00') as HoraFinPlanificacion
, Ejecucion.HoraFin as HoraFinEjecucion
, DATEDIFF(MINUTE, Isnull(Detalle.HoraFin,'00:00:00'), Ejecucion.HoraFin) AS HorasExtrasEnMinutos
, DATEPART(day, Ejecucion.Fecha) Dia
, Ejecucion.TipoRegistro
, Ejecucion.Descanso
, Ejecucion.DescuentoTardanza
, Ejecucion.IncentivoFactura
, Ejecucion.MontoHorasExtras
, Ejecucion.Justificacion
, Oper.Salario
, tc.MontoDiario
, tc.NumTarjeta
, Oper.SMG
, ((Oper.Salario + Ejecucion.IncentivoFactura + Ejecucion.MontoHorasExtras + tc.MontoDiario) - Ejecucion.DescuentoTardanza) SubTotal
, cta.CuentaBancaria
, bco.IdBanco
, bco.NombreBanco
From tbl_EjecucionPlanificacion Ejecucion
	Left Join tbl_DetallePlanificacion Detalle
		On Detalle.IdPlanificacion  =  Ejecucion.IdPlanificacion
	   And Detalle.IdDetallePlanificacion =  Ejecucion.IdDetallePlanificacion
	   And Detalle.IdOperador = Ejecucion.IdOperador
	Inner Join tbl_Tienda Tda
		On Ejecucion.IdTienda = tda.IdTienda
	Inner Join tbl_ZonaSted ZnaSted
		On Tda.IdZonaSted = ZnaSted.IdZonaSted
	Inner Join tbl_Cliente cte
		On ZnaSted.IdCliente = cte.IdCliente
	Inner Join tbl_CatalogoEstado est
		On tda.IdEstado = est.IdEstado
	Inner Join tbl_Empleados Oper
		On Ejecucion.IdOperador = Oper.IdEmpleado
	Inner Join tbl_AsignacionTarjeta tc
		On oper.IdEmpleado = tc.IdEmpleado
		And tc.Activa = 1 And tc.TarjetaPrincipal = 1
	Inner Join tbl_EmpleadoCuentaBancaria cta
		On cta.IdEmpleado = oper.IdEmpleado
		And cta.Activa = 1 And cta.CuentaPrincipal = 1
	Inner Join tbl_CatalogoBancos bco
		On cta.IdBanco = bco.IdBanco
	
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[EntityId] [nvarchar](450) NOT NULL,
	[ActionType] [nvarchar](12) NOT NULL,
	[UserId] [nvarchar](75) NOT NULL,
	[OldValues] [nvarchar](max) NOT NULL,
	[NewValues] [nvarchar](max) NOT NULL,
	[ActionDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CatalogoDias]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CatalogoDias](
	[IdDia] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Siglas] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CatalogoDias] PRIMARY KEY CLUSTERED 
(
	[IdDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CatalogoMunicipio]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CatalogoMunicipio](
	[IdMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[IdEstado] [int] NOT NULL,
	[NombreMunicipio] [nvarchar](30) NOT NULL,
	[Activo] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CatalogoMunicipio] PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CatalogoTipoVehiculo]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CatalogoTipoVehiculo](
	[IdTipoVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[TipoVehiculo] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CatalogoTipoVehiculo] PRIMARY KEY CLUSTERED 
(
	[IdTipoVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CatalogoVehiculoMarca]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CatalogoVehiculoMarca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[IdTipo] [int] NULL,
	[Marca] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CatalogoVehiculoMarca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CatalogoVehiculoModelo]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CatalogoVehiculoModelo](
	[IdModelo] [int] IDENTITY(1,1) NOT NULL,
	[IdMarca] [int] NULL,
	[Modelo] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CatalogoVehiculoModelo] PRIMARY KEY CLUSTERED 
(
	[IdModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CheckIn_CheckOut]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CheckIn_CheckOut](
	[IdCheck] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [bigint] NOT NULL,
	[CheckIN] [nvarchar](max) NOT NULL,
	[CheckIn_Photo_Path] [nvarchar](max) NULL,
	[CheckIn_PhotoPerfil_Path] [nvarchar](max) NULL,
	[CheckIn_PhotoCarroExterior_Path] [nvarchar](max) NULL,
	[CheckIn_PhotoCarroInterior_Path] [nvarchar](max) NULL,
	[status_Entrada] [nvarchar](max) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdSucursalActual] [int] NULL,
	[CheckOut] [nvarchar](max) NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[CheckOut_Photo_Perfil] [nvarchar](max) NULL,
	[CheckOut_Photo2_Uniforme] [nvarchar](max) NULL,
	[CheckOut_Photo3_Factura] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CheckIn_CheckOut] PRIMARY KEY CLUSTERED 
(
	[IdCheck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ContactoCliente]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ContactoCliente](
	[IdContacto] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[telefono] [nvarchar](max) NOT NULL,
	[telefono2] [nvarchar](max) NOT NULL,
	[Activo] [bit] NOT NULL,
	[TipoContacto] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_ContactoCliente] PRIMARY KEY CLUSTERED 
(
	[IdContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CoordinadorCliente]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CoordinadorCliente](
	[IdCoordinador] [bigint] NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CoordinadorCliente] PRIMARY KEY CLUSTERED 
(
	[IdCoordinador] ASC,
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleTarjeta]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleTarjeta](
	[IdDetalleTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[IdTarjeta] [bigint] NULL,
	[IdEmpleado] [bigint] NULL,
	[Importe] [decimal](18, 2) NULL,
	[FechaDispension] [datetime] NULL,
	[IdSucursal] [int] NULL,
	[IdCordinador] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_DetalleTarjeta] PRIMARY KEY CLUSTERED 
(
	[IdDetalleTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DirectorSubDirector]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DirectorSubDirector](
	[IdDirector] [bigint] NOT NULL,
	[IdSubDirector] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_DirectorSubDirector] PRIMARY KEY CLUSTERED 
(
	[IdSubDirector] ASC,
	[IdDirector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EmpleadoCoordinador]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmpleadoCoordinador](
	[IdOperador] [bigint] NOT NULL,
	[IdCoordinador] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_EmpleadoCoordinador] PRIMARY KEY CLUSTERED 
(
	[IdOperador] ASC,
	[IdCoordinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Formato]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Formato](
	[IdFormato] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionFormato] [nvarchar](30) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Formato] PRIMARY KEY CLUSTERED 
(
	[IdFormato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FormatoCliente]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FormatoCliente](
	[IdFormato] [int] NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_FormatoCliente] PRIMARY KEY CLUSTERED 
(
	[IdFormato] ASC,
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_GerenteSubGerente]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GerenteSubGerente](
	[IdGerente] [bigint] NOT NULL,
	[IdSubGerente] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_GerenteSubGerente] PRIMARY KEY CLUSTERED 
(
	[IdGerente] ASC,
	[IdSubGerente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Horario]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Horario](
	[IdHorario] [bigint] IDENTITY(1,1) NOT NULL,
	[IdDia] [int] NOT NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFin] [time](7) NULL,
	[Activo] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Horario] PRIMARY KEY CLUSTERED 
(
	[IdHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HorarioEmpleado]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HorarioEmpleado](
	[IdHorario] [bigint] NOT NULL,
	[IdEmpleado] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_HorarioEmpleado] PRIMARY KEY CLUSTERED 
(
	[IdHorario] ASC,
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MunicipioCliente]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MunicipioCliente](
	[IdMunicipio] [int] NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_MunicipioCliente] PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC,
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Planificacion]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Planificacion](
	[IdPlanificacion] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[FechaDesde] [date] NOT NULL,
	[FechaHasta] [date] NOT NULL,
	[Comentario] [nvarchar](50) NOT NULL,
	[IdCoordinador] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[EstatusPlanificacionId] [int] NOT NULL,
	[FrecuenciaId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Planificacion] PRIMARY KEY CLUSTERED 
(
	[IdPlanificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SubDirectorCoordinador]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SubDirectorCoordinador](
	[IdCoordinador] [bigint] NOT NULL,
	[IdSubDirector] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_SubDirectorCoordinador] PRIMARY KEY CLUSTERED 
(
	[IdSubDirector] ASC,
	[IdCoordinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TarifasTipoVehiculo]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TarifasTipoVehiculo](
	[IdTarifa] [int] IDENTITY(1,1) NOT NULL,
	[Tarifa] [decimal](18, 2) NOT NULL,
	[Activa] [bit] NOT NULL,
	[Principal] [bit] NOT NULL,
	[IdTipoVehiculo] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_TarifasTipoVehiculo] PRIMARY KEY CLUSTERED 
(
	[IdTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TiendaCoordinador]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TiendaCoordinador](
	[IdTienda] [int] NOT NULL,
	[IdCoordinador] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_TiendaCoordinador] PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC,
	[IdCoordinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ValidateUserAccount]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ValidateUserAccount](
	[IdValidarCuenta] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [bigint] NULL,
	[CorreoEmpleado] [nvarchar](max) NOT NULL,
	[CodigoVerficacion] [nvarchar](max) NOT NULL,
	[fechaExpiracion] [datetime] NOT NULL,
	[TipoCodigo] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_ValidateUserAccount] PRIMARY KEY CLUSTERED 
(
	[IdValidarCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Vehiculo]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Vehiculo](
	[IdVehiculo] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreVehiculo] [nvarchar](50) NOT NULL,
	[IdTipoVehiculo] [int] NULL,
	[IdMarcaVehiculo] [int] NULL,
	[IdModeloVehiculo] [int] NULL,
	[EmisionVehiculo] [int] NULL,
	[VehiculoEmpresa] [bit] NULL,
	[Tarifa] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VehiculoOperador]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VehiculoOperador](
	[IdVehiculo] [bigint] NOT NULL,
	[IdEmpleado] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_VehiculoOperador] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC,
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Zona]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Zona](
	[IdZona] [int] IDENTITY(1,1) NOT NULL,
	[NombreZona] [nvarchar](30) NOT NULL,
	[ClaveDET] [nvarchar](50) NOT NULL,
	[Activa] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Zona] PRIMARY KEY CLUSTERED 
(
	[IdZona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230531034445_ModificarTienda', N'7.0.5')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602033947_EjecutionData', N'7.0.5')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604064944_EjecucionPlanificacion', N'7.0.5')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604065447_EjecucionPlanificacion2', N'7.0.5')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604143809_EjecucionPlanificacion3', N'7.0.5')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604160432_EjecucionPlanificacion4', N'7.0.5')
GO
SET IDENTITY_INSERT [dbo].[tbl_AsignacionTarjeta] ON 
GO
INSERT [dbo].[tbl_AsignacionTarjeta] ([IdTarjeta], [IdEmpleado], [NumTarjeta], [NumeroInterno], [Activa], [TarjetaPrincipal], [MontoDiario], [IsDeleted]) VALUES (1, 1, N'454541', N'1', 1, 1, CAST(1200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_AsignacionTarjeta] ([IdTarjeta], [IdEmpleado], [NumTarjeta], [NumeroInterno], [Activa], [TarjetaPrincipal], [MontoDiario], [IsDeleted]) VALUES (2, 2, N'454542', N'1', 1, 1, CAST(1200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_AsignacionTarjeta] ([IdTarjeta], [IdEmpleado], [NumTarjeta], [NumeroInterno], [Activa], [TarjetaPrincipal], [MontoDiario], [IsDeleted]) VALUES (3, 4, N'454543', N'1', 1, 1, CAST(1200.00 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_AsignacionTarjeta] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoBancos] ON 
GO
INSERT [dbo].[tbl_CatalogoBancos] ([IdBanco], [NombreBanco], [Activo], [IsDeleted]) VALUES (1, N'Banco 1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoBancos] ([IdBanco], [NombreBanco], [Activo], [IsDeleted]) VALUES (2, N'Banco 2', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoBancos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoEstado] ON 
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (1, N'Estado1', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (2, N'Estado2', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (3, N'Estado3', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (4, N'Estado4', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (5, N'Estado5', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (6, N'Estado6', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (7, N'Estado7', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (8, N'Estado8', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (9, N'Estado9', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (10, N'Estado10', 1, 1, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (11, N'Estado1', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (12, N'Estado2', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (13, N'Estado3', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (14, N'Estado4', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (15, N'Estado5', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (16, N'Estado6', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (17, N'Estado7', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (18, N'Estado8', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (19, N'Estado9', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (20, N'Estado10', 1, 2, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (21, N'Estado1', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (22, N'Estado2', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (23, N'Estado3', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (24, N'Estado4', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (25, N'Estado5', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (26, N'Estado6', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (27, N'Estado7', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (28, N'Estado8', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (29, N'Estado9', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (30, N'Estado10', 1, 3, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (31, N'Estado1', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (32, N'Estado2', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (33, N'Estado3', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (34, N'Estado4', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (35, N'Estado5', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (36, N'Estado6', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (37, N'Estado7', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (38, N'Estado8', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (39, N'Estado9', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (40, N'Estado10', 1, 4, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (41, N'Estado1', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (42, N'Estado2', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (43, N'Estado3', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (44, N'Estado4', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (45, N'Estado5', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (46, N'Estado6', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (47, N'Estado7', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (48, N'Estado8', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (49, N'Estado9', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (50, N'Estado10', 1, 5, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (51, N'Estado1', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (52, N'Estado2', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (53, N'Estado3', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (54, N'Estado4', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (55, N'Estado5', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (56, N'Estado6', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (57, N'Estado7', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (58, N'Estado8', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (59, N'Estado9', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (60, N'Estado10', 1, 6, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (61, N'Estado1', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (62, N'Estado2', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (63, N'Estado3', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (64, N'Estado4', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (65, N'Estado5', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (66, N'Estado6', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (67, N'Estado7', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (68, N'Estado8', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (69, N'Estado9', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (70, N'Estado10', 1, 7, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (71, N'Estado1', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (72, N'Estado2', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (73, N'Estado3', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (74, N'Estado4', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (75, N'Estado5', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (76, N'Estado6', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (77, N'Estado7', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (78, N'Estado8', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (79, N'Estado9', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (80, N'Estado10', 1, 8, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (81, N'Estado1', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (82, N'Estado2', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (83, N'Estado3', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (84, N'Estado4', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (85, N'Estado5', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (86, N'Estado6', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (87, N'Estado7', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (88, N'Estado8', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (89, N'Estado9', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (90, N'Estado10', 1, 9, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (91, N'Estado1', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (92, N'Estado2', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (93, N'Estado3', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (94, N'Estado4', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (95, N'Estado5', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (96, N'Estado6', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (97, N'Estado7', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (98, N'Estado8', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (99, N'Estado9', 1, 10, 0)
GO
INSERT [dbo].[tbl_CatalogoEstado] ([IdEstado], [NombreEstado], [Activo], [IdZona], [IsDeleted]) VALUES (100, N'Estado10', 1, 10, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoEstado] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoMunicipio] ON 
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (1, 1, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (2, 2, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (3, 3, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (4, 4, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (5, 5, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (6, 6, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (7, 7, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (8, 8, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (9, 9, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (10, 10, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (11, 11, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (12, 12, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (13, 13, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (14, 14, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (15, 15, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (16, 16, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (17, 17, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (18, 18, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (19, 19, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (20, 20, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (21, 21, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (22, 22, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (23, 23, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (24, 24, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (25, 25, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (26, 26, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (27, 27, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (28, 28, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (29, 29, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (30, 30, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (31, 31, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (32, 32, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (33, 33, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (34, 34, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (35, 35, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (36, 36, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (37, 37, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (38, 38, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (39, 39, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (40, 40, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (41, 41, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (42, 42, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (43, 43, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (44, 44, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (45, 45, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (46, 46, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (47, 47, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (48, 48, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (49, 49, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (50, 50, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (51, 51, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (52, 52, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (53, 53, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (54, 54, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (55, 55, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (56, 56, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (57, 57, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (58, 58, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (59, 59, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (60, 60, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (61, 61, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (62, 62, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (63, 63, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (64, 64, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (65, 65, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (66, 66, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (67, 67, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (68, 68, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (69, 69, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (70, 70, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (71, 71, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (72, 72, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (73, 73, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (74, 74, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (75, 75, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (76, 76, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (77, 77, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (78, 78, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (79, 79, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (80, 80, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (81, 81, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (82, 82, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (83, 83, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (84, 84, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (85, 85, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (86, 86, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (87, 87, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (88, 88, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (89, 89, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (90, 90, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (91, 91, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (92, 92, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (93, 93, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (94, 94, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (95, 95, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (96, 96, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (97, 97, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (98, 98, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (99, 99, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (100, 100, N'Municipio1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (101, 1, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (102, 2, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (103, 3, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (104, 4, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (105, 5, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (106, 6, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (107, 7, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (108, 8, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (109, 9, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (110, 10, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (111, 11, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (112, 12, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (113, 13, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (114, 14, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (115, 15, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (116, 16, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (117, 17, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (118, 18, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (119, 19, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (120, 20, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (121, 21, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (122, 22, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (123, 23, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (124, 24, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (125, 25, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (126, 26, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (127, 27, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (128, 28, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (129, 29, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (130, 30, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (131, 31, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (132, 32, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (133, 33, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (134, 34, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (135, 35, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (136, 36, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (137, 37, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (138, 38, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (139, 39, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (140, 40, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (141, 41, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (142, 42, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (143, 43, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (144, 44, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (145, 45, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (146, 46, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (147, 47, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (148, 48, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (149, 49, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (150, 50, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (151, 51, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (152, 52, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (153, 53, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (154, 54, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (155, 55, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (156, 56, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (157, 57, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (158, 58, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (159, 59, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (160, 60, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (161, 61, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (162, 62, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (163, 63, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (164, 64, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (165, 65, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (166, 66, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (167, 67, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (168, 68, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (169, 69, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (170, 70, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (171, 71, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (172, 72, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (173, 73, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (174, 74, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (175, 75, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (176, 76, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (177, 77, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (178, 78, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (179, 79, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (180, 80, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (181, 81, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (182, 82, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (183, 83, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (184, 84, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (185, 85, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (186, 86, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (187, 87, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (188, 88, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (189, 89, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (190, 90, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (191, 91, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (192, 92, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (193, 93, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (194, 94, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (195, 95, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (196, 96, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (197, 97, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (198, 98, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (199, 99, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (200, 100, N'Municipio2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (201, 1, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (202, 2, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (203, 3, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (204, 4, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (205, 5, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (206, 6, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (207, 7, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (208, 8, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (209, 9, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (210, 10, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (211, 11, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (212, 12, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (213, 13, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (214, 14, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (215, 15, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (216, 16, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (217, 17, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (218, 18, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (219, 19, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (220, 20, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (221, 21, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (222, 22, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (223, 23, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (224, 24, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (225, 25, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (226, 26, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (227, 27, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (228, 28, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (229, 29, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (230, 30, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (231, 31, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (232, 32, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (233, 33, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (234, 34, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (235, 35, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (236, 36, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (237, 37, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (238, 38, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (239, 39, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (240, 40, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (241, 41, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (242, 42, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (243, 43, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (244, 44, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (245, 45, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (246, 46, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (247, 47, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (248, 48, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (249, 49, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (250, 50, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (251, 51, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (252, 52, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (253, 53, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (254, 54, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (255, 55, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (256, 56, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (257, 57, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (258, 58, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (259, 59, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (260, 60, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (261, 61, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (262, 62, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (263, 63, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (264, 64, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (265, 65, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (266, 66, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (267, 67, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (268, 68, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (269, 69, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (270, 70, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (271, 71, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (272, 72, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (273, 73, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (274, 74, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (275, 75, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (276, 76, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (277, 77, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (278, 78, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (279, 79, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (280, 80, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (281, 81, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (282, 82, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (283, 83, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (284, 84, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (285, 85, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (286, 86, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (287, 87, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (288, 88, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (289, 89, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (290, 90, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (291, 91, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (292, 92, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (293, 93, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (294, 94, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (295, 95, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (296, 96, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (297, 97, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (298, 98, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (299, 99, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (300, 100, N'Municipio3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (301, 1, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (302, 2, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (303, 3, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (304, 4, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (305, 5, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (306, 6, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (307, 7, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (308, 8, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (309, 9, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (310, 10, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (311, 11, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (312, 12, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (313, 13, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (314, 14, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (315, 15, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (316, 16, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (317, 17, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (318, 18, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (319, 19, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (320, 20, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (321, 21, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (322, 22, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (323, 23, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (324, 24, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (325, 25, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (326, 26, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (327, 27, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (328, 28, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (329, 29, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (330, 30, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (331, 31, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (332, 32, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (333, 33, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (334, 34, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (335, 35, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (336, 36, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (337, 37, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (338, 38, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (339, 39, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (340, 40, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (341, 41, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (342, 42, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (343, 43, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (344, 44, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (345, 45, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (346, 46, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (347, 47, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (348, 48, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (349, 49, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (350, 50, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (351, 51, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (352, 52, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (353, 53, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (354, 54, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (355, 55, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (356, 56, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (357, 57, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (358, 58, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (359, 59, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (360, 60, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (361, 61, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (362, 62, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (363, 63, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (364, 64, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (365, 65, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (366, 66, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (367, 67, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (368, 68, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (369, 69, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (370, 70, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (371, 71, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (372, 72, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (373, 73, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (374, 74, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (375, 75, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (376, 76, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (377, 77, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (378, 78, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (379, 79, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (380, 80, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (381, 81, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (382, 82, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (383, 83, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (384, 84, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (385, 85, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (386, 86, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (387, 87, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (388, 88, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (389, 89, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (390, 90, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (391, 91, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (392, 92, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (393, 93, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (394, 94, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (395, 95, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (396, 96, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (397, 97, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (398, 98, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (399, 99, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (400, 100, N'Municipio4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (401, 1, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (402, 2, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (403, 3, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (404, 4, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (405, 5, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (406, 6, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (407, 7, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (408, 8, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (409, 9, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (410, 10, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (411, 11, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (412, 12, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (413, 13, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (414, 14, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (415, 15, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (416, 16, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (417, 17, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (418, 18, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (419, 19, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (420, 20, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (421, 21, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (422, 22, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (423, 23, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (424, 24, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (425, 25, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (426, 26, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (427, 27, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (428, 28, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (429, 29, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (430, 30, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (431, 31, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (432, 32, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (433, 33, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (434, 34, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (435, 35, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (436, 36, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (437, 37, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (438, 38, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (439, 39, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (440, 40, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (441, 41, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (442, 42, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (443, 43, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (444, 44, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (445, 45, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (446, 46, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (447, 47, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (448, 48, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (449, 49, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (450, 50, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (451, 51, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (452, 52, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (453, 53, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (454, 54, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (455, 55, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (456, 56, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (457, 57, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (458, 58, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (459, 59, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (460, 60, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (461, 61, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (462, 62, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (463, 63, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (464, 64, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (465, 65, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (466, 66, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (467, 67, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (468, 68, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (469, 69, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (470, 70, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (471, 71, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (472, 72, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (473, 73, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (474, 74, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (475, 75, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (476, 76, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (477, 77, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (478, 78, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (479, 79, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (480, 80, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (481, 81, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (482, 82, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (483, 83, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (484, 84, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (485, 85, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (486, 86, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (487, 87, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (488, 88, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (489, 89, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (490, 90, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (491, 91, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (492, 92, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (493, 93, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (494, 94, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (495, 95, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (496, 96, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (497, 97, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (498, 98, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (499, 99, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (500, 100, N'Municipio5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (501, 1, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (502, 2, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (503, 3, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (504, 4, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (505, 5, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (506, 6, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (507, 7, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (508, 8, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (509, 9, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (510, 10, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (511, 11, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (512, 12, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (513, 13, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (514, 14, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (515, 15, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (516, 16, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (517, 17, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (518, 18, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (519, 19, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (520, 20, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (521, 21, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (522, 22, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (523, 23, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (524, 24, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (525, 25, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (526, 26, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (527, 27, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (528, 28, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (529, 29, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (530, 30, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (531, 31, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (532, 32, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (533, 33, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (534, 34, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (535, 35, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (536, 36, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (537, 37, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (538, 38, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (539, 39, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (540, 40, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (541, 41, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (542, 42, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (543, 43, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (544, 44, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (545, 45, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (546, 46, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (547, 47, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (548, 48, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (549, 49, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (550, 50, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (551, 51, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (552, 52, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (553, 53, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (554, 54, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (555, 55, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (556, 56, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (557, 57, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (558, 58, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (559, 59, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (560, 60, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (561, 61, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (562, 62, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (563, 63, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (564, 64, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (565, 65, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (566, 66, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (567, 67, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (568, 68, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (569, 69, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (570, 70, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (571, 71, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (572, 72, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (573, 73, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (574, 74, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (575, 75, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (576, 76, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (577, 77, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (578, 78, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (579, 79, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (580, 80, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (581, 81, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (582, 82, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (583, 83, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (584, 84, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (585, 85, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (586, 86, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (587, 87, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (588, 88, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (589, 89, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (590, 90, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (591, 91, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (592, 92, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (593, 93, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (594, 94, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (595, 95, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (596, 96, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (597, 97, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (598, 98, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (599, 99, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (600, 100, N'Municipio6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (601, 1, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (602, 2, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (603, 3, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (604, 4, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (605, 5, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (606, 6, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (607, 7, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (608, 8, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (609, 9, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (610, 10, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (611, 11, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (612, 12, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (613, 13, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (614, 14, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (615, 15, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (616, 16, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (617, 17, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (618, 18, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (619, 19, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (620, 20, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (621, 21, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (622, 22, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (623, 23, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (624, 24, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (625, 25, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (626, 26, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (627, 27, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (628, 28, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (629, 29, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (630, 30, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (631, 31, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (632, 32, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (633, 33, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (634, 34, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (635, 35, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (636, 36, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (637, 37, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (638, 38, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (639, 39, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (640, 40, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (641, 41, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (642, 42, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (643, 43, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (644, 44, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (645, 45, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (646, 46, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (647, 47, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (648, 48, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (649, 49, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (650, 50, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (651, 51, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (652, 52, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (653, 53, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (654, 54, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (655, 55, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (656, 56, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (657, 57, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (658, 58, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (659, 59, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (660, 60, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (661, 61, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (662, 62, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (663, 63, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (664, 64, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (665, 65, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (666, 66, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (667, 67, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (668, 68, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (669, 69, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (670, 70, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (671, 71, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (672, 72, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (673, 73, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (674, 74, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (675, 75, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (676, 76, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (677, 77, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (678, 78, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (679, 79, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (680, 80, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (681, 81, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (682, 82, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (683, 83, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (684, 84, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (685, 85, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (686, 86, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (687, 87, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (688, 88, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (689, 89, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (690, 90, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (691, 91, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (692, 92, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (693, 93, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (694, 94, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (695, 95, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (696, 96, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (697, 97, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (698, 98, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (699, 99, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (700, 100, N'Municipio7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (701, 1, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (702, 2, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (703, 3, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (704, 4, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (705, 5, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (706, 6, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (707, 7, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (708, 8, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (709, 9, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (710, 10, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (711, 11, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (712, 12, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (713, 13, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (714, 14, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (715, 15, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (716, 16, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (717, 17, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (718, 18, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (719, 19, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (720, 20, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (721, 21, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (722, 22, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (723, 23, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (724, 24, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (725, 25, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (726, 26, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (727, 27, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (728, 28, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (729, 29, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (730, 30, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (731, 31, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (732, 32, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (733, 33, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (734, 34, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (735, 35, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (736, 36, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (737, 37, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (738, 38, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (739, 39, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (740, 40, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (741, 41, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (742, 42, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (743, 43, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (744, 44, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (745, 45, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (746, 46, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (747, 47, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (748, 48, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (749, 49, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (750, 50, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (751, 51, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (752, 52, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (753, 53, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (754, 54, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (755, 55, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (756, 56, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (757, 57, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (758, 58, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (759, 59, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (760, 60, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (761, 61, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (762, 62, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (763, 63, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (764, 64, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (765, 65, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (766, 66, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (767, 67, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (768, 68, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (769, 69, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (770, 70, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (771, 71, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (772, 72, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (773, 73, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (774, 74, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (775, 75, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (776, 76, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (777, 77, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (778, 78, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (779, 79, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (780, 80, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (781, 81, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (782, 82, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (783, 83, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (784, 84, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (785, 85, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (786, 86, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (787, 87, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (788, 88, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (789, 89, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (790, 90, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (791, 91, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (792, 92, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (793, 93, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (794, 94, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (795, 95, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (796, 96, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (797, 97, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (798, 98, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (799, 99, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (800, 100, N'Municipio8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (801, 1, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (802, 2, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (803, 3, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (804, 4, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (805, 5, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (806, 6, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (807, 7, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (808, 8, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (809, 9, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (810, 10, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (811, 11, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (812, 12, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (813, 13, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (814, 14, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (815, 15, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (816, 16, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (817, 17, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (818, 18, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (819, 19, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (820, 20, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (821, 21, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (822, 22, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (823, 23, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (824, 24, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (825, 25, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (826, 26, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (827, 27, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (828, 28, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (829, 29, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (830, 30, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (831, 31, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (832, 32, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (833, 33, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (834, 34, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (835, 35, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (836, 36, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (837, 37, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (838, 38, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (839, 39, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (840, 40, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (841, 41, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (842, 42, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (843, 43, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (844, 44, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (845, 45, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (846, 46, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (847, 47, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (848, 48, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (849, 49, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (850, 50, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (851, 51, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (852, 52, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (853, 53, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (854, 54, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (855, 55, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (856, 56, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (857, 57, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (858, 58, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (859, 59, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (860, 60, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (861, 61, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (862, 62, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (863, 63, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (864, 64, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (865, 65, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (866, 66, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (867, 67, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (868, 68, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (869, 69, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (870, 70, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (871, 71, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (872, 72, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (873, 73, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (874, 74, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (875, 75, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (876, 76, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (877, 77, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (878, 78, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (879, 79, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (880, 80, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (881, 81, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (882, 82, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (883, 83, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (884, 84, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (885, 85, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (886, 86, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (887, 87, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (888, 88, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (889, 89, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (890, 90, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (891, 91, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (892, 92, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (893, 93, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (894, 94, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (895, 95, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (896, 96, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (897, 97, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (898, 98, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (899, 99, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (900, 100, N'Municipio9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (901, 1, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (902, 2, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (903, 3, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (904, 4, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (905, 5, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (906, 6, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (907, 7, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (908, 8, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (909, 9, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (910, 10, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (911, 11, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (912, 12, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (913, 13, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (914, 14, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (915, 15, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (916, 16, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (917, 17, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (918, 18, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (919, 19, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (920, 20, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (921, 21, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (922, 22, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (923, 23, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (924, 24, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (925, 25, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (926, 26, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (927, 27, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (928, 28, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (929, 29, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (930, 30, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (931, 31, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (932, 32, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (933, 33, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (934, 34, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (935, 35, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (936, 36, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (937, 37, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (938, 38, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (939, 39, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (940, 40, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (941, 41, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (942, 42, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (943, 43, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (944, 44, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (945, 45, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (946, 46, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (947, 47, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (948, 48, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (949, 49, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (950, 50, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (951, 51, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (952, 52, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (953, 53, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (954, 54, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (955, 55, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (956, 56, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (957, 57, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (958, 58, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (959, 59, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (960, 60, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (961, 61, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (962, 62, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (963, 63, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (964, 64, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (965, 65, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (966, 66, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (967, 67, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (968, 68, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (969, 69, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (970, 70, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (971, 71, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (972, 72, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (973, 73, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (974, 74, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (975, 75, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (976, 76, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (977, 77, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (978, 78, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (979, 79, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (980, 80, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (981, 81, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (982, 82, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (983, 83, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (984, 84, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (985, 85, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (986, 86, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (987, 87, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (988, 88, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (989, 89, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (990, 90, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (991, 91, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (992, 92, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (993, 93, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (994, 94, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (995, 95, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (996, 96, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (997, 97, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (998, 98, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (999, 99, N'Municipio10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio], [IdEstado], [NombreMunicipio], [Activo], [IsDeleted]) VALUES (1000, 100, N'Municipio10', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoMunicipio] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoTipoVehiculo] ON 
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (1, N'Tipo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (2, N'Tipo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (3, N'Tipo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (4, N'Tipo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (5, N'Tipo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (6, N'Tipo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (7, N'Tipo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (8, N'Tipo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (9, N'Tipo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo], [TipoVehiculo], [Activo], [IsDeleted]) VALUES (10, N'Tipo10', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoTipoVehiculo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoVehiculoMarca] ON 
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (1, 1, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (2, 1, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (3, 1, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (4, 1, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (5, 1, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (6, 1, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (7, 1, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (8, 1, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (9, 1, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (10, 1, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (11, 2, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (12, 2, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (13, 2, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (14, 2, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (15, 2, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (16, 2, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (17, 2, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (18, 2, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (19, 2, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (20, 2, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (21, 3, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (22, 3, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (23, 3, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (24, 3, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (25, 3, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (26, 3, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (27, 3, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (28, 3, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (29, 3, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (30, 3, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (31, 4, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (32, 4, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (33, 4, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (34, 4, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (35, 4, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (36, 4, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (37, 4, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (38, 4, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (39, 4, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (40, 4, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (41, 5, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (42, 5, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (43, 5, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (44, 5, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (45, 5, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (46, 5, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (47, 5, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (48, 5, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (49, 5, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (50, 5, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (51, 6, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (52, 6, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (53, 6, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (54, 6, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (55, 6, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (56, 6, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (57, 6, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (58, 6, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (59, 6, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (60, 6, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (61, 7, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (62, 7, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (63, 7, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (64, 7, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (65, 7, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (66, 7, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (67, 7, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (68, 7, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (69, 7, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (70, 7, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (71, 8, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (72, 8, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (73, 8, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (74, 8, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (75, 8, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (76, 8, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (77, 8, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (78, 8, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (79, 8, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (80, 8, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (81, 9, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (82, 9, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (83, 9, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (84, 9, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (85, 9, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (86, 9, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (87, 9, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (88, 9, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (89, 9, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (90, 9, N'Marca10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (91, 10, N'Marca1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (92, 10, N'Marca2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (93, 10, N'Marca3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (94, 10, N'Marca4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (95, 10, N'Marca5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (96, 10, N'Marca6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (97, 10, N'Marca7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (98, 10, N'Marca8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (99, 10, N'Marca9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca], [IdTipo], [Marca], [Activo], [IsDeleted]) VALUES (100, 10, N'Marca10', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoVehiculoMarca] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoVehiculoModelo] ON 
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (1, 1, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (2, 2, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (3, 3, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (4, 4, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (5, 5, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (6, 6, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (7, 7, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (8, 8, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (9, 9, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (10, 10, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (11, 11, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (12, 12, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (13, 13, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (14, 14, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (15, 15, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (16, 16, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (17, 17, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (18, 18, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (19, 19, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (20, 20, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (21, 21, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (22, 22, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (23, 23, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (24, 24, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (25, 25, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (26, 26, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (27, 27, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (28, 28, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (29, 29, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (30, 30, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (31, 31, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (32, 32, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (33, 33, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (34, 34, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (35, 35, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (36, 36, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (37, 37, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (38, 38, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (39, 39, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (40, 40, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (41, 41, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (42, 42, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (43, 43, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (44, 44, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (45, 45, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (46, 46, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (47, 47, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (48, 48, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (49, 49, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (50, 50, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (51, 51, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (52, 52, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (53, 53, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (54, 54, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (55, 55, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (56, 56, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (57, 57, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (58, 58, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (59, 59, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (60, 60, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (61, 61, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (62, 62, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (63, 63, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (64, 64, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (65, 65, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (66, 66, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (67, 67, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (68, 68, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (69, 69, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (70, 70, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (71, 71, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (72, 72, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (73, 73, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (74, 74, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (75, 75, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (76, 76, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (77, 77, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (78, 78, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (79, 79, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (80, 80, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (81, 81, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (82, 82, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (83, 83, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (84, 84, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (85, 85, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (86, 86, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (87, 87, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (88, 88, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (89, 89, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (90, 90, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (91, 91, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (92, 92, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (93, 93, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (94, 94, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (95, 95, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (96, 96, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (97, 97, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (98, 98, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (99, 99, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (100, 100, N'Modelo1', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (101, 1, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (102, 2, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (103, 3, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (104, 4, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (105, 5, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (106, 6, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (107, 7, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (108, 8, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (109, 9, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (110, 10, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (111, 11, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (112, 12, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (113, 13, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (114, 14, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (115, 15, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (116, 16, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (117, 17, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (118, 18, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (119, 19, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (120, 20, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (121, 21, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (122, 22, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (123, 23, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (124, 24, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (125, 25, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (126, 26, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (127, 27, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (128, 28, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (129, 29, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (130, 30, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (131, 31, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (132, 32, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (133, 33, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (134, 34, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (135, 35, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (136, 36, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (137, 37, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (138, 38, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (139, 39, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (140, 40, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (141, 41, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (142, 42, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (143, 43, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (144, 44, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (145, 45, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (146, 46, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (147, 47, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (148, 48, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (149, 49, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (150, 50, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (151, 51, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (152, 52, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (153, 53, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (154, 54, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (155, 55, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (156, 56, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (157, 57, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (158, 58, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (159, 59, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (160, 60, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (161, 61, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (162, 62, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (163, 63, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (164, 64, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (165, 65, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (166, 66, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (167, 67, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (168, 68, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (169, 69, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (170, 70, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (171, 71, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (172, 72, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (173, 73, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (174, 74, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (175, 75, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (176, 76, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (177, 77, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (178, 78, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (179, 79, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (180, 80, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (181, 81, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (182, 82, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (183, 83, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (184, 84, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (185, 85, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (186, 86, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (187, 87, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (188, 88, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (189, 89, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (190, 90, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (191, 91, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (192, 92, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (193, 93, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (194, 94, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (195, 95, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (196, 96, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (197, 97, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (198, 98, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (199, 99, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (200, 100, N'Modelo2', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (201, 1, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (202, 2, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (203, 3, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (204, 4, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (205, 5, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (206, 6, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (207, 7, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (208, 8, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (209, 9, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (210, 10, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (211, 11, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (212, 12, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (213, 13, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (214, 14, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (215, 15, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (216, 16, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (217, 17, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (218, 18, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (219, 19, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (220, 20, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (221, 21, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (222, 22, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (223, 23, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (224, 24, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (225, 25, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (226, 26, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (227, 27, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (228, 28, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (229, 29, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (230, 30, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (231, 31, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (232, 32, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (233, 33, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (234, 34, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (235, 35, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (236, 36, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (237, 37, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (238, 38, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (239, 39, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (240, 40, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (241, 41, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (242, 42, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (243, 43, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (244, 44, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (245, 45, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (246, 46, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (247, 47, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (248, 48, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (249, 49, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (250, 50, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (251, 51, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (252, 52, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (253, 53, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (254, 54, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (255, 55, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (256, 56, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (257, 57, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (258, 58, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (259, 59, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (260, 60, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (261, 61, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (262, 62, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (263, 63, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (264, 64, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (265, 65, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (266, 66, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (267, 67, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (268, 68, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (269, 69, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (270, 70, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (271, 71, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (272, 72, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (273, 73, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (274, 74, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (275, 75, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (276, 76, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (277, 77, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (278, 78, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (279, 79, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (280, 80, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (281, 81, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (282, 82, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (283, 83, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (284, 84, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (285, 85, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (286, 86, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (287, 87, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (288, 88, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (289, 89, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (290, 90, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (291, 91, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (292, 92, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (293, 93, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (294, 94, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (295, 95, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (296, 96, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (297, 97, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (298, 98, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (299, 99, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (300, 100, N'Modelo3', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (301, 1, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (302, 2, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (303, 3, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (304, 4, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (305, 5, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (306, 6, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (307, 7, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (308, 8, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (309, 9, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (310, 10, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (311, 11, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (312, 12, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (313, 13, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (314, 14, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (315, 15, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (316, 16, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (317, 17, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (318, 18, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (319, 19, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (320, 20, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (321, 21, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (322, 22, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (323, 23, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (324, 24, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (325, 25, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (326, 26, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (327, 27, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (328, 28, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (329, 29, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (330, 30, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (331, 31, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (332, 32, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (333, 33, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (334, 34, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (335, 35, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (336, 36, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (337, 37, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (338, 38, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (339, 39, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (340, 40, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (341, 41, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (342, 42, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (343, 43, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (344, 44, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (345, 45, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (346, 46, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (347, 47, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (348, 48, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (349, 49, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (350, 50, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (351, 51, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (352, 52, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (353, 53, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (354, 54, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (355, 55, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (356, 56, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (357, 57, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (358, 58, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (359, 59, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (360, 60, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (361, 61, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (362, 62, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (363, 63, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (364, 64, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (365, 65, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (366, 66, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (367, 67, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (368, 68, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (369, 69, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (370, 70, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (371, 71, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (372, 72, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (373, 73, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (374, 74, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (375, 75, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (376, 76, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (377, 77, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (378, 78, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (379, 79, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (380, 80, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (381, 81, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (382, 82, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (383, 83, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (384, 84, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (385, 85, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (386, 86, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (387, 87, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (388, 88, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (389, 89, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (390, 90, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (391, 91, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (392, 92, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (393, 93, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (394, 94, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (395, 95, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (396, 96, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (397, 97, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (398, 98, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (399, 99, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (400, 100, N'Modelo4', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (401, 1, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (402, 2, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (403, 3, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (404, 4, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (405, 5, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (406, 6, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (407, 7, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (408, 8, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (409, 9, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (410, 10, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (411, 11, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (412, 12, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (413, 13, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (414, 14, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (415, 15, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (416, 16, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (417, 17, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (418, 18, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (419, 19, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (420, 20, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (421, 21, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (422, 22, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (423, 23, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (424, 24, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (425, 25, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (426, 26, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (427, 27, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (428, 28, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (429, 29, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (430, 30, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (431, 31, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (432, 32, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (433, 33, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (434, 34, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (435, 35, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (436, 36, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (437, 37, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (438, 38, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (439, 39, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (440, 40, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (441, 41, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (442, 42, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (443, 43, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (444, 44, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (445, 45, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (446, 46, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (447, 47, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (448, 48, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (449, 49, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (450, 50, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (451, 51, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (452, 52, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (453, 53, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (454, 54, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (455, 55, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (456, 56, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (457, 57, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (458, 58, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (459, 59, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (460, 60, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (461, 61, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (462, 62, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (463, 63, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (464, 64, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (465, 65, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (466, 66, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (467, 67, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (468, 68, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (469, 69, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (470, 70, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (471, 71, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (472, 72, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (473, 73, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (474, 74, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (475, 75, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (476, 76, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (477, 77, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (478, 78, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (479, 79, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (480, 80, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (481, 81, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (482, 82, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (483, 83, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (484, 84, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (485, 85, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (486, 86, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (487, 87, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (488, 88, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (489, 89, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (490, 90, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (491, 91, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (492, 92, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (493, 93, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (494, 94, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (495, 95, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (496, 96, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (497, 97, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (498, 98, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (499, 99, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (500, 100, N'Modelo5', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (501, 1, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (502, 2, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (503, 3, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (504, 4, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (505, 5, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (506, 6, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (507, 7, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (508, 8, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (509, 9, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (510, 10, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (511, 11, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (512, 12, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (513, 13, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (514, 14, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (515, 15, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (516, 16, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (517, 17, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (518, 18, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (519, 19, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (520, 20, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (521, 21, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (522, 22, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (523, 23, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (524, 24, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (525, 25, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (526, 26, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (527, 27, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (528, 28, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (529, 29, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (530, 30, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (531, 31, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (532, 32, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (533, 33, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (534, 34, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (535, 35, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (536, 36, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (537, 37, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (538, 38, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (539, 39, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (540, 40, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (541, 41, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (542, 42, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (543, 43, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (544, 44, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (545, 45, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (546, 46, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (547, 47, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (548, 48, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (549, 49, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (550, 50, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (551, 51, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (552, 52, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (553, 53, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (554, 54, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (555, 55, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (556, 56, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (557, 57, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (558, 58, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (559, 59, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (560, 60, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (561, 61, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (562, 62, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (563, 63, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (564, 64, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (565, 65, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (566, 66, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (567, 67, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (568, 68, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (569, 69, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (570, 70, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (571, 71, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (572, 72, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (573, 73, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (574, 74, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (575, 75, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (576, 76, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (577, 77, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (578, 78, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (579, 79, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (580, 80, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (581, 81, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (582, 82, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (583, 83, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (584, 84, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (585, 85, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (586, 86, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (587, 87, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (588, 88, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (589, 89, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (590, 90, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (591, 91, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (592, 92, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (593, 93, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (594, 94, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (595, 95, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (596, 96, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (597, 97, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (598, 98, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (599, 99, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (600, 100, N'Modelo6', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (601, 1, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (602, 2, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (603, 3, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (604, 4, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (605, 5, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (606, 6, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (607, 7, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (608, 8, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (609, 9, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (610, 10, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (611, 11, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (612, 12, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (613, 13, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (614, 14, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (615, 15, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (616, 16, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (617, 17, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (618, 18, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (619, 19, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (620, 20, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (621, 21, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (622, 22, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (623, 23, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (624, 24, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (625, 25, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (626, 26, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (627, 27, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (628, 28, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (629, 29, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (630, 30, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (631, 31, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (632, 32, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (633, 33, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (634, 34, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (635, 35, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (636, 36, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (637, 37, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (638, 38, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (639, 39, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (640, 40, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (641, 41, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (642, 42, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (643, 43, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (644, 44, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (645, 45, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (646, 46, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (647, 47, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (648, 48, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (649, 49, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (650, 50, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (651, 51, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (652, 52, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (653, 53, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (654, 54, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (655, 55, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (656, 56, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (657, 57, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (658, 58, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (659, 59, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (660, 60, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (661, 61, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (662, 62, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (663, 63, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (664, 64, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (665, 65, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (666, 66, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (667, 67, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (668, 68, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (669, 69, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (670, 70, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (671, 71, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (672, 72, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (673, 73, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (674, 74, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (675, 75, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (676, 76, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (677, 77, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (678, 78, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (679, 79, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (680, 80, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (681, 81, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (682, 82, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (683, 83, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (684, 84, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (685, 85, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (686, 86, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (687, 87, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (688, 88, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (689, 89, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (690, 90, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (691, 91, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (692, 92, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (693, 93, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (694, 94, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (695, 95, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (696, 96, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (697, 97, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (698, 98, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (699, 99, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (700, 100, N'Modelo7', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (701, 1, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (702, 2, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (703, 3, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (704, 4, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (705, 5, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (706, 6, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (707, 7, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (708, 8, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (709, 9, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (710, 10, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (711, 11, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (712, 12, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (713, 13, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (714, 14, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (715, 15, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (716, 16, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (717, 17, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (718, 18, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (719, 19, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (720, 20, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (721, 21, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (722, 22, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (723, 23, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (724, 24, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (725, 25, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (726, 26, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (727, 27, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (728, 28, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (729, 29, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (730, 30, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (731, 31, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (732, 32, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (733, 33, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (734, 34, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (735, 35, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (736, 36, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (737, 37, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (738, 38, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (739, 39, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (740, 40, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (741, 41, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (742, 42, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (743, 43, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (744, 44, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (745, 45, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (746, 46, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (747, 47, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (748, 48, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (749, 49, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (750, 50, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (751, 51, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (752, 52, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (753, 53, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (754, 54, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (755, 55, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (756, 56, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (757, 57, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (758, 58, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (759, 59, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (760, 60, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (761, 61, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (762, 62, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (763, 63, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (764, 64, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (765, 65, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (766, 66, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (767, 67, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (768, 68, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (769, 69, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (770, 70, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (771, 71, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (772, 72, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (773, 73, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (774, 74, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (775, 75, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (776, 76, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (777, 77, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (778, 78, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (779, 79, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (780, 80, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (781, 81, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (782, 82, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (783, 83, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (784, 84, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (785, 85, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (786, 86, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (787, 87, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (788, 88, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (789, 89, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (790, 90, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (791, 91, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (792, 92, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (793, 93, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (794, 94, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (795, 95, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (796, 96, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (797, 97, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (798, 98, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (799, 99, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (800, 100, N'Modelo8', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (801, 1, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (802, 2, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (803, 3, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (804, 4, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (805, 5, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (806, 6, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (807, 7, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (808, 8, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (809, 9, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (810, 10, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (811, 11, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (812, 12, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (813, 13, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (814, 14, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (815, 15, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (816, 16, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (817, 17, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (818, 18, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (819, 19, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (820, 20, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (821, 21, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (822, 22, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (823, 23, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (824, 24, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (825, 25, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (826, 26, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (827, 27, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (828, 28, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (829, 29, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (830, 30, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (831, 31, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (832, 32, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (833, 33, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (834, 34, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (835, 35, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (836, 36, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (837, 37, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (838, 38, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (839, 39, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (840, 40, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (841, 41, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (842, 42, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (843, 43, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (844, 44, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (845, 45, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (846, 46, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (847, 47, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (848, 48, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (849, 49, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (850, 50, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (851, 51, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (852, 52, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (853, 53, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (854, 54, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (855, 55, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (856, 56, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (857, 57, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (858, 58, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (859, 59, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (860, 60, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (861, 61, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (862, 62, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (863, 63, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (864, 64, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (865, 65, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (866, 66, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (867, 67, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (868, 68, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (869, 69, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (870, 70, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (871, 71, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (872, 72, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (873, 73, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (874, 74, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (875, 75, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (876, 76, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (877, 77, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (878, 78, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (879, 79, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (880, 80, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (881, 81, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (882, 82, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (883, 83, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (884, 84, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (885, 85, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (886, 86, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (887, 87, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (888, 88, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (889, 89, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (890, 90, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (891, 91, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (892, 92, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (893, 93, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (894, 94, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (895, 95, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (896, 96, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (897, 97, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (898, 98, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (899, 99, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (900, 100, N'Modelo9', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (901, 1, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (902, 2, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (903, 3, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (904, 4, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (905, 5, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (906, 6, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (907, 7, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (908, 8, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (909, 9, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (910, 10, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (911, 11, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (912, 12, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (913, 13, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (914, 14, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (915, 15, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (916, 16, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (917, 17, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (918, 18, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (919, 19, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (920, 20, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (921, 21, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (922, 22, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (923, 23, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (924, 24, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (925, 25, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (926, 26, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (927, 27, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (928, 28, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (929, 29, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (930, 30, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (931, 31, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (932, 32, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (933, 33, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (934, 34, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (935, 35, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (936, 36, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (937, 37, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (938, 38, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (939, 39, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (940, 40, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (941, 41, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (942, 42, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (943, 43, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (944, 44, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (945, 45, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (946, 46, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (947, 47, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (948, 48, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (949, 49, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (950, 50, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (951, 51, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (952, 52, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (953, 53, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (954, 54, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (955, 55, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (956, 56, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (957, 57, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (958, 58, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (959, 59, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (960, 60, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (961, 61, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (962, 62, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (963, 63, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (964, 64, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (965, 65, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (966, 66, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (967, 67, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (968, 68, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (969, 69, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (970, 70, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (971, 71, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (972, 72, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (973, 73, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (974, 74, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (975, 75, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (976, 76, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (977, 77, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (978, 78, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (979, 79, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (980, 80, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (981, 81, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (982, 82, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (983, 83, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (984, 84, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (985, 85, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (986, 86, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (987, 87, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (988, 88, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (989, 89, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (990, 90, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (991, 91, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (992, 92, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (993, 93, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (994, 94, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (995, 95, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (996, 96, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (997, 97, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (998, 98, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (999, 99, N'Modelo10', 1, 0)
GO
INSERT [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo], [IdMarca], [Modelo], [Activo], [IsDeleted]) VALUES (1000, 100, N'Modelo10', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_CatalogoVehiculoModelo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Cliente] ON 
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (1, 1, N'Cliente 1', 1, 1, 1, CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (2, 2, N'Cliente 2', 1, 2, 2, CAST(15.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(17.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (3, 1, N'Cliente 3', 1, 1, 1, CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (4, 2, N'Cliente 4', 1, 2, 2, CAST(15.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(17.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (5, 1, N'Cliente 5', 1, 1, 1, CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (6, 2, N'Cliente 6', 1, 2, 2, CAST(15.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(17.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (7, 1, N'Cliente 7', 1, 1, 1, CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (8, 2, N'Cliente 8', 1, 2, 2, CAST(15.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(17.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (9, 1, N'Cliente 9', 1, 1, 1, CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Cliente] ([IdCliente], [Clave], [NombreCliente], [IdEstado], [IdMunicipio], [IdZona], [Tarifa], [TarifaHoraAdicional], [TarifaConAyudante], [TarifaSpot], [IsDeleted]) VALUES (10, 2, N'Cliente 10', 1, 2, 2, CAST(15.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(17.50 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ContactoCliente] ON 
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (1, 1, N'Contacto 1', N'contacto1@cliente1.com', N'1234567890', N'0987654321', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (2, 2, N'Contacto 2', N'contacto2@cliente2.com', N'2345678901', N'1098765432', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (3, 1, N'Contacto 1', N'contacto1@cliente1.com', N'1234567890', N'0987654321', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (4, 2, N'Contacto 2', N'contacto2@cliente2.com', N'2345678901', N'1098765432', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (5, 3, N'Contacto 3', N'contacto3@cliente3.com', N'3456789012', N'2109876543', 1, 2, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (6, 3, N'Contacto 4', N'contacto4@cliente3.com', N'4567890123', N'3210987654', 1, 2, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (7, 4, N'Contacto 5', N'contacto5@cliente4.com', N'5678901234', N'4321098765', 1, 2, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (8, 4, N'Contacto 6', N'contacto6@cliente4.com', N'6789012345', N'5432109876', 1, 2, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (9, 5, N'Contacto 7', N'contacto7@cliente5.com', N'7890123456', N'6543210987', 1, 2, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (10, 5, N'Contacto 8', N'contacto8@cliente5.com', N'8901234567', N'7654321098', 1, 2, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (11, 6, N'Contacto 9', N'contacto9@cliente6.com', N'9012345678', N'8765432109', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (12, 6, N'Contacto 10', N'contacto10@cliente6.com', N'0123456789', N'9876543210', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (13, 7, N'Contacto 11', N'contacto11@cliente7.com', N'1234567890', N'0987654321', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (14, 7, N'Contacto 12', N'contacto12@cliente7.com', N'2345678901', N'1098765432', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (15, 8, N'Contacto 13', N'contacto13@cliente8.com', N'3456789012', N'2109876543', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (16, 8, N'Contacto 14', N'contacto14@cliente8.com', N'4567890123', N'3210987654', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (17, 9, N'Contacto 15', N'contacto15@cliente9.com', N'5678901234', N'4321098765', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (18, 9, N'Contacto 16', N'contacto16@cliente9.com', N'6789012345', N'5432109876', 1, 1, 0)
GO
INSERT [dbo].[tbl_ContactoCliente] ([IdContacto], [IdCliente], [Nombre], [email], [telefono], [telefono2], [Activo], [TipoContacto], [IsDeleted]) VALUES (19, 10, N'Contacto 17', N'contacto17@cliente10.com', N'7890123456', N'6543210987', 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ContactoCliente] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetallePlanificacion] ON 
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), 1, 3, CAST(N'2023-06-10' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), 1, 3, CAST(N'2023-06-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), 1, 3, CAST(N'2023-06-05' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), 1, 3, CAST(N'2023-06-06' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 1, 3, CAST(N'2023-06-07' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), 1, 3, CAST(N'2023-06-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(9 AS Decimal(18, 0)), 1, 3, CAST(N'2023-06-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-05' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-06' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-07' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-10' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-13' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-15' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-17' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
INSERT [dbo].[tbl_DetallePlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [IdTienda], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(24 AS Decimal(18, 0)), 2, 4, CAST(N'2023-06-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_DetallePlanificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EjecucionPlanificacion] ON 
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), 1, 2, CAST(N'2023-06-10' AS Date), CAST(N'08:50:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, CAST(1 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), 1, 2, CAST(N'2023-06-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, CAST(2 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), 1, 2, CAST(N'2023-06-05' AS Date), CAST(N'08:30:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, CAST(3 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), 1, 2, CAST(N'2023-06-06' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, CAST(4 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 1, 2, CAST(N'2023-06-07' AS Date), CAST(N'08:00:00' AS Time), CAST(N'16:40:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, CAST(5 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), 1, 2, CAST(N'2023-06-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, CAST(6 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(9 AS Decimal(18, 0)), 1, 2, CAST(N'2023-06-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, CAST(7 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(8 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-05' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(9 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-06' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(10 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-07' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(11 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(12 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(13 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-10' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(14 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(15 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(16 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-13' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(17 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(18 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-15' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(19 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(20 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-17' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(21 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(24 AS Decimal(18, 0)), 2, 2, CAST(N'2023-06-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(22 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(23 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(24 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-05' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(25 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-06' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(26 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-07' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(27 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(28 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(29 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-10' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(30 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(31 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(32 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-13' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(33 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(34 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-15' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(35 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(36 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-17' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(37 AS Decimal(18, 0)), N'')
GO
INSERT [dbo].[tbl_EjecucionPlanificacion] ([IdPlanificacion], [IdDetallePlanificacion], [IdOperador], [TipoRegistro], [Fecha], [HoraInicio], [HoraFin], [Descanso], [IsDeleted], [DescuentoTardanza], [IncentivoFactura], [MontoHorasExtras], [IdTienda], [IdEjecucionPlanificacion], [Justificacion]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 4, 1, CAST(N'2023-06-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, CAST(38 AS Decimal(18, 0)), N'')
GO
SET IDENTITY_INSERT [dbo].[tbl_EjecucionPlanificacion] OFF
GO
INSERT [dbo].[tbl_EmpleadoCoordinador] ([IdOperador], [IdCoordinador], [IsDeleted]) VALUES (1, 3, 0)
GO
INSERT [dbo].[tbl_EmpleadoCoordinador] ([IdOperador], [IdCoordinador], [IsDeleted]) VALUES (2, 3, 0)
GO
INSERT [dbo].[tbl_EmpleadoCoordinador] ([IdOperador], [IdCoordinador], [IsDeleted]) VALUES (4, 3, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EmpleadoCuentaBancaria] ON 
GO
INSERT [dbo].[tbl_EmpleadoCuentaBancaria] ([IdCuenta], [IdEmpleado], [IdBanco], [CuentaBancaria], [Activa], [CuentaPrincipal], [IsDeleted]) VALUES (1, 2, 1, N'1223', 1, 1, 0)
GO
INSERT [dbo].[tbl_EmpleadoCuentaBancaria] ([IdCuenta], [IdEmpleado], [IdBanco], [CuentaBancaria], [Activa], [CuentaPrincipal], [IsDeleted]) VALUES (2, 2, 2, N'12234', 1, 0, 0)
GO
INSERT [dbo].[tbl_EmpleadoCuentaBancaria] ([IdCuenta], [IdEmpleado], [IdBanco], [CuentaBancaria], [Activa], [CuentaPrincipal], [IsDeleted]) VALUES (3, 1, 1, N'12235', 1, 1, 0)
GO
INSERT [dbo].[tbl_EmpleadoCuentaBancaria] ([IdCuenta], [IdEmpleado], [IdBanco], [CuentaBancaria], [Activa], [CuentaPrincipal], [IsDeleted]) VALUES (4, 1, 2, N'122345', 1, 0, 0)
GO
INSERT [dbo].[tbl_EmpleadoCuentaBancaria] ([IdCuenta], [IdEmpleado], [IdBanco], [CuentaBancaria], [Activa], [CuentaPrincipal], [IsDeleted]) VALUES (5, 4, 1, N'12236', 1, 1, 0)
GO
INSERT [dbo].[tbl_EmpleadoCuentaBancaria] ([IdCuenta], [IdEmpleado], [IdBanco], [CuentaBancaria], [Activa], [CuentaPrincipal], [IsDeleted]) VALUES (6, 4, 2, N'122346', 1, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EmpleadoCuentaBancaria] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Empleados] ON 
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (1, CAST(1 AS Numeric(18, 0)), N'Empleado 1', N'Materno1', N'Paterno1', N'Direccion 1', 1, N'1234567890', N'empleado1@email.com', CAST(1000.00 AS Decimal(18, 2)), 2, 1, CAST(1.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (2, CAST(2 AS Numeric(18, 0)), N'Empleado 2', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado2@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (3, CAST(1 AS Numeric(18, 0)), N'Empleado 3', N'Materno1', N'Paterno1', N'Direccion 1', 1, N'1234567890', N'empleado3@email.com', CAST(1000.00 AS Decimal(18, 2)), 3, 1, CAST(1.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (4, CAST(2 AS Numeric(18, 0)), N'Empleado 4', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado4@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (5, CAST(1 AS Numeric(18, 0)), N'Empleado 5', N'Materno1', N'Paterno1', N'Direccion 1', 1, N'1234567890', N'empleado5@email.com', CAST(1000.00 AS Decimal(18, 2)), 2, 1, CAST(1.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (6, CAST(2 AS Numeric(18, 0)), N'Empleado 6', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado6@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (7, CAST(1 AS Numeric(18, 0)), N'Empleado 7', N'Materno1', N'Paterno1', N'Direccion 1', 1, N'1234567890', N'empleado7@email.com', CAST(1000.00 AS Decimal(18, 2)), 2, 1, CAST(1.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (8, CAST(2 AS Numeric(18, 0)), N'Empleado 8', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado8@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (9, CAST(1 AS Numeric(18, 0)), N'Empleado 9', N'Materno1', N'Paterno1', N'Direccion 1', 1, N'1234567890', N'empleado9@email.com', CAST(1000.00 AS Decimal(18, 2)), 3, 1, CAST(1.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (10, CAST(2 AS Numeric(18, 0)), N'Empleado 10', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado10@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (11, CAST(2 AS Numeric(18, 0)), N'Empleado 11', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado11@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (12, CAST(2 AS Numeric(18, 0)), N'Empleado 12', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado12@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (13, CAST(2 AS Numeric(18, 0)), N'Empleado 13', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado13@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (14, CAST(2 AS Numeric(18, 0)), N'Empleado 14', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado14@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[tbl_Empleados] ([IdEmpleado], [NumeroContrato], [Nombres], [ApellidoMaterno], [ApellidoPaterno], [Direccion], [IdMunicipio], [Telefono], [Correo], [Salario], [IdTipoEmpleado], [IdSegmento], [SMG], [IsDeleted]) VALUES (15, CAST(2 AS Numeric(18, 0)), N'Empleado 15', N'Materno2', N'Paterno2', N'Direccion 2', 2, N'2345678901', N'empleado15@email.com', CAST(2000.00 AS Decimal(18, 2)), 1, 2, CAST(1.70 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_Empleados] OFF
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (1, 11, 0)
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (2, 12, 0)
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (3, 13, 0)
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (4, 14, 0)
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (5, 15, 0)
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (6, 16, 0)
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (7, 17, 0)
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (8, 18, 0)
GO
INSERT [dbo].[tbl_GerenteSubGerente] ([IdGerente], [IdSubGerente], [IsDeleted]) VALUES (9, 19, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_Planificacion] ON 
GO
INSERT [dbo].[tbl_Planificacion] ([IdPlanificacion], [FechaDesde], [FechaHasta], [Comentario], [IdCoordinador], [IsDeleted], [EstatusPlanificacionId], [FrecuenciaId]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(N'2023-06-04' AS Date), CAST(N'2023-06-10' AS Date), N'string', 1, 0, 3, 1)
GO
INSERT [dbo].[tbl_Planificacion] ([IdPlanificacion], [FechaDesde], [FechaHasta], [Comentario], [IdCoordinador], [IsDeleted], [EstatusPlanificacionId], [FrecuenciaId]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(N'2023-06-04' AS Date), CAST(N'2023-06-18' AS Date), N'string', 5, 0, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[tbl_Planificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Tienda] ON 
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (3, N'Tienda1', 11, 1, 1, CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), 1, 5, 5, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (4, N'Tienda2', 12, 2, 2, CAST(15.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), 1, 7, 7, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (5, N'Tienda3', 13, 3, 3, CAST(20.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), 1, 9, 9, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (6, N'Tienda4', 14, 1, 4, CAST(25.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 1, 11, 11, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (7, N'Tienda5', 15, 2, 5, CAST(30.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), 1, 13, 13, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (8, N'Tienda6', 16, 3, 6, CAST(35.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(280.00 AS Decimal(18, 2)), 1, 15, 15, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (9, N'Tienda7', 17, 1, 7, CAST(40.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(320.00 AS Decimal(18, 2)), 1, 17, 17, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (10, N'Tienda8', 18, 2, 8, CAST(45.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(360.00 AS Decimal(18, 2)), 1, 19, 19, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (11, N'Tienda9', 19, 3, 9, CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, 21, 21, 2, 0)
GO
INSERT [dbo].[tbl_Tienda] ([IdTienda], [NombreTienda], [IdSubGerente], [IdEstado], [IdZonaSted], [NumUnidades], [UnidadesMaximas], [Tarifa], [TarifaDescanso], [Activa], [CntEmpleadosInterno], [CntEmpleadosExterno], [CntEmpleadosSpot], [IsDeleted]) VALUES (12, N'Tienda10', 19, 3, 10, CAST(55.00 AS Decimal(18, 2)), CAST(110.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), CAST(440.00 AS Decimal(18, 2)), 1, 23, 23, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_Tienda] OFF
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (3, 1, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (4, 1, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (5, 1, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (6, 5, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (7, 5, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (8, 7, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (9, 7, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (10, 7, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (11, 1, 0)
GO
INSERT [dbo].[tbl_TiendaCoordinador] ([IdTienda], [IdCoordinador], [IsDeleted]) VALUES (12, 5, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_Zona] ON 
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (1, N'Zona1', N'DET1', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (2, N'Zona2', N'DET2', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (3, N'Zona3', N'DET3', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (4, N'Zona4', N'DET4', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (5, N'Zona5', N'DET5', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (6, N'Zona6', N'DET6', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (7, N'Zona7', N'DET7', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (8, N'Zona8', N'DET8', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (9, N'Zona9', N'DET9', 1, 0)
GO
INSERT [dbo].[tbl_Zona] ([IdZona], [NombreZona], [ClaveDET], [Activa], [IsDeleted]) VALUES (10, N'Zona10', N'DET10', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_Zona] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ZonaSted] ON 
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (1, N'Zona Sted 1', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (2, N'Zona Sted 2', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (3, N'Zona Sted 3', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (4, N'Zona Sted 4', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (5, N'Zona Sted 5', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (6, N'Zona Sted 6', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (7, N'Zona Sted 7', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (8, N'Zona Sted 8', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (9, N'Zona Sted 9', N'1', 1, 1, 0)
GO
INSERT [dbo].[tbl_ZonaSted] ([IdZonaSted], [NombreZona], [ClaveDET], [Activa], [IdCliente], [IsDeleted]) VALUES (10, N'Zona Sted 10', N'1', 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ZonaSted] OFF
GO
ALTER TABLE [dbo].[tbl_AsignacionTarjeta] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CatalogoBancos] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CatalogoDias] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CatalogoEstado] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CatalogoMunicipio] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CatalogoTipoVehiculo] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CatalogoVehiculoMarca] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CatalogoVehiculoModelo] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CheckIn_CheckOut] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Cliente] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_ContactoCliente] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_CoordinadorCliente] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_DetallePlanificacion] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_DetalleTarjeta] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_DirectorSubDirector] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] ADD  DEFAULT ((0.0)) FOR [DescuentoTardanza]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] ADD  DEFAULT ((0.0)) FOR [IncentivoFactura]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] ADD  DEFAULT ((0.0)) FOR [MontoHorasExtras]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] ADD  DEFAULT ((0)) FOR [IdTienda]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] ADD  DEFAULT (N'') FOR [Justificacion]
GO
ALTER TABLE [dbo].[tbl_EmpleadoCoordinador] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_EmpleadoCuentaBancaria] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Empleados] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Formato] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_FormatoCliente] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_GerenteSubGerente] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Horario] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_HorarioEmpleado] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_MunicipioCliente] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Planificacion] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Planificacion] ADD  DEFAULT ((0)) FOR [EstatusPlanificacionId]
GO
ALTER TABLE [dbo].[tbl_Planificacion] ADD  DEFAULT ((0)) FOR [FrecuenciaId]
GO
ALTER TABLE [dbo].[tbl_SubDirectorCoordinador] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_TarifasTipoVehiculo] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Tienda] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_TiendaCoordinador] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Vehiculo] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_VehiculoOperador] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_Zona] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tbl_ZonaSted] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[tbl_AsignacionTarjeta]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionTarjeta_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_AsignacionTarjeta] CHECK CONSTRAINT [FK_AsignacionTarjeta_Empleados]
GO
ALTER TABLE [dbo].[tbl_CatalogoEstado]  WITH CHECK ADD  CONSTRAINT [FK_Estados_Zona] FOREIGN KEY([IdZona])
REFERENCES [dbo].[tbl_Zona] ([IdZona])
GO
ALTER TABLE [dbo].[tbl_CatalogoEstado] CHECK CONSTRAINT [FK_Estados_Zona]
GO
ALTER TABLE [dbo].[tbl_CatalogoMunicipio]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[tbl_CatalogoEstado] ([IdEstado])
GO
ALTER TABLE [dbo].[tbl_CatalogoMunicipio] CHECK CONSTRAINT [FK_Municipio_Estado]
GO
ALTER TABLE [dbo].[tbl_CatalogoVehiculoMarca]  WITH CHECK ADD  CONSTRAINT [FK_VehiculoMarca_TipoVehiculo] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo])
GO
ALTER TABLE [dbo].[tbl_CatalogoVehiculoMarca] CHECK CONSTRAINT [FK_VehiculoMarca_TipoVehiculo]
GO
ALTER TABLE [dbo].[tbl_CatalogoVehiculoModelo]  WITH CHECK ADD  CONSTRAINT [FK_VehiculoModelo_VehiculoMarca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca])
GO
ALTER TABLE [dbo].[tbl_CatalogoVehiculoModelo] CHECK CONSTRAINT [FK_VehiculoModelo_VehiculoMarca]
GO
ALTER TABLE [dbo].[tbl_CheckIn_CheckOut]  WITH CHECK ADD  CONSTRAINT [FK_CheckIn_CheckOut_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_CheckIn_CheckOut] CHECK CONSTRAINT [FK_CheckIn_CheckOut_Empleado]
GO
ALTER TABLE [dbo].[tbl_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[tbl_CatalogoEstado] ([IdEstado])
GO
ALTER TABLE [dbo].[tbl_Cliente] CHECK CONSTRAINT [FK_Clientes_Estado]
GO
ALTER TABLE [dbo].[tbl_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Municipio] FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio])
GO
ALTER TABLE [dbo].[tbl_Cliente] CHECK CONSTRAINT [FK_Clientes_Municipio]
GO
ALTER TABLE [dbo].[tbl_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Cliente_tbl_Zona_IdZona] FOREIGN KEY([IdZona])
REFERENCES [dbo].[tbl_Zona] ([IdZona])
GO
ALTER TABLE [dbo].[tbl_Cliente] CHECK CONSTRAINT [FK_tbl_Cliente_tbl_Zona_IdZona]
GO
ALTER TABLE [dbo].[tbl_ContactoCliente]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tbl_Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[tbl_ContactoCliente] CHECK CONSTRAINT [FK_Contacto_Cliente]
GO
ALTER TABLE [dbo].[tbl_CoordinadorCliente]  WITH CHECK ADD  CONSTRAINT [FK_CoordinadorCliente_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tbl_Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[tbl_CoordinadorCliente] CHECK CONSTRAINT [FK_CoordinadorCliente_Cliente]
GO
ALTER TABLE [dbo].[tbl_CoordinadorCliente]  WITH CHECK ADD  CONSTRAINT [FK_CoordinadorCliente_Coordinador] FOREIGN KEY([IdCoordinador])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_CoordinadorCliente] CHECK CONSTRAINT [FK_CoordinadorCliente_Coordinador]
GO
ALTER TABLE [dbo].[tbl_DetallePlanificacion]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Planificacion] FOREIGN KEY([IdPlanificacion])
REFERENCES [dbo].[tbl_Planificacion] ([IdPlanificacion])
GO
ALTER TABLE [dbo].[tbl_DetallePlanificacion] CHECK CONSTRAINT [FK_Detalle_Planificacion]
GO
ALTER TABLE [dbo].[tbl_DetallePlanificacion]  WITH CHECK ADD  CONSTRAINT [FK_DetallePlanificacion_Operador] FOREIGN KEY([IdOperador])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_DetallePlanificacion] CHECK CONSTRAINT [FK_DetallePlanificacion_Operador]
GO
ALTER TABLE [dbo].[tbl_DetallePlanificacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetallePlanificacion_tbl_Tienda_IdTienda] FOREIGN KEY([IdTienda])
REFERENCES [dbo].[tbl_Tienda] ([IdTienda])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_DetallePlanificacion] CHECK CONSTRAINT [FK_tbl_DetallePlanificacion_tbl_Tienda_IdTienda]
GO
ALTER TABLE [dbo].[tbl_DetalleTarjeta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleTarjeta_AsignacionTarjeta] FOREIGN KEY([IdTarjeta])
REFERENCES [dbo].[tbl_AsignacionTarjeta] ([IdTarjeta])
GO
ALTER TABLE [dbo].[tbl_DetalleTarjeta] CHECK CONSTRAINT [FK_DetalleTarjeta_AsignacionTarjeta]
GO
ALTER TABLE [dbo].[tbl_DetalleTarjeta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleTarjeta_Coordinador] FOREIGN KEY([IdCordinador])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_DetalleTarjeta] CHECK CONSTRAINT [FK_DetalleTarjeta_Coordinador]
GO
ALTER TABLE [dbo].[tbl_DetalleTarjeta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleTarjeta_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_DetalleTarjeta] CHECK CONSTRAINT [FK_DetalleTarjeta_Empleado]
GO
ALTER TABLE [dbo].[tbl_DirectorSubDirector]  WITH CHECK ADD  CONSTRAINT [FK_DirectorSubDirector_Director] FOREIGN KEY([IdDirector])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_DirectorSubDirector] CHECK CONSTRAINT [FK_DirectorSubDirector_Director]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion]  WITH CHECK ADD  CONSTRAINT [FK_Ejecucion_Planificacion] FOREIGN KEY([IdPlanificacion])
REFERENCES [dbo].[tbl_Planificacion] ([IdPlanificacion])
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] CHECK CONSTRAINT [FK_Ejecucion_Planificacion]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion]  WITH CHECK ADD  CONSTRAINT [FK_EjecucionPlanificacion_Operador] FOREIGN KEY([IdOperador])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] CHECK CONSTRAINT [FK_EjecucionPlanificacion_Operador]
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EjecucionPlanificacion_tbl_Tienda_IdTienda] FOREIGN KEY([IdTienda])
REFERENCES [dbo].[tbl_Tienda] ([IdTienda])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_EjecucionPlanificacion] CHECK CONSTRAINT [FK_tbl_EjecucionPlanificacion_tbl_Tienda_IdTienda]
GO
ALTER TABLE [dbo].[tbl_EmpleadoCoordinador]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoCoordinador_Coordinador] FOREIGN KEY([IdCoordinador])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_EmpleadoCoordinador] CHECK CONSTRAINT [FK_EmpleadoCoordinador_Coordinador]
GO
ALTER TABLE [dbo].[tbl_EmpleadoCuentaBancaria]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoCuentaBancaria_Bancos] FOREIGN KEY([IdBanco])
REFERENCES [dbo].[tbl_CatalogoBancos] ([IdBanco])
GO
ALTER TABLE [dbo].[tbl_EmpleadoCuentaBancaria] CHECK CONSTRAINT [FK_EmpleadoCuentaBancaria_Bancos]
GO
ALTER TABLE [dbo].[tbl_EmpleadoCuentaBancaria]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoCuentaBancaria_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_EmpleadoCuentaBancaria] CHECK CONSTRAINT [FK_EmpleadoCuentaBancaria_Empleados]
GO
ALTER TABLE [dbo].[tbl_Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Municipio] FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio])
GO
ALTER TABLE [dbo].[tbl_Empleados] CHECK CONSTRAINT [FK_Empleados_Municipio]
GO
ALTER TABLE [dbo].[tbl_FormatoCliente]  WITH CHECK ADD  CONSTRAINT [FK_FormatoCliente_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tbl_Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[tbl_FormatoCliente] CHECK CONSTRAINT [FK_FormatoCliente_Cliente]
GO
ALTER TABLE [dbo].[tbl_FormatoCliente]  WITH CHECK ADD  CONSTRAINT [FK_FormatoCliente_Formato] FOREIGN KEY([IdFormato])
REFERENCES [dbo].[tbl_Formato] ([IdFormato])
GO
ALTER TABLE [dbo].[tbl_FormatoCliente] CHECK CONSTRAINT [FK_FormatoCliente_Formato]
GO
ALTER TABLE [dbo].[tbl_GerenteSubGerente]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_SubGerentes] FOREIGN KEY([IdSubGerente])
REFERENCES [dbo].[tbl_ContactoCliente] ([IdContacto])
GO
ALTER TABLE [dbo].[tbl_GerenteSubGerente] CHECK CONSTRAINT [FK_Contacto_SubGerentes]
GO
ALTER TABLE [dbo].[tbl_Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Dias] FOREIGN KEY([IdDia])
REFERENCES [dbo].[tbl_CatalogoDias] ([IdDia])
GO
ALTER TABLE [dbo].[tbl_Horario] CHECK CONSTRAINT [FK_Horario_Dias]
GO
ALTER TABLE [dbo].[tbl_HorarioEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_HorarioEmpleado_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_HorarioEmpleado] CHECK CONSTRAINT [FK_HorarioEmpleado_Empleado]
GO
ALTER TABLE [dbo].[tbl_HorarioEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_HorarioEmpleado_Horario] FOREIGN KEY([IdHorario])
REFERENCES [dbo].[tbl_Horario] ([IdHorario])
GO
ALTER TABLE [dbo].[tbl_HorarioEmpleado] CHECK CONSTRAINT [FK_HorarioEmpleado_Horario]
GO
ALTER TABLE [dbo].[tbl_MunicipioCliente]  WITH CHECK ADD  CONSTRAINT [FK_MunicipioCliente_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tbl_Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[tbl_MunicipioCliente] CHECK CONSTRAINT [FK_MunicipioCliente_Cliente]
GO
ALTER TABLE [dbo].[tbl_MunicipioCliente]  WITH CHECK ADD  CONSTRAINT [FK_MunicipioCliente_Formato] FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[tbl_CatalogoMunicipio] ([IdMunicipio])
GO
ALTER TABLE [dbo].[tbl_MunicipioCliente] CHECK CONSTRAINT [FK_MunicipioCliente_Formato]
GO
ALTER TABLE [dbo].[tbl_Planificacion]  WITH CHECK ADD  CONSTRAINT [FK_Planificacion_Coordinador] FOREIGN KEY([IdCoordinador])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_Planificacion] CHECK CONSTRAINT [FK_Planificacion_Coordinador]
GO
ALTER TABLE [dbo].[tbl_SubDirectorCoordinador]  WITH CHECK ADD  CONSTRAINT [FK_SubDirectorCoordinador_Coordinador] FOREIGN KEY([IdCoordinador])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_SubDirectorCoordinador] CHECK CONSTRAINT [FK_SubDirectorCoordinador_Coordinador]
GO
ALTER TABLE [dbo].[tbl_TarifasTipoVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Tarifa_TipoVehiculo] FOREIGN KEY([IdTipoVehiculo])
REFERENCES [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo])
GO
ALTER TABLE [dbo].[tbl_TarifasTipoVehiculo] CHECK CONSTRAINT [FK_Tarifa_TipoVehiculo]
GO
ALTER TABLE [dbo].[tbl_Tienda]  WITH CHECK ADD  CONSTRAINT [FK_Tienda_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[tbl_CatalogoEstado] ([IdEstado])
GO
ALTER TABLE [dbo].[tbl_Tienda] CHECK CONSTRAINT [FK_Tienda_Estado]
GO
ALTER TABLE [dbo].[tbl_Tienda]  WITH CHECK ADD  CONSTRAINT [FK_ZonaSted_Tienda] FOREIGN KEY([IdZonaSted])
REFERENCES [dbo].[tbl_ZonaSted] ([IdZonaSted])
GO
ALTER TABLE [dbo].[tbl_Tienda] CHECK CONSTRAINT [FK_ZonaSted_Tienda]
GO
ALTER TABLE [dbo].[tbl_TiendaCoordinador]  WITH CHECK ADD  CONSTRAINT [FK_TiendaCoordinador_Coordinador] FOREIGN KEY([IdCoordinador])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_TiendaCoordinador] CHECK CONSTRAINT [FK_TiendaCoordinador_Coordinador]
GO
ALTER TABLE [dbo].[tbl_TiendaCoordinador]  WITH CHECK ADD  CONSTRAINT [FK_TiendaCoordinador_Tienda] FOREIGN KEY([IdTienda])
REFERENCES [dbo].[tbl_Tienda] ([IdTienda])
GO
ALTER TABLE [dbo].[tbl_TiendaCoordinador] CHECK CONSTRAINT [FK_TiendaCoordinador_Tienda]
GO
ALTER TABLE [dbo].[tbl_Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Marca] FOREIGN KEY([IdMarcaVehiculo])
REFERENCES [dbo].[tbl_CatalogoVehiculoMarca] ([IdMarca])
GO
ALTER TABLE [dbo].[tbl_Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Marca]
GO
ALTER TABLE [dbo].[tbl_Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Modelo] FOREIGN KEY([IdModeloVehiculo])
REFERENCES [dbo].[tbl_CatalogoVehiculoModelo] ([IdModelo])
GO
ALTER TABLE [dbo].[tbl_Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Modelo]
GO
ALTER TABLE [dbo].[tbl_Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_TipoVehiculo] FOREIGN KEY([IdTipoVehiculo])
REFERENCES [dbo].[tbl_CatalogoTipoVehiculo] ([IdTipoVehiculo])
GO
ALTER TABLE [dbo].[tbl_Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_TipoVehiculo]
GO
ALTER TABLE [dbo].[tbl_VehiculoOperador]  WITH CHECK ADD  CONSTRAINT [FK_VehiculoOperador_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[tbl_Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[tbl_VehiculoOperador] CHECK CONSTRAINT [FK_VehiculoOperador_Empleados]
GO
ALTER TABLE [dbo].[tbl_VehiculoOperador]  WITH CHECK ADD  CONSTRAINT [FK_VehiculoOperador_Operador] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[tbl_Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[tbl_VehiculoOperador] CHECK CONSTRAINT [FK_VehiculoOperador_Operador]
GO
ALTER TABLE [dbo].[tbl_ZonaSted]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ZonaSted_tbl_Cliente_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tbl_Cliente] ([IdCliente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_ZonaSted] CHECK CONSTRAINT [FK_tbl_ZonaSted_tbl_Cliente_IdCliente]
GO
/****** Object:  StoredProcedure [dbo].[PlanificacionDetalleGetByParameter]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[PlanificacionDetalleGetByParameter] 
								@IdPlanificacion as decimal(8,0),
								@IdDetallePlanificacion as decimal(8,0) = null


				As

				Select
				cte.IdCliente,
				cte.NombreCliente, 
				cte.Clave, 
				cte.IdZona, 
				zn_Sted.NombreZona As NombreZonaSted,
				zn_Sted.ClaveDET,
				zn_Sted.IdZonaSted,
				tda.IdSubGerente,
				tda.IdEstado,
				dtPln.IdTienda,
				tda.NombreTienda, 
				tda.NumUnidades, 
				tda.Tarifa, 
				tda.TarifaDescanso, 
				tda.UnidadesMaximas, 
				subg.Nombre As SubGerente,
				IsNull(subg.email,'') As EmailSubGerente, 
				IsNull(subg.telefono,'') As Tel1SubGerente, 
				IsNull(subg.telefono2,'') As Tel2SubGerente,
				gte.Nombre As Gerente,
				IsNull(gte.email,'') As EmailGerente, 
				IsNull(gte.telefono,'') As Tel1Gerente, 
				IsNull(gte.telefono2,'') As Tel2Gerente,
				est.NombreEstado,
				zna.NombreZona, 
				tdacdor.IdCoordinador,
				concat_WS(' ',cdor.Nombres,cdor.ApellidoPaterno,cdor.ApellidoMaterno) NombreCoordinador,
				pln.IdPlanificacion,
				pln.FechaDesde, 
				pln.FechaHasta,
				pln.Comentario, 
				dtPln.IdDetallePlanificacion, 
				dtPln.IdOperador, 
				concat_WS(' ', OpEmp.Nombres,OpEmp.ApellidoPaterno,OpEmp.ApellidoMaterno) NombreOperador,
				dtPln.HoraInicio, 
				dtPln.HoraFin, 
				dtPln.Fecha, 
				dtPln.Descanso

				From tbl_Planificacion pln					
						Inner Join tbl_DetallePlanificacion dtPln
							On pln.IdPlanificacion = dtPln.IdPlanificacion
						Inner Join tbl_Empleados OpEmp
							On dtPln.IdOperador = OpEmp.IdEmpleado
						Inner Join tbl_Tienda tda
							On dtPln.IdTienda =  tda.IdTienda
						Inner Join tbl_TiendaCoordinador tdacdor
							On tda.IdTienda = tdacdor.IdTienda
						And tdacdor.IdCoordinador = pln.IdCoordinador	
						Inner Join tbl_Empleados cdor
							On tdacdor.IdCoordinador = cdor.IdEmpleado
						Inner Join tbl_ZonaSted zn_Sted
						   On zn_Sted.IdZonaSted = tda.IdZonaSted
						Inner Join tbl_Cliente cte
						   On cte.IdCliente = zn_Sted.IdCliente
						And zn_Sted.IdZonaSted = tda.IdZonaSted
						Inner Join tbl_GerenteSubGerente gteSubg
    						On tda.IdSubGerente = gteSubg.IdSubGerente
						Inner Join tbl_ContactoCliente subg
							On gteSubg.IdSubGerente = subg.IdContacto
						Inner Join tbl_ContactoCliente gte
							On gteSubg.IdGerente = gte.IdContacto
						Inner Join tbl_CatalogoEstado est
							On tda.IdEstado  = est.IdEstado
						Inner Join tbl_Zona zna
							On cte.IdZona = zna.IdZona				
				Where pln.IdPlanificacion = @IdPlanificacion
				And ((@IdDetallePlanificacion Is Null) Or (dtPln.IdDetallePlanificacion = @IdDetallePlanificacion))
            


            
GO
/****** Object:  StoredProcedure [dbo].[PlanificacionGetByCoordinador]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PlanificacionGetByCoordinador]
@IdCoordinador bigint = Null

As

Select 
	pln.IdPlanificacion
 ,  pln.IdCoordinador
 ,  concat_WS(' ',cdr.Nombres,cdr.ApellidoPaterno,cdr.ApellidoMaterno) Coordinador
 ,  pln.FechaDesde
 ,  pln.FechaHasta
 ,  pln.FrecuenciaId
 ,  Case pln.FrecuenciaId When 1 Then 'Semanal'
						  When 2 Then 'Quincenal'
						  When 3 Then 'Mensual' End Frecuencia
 ,  pln.EstatusPlanificacionId 
 ,  Case pln.EstatusPlanificacionId When 1 Then 'Pendiente'
									When 2 Then 'En Proceso'
									When 3 Then 'Cerrada'
									When 4 Then 'Pagada' End Estatus
From tbl_Planificacion pln
	Inner Join tbl_Empleados cdr
		On pln.IdCoordinador = cdr.IdEmpleado
Where ((@IdCoordinador Is Null) Or (pln.IdCoordinador = @IdCoordinador))
GO
/****** Object:  StoredProcedure [dbo].[ProductividadGetById]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ProductividadGetById]
	@IdPlanificacion AS decimal(18,0)
As

DECLARE @cols  AS NVARCHAR(MAX);
DECLARE @query AS NVARCHAR(MAX);

SET @cols = STUFF((SELECT ',' + QUOTENAME(Dia) 
            FROM (
                SELECT DISTINCT Dia
                FROM vw_Productividad
                WHERE IdPlanificacion = @IdPlanificacion
            ) t
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)'),1,1,'')

SET @query = 'SELECT IdPlanificacion, IdOperador, IdCliente, IdTienda, NombreTienda, NombreCliente, NombreEstado, NombreOperador, Spot,TipoRegistro, ' + @cols + ' 
            FROM 
            (
                SELECT 
                    IdPlanificacion
                  , IdOperador
                  , IdCliente
                  , IdTienda
                  , NombreTienda
                  , NombreCliente
                  , NombreEstado
                  , NombreOperador    
                  , Spot
                  , Dia
				  , TipoRegistro
                FROM vw_Productividad 
                WHERE IdPlanificacion = ' + CAST(@idPlanificacion AS NVARCHAR(10)) + '
           ) x
            PIVOT 
            (
                MIN(Dia)
                FOR Dia IN (' + @cols + ')
            ) p '

EXECUTE(@query);
GO
/****** Object:  StoredProcedure [dbo].[ProductividadGetByOperador]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProductividadGetByOperador]
  @IdPlanificacion decimal(18,0)
, @IdOperador bigint = NULL

As

Select
   IdEjecucionPlanificacion
 , IdDetallePlanificacion
 , IdPlanificacion
 , IdOperador
 , NombreOperador 
 , Fecha
 , HoraInicioPlanificacion
 , HoraFinPlanificacion
 , Descanso
 , IdTienda
 , NombreTienda
 , HoraInicioEjecucion
 , HoraFinEjecucion
 , IncentivoFactura
 , DescuentoTardanza
 , MontoHorasExtras
 , TardanzaEnMinutos
 , HorasExtrasEnMinutos
 , Justificacion
 , Dia
 , Spot
 , IdCliente
 , NombreCliente
 , IdEstado
 , NombreEstado
 , Salario
 , MontoDiario
 , NumTarjeta
 , SMG
 , SubTotal
, CuentaBancaria
, IdBanco
, NombreBanco
, Case When TardanzaEnMinutos > 0 or HorasExtrasEnMinutos < 0 Then 'R'
	   When HorasExtrasEnMinutos > 0 Then 'A' else 'N' end Accion  
From vw_Productividad
Where IdPlanificacion = @IdPlanificacion
And ((@IdOperador Is Null) Or (IdOperador = @IdOperador))
Order by IdOperador asc
GO
/****** Object:  StoredProcedure [dbo].[TiendasGetByParameter]    Script Date: 6/4/2023 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create Procedure [dbo].[TiendasGetByParameter] 
                @IdTienda as int = null,
                @IdZonaSted as int = null, 
                @IdCliente as bigint = null,
                @IdCoordinador as bigint = null

                As

				Select
                cte.IdCliente,
                cte.NombreCliente, 
                cte.Clave, 
                cte.IdZona, 
                zn_Sted.NombreZona As NombreZonaSted,
                zn_Sted.ClaveDET,
                zn_Sted.IdZonaSted,
                tda.IdSubGerente,
                tda.IdEstado,
                tda.IdTienda,
                tda.NombreTienda, 
                tda.NumUnidades, 
                tda.Tarifa, 
                tda.TarifaDescanso, 
                tda.UnidadesMaximas, 
                subg.Nombre As SubGerente,
                IsNull(subg.email,'') As EmailSubGerente, 
                IsNull(subg.telefono,'') As Tel1SubGerente, 
                IsNull(subg.telefono2,'') As Tel2SubGerente,
                gte.Nombre As Gerente,
                IsNull(gte.email,'') As EmailGerente, 
                IsNull(gte.telefono,'') As Tel1Gerente, 
                IsNull(gte.telefono2,'') As Tel2Gerente,
                est.NombreEstado,
                zna.NombreZona, 
                tdacdor.IdCoordinador,
                concat_WS(' ',cdor.Nombres,cdor.ApellidoPaterno,cdor.ApellidoMaterno) NombreCoordinador
                From tbl_Cliente cte
	                Inner Join tbl_ZonaSted zn_Sted
		                On cte.IdCliente = zn_Sted.IdCliente
	                Inner Join tbl_Tienda tda
		                On zn_Sted.IdZonaSted = tda.IdZonaSted
	                Inner Join tbl_GerenteSubGerente gteSubg
		                On tda.IdSubGerente = gteSubg.IdSubGerente
	                Inner Join tbl_ContactoCliente subg
		                On gteSubg.IdSubGerente = subg.IdContacto
                    Inner Join tbl_ContactoCliente gte
		                On gteSubg.IdGerente = gte.IdContacto
	                Inner Join tbl_CatalogoEstado est
		                On tda.IdEstado  = est.IdEstado
	                Inner Join tbl_Zona zna
		                On est.IdZona = zna.IdZona
                    Inner Join tbl_TiendaCoordinador tdacdor
		                On tda.IdTienda = tdacdor.IdTienda
	                Inner Join tbl_Empleados cdor
		                On tdacdor.IdCoordinador = cdor.IdEmpleado                
				Where ((@IdTienda Is Null) or tda.IdTienda = @IdTienda)
                  And ((@IdCliente Is Null) Or (cte.IdCliente = @IdCliente))
                  And ((@IdZonaSted Is Null) Or (tda.IdZonaSted = @IdZonaSted))  
                  And ((@IdCoordinador Is Null) Or (tdacdor.IdCoordinador = @IdCoordinador))
            
GO
/****** Object:  StoredProcedure [dbo].[ReporteImporteCombustibleAsignado]    Script Date: 14/11/2023 16:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteImporteCombustibleAsignado]

@FechaIni DATETIME = NULL,
@FechaEnd DATETIME = NULL,
@IdTienda INT = NULL,
@IdCoordinador INT = NULL	

AS

	SELECT
		DISTINCT
		tienda.IdTienda
		, tienda.NombreTienda Tienda
		, ejecucion.IdOperador
		, CONCAT(oper.Nombres, ' ', oper.ApellidoPaterno, ' ', oper.ApellidoMaterno) Operador
		, tarjeta.NumTarjeta NumTarjetaGasolina
		, ejecucion.MontoCombustible ImporteGasolina
		, ejecucion.Fecha FechaDisperción
	FROM tbl_EjecucionPlanificacion ejecucion
	INNER JOIN tbl_Planificacion pl
		ON ejecucion.IdPlanificacion = pl.IdPlanificacion
	INNER JOIN tbl_Empleados oper
		ON ejecucion.IdOperador = oper.IdEmpleado
	INNER JOIN tbl_Tienda tienda
		ON ejecucion.IdTienda = tienda.IdTienda
	INNER JOIN tbl_AsignacionTarjeta tarjeta
		ON ejecucion.IdOperador = tarjeta.IdEmpleado
	WHERE ISNULL(ejecucion.IdTienda, '') = CASE WHEN @IdTienda IS NULL THEN ISNULL(ejecucion.IdTienda, '') ELSE @IdTienda END
    AND ejecucion.Fecha BETWEEN @FechaIni AND @FechaEnd
    AND ISNULL(pl.IdCoordinador, '') = CASE WHEN @IdCoordinador IS NULL THEN ISNULL(pl.IdCoordinador, '') ELSE @IdCoordinador END
    AND ejecucion.MontoCombustible > 0
	ORDER BY ejecucion.Fecha
GO
/****** Object:  StoredProcedure [dbo].[ReporteVehiculosExtraUtilizados]    Script Date: 14/11/2023 16:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteVehiculosExtraUtilizados]

@fechaIni DATETIME,
@fechaEnd DATETIME,
@ColumnHeaders VARCHAR(MAX),
@IdPlanificacion VARCHAR(MAX),
@ColumnHeaderSpot VARCHAR(MAX)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		SELECT @ColumnHeaderSpot = 
			COALESCE(
				@ColumnHeaderSpot + ',[' + CAST([Fecha] As varchar) + ']', '[' + CAST([Fecha] AS varchar) + ']'
			)
			FROM tbl_EjecucionPlanificacion a
			INNER JOIN tbl_Empleados b ON a.IdOperador = b.IdEmpleado
			WHERE Fecha BETWEEN @fechaIni AND @fechaEnd AND b.IdSegmento = 3


			SELECT @ColumnHeaders = 
			COALESCE(
				@ColumnHeaders + ',[' + CAST([Fecha] AS varchar) + ']', '[' + CAST([Fecha] AS varchar) + ']', CONVERT(char, IdOperador) 
			)
			FROM tbl_EjecucionPlanificacion
			WHERE Fecha BETWEEN @fechaIni AND @fechaEnd AND IdPlanificacion = @IdPlanificacion
			GROUP BY [Fecha], IdOperador


			DECLARE @TableSQL NVARCHAR(MAX)

			SET @TableSQL = N'
				SELECT
					DISTINCT 
					 IdPlanificacion, 
					 Tienda,
					 Operador,
					 TipoVehiculo,
					 UnidadesSpot,
					 ' + @ColumnHeaders + ',
					 TotalUtilizadas
         
				FROM (
					SELECT
					  DISTINCT  
					  a.IdPlanificacion
					, c.NombreTienda Tienda
					, b.Nombres Operador        
					, f.TipoVehiculo
					, c.CntEmpleadosSpot UnidadesSpot        
					, a.Fecha
					, COUNT(a.IdEjecucionPlanificacion) Cantidad
					, SUM(a.IdEjecucionPlanificacion) TotalUtilizadas
					FROM tbl_EjecucionPlanificacion a
					INNER JOIN tbl_Empleados b ON a.IdOperador = b.IdEmpleado
					INNER JOIN tbl_Tienda c ON a.IdTienda = c.IdTienda
					INNER JOIN tbl_VehiculoOperador d ON a.IdOperador = d.IdEmpleado
					INNER JOIN tbl_Vehiculo e ON d.IdVehiculo = e.IdVehiculo
					INNER JOIN tbl_CatalogoTipoVehiculo f ON e.IdTipoVehiculo = f.IdTipoVehiculo               
					GROUP BY Fecha, IdPlanificacion, IdPlanificacion, c.NombreTienda, b.Nombres, f.TipoVehiculo, c.CntEmpleadosSpot                
				) AS PivotData
				PIVOT(
					SUM(Cantidad) FOR [Fecha] IN(' + @ColumnHeaders + ')
				) AS PivotTable
				ORDER BY IdPlanificacion
			'
			EXECUTE(@TableSQL)

END
GO

/****** Object:  StoredProcedure [dbo].[CalculoNominaProductividad]    Script Date: 17/11/2023 14:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CalculoNominaProductividad]
	-- Add the parameters for the stored procedure here
@FechaIni DATETIME = NULL,
@FechaEnd DATETIME = NULL,
@IdCoordinador INT = NULL,
@IdOperador INT = NULL,
@IdPlanificacion INT = NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
            Ejecucion.IdOperador
            , CONCAT(Oper.Nombres, ' ', Oper.ApellidoPaterno, ' ', Oper.ApellidoMaterno) Nombre
            , Oper.Salario    
            , CONCAT(cta.CuentaBancaria, ' ', bco.NombreBanco) Banco
            , pl.IdCoordinador
            , (SELECT CONCAT(Nombres, ' ', ApellidoPaterno, ' ', ApellidoMaterno)  FROM tbl_Empleados WHERE IdTipoEmpleado = 2 AND IdEmpleado = pl.IdCoordinador) Coordinador
            , Tda.NombreTienda Tienda
            , ZnaSted.NombreZona ZonaSted
            , Ejecucion.Fecha
            , DAY(Ejecucion.Fecha) Dia
            , Ejecucion.HoraInicio
            , Ejecucion.HoraFin
            , DATEDIFF(HOUR, Ejecucion.HoraInicio, Ejecucion.HoraFin) Horas
            , COUNT(Ejecucion.IdDetallePlanificacion) * Oper.Salario SubTotal
            , Ejecucion.MontoCombustible Gasolina
            , Ejecucion.MontoHorasExtras HorasExtra
            , DATEDIFF(MINUTE, Isnull(Detalle.HoraInicio,'00:00:00'), Ejecucion.HoraInicio) MinutosRetardo
            , DATEDIFF(MINUTE, Isnull(Detalle.HoraInicio,'00:00:00'), Ejecucion.HoraInicio) * 1.5 DescuentoRetardo
            , Oper.SMG PagoSMG
            , COUNT(Ejecucion.IdDetallePlanificacion) / 600 DescuentoSted
            -- , SUM
            --     (
            --         (COUNT(Ejecucion.IdDetallePlanificacion) * Oper.Salario) +
            --         Ejecucion.MontoCombustible +
            --         Ejecucion.MontoHorasExtras +
            --         Oper.SMG -
            --         DATEDIFF(MINUTE, Isnull(Detalle.HoraInicio,'00:00:00'), Ejecucion.HoraInicio) * 1.5 -
            --         600
                    
            --     ) Total
FROM tbl_EjecucionPlanificacion Ejecucion    
	LEFT JOIN tbl_DetallePlanificacion Detalle
		ON Detalle.IdPlanificacion  =  Ejecucion.IdPlanificacion
	   AND Detalle.IdDetallePlanificacion =  Ejecucion.IdDetallePlanificacion
	   AND Detalle.IdOperador = Ejecucion.IdOperador
	INNER JOIN tbl_Tienda Tda
		ON Ejecucion.IdTienda = tda.IdTienda
	INNER JOIN tbl_ZonaSted ZnaSted
		ON Tda.IdZonaSted = ZnaSted.IdZonaSted
	INNER JOIN tbl_Cliente cte
		ON ZnaSted.IdCliente = cte.IdCliente
	INNER JOIN tbl_CatalogoEstado est
		ON tda.IdEstado = est.IdEstado
	INNER JOIN tbl_Empleados Oper
		ON Ejecucion.IdOperador = Oper.IdEmpleado
	INNER JOIN tbl_AsignacionTarjeta tc
		ON oper.IdEmpleado = tc.IdEmpleado
		AND tc.Activa = 1 AND tc.TarjetaPrincipal = 1
	INNER JOIN tbl_EmpleadoCuentaBancaria cta
		ON cta.IdEmpleado = oper.IdEmpleado
		AND cta.Activa = 1 AND cta.CuentaPrincipal = 1
	INNER JOIN tbl_CatalogoBancos bco
		ON cta.IdBanco = bco.IdBanco
    INNER JOIN tbl_Planificacion pl ON Detalle.IdPlanificacion = pl.IdPlanificacion
WHERE Ejecucion.Fecha BETWEEN @FechaIni AND @FechaEnd
AND DATEDIFF(HOUR, Ejecucion.HoraInicio, Ejecucion.HoraFin) >= 8
AND ((@IdCoordinador IS NULL) OR (pl.IdCoordinador = @IdCoordinador))
AND ((@IdOperador IS NULL) OR (Ejecucion.IdOperador = @IdOperador))
AND ((@IdPlanificacion IS NULL) OR (Ejecucion.IdPlanificacion = @IdPlanificacion)) 
GROUP BY Ejecucion.IdOperador, Oper.Nombres, Oper.ApellidoPaterno, Oper.ApellidoMaterno, Oper.Salario, cta.CuentaBancaria, bco.NombreBanco, 
            pl.IdCoordinador, Tda.NombreTienda, ZnaSted.NombreZona, Ejecucion.Fecha, Ejecucion.HoraInicio, Ejecucion.HoraFin, Ejecucion.MontoCombustible, 
            Ejecucion.MontoHorasExtras, Detalle.HoraInicio, Detalle.HoraFin, Oper.SMG

END
GO

