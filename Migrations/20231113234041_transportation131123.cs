using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TransportationCore.Migrations
{
    /// <inheritdoc />
    public partial class transportation131123 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_tbl_TiendaCoordinador",
                table: "tbl_TiendaCoordinador");

            migrationBuilder.DropIndex(
                name: "IX_tbl_TiendaCoordinador_IdCoordinador",
                table: "tbl_TiendaCoordinador");

            migrationBuilder.AddColumn<decimal>(
                name: "MontoCombustible",
                table: "tbl_EjecucionPlanificacion",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddPrimaryKey(
                name: "PK_tbl_TiendaCoordinador",
                table: "tbl_TiendaCoordinador",
                columns: new[] { "IdCoordinador", "IdTienda" });

            migrationBuilder.CreateIndex(
                name: "IX_tbl_TiendaCoordinador_IdTienda",
                table: "tbl_TiendaCoordinador",
                column: "IdTienda");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_tbl_TiendaCoordinador",
                table: "tbl_TiendaCoordinador");

            migrationBuilder.DropIndex(
                name: "IX_tbl_TiendaCoordinador_IdTienda",
                table: "tbl_TiendaCoordinador");

            migrationBuilder.DropColumn(
                name: "MontoCombustible",
                table: "tbl_EjecucionPlanificacion");

            migrationBuilder.AddPrimaryKey(
                name: "PK_tbl_TiendaCoordinador",
                table: "tbl_TiendaCoordinador",
                columns: new[] { "IdTienda", "IdCoordinador" });

            migrationBuilder.CreateIndex(
                name: "IX_tbl_TiendaCoordinador_IdCoordinador",
                table: "tbl_TiendaCoordinador",
                column: "IdCoordinador");
        }
    }
}
