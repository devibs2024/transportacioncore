using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TransportationCore.Migrations
{
    /// <inheritdoc />
    public partial class Initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AuditLogs",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TableName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    EntityId = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: false),
                    ActionType = table.Column<string>(type: "nvarchar(12)", maxLength: 12, nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(75)", maxLength: 75, nullable: false),
                    OldValues = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NewValues = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ActionDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AuditLogs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CatalogoBancos",
                columns: table => new
                {
                    IdBanco = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreBanco = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Activo = table.Column<bool>(type: "bit", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CatalogoBancos", x => x.IdBanco);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CatalogoDias",
                columns: table => new
                {
                    IdDia = table.Column<int>(type: "int", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Siglas = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CatalogoDias", x => x.IdDia);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CatalogoTipoVehiculo",
                columns: table => new
                {
                    IdTipoVehiculo = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TipoVehiculo = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Activo = table.Column<bool>(type: "bit", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CatalogoTipoVehiculo", x => x.IdTipoVehiculo);
                });

            migrationBuilder.CreateTable(
                name: "tbl_Formato",
                columns: table => new
                {
                    IdFormato = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DescripcionFormato = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    Estado = table.Column<bool>(type: "bit", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_Formato", x => x.IdFormato);
                });

            migrationBuilder.CreateTable(
                name: "tbl_ValidateUserAccount",
                columns: table => new
                {
                    IdValidarCuenta = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdEmpleado = table.Column<long>(type: "bigint", nullable: true),
                    CorreoEmpleado = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CodigoVerficacion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    fechaExpiracion = table.Column<DateTime>(type: "datetime", nullable: false),
                    TipoCodigo = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_ValidateUserAccount", x => x.IdValidarCuenta);
                });

            migrationBuilder.CreateTable(
                name: "tbl_Zona",
                columns: table => new
                {
                    IdZona = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreZona = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    ClaveDET = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Activa = table.Column<bool>(type: "bit", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_Zona", x => x.IdZona);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "tbl_Horario",
                columns: table => new
                {
                    IdHorario = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdDia = table.Column<int>(type: "int", nullable: false),
                    HoraInicio = table.Column<TimeSpan>(type: "time", nullable: true),
                    HoraFin = table.Column<TimeSpan>(type: "time", nullable: true),
                    Activo = table.Column<bool>(type: "bit", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_Horario", x => x.IdHorario);
                    table.ForeignKey(
                        name: "FK_Horario_Dias",
                        column: x => x.IdDia,
                        principalTable: "tbl_CatalogoDias",
                        principalColumn: "IdDia",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CatalogoVehiculoMarca",
                columns: table => new
                {
                    IdMarca = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdTipo = table.Column<int>(type: "int", nullable: true),
                    Marca = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Activo = table.Column<bool>(type: "bit", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CatalogoVehiculoMarca", x => x.IdMarca);
                    table.ForeignKey(
                        name: "FK_VehiculoMarca_TipoVehiculo",
                        column: x => x.IdTipo,
                        principalTable: "tbl_CatalogoTipoVehiculo",
                        principalColumn: "IdTipoVehiculo",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_TarifasTipoVehiculo",
                columns: table => new
                {
                    IdTarifa = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Tarifa = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Activa = table.Column<bool>(type: "bit", nullable: false),
                    Principal = table.Column<bool>(type: "bit", nullable: false),
                    IdTipoVehiculo = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_TarifasTipoVehiculo", x => x.IdTarifa);
                    table.ForeignKey(
                        name: "FK_Tarifa_TipoVehiculo",
                        column: x => x.IdTipoVehiculo,
                        principalTable: "tbl_CatalogoTipoVehiculo",
                        principalColumn: "IdTipoVehiculo",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CatalogoEstado",
                columns: table => new
                {
                    IdEstado = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreEstado = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    Activo = table.Column<bool>(type: "bit", nullable: false),
                    IdZona = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CatalogoEstado", x => x.IdEstado);
                    table.ForeignKey(
                        name: "FK_Estados_Zona",
                        column: x => x.IdZona,
                        principalTable: "tbl_Zona",
                        principalColumn: "IdZona",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CatalogoVehiculoModelo",
                columns: table => new
                {
                    IdModelo = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdMarca = table.Column<int>(type: "int", nullable: true),
                    Modelo = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Activo = table.Column<bool>(type: "bit", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CatalogoVehiculoModelo", x => x.IdModelo);
                    table.ForeignKey(
                        name: "FK_VehiculoModelo_VehiculoMarca",
                        column: x => x.IdMarca,
                        principalTable: "tbl_CatalogoVehiculoMarca",
                        principalColumn: "IdMarca",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CatalogoMunicipio",
                columns: table => new
                {
                    IdMunicipio = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdEstado = table.Column<int>(type: "int", nullable: false),
                    NombreMunicipio = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    Activo = table.Column<bool>(type: "bit", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CatalogoMunicipio", x => x.IdMunicipio);
                    table.ForeignKey(
                        name: "FK_Municipio_Estado",
                        column: x => x.IdEstado,
                        principalTable: "tbl_CatalogoEstado",
                        principalColumn: "IdEstado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_Vehiculo",
                columns: table => new
                {
                    IdVehiculo = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreVehiculo = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    IdTipoVehiculo = table.Column<int>(type: "int", nullable: true),
                    IdMarcaVehiculo = table.Column<int>(type: "int", nullable: true),
                    IdModeloVehiculo = table.Column<int>(type: "int", nullable: true),
                    EmisionVehiculo = table.Column<int>(type: "int", nullable: true),
                    VehiculoEmpresa = table.Column<bool>(type: "bit", nullable: true),
                    Tarifa = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_Vehiculo", x => x.IdVehiculo);
                    table.ForeignKey(
                        name: "FK_Vehiculo_Marca",
                        column: x => x.IdMarcaVehiculo,
                        principalTable: "tbl_CatalogoVehiculoMarca",
                        principalColumn: "IdMarca",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Vehiculo_Modelo",
                        column: x => x.IdModeloVehiculo,
                        principalTable: "tbl_CatalogoVehiculoModelo",
                        principalColumn: "IdModelo",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Vehiculo_TipoVehiculo",
                        column: x => x.IdTipoVehiculo,
                        principalTable: "tbl_CatalogoTipoVehiculo",
                        principalColumn: "IdTipoVehiculo",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_Cliente",
                columns: table => new
                {
                    IdCliente = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Clave = table.Column<long>(type: "bigint", nullable: false),
                    NombreCliente = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    IdEstado = table.Column<int>(type: "int", nullable: true),
                    IdMunicipio = table.Column<int>(type: "int", nullable: true),
                    IdZona = table.Column<int>(type: "int", nullable: true),
                    Tarifa = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    TarifaHoraAdicional = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    TarifaConAyudante = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    TarifaSpot = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_Cliente", x => x.IdCliente);
                    table.ForeignKey(
                        name: "FK_Clientes_Estado",
                        column: x => x.IdEstado,
                        principalTable: "tbl_CatalogoEstado",
                        principalColumn: "IdEstado",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Clientes_Municipio",
                        column: x => x.IdMunicipio,
                        principalTable: "tbl_CatalogoMunicipio",
                        principalColumn: "IdMunicipio",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_tbl_Cliente_tbl_Zona_IdZona",
                        column: x => x.IdZona,
                        principalTable: "tbl_Zona",
                        principalColumn: "IdZona");
                });

            migrationBuilder.CreateTable(
                name: "tbl_Empleados",
                columns: table => new
                {
                    IdEmpleado = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NumeroContrato = table.Column<decimal>(type: "numeric(18,0)", nullable: false),
                    Nombres = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    ApellidoMaterno = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
                    ApellidoPaterno = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
                    Direccion = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    IdMunicipio = table.Column<int>(type: "int", nullable: false),
                    Telefono = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    Correo = table.Column<string>(type: "nvarchar(75)", maxLength: 75, nullable: false),
                    Salario = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    IdTipoEmpleado = table.Column<int>(type: "int", nullable: true),
                    IdSegmento = table.Column<int>(type: "int", nullable: true),
                    SMG = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_Empleados", x => x.IdEmpleado);
                    table.ForeignKey(
                        name: "FK_Empleados_Municipio",
                        column: x => x.IdMunicipio,
                        principalTable: "tbl_CatalogoMunicipio",
                        principalColumn: "IdMunicipio",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_ContactoCliente",
                columns: table => new
                {
                    IdContacto = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdCliente = table.Column<long>(type: "bigint", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    telefono = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    telefono2 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Activo = table.Column<bool>(type: "bit", nullable: false),
                    TipoContacto = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_ContactoCliente", x => x.IdContacto);
                    table.ForeignKey(
                        name: "FK_Contacto_Cliente",
                        column: x => x.IdCliente,
                        principalTable: "tbl_Cliente",
                        principalColumn: "IdCliente",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_FormatoCliente",
                columns: table => new
                {
                    IdFormato = table.Column<int>(type: "int", nullable: false),
                    IdCliente = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_FormatoCliente", x => new { x.IdFormato, x.IdCliente });
                    table.ForeignKey(
                        name: "FK_FormatoCliente_Cliente",
                        column: x => x.IdCliente,
                        principalTable: "tbl_Cliente",
                        principalColumn: "IdCliente",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_FormatoCliente_Formato",
                        column: x => x.IdFormato,
                        principalTable: "tbl_Formato",
                        principalColumn: "IdFormato",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_MunicipioCliente",
                columns: table => new
                {
                    IdMunicipio = table.Column<int>(type: "int", nullable: false),
                    IdCliente = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_MunicipioCliente", x => new { x.IdMunicipio, x.IdCliente });
                    table.ForeignKey(
                        name: "FK_MunicipioCliente_Cliente",
                        column: x => x.IdCliente,
                        principalTable: "tbl_Cliente",
                        principalColumn: "IdCliente",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_MunicipioCliente_Formato",
                        column: x => x.IdMunicipio,
                        principalTable: "tbl_CatalogoMunicipio",
                        principalColumn: "IdMunicipio",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_ZonaSted",
                columns: table => new
                {
                    IdZonaSted = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreZona = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    ClaveDET = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Activa = table.Column<bool>(type: "bit", nullable: false),
                    IdCliente = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_ZonaSted", x => x.IdZonaSted);
                    table.ForeignKey(
                        name: "FK_tbl_ZonaSted_tbl_Cliente_IdCliente",
                        column: x => x.IdCliente,
                        principalTable: "tbl_Cliente",
                        principalColumn: "IdCliente",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "tbl_AsignacionTarjeta",
                columns: table => new
                {
                    IdTarjeta = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdEmpleado = table.Column<long>(type: "bigint", nullable: false),
                    NumTarjeta = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    NumeroInterno = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Activa = table.Column<bool>(type: "bit", nullable: true),
                    TarjetaPrincipal = table.Column<bool>(type: "bit", nullable: false),
                    MontoDiario = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_AsignacionTarjeta", x => x.IdTarjeta);
                    table.ForeignKey(
                        name: "FK_AsignacionTarjeta_Empleados",
                        column: x => x.IdEmpleado,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CheckIn_CheckOut",
                columns: table => new
                {
                    IdCheck = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdEmpleado = table.Column<long>(type: "bigint", nullable: false),
                    CheckIN = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CheckIn_Photo_Path = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CheckIn_PhotoPerfil_Path = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CheckIn_PhotoCarroExterior_Path = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CheckIn_PhotoCarroInterior_Path = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    status_Entrada = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IdSucursal = table.Column<int>(type: "int", nullable: false),
                    IdSucursalActual = table.Column<int>(type: "int", nullable: true),
                    CheckOut = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Fecha = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CheckOut_Photo_Perfil = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CheckOut_Photo2_Uniforme = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CheckOut_Photo3_Factura = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    width = table.Column<int>(type: "int", nullable: false),
                    height = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CheckIn_CheckOut", x => x.IdCheck);
                    table.ForeignKey(
                        name: "FK_CheckIn_CheckOut_Empleado",
                        column: x => x.IdEmpleado,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_CoordinadorCliente",
                columns: table => new
                {
                    IdCoordinador = table.Column<long>(type: "bigint", nullable: false),
                    IdCliente = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_CoordinadorCliente", x => new { x.IdCoordinador, x.IdCliente });
                    table.ForeignKey(
                        name: "FK_CoordinadorCliente_Cliente",
                        column: x => x.IdCliente,
                        principalTable: "tbl_Cliente",
                        principalColumn: "IdCliente",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CoordinadorCliente_Coordinador",
                        column: x => x.IdCoordinador,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_DirectorSubDirector",
                columns: table => new
                {
                    IdDirector = table.Column<long>(type: "bigint", nullable: false),
                    IdSubDirector = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_DirectorSubDirector", x => new { x.IdSubDirector, x.IdDirector });
                    table.ForeignKey(
                        name: "FK_DirectorSubDirector_Director",
                        column: x => x.IdDirector,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_EmpleadoCoordinador",
                columns: table => new
                {
                    IdOperador = table.Column<long>(type: "bigint", nullable: false),
                    IdCoordinador = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_EmpleadoCoordinador", x => new { x.IdOperador, x.IdCoordinador });
                    table.ForeignKey(
                        name: "FK_EmpleadoCoordinador_Coordinador",
                        column: x => x.IdCoordinador,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_EmpleadoCuentaBancaria",
                columns: table => new
                {
                    IdCuenta = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdEmpleado = table.Column<long>(type: "bigint", nullable: true),
                    IdBanco = table.Column<int>(type: "int", nullable: false),
                    CuentaBancaria = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    Activa = table.Column<bool>(type: "bit", nullable: true),
                    CuentaPrincipal = table.Column<bool>(type: "bit", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_EmpleadoCuentaBancaria", x => x.IdCuenta);
                    table.ForeignKey(
                        name: "FK_EmpleadoCuentaBancaria_Bancos",
                        column: x => x.IdBanco,
                        principalTable: "tbl_CatalogoBancos",
                        principalColumn: "IdBanco",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_EmpleadoCuentaBancaria_Empleados",
                        column: x => x.IdEmpleado,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_HorarioEmpleado",
                columns: table => new
                {
                    IdHorario = table.Column<long>(type: "bigint", nullable: false),
                    IdEmpleado = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_HorarioEmpleado", x => new { x.IdHorario, x.IdEmpleado });
                    table.ForeignKey(
                        name: "FK_HorarioEmpleado_Empleado",
                        column: x => x.IdEmpleado,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_HorarioEmpleado_Horario",
                        column: x => x.IdHorario,
                        principalTable: "tbl_Horario",
                        principalColumn: "IdHorario",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_Planificacion",
                columns: table => new
                {
                    IdPlanificacion = table.Column<decimal>(type: "decimal(18,0)", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FechaDesde = table.Column<DateTime>(type: "date", nullable: false),
                    FechaHasta = table.Column<DateTime>(type: "date", nullable: false),
                    Comentario = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    IdCoordinador = table.Column<long>(type: "bigint", nullable: false),
                    FrecuenciaId = table.Column<int>(type: "int", nullable: false),
                    EstatusPlanificacionId = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_Planificacion", x => x.IdPlanificacion);
                    table.ForeignKey(
                        name: "FK_Planificacion_Coordinador",
                        column: x => x.IdCoordinador,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_SubDirectorCoordinador",
                columns: table => new
                {
                    IdCoordinador = table.Column<long>(type: "bigint", nullable: false),
                    IdSubDirector = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_SubDirectorCoordinador", x => new { x.IdSubDirector, x.IdCoordinador });
                    table.ForeignKey(
                        name: "FK_SubDirectorCoordinador_Coordinador",
                        column: x => x.IdCoordinador,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_VehiculoOperador",
                columns: table => new
                {
                    IdVehiculo = table.Column<long>(type: "bigint", nullable: false),
                    IdEmpleado = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_VehiculoOperador", x => new { x.IdVehiculo, x.IdEmpleado });
                    table.ForeignKey(
                        name: "FK_VehiculoOperador_Empleados",
                        column: x => x.IdEmpleado,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_VehiculoOperador_Operador",
                        column: x => x.IdVehiculo,
                        principalTable: "tbl_Vehiculo",
                        principalColumn: "IdVehiculo",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_GerenteSubGerente",
                columns: table => new
                {
                    IdGerente = table.Column<long>(type: "bigint", nullable: false),
                    IdSubGerente = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_GerenteSubGerente", x => new { x.IdGerente, x.IdSubGerente });
                    table.ForeignKey(
                        name: "FK_Contacto_SubGerentes",
                        column: x => x.IdSubGerente,
                        principalTable: "tbl_ContactoCliente",
                        principalColumn: "IdContacto",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_Tienda",
                columns: table => new
                {
                    IdTienda = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreTienda = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    IdSubGerente = table.Column<long>(type: "bigint", nullable: false),
                    IdEstado = table.Column<int>(type: "int", nullable: false),
                    IdZonaSted = table.Column<int>(type: "int", nullable: false),
                    NumUnidades = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    UnidadesMaximas = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Tarifa = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    TarifaDescanso = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Activa = table.Column<bool>(type: "bit", nullable: true),
                    CntEmpleadosInterno = table.Column<int>(type: "int", nullable: true),
                    CntEmpleadosExterno = table.Column<int>(type: "int", nullable: true),
                    CntEmpleadosSpot = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_Tienda", x => x.IdTienda);
                    table.ForeignKey(
                        name: "FK_Tienda_Estado",
                        column: x => x.IdEstado,
                        principalTable: "tbl_CatalogoEstado",
                        principalColumn: "IdEstado",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ZonaSted_Tienda",
                        column: x => x.IdZonaSted,
                        principalTable: "tbl_ZonaSted",
                        principalColumn: "IdZonaSted",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_DetalleTarjeta",
                columns: table => new
                {
                    IdDetalleTarjeta = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdTarjeta = table.Column<long>(type: "bigint", nullable: true),
                    IdEmpleado = table.Column<long>(type: "bigint", nullable: true),
                    Importe = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    FechaDispension = table.Column<DateTime>(type: "datetime", nullable: true),
                    IdSucursal = table.Column<int>(type: "int", nullable: true),
                    IdCordinador = table.Column<long>(type: "bigint", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_DetalleTarjeta", x => x.IdDetalleTarjeta);
                    table.ForeignKey(
                        name: "FK_DetalleTarjeta_AsignacionTarjeta",
                        column: x => x.IdTarjeta,
                        principalTable: "tbl_AsignacionTarjeta",
                        principalColumn: "IdTarjeta",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DetalleTarjeta_Coordinador",
                        column: x => x.IdCordinador,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DetalleTarjeta_Empleado",
                        column: x => x.IdEmpleado,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "tbl_DetallePlanificacion",
                columns: table => new
                {
                    IdPlanificacion = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
                    IdDetallePlanificacion = table.Column<decimal>(type: "decimal(18,0)", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdOperador = table.Column<long>(type: "bigint", nullable: false),
                    IdTienda = table.Column<int>(type: "int", nullable: false),
                    Fecha = table.Column<DateTime>(type: "date", nullable: false),
                    HoraInicio = table.Column<TimeSpan>(type: "time(7)", nullable: false),
                    HoraFin = table.Column<TimeSpan>(type: "time(7)", nullable: false),
                    Descanso = table.Column<bool>(type: "bit", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_DetallePlanificacion", x => new { x.IdPlanificacion, x.IdDetallePlanificacion });
                    table.ForeignKey(
                        name: "FK_DetallePlanificacion_Operador",
                        column: x => x.IdOperador,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Detalle_Planificacion",
                        column: x => x.IdPlanificacion,
                        principalTable: "tbl_Planificacion",
                        principalColumn: "IdPlanificacion",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_tbl_DetallePlanificacion_tbl_Tienda_IdTienda",
                        column: x => x.IdTienda,
                        principalTable: "tbl_Tienda",
                        principalColumn: "IdTienda",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "tbl_EjecucionPlanificacion",
                columns: table => new
                {
                    IdPlanificacion = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
                    IdEjecucionPlanificacion = table.Column<decimal>(type: "decimal(18,0)", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdDetallePlanificacion = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
                    IdOperador = table.Column<long>(type: "bigint", nullable: false),
                    IdTienda = table.Column<int>(type: "int", nullable: false),
                    Fecha = table.Column<DateTime>(type: "date", nullable: false),
                    HoraInicio = table.Column<TimeSpan>(type: "time(7)", nullable: false),
                    HoraFin = table.Column<TimeSpan>(type: "time(7)", nullable: false),
                    Descanso = table.Column<bool>(type: "bit", nullable: false),
                    IncentivoFactura = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    DescuentoTardanza = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    MontoHorasExtras = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    TipoRegistro = table.Column<int>(type: "int", nullable: false),
                    Justificacion = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_EjecucionPlanificacion", x => new { x.IdPlanificacion, x.IdEjecucionPlanificacion });
                    table.ForeignKey(
                        name: "FK_EjecucionPlanificacion_Operador",
                        column: x => x.IdOperador,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Ejecucion_Planificacion",
                        column: x => x.IdPlanificacion,
                        principalTable: "tbl_Planificacion",
                        principalColumn: "IdPlanificacion",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_tbl_EjecucionPlanificacion_tbl_Tienda_IdTienda",
                        column: x => x.IdTienda,
                        principalTable: "tbl_Tienda",
                        principalColumn: "IdTienda",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "tbl_TiendaCoordinador",
                columns: table => new
                {
                    IdTienda = table.Column<int>(type: "int", nullable: false),
                    IdCoordinador = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tbl_TiendaCoordinador", x => new { x.IdTienda, x.IdCoordinador });
                    table.ForeignKey(
                        name: "FK_TiendaCoordinador_Coordinador",
                        column: x => x.IdCoordinador,
                        principalTable: "tbl_Empleados",
                        principalColumn: "IdEmpleado",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TiendaCoordinador_Tienda",
                        column: x => x.IdTienda,
                        principalTable: "tbl_Tienda",
                        principalColumn: "IdTienda",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_AsignacionTarjeta_IdEmpleado",
                table: "tbl_AsignacionTarjeta",
                column: "IdEmpleado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_CatalogoEstado_IdZona",
                table: "tbl_CatalogoEstado",
                column: "IdZona");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_CatalogoMunicipio_IdEstado",
                table: "tbl_CatalogoMunicipio",
                column: "IdEstado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_CatalogoVehiculoMarca_IdTipo",
                table: "tbl_CatalogoVehiculoMarca",
                column: "IdTipo");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_CatalogoVehiculoModelo_IdMarca",
                table: "tbl_CatalogoVehiculoModelo",
                column: "IdMarca");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_CheckIn_CheckOut_IdEmpleado",
                table: "tbl_CheckIn_CheckOut",
                column: "IdEmpleado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Cliente_IdEstado",
                table: "tbl_Cliente",
                column: "IdEstado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Cliente_IdMunicipio",
                table: "tbl_Cliente",
                column: "IdMunicipio");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Cliente_IdZona",
                table: "tbl_Cliente",
                column: "IdZona");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_ContactoCliente_IdCliente",
                table: "tbl_ContactoCliente",
                column: "IdCliente");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_CoordinadorCliente_IdCliente",
                table: "tbl_CoordinadorCliente",
                column: "IdCliente");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_DetallePlanificacion_IdOperador",
                table: "tbl_DetallePlanificacion",
                column: "IdOperador");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_DetallePlanificacion_IdTienda",
                table: "tbl_DetallePlanificacion",
                column: "IdTienda");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_DetalleTarjeta_IdCordinador",
                table: "tbl_DetalleTarjeta",
                column: "IdCordinador");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_DetalleTarjeta_IdEmpleado",
                table: "tbl_DetalleTarjeta",
                column: "IdEmpleado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_DetalleTarjeta_IdTarjeta",
                table: "tbl_DetalleTarjeta",
                column: "IdTarjeta");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_DirectorSubDirector_IdDirector",
                table: "tbl_DirectorSubDirector",
                column: "IdDirector");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_EjecucionPlanificacion_IdOperador",
                table: "tbl_EjecucionPlanificacion",
                column: "IdOperador");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_EjecucionPlanificacion_IdTienda",
                table: "tbl_EjecucionPlanificacion",
                column: "IdTienda");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_EmpleadoCoordinador_IdCoordinador",
                table: "tbl_EmpleadoCoordinador",
                column: "IdCoordinador");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_EmpleadoCuentaBancaria_IdBanco",
                table: "tbl_EmpleadoCuentaBancaria",
                column: "IdBanco");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_EmpleadoCuentaBancaria_IdEmpleado",
                table: "tbl_EmpleadoCuentaBancaria",
                column: "IdEmpleado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Empleados_IdMunicipio",
                table: "tbl_Empleados",
                column: "IdMunicipio");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_FormatoCliente_IdCliente",
                table: "tbl_FormatoCliente",
                column: "IdCliente");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_GerenteSubGerente_IdSubGerente",
                table: "tbl_GerenteSubGerente",
                column: "IdSubGerente");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Horario_IdDia",
                table: "tbl_Horario",
                column: "IdDia");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_HorarioEmpleado_IdEmpleado",
                table: "tbl_HorarioEmpleado",
                column: "IdEmpleado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_MunicipioCliente_IdCliente",
                table: "tbl_MunicipioCliente",
                column: "IdCliente");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Planificacion_IdCoordinador",
                table: "tbl_Planificacion",
                column: "IdCoordinador");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_SubDirectorCoordinador_IdCoordinador",
                table: "tbl_SubDirectorCoordinador",
                column: "IdCoordinador");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_TarifasTipoVehiculo_IdTipoVehiculo",
                table: "tbl_TarifasTipoVehiculo",
                column: "IdTipoVehiculo");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Tienda_IdEstado",
                table: "tbl_Tienda",
                column: "IdEstado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Tienda_IdZonaSted",
                table: "tbl_Tienda",
                column: "IdZonaSted");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_TiendaCoordinador_IdCoordinador",
                table: "tbl_TiendaCoordinador",
                column: "IdCoordinador");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Vehiculo_IdMarcaVehiculo",
                table: "tbl_Vehiculo",
                column: "IdMarcaVehiculo");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Vehiculo_IdModeloVehiculo",
                table: "tbl_Vehiculo",
                column: "IdModeloVehiculo");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_Vehiculo_IdTipoVehiculo",
                table: "tbl_Vehiculo",
                column: "IdTipoVehiculo");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_VehiculoOperador_IdEmpleado",
                table: "tbl_VehiculoOperador",
                column: "IdEmpleado");

            migrationBuilder.CreateIndex(
                name: "IX_tbl_ZonaSted_IdCliente",
                table: "tbl_ZonaSted",
                column: "IdCliente");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "AuditLogs");

            migrationBuilder.DropTable(
                name: "tbl_CheckIn_CheckOut");

            migrationBuilder.DropTable(
                name: "tbl_CoordinadorCliente");

            migrationBuilder.DropTable(
                name: "tbl_DetallePlanificacion");

            migrationBuilder.DropTable(
                name: "tbl_DetalleTarjeta");

            migrationBuilder.DropTable(
                name: "tbl_DirectorSubDirector");

            migrationBuilder.DropTable(
                name: "tbl_EjecucionPlanificacion");

            migrationBuilder.DropTable(
                name: "tbl_EmpleadoCoordinador");

            migrationBuilder.DropTable(
                name: "tbl_EmpleadoCuentaBancaria");

            migrationBuilder.DropTable(
                name: "tbl_FormatoCliente");

            migrationBuilder.DropTable(
                name: "tbl_GerenteSubGerente");

            migrationBuilder.DropTable(
                name: "tbl_HorarioEmpleado");

            migrationBuilder.DropTable(
                name: "tbl_MunicipioCliente");

            migrationBuilder.DropTable(
                name: "tbl_SubDirectorCoordinador");

            migrationBuilder.DropTable(
                name: "tbl_TarifasTipoVehiculo");

            migrationBuilder.DropTable(
                name: "tbl_TiendaCoordinador");

            migrationBuilder.DropTable(
                name: "tbl_ValidateUserAccount");

            migrationBuilder.DropTable(
                name: "tbl_VehiculoOperador");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "tbl_AsignacionTarjeta");

            migrationBuilder.DropTable(
                name: "tbl_Planificacion");

            migrationBuilder.DropTable(
                name: "tbl_CatalogoBancos");

            migrationBuilder.DropTable(
                name: "tbl_Formato");

            migrationBuilder.DropTable(
                name: "tbl_ContactoCliente");

            migrationBuilder.DropTable(
                name: "tbl_Horario");

            migrationBuilder.DropTable(
                name: "tbl_Tienda");

            migrationBuilder.DropTable(
                name: "tbl_Vehiculo");

            migrationBuilder.DropTable(
                name: "tbl_Empleados");

            migrationBuilder.DropTable(
                name: "tbl_CatalogoDias");

            migrationBuilder.DropTable(
                name: "tbl_ZonaSted");

            migrationBuilder.DropTable(
                name: "tbl_CatalogoVehiculoModelo");

            migrationBuilder.DropTable(
                name: "tbl_Cliente");

            migrationBuilder.DropTable(
                name: "tbl_CatalogoVehiculoMarca");

            migrationBuilder.DropTable(
                name: "tbl_CatalogoMunicipio");

            migrationBuilder.DropTable(
                name: "tbl_CatalogoTipoVehiculo");

            migrationBuilder.DropTable(
                name: "tbl_CatalogoEstado");

            migrationBuilder.DropTable(
                name: "tbl_Zona");
        }
    }
}
