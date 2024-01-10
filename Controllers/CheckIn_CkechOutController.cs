using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TransportationCore.Data;
using TransportationCore.Data.Models;
using TransportationCore.Data.Dtos.CheckIn_CkeckOut;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using System.Data;
using System.IO;
using NuGet.Versioning;
using Microsoft.Data.SqlClient;
using Microsoft.Data.Sqlite;
using System.Drawing;
using TransportationCore.Enumeradores;

namespace TransportationCore.Controllers
{

    // //[Authorize(Policy = "CheckinCheckoutPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class CheckIn_CkechOutController : ControllerBase
    {

        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;
        private readonly IConfiguration configuration;
        private readonly int tipoRegistro;
        public CheckIn_CkechOutController(ApplicationDbContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            this.mapper = mapper;
            this.configuration = configuration;
            this.tipoRegistro = (int)EnumTipoRegistro.RegistroAutomatico;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<ConsultaCheckIn_CkeckOutDto>>> GetChecks()
        {
            if (_context.CheckIn_CkeckOut == null)
            {
                return NotFound();
            }

            var check = await _context.CheckIn_CkeckOut.ToListAsync();
            var CheckIn_CkeckOutDto = mapper.Map<List<ConsultaCheckIn_CkeckOutDto>>(check);
            return CheckIn_CkeckOutDto;
        }



        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CrearCheckIn_CheckOutDto checkIn_CkeckOut)
        {
            try
            {

                string? ruta = configuration.GetSection("Ruta:Completa").Value;

                var user = checkIn_CkeckOut.IdEmpleado;

                string photoPath = Path.Combine(ruta, $"{checkIn_CkeckOut.IdEmpleado}_{DateTime.UtcNow.ToString("yyyyMMdd_HHmmss")}.jpeg");



                var currentDay = DateTime.Now.ToString("yyyy/MM/dd");
                var horarios = await (from h in _context.DetallesPlanificacion
                                      join e in _context.Empleados
                                       on h.IdOperador equals e.IdEmpleado
                                      where h.Fecha == DateTime.Parse(currentDay) && h.IdOperador == user
                                      select new
                                      {
                                          h.HoraInicio,
                                          h.HoraFin,
                                          h.Fecha,
                                          h.IdTienda,
                                          h.IdOperador,
                                          h.IdPlanificacion,
                                          h.IdDetallePlanificacion
                                      }).ToListAsync();



                var check = mapper.Map<CheckIn_CkeckOut>(checkIn_CkeckOut);
                var chkInOut = await _context.CheckIn_CkeckOut.Where(p => p.IdEmpleado == checkIn_CkeckOut.IdEmpleado).FirstOrDefaultAsync();
                //var check2 = await _context.CheckIn_CkeckOut.Where(p => p.IdEmpleado == checkIn_CkeckOut.IdEmpleado && p.Fecha == DateTime.Today && p.CheckOut == null).FirstOrDefaultAsync();

                var now = DateTime.Now.TimeOfDay;

                // if (horarios.Count() >= 1 && check2 == null)
                // {
                //     horarios = horarios.Take(1).ToList();
                // }
                // else if(!String.IsNullOrEmpty(check2!.CheckIN) && check2.CheckOut == null)
                // {
                //     horarios = horarios.Skip(1).Take(1).ToList();
                // }

                foreach (var h in horarios)
                {
                    if (h.Fecha == DateTime.Today.Date && !String.IsNullOrEmpty(chkInOut?.CheckOut) && !string.IsNullOrEmpty(chkInOut.CheckOut_Photo_Perfil) && chkInOut.Fecha == DateTime.Today)
                    {
                        return BadRequest(new { message = "Su Jornada finalizó. No puede hacer CHECK-IN ni CHECK-OUT por el dia de hoy!", jornadaFinalizada = true });
                    }

                    if (horarios.Any(h => h.Fecha == DateTime.Today))
                    {
                        var tolerancia = TimeSpan.FromMinutes(15);
                        var checkInTime = h.HoraInicio;
                        var checkOutTime = h.HoraFin;
                        var horaInicioTardanza = checkInTime.Add(tolerancia);



                        CrearCarpeta();


                        if (now < checkInTime)
                        {
                            return BadRequest(new { message = "No se permite  el check-In en estos momentos " });
                        }
                        else if (now >= checkInTime && now < checkOutTime)
                        {
                            check.Fecha = DateTime.Today.Date;

                            var existCheckIn = await _context.CheckIn_CkeckOut.Where(p => p.IdEmpleado.Equals(user) && p.Fecha.Equals(DateTime.Today.Date) && p.CheckOut == null).FirstOrDefaultAsync();
                            var checkin = await _context.DetallesPlanificacion.Where(p => p.IdOperador == user && p.Fecha == DateTime.Today).FirstOrDefaultAsync();

                            CrearEmpleadosCarp(checkIn_CkeckOut.IdEmpleado);

                            if (checkin.Fecha == DateTime.Today.Date && checkin.IdOperador == user && existCheckIn == null)
                            {

                                check.status_Entrada = "Entrada en hora";


                                if (now > horaInicioTardanza)
                                {
                                    check.status_Entrada = "Tardanza";
                                }

                                //Lista para fotos 
                                var ImagenesIN = new List<string> { "CheckIn_Photo_Path", "CheckIn_PhotoPerfil_Path", "CheckIn_PhotoCarroExterior_Path", "CheckIn_PhotoCarroInterior_Path" };

                                for (int i = 0; i < ImagenesIN.Count; i++)
                                {

                                    foreach (var image in checkIn_CkeckOut.Image)
                                    {
                                        string currentHour = DateTime.Now.ToString("HHmm");

                                        byte[] photoBytes = Convert.FromBase64String(image.Split(",")[1]);

                                        string path = Path.Combine(ruta, "Photos\\", "Fotos" + DateTime.UtcNow.ToString("yyyyMMdd"));
                                        string OperadorPath = Path.Combine(path, checkIn_CkeckOut.IdEmpleado.ToString());
                                        string checkInPath = Path.Combine(OperadorPath, "CheckIn", $"photoPath{i}{currentHour}.jpg");
                                        string campoFoto = ImagenesIN[i];

                                        using (Image originalImage = Image.FromStream(new MemoryStream(photoBytes)))
                                        {
                                            check.width = originalImage.Width;
                                            check.height = originalImage.Height;

                                            using (Image imageToSave = new Bitmap(originalImage, new Size(500, 500)))
                                            {
                                                imageToSave.Save(checkInPath, originalImage.RawFormat);
                                            }
                                        }



                                        typeof(CheckIn_CkeckOut).GetProperty(campoFoto).SetValue(check, checkInPath);
                                        i++;

                                    }
                                }
                                check.CheckIN = DateTime.Now.ToString();
                                check.CheckOut = null;
                                _context.CheckIn_CkeckOut.Add(check);

                                await _context.SaveChangesAsync();

                                return Ok(new { message = "Registro de " + check.status_Entrada + " recibido y almacenado." });

                            }
                            else
                            {
                                var ImagenesOUT = new List<string> { "CheckOut_Photo_Perfil", "CheckOut_Photo2_Uniforme", "CheckOut_Photo3_Factura" };

                                for (int o = 0; o < ImagenesOUT.Count; o++)
                                {
                                    foreach (var image in checkIn_CkeckOut.Image)
                                    {
                                        byte[] photoBytes = Convert.FromBase64String(image.Split(",")[1]);
                                        string currentHour = DateTime.Now.ToString("HHmm");

                                        string path = Path.Combine(ruta, "Photos\\", "Fotos" + DateTime.UtcNow.ToString("yyyyMMdd"));
                                        string OperadorPath = Path.Combine(path, checkIn_CkeckOut.IdEmpleado.ToString());
                                        string checkOutPath = Path.Combine(OperadorPath, "CheckOut", $"photoPath{o}{currentHour}.jpg");

                                        string campoFoto = ImagenesOUT[o];

                                        using (Image originalImage = Image.FromStream(new MemoryStream(photoBytes)))
                                        {
                                            using (Image imageToSave = new Bitmap(originalImage, new Size(500, 500)))
                                            {
                                                imageToSave.Save(checkOutPath, originalImage.RawFormat);
                                            }
                                        }

                                        typeof(CheckIn_CkeckOut).GetProperty(campoFoto).SetValue(existCheckIn, checkOutPath);

                                        o++;
                                    }


                                }
                                existCheckIn.CheckOut = DateTime.Now.ToString();
                                _context.Update(existCheckIn);
                                var i = await _context.SaveChangesAsync();


                                var ejecucion = new EjecucionPlanificacion
                                {
                                    HoraInicio = DateTime.Parse(existCheckIn.CheckIN).TimeOfDay,
                                    HoraFin = DateTime.Parse(existCheckIn.CheckOut).TimeOfDay,
                                    Fecha = checkin.Fecha,
                                    IdOperador = existCheckIn.IdEmpleado,
                                    IdDetallePlanificacion = checkin.IdDetallePlanificacion,
                                    IdPlanificacion = checkin.IdPlanificacion,
                                    IdTienda = existCheckIn.IdSucursal
                                };


                                _context.EjecucionesPlanificacion.Add(ejecucion);
                                var u = await _context.SaveChangesAsync();

                                if (i > 0)
                                {
                                    return Ok(new { message = $"Se realizo el CHECK-OUT antes de su hora establecida ---> {checkOutTime}." });
                                }

                                return BadRequest(new { message = "Error al hacer el checkout. Favor verificar (Registro No Almacendo)!" });

                            }
                        }
                        else
                        {

                            var existCheckIn = await _context.CheckIn_CkeckOut.Where(p => p.IdEmpleado == check.IdEmpleado).FirstOrDefaultAsync();


                            if (existCheckIn != null && String.IsNullOrEmpty(check.CheckOut))
                            {
                                var ImagenesOUT = new List<string> { "CheckOut_Photo_Perfil", "CheckOut_Photo2_Uniforme", "CheckOut_Photo3_Factura" };

                                for (int o = 0; o < ImagenesOUT.Count; o++)
                                {
                                    foreach (var image in checkIn_CkeckOut.Image)
                                    {
                                        byte[] photoBytes = Convert.FromBase64String(image.Split(",")[1]);
                                        string currentHour = DateTime.Now.ToString("HHmm");

                                        string path = Path.Combine(ruta, "Photos\\", "Fotos" + DateTime.UtcNow.ToString("yyyyMMdd"));
                                        string OperadorPath = Path.Combine(path, checkIn_CkeckOut.IdEmpleado.ToString());
                                        string checkOutPath = Path.Combine(OperadorPath, "CheckOut", $"photoPath{o}{currentHour}.jpg");
                                        string campoFoto = ImagenesOUT[o];

                                        using (Image originalImage = Image.FromStream(new MemoryStream(photoBytes)))
                                        {
                                            using (Image imageToSave = new Bitmap(originalImage, new Size(500, 500)))
                                            {
                                                imageToSave.Save(checkOutPath, originalImage.RawFormat);
                                            }
                                        }
                                        typeof(CheckIn_CkeckOut).GetProperty(campoFoto).SetValue(existCheckIn, checkOutPath);
                                        o++;
                                    }
                                }
                                existCheckIn.CheckOut = DateTime.Now.ToString();
                                _context.Update(existCheckIn);
                                var i = await _context.SaveChangesAsync();
                                var checkin = await _context.DetallesPlanificacion.Where(p => p.IdOperador == user && p.Fecha == DateTime.Today).FirstOrDefaultAsync();

                                var ejecucion = new EjecucionPlanificacion
                                {
                                   IdPlanificacion = checkin.IdPlanificacion,
                                   IdDetallePlanificacion = checkin.IdDetallePlanificacion,
                                   IdOperador = existCheckIn.IdEmpleado,
                                   IdTienda =  existCheckIn.IdSucursal,
                                   Fecha = checkin.Fecha,
                                   HoraInicio = DateTime.Parse(existCheckIn.CheckIN).TimeOfDay,
                                   HoraFin = DateTime.Parse(existCheckIn.CheckOut).TimeOfDay,
                                   TipoRegistro = tipoRegistro
                                };

                                _context.EjecucionesPlanificacion.Add(ejecucion);
                                var a = await _context.SaveChangesAsync();

                                if (i > 0)
                                {
                                    return Ok(new { message = "Registro de salida recibido y almacenado." });
                                }

                                return BadRequest("Error al hacer el checkout. Favor verificar!");
                            }
                            else
                            {
                                return BadRequest(new { message = $"Error: Verifique que el horario del operador sea el correcto para el CheckIn/CheckOut!" });
                            }
                        }
                    }
                }

                return BadRequest(new { message = "No se encontró un horario para el día actual." });

            }
            catch (Exception e)
            {
                return BadRequest(new { message = "Ha Ocurrido un error " + e.Message });
            }
        }



        static void CrearEmpleadosCarp(long IdOperador)
        {


            string path = Path.Combine("Photos\\", "Fotos" + DateTime.UtcNow.ToString("yyyyMMdd"));
            string OperadorPath = Path.Combine(path, IdOperador.ToString());
            string checkInPath = Path.Combine(OperadorPath, "CheckIn");
            string checkOutPath = Path.Combine(OperadorPath, "CheckOut");
            try
            {
                if (Directory.Exists(OperadorPath))
                {
                    Console.WriteLine("Ya existe el directorio");
                    return;
                }

                Directory.CreateDirectory(OperadorPath);

                Directory.CreateDirectory(checkInPath);

                Directory.CreateDirectory(checkOutPath);

            }
            catch (Exception e)
            {
                Console.WriteLine(new { message = "Ha ocurrido un error al crear el direcctorio" + e.Message });
            }

        }

        static void CrearCarpeta()
        {
            string path = Path.Combine("Photos\\", "Fotos" + DateTime.UtcNow.ToString("yyyyMMdd"));
            // Se debe colocar la ruta en donde va a correr la app 
            try
            {
                if (Directory.Exists(path))
                {
                    Console.WriteLine("Ya existe el directorio");
                    return;
                }

                DirectoryInfo di = Directory.CreateDirectory(path);
            }
            catch (Exception e)
            {
                Console.WriteLine(new { message = "Ha ocurrido un error al crear el direcctorio" + e.Message });
            }
        }
        [HttpGet("empleadoTienda/empleadoId/{IdEmpleado}")]
        public async Task<ActionResult<List<object>>> GetTiendaEmpleado(long IdEmpleado)
        {
            List<object> tiendasList = new List<object>();
            var TiendasEmpleados = await (from e in _context.Empleados
                                          join ep in _context.EjecucionesPlanificacion
                                          on e.IdEmpleado equals ep.IdOperador
                                          join t in _context.Tiendas
                                          on ep.IdTienda equals t.IdTienda
                                          where e.IdEmpleado == IdEmpleado
                                          select new
                                          {
                                              t.IdTienda,
                                              t.NombreTienda
                                          }).ToListAsync();

            if (TiendasEmpleados == null)
            {
                return NotFound();
            }

            foreach (var item in TiendasEmpleados)
            {
                tiendasList.Add(new { key = item.NombreTienda, value = item.IdTienda });
            }

            return tiendasList;
        }

        [HttpGet("empleadoInfo/empleadoId/{IdEmpleado}")]
        public async Task<ActionResult<object>> GetEmpleadoInfo(long IdEmpleado)
        {
            List<object> empleadosList = new List<object>();
            var EmpleadosInfo = await (from e in _context.Empleados
                                       join ep in _context.EjecucionesPlanificacion
                                       on e.IdEmpleado equals ep.IdOperador
                                       join t in _context.Tiendas
                                       on ep.IdTienda equals t.IdTienda
                                       join pl in _context.Planificaciones
                                       on ep.IdPlanificacion equals pl.IdPlanificacion
                                       where e.IdEmpleado == IdEmpleado
                                       select new
                                       {
                                           t.IdTienda,
                                           t.NombreTienda,
                                           NombreEmpleado = $"{e.Nombres} {e.ApellidoPaterno} {e.ApellidoMaterno}",
                                           NombreCoordinador = $"{pl.Coordinador.Nombres} {pl.Coordinador.ApellidoPaterno} {pl.Coordinador.ApellidoMaterno}",
                                           HoraEntrada = ep.HoraInicio,
                                           HoraSalida = ep.HoraFin
                                       }).FirstOrDefaultAsync();

            if (EmpleadosInfo == null)
            {
                return NotFound();
            }

            return EmpleadosInfo;
        }
     
        [HttpGet("GetAllTiendaEmpleado")]
        public async Task<ActionResult<List<object>>> GetAllTiendaEmpleado()
        {
            List<object> tiendasList = new List<object>();
            var TiendasEmpleados = await (from t in _context.Tiendas
                                          select new
                                          {
                                              t.IdTienda,
                                              t.NombreTienda
                                          }).ToListAsync();

            if (TiendasEmpleados == null)
            {
                return NotFound();
            }

            foreach (var item in TiendasEmpleados)
            {
                tiendasList.Add(new { key = item.NombreTienda, value = item.IdTienda });
            }

            return tiendasList;
        }

        [HttpGet("empleado/{IdEmpleado}")]
        public async Task<ActionResult<Object>> GetByEmpleado(long IdEmpleado)
        {
            var checks = await _context.CheckIn_CkeckOut.Where(b => b.IdEmpleado == IdEmpleado).ToListAsync();
            if (checks == null)
            {
                return new
                {
                    success = false,
                };
            }
            var checksDto = mapper.Map<List<ConsultaCheckIn_CkeckOutDto>>(checks);
            return new
            {
                data = checksDto,
                success = true
            };

        }

        [HttpGet("CheckInOut/{IdEmpleado}")]
        public async Task<ActionResult<bool>> CheckInOut(long IdEmpleado)
        {
            var checks = await _context.CheckIn_CkeckOut.Where(p => p.IdEmpleado == IdEmpleado && p.CheckOut == null).FirstOrDefaultAsync();
            if (checks == null)
            {
                return false;
            }
            return true;
        }
        [HttpGet("CheckInAndCheckOutComplete/{IdEmpleado}")]
        public async Task<ActionResult<bool>> CheckInAndCheckOutComplete(long IdEmpleado)
        {
            var checks = await _context.CheckIn_CkeckOut.Where(p => p.IdEmpleado == IdEmpleado && p.CheckIN != null && p.CheckOut != null).FirstOrDefaultAsync();
            if (checks == null)
            {
                return false;
            }

            return true;

        }

        [HttpGet("{IdCheck}")]
        public async Task<ActionResult<ConsultaCheckIn_CkeckOutDto>> GetCheckId(long IdCheck)
        {
            if (_context.CheckIn_CkeckOut == null)
            {
                return NotFound();
            }
            var check = await _context.CheckIn_CkeckOut.FirstAsync(b => b.IdCheck == IdCheck);

            if (check == null)
            {
                return NotFound();
            }

            var checkDto = mapper.Map<ConsultaCheckIn_CkeckOutDto>(check);

            return checkDto;
        }


        [HttpGet("checkIn_checkOut/FotosIn/{fecha}/{IdEmpleado}")]
        public async Task<ActionResult> GetFotosUser(string fecha, long IdEmpleado)
        {
            string? ruta = configuration.GetSection("Ruta:Completa").Value;
            string path = Path.Combine(ruta, "Photos\\", "Fotos" + fecha);
            string OperadorPath = Path.Combine(path, IdEmpleado.ToString(), "CheckIn");

            if (!Directory.Exists(OperadorPath))
            {
                return NotFound();
            }

            string[] files = Directory.GetFiles(OperadorPath);

            List<string> fotos = new List<string>();

            foreach (string file in files)
            {
                string rutaImagen = Path.Combine(OperadorPath, Path.GetFileName(file));
                fotos.Add(rutaImagen);
            }

            var resultado = new
            {
                Fotos = fotos
            };

            return Ok(resultado);
        }


        [HttpGet("checkIn_checkOut/FotosOut/fecha/{IdEmpleado}")]
        public async Task<ActionResult> GetFotosOutUser(string fecha, long IdEmpleado)
        {
            string? ruta = configuration.GetSection("Ruta:Completa").Value;
            string path = Path.Combine(ruta, "Photos\\", "Fotos" + fecha);
            string OperadorPath = Path.Combine(path, IdEmpleado.ToString(), "CheckOut");

            if (!Directory.Exists(OperadorPath))
            {
                return NotFound();
            }

            string[] files = Directory.GetFiles(OperadorPath);

            List<string> fotos = new List<string>();
            foreach (string file in files)
            {
                string rutaImagen = Path.Combine(OperadorPath, Path.GetFileName(file));
                fotos.Add(rutaImagen);
            }

            var resultado = new
            {
                Fotos = fotos
            };

            return Ok(resultado);
        }


    }
}