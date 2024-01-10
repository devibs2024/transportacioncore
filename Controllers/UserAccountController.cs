using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using NuGet.Protocol;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using TransportationCore.Data;
using TransportationCore.Data.Dtos.Cliente;
using TransportationCore.Data.Dtos.UserAccount;
using TransportationCore.Data.Models;
//
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using TransportationCore.Data.Dtos.ValidateUserAccount;
using NuGet.Common;
using Newtonsoft.Json.Linq;

namespace TransportationCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserAccountController : ControllerBase
    {
        private readonly SignInManager<IdentityUser> signinManager;
        private readonly UserManager<IdentityUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly IConfiguration configuration;
        private readonly ApplicationDbContext _context;
        private readonly IMapper mapper;

        public UserAccountController(UserManager<IdentityUser> userManager, IConfiguration configuration, ApplicationDbContext _context
                                  , SignInManager<IdentityUser> signinManager, RoleManager<IdentityRole> roleManager, IMapper mapper)

        {
            this.configuration = configuration;
            this.signinManager = signinManager;
            this.userManager = userManager;
            this.roleManager = roleManager;
            this._context = _context;
            this.mapper = mapper;
        }



        [HttpPost("createUser")]
        public async Task<ActionResult<AuthenticationResponseDto>> CreateUser(UserCredencialsCrearDto userCredencialsDto)
        {

            var user = new IdentityUser { UserName = userCredencialsDto.Email, Email = userCredencialsDto.Email };
            var result = await userManager.CreateAsync(user, userCredencialsDto.Password);

            if (result.Succeeded)
            {
                return Ok("Usuario creado correctamente.");
            }
            else
            {
                return BadRequest(result.Errors);
            }
        }


        [HttpPost("login")]
        public async Task<ActionResult<AuthenticationResponseDto>> Login(UserCredencialsDto userCredentials)
        {
            var result = await signinManager.PasswordSignInAsync(userCredentials.Email
                , userCredentials.Password, isPersistent: false, lockoutOnFailure: false);

            if (result.Succeeded)
            {
                return CreateToken(userCredentials);
            }
            else
            {
                return BadRequest("Login incorrecto");
            }
        }


        [HttpGet("RefreshToken")]
        ////[Authorize(Policy = "UsuarioPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult<AuthenticationResponseDto> RefreshToken()
        {
            var emailClaim = HttpContext.User.Claims.Where(x => x.Type == "UserEmail").FirstOrDefault();
            var email = emailClaim.Value;

            var credencialUser = new UserCredencialsDto { Email = email };
            return CreateToken(credencialUser);
        }


        //-------------------------------
        [HttpPost("RegistrarUsuario")]
        public async Task<ActionResult<UserCredencialsRegistrarDto>> RegistrarUsuario(UserCredencialsRegistrarDto registrarDto)
        {
            if (registrarDto.Email != registrarDto.ConfirmarEmail) return BadRequest("Los correos no coinciden.");

            var empleado = await _context.Empleados.FirstOrDefaultAsync(x => x.Correo.Trim().ToUpper().Trim() == registrarDto.Email.Trim().ToUpper());
            if (empleado == null) return NotFound("No existe ningun empleado registrado con este correo, favor validar.");

            var user = await userManager.FindByEmailAsync(registrarDto.Email);
            if (user != null) return BadRequest("Este correo está siendo utilizado, favor contactar al administrador del sistema.");


            //Generar Codigo RegistrarUsuario y guardar:
            string codigo = Guid.NewGuid().ToString().Substring(0, 6).ToUpper();
            DateTime fechaExp = DateTime.UtcNow.AddMinutes(15);

            ValidateUserAccountDto validateUserAccountDto = new ValidateUserAccountDto();
            var validateUserAccount = mapper.Map<ValidateUserAccount>(validateUserAccountDto);
            validateUserAccount.IdEmpleado = empleado.IdEmpleado;
            validateUserAccount.CorreoEmpleado = empleado.Correo;
            validateUserAccount.CodigoVerficacion = codigo;
            validateUserAccount.fechaExpiracion = fechaExp;
            validateUserAccount.TipoCodigo = "RegistrarUsuario";


            _context.ValidateUserAccounts.Add(validateUserAccount);
            await _context.SaveChangesAsync();

            //Enviar correo:
            try
            {
                string? body1 = configuration.GetSection("SMTP_Settings:bodyRegistrarUsuario").Value;
                int smtport1;
                int.TryParse(configuration.GetSection("SMTP_Settings:smtpPort").Value, out smtport1);

                string toEmail = empleado.Correo;
                string? subject = configuration.GetSection("SMTP_Settings:subjectRegistrarUsuario").Value;
                string? body = string.Format(body1, codigo);

                string? smtpServer = configuration.GetSection("SMTP_Settings:smtpServer").Value;
                int smtpPort = smtport1;
                string? smtpUsername = configuration.GetSection("SMTP_Settings:smtpUsername").Value;
                string? smtpPassword = configuration.GetSection("SMTP_Settings:smtpPassword").Value;

                using var mailMessage = new MailMessage
                {
                    From = new MailAddress(smtpUsername),
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                };
                mailMessage.To.Add(new MailAddress(toEmail));

                using var smtpClient = new SmtpClient(smtpServer, smtpPort)
                {
                    Credentials = new NetworkCredential(smtpUsername, smtpPassword),
                    EnableSsl = true
                };

                await smtpClient.SendMailAsync(mailMessage);
            }
            catch
            {
                return BadRequest("No se pudo validar su correo.");
            }

            string correoEnviadoParcial = empleado.Correo.Substring(0, 3) + new string('*', empleado.Correo.Length - 3);
            return Ok($"Un código de verificación le fue enviado a la dirección de correo: {correoEnviadoParcial}");
        }



        [HttpPost("ValidarCodigo")]
        public async Task<ActionResult> ValidarCodigo(CodigoValidateUserAccountDto codigoValidateUserAccountDto)
        {
            var buscarCorreo = await _context.ValidateUserAccounts.FirstOrDefaultAsync(x => x.CorreoEmpleado.Trim().ToUpper().Trim() == codigoValidateUserAccountDto.CorreoEmpleado.Trim().ToUpper());
            if (buscarCorreo == null) return NotFound("No se han enviado Códigos a este correo, favor validar.");

            var CorreoCodigo = await _context.ValidateUserAccounts.FirstOrDefaultAsync(c => c.CorreoEmpleado.Trim().ToUpper().Trim() == codigoValidateUserAccountDto.CorreoEmpleado.Trim().ToUpper()
                                                                                            && c.CodigoVerficacion == codigoValidateUserAccountDto.CodigoVerficacion);
            if (CorreoCodigo == null) return NotFound("No existe codigo.");
            if (CorreoCodigo.fechaExpiracion < DateTime.UtcNow)
            {
                _context.ValidateUserAccounts.Remove(CorreoCodigo);
                await _context.SaveChangesAsync();
                return NotFound("El código ha Expirado.");
            }

            _context.ValidateUserAccounts.Remove(CorreoCodigo);
            await _context.SaveChangesAsync();

            if (CorreoCodigo.TipoCodigo == "RegistrarUsuario") return Ok("Usuario Validado.");
            else return Ok("Código Validado.");

        }


        //-------------------------------
        [HttpPost("RecuperarClave")]
        public async Task<ActionResult> RecuperarClave(RecuperarClaveDto recuperarClaveDto)
        {
            if (recuperarClaveDto.Email != recuperarClaveDto.ConfirmarEmail) return BadRequest("Los correos no coinciden.");
            var user = await userManager.FindByEmailAsync(recuperarClaveDto.Email);
            if (user == null) return BadRequest("El usuario no fue encontrado en el sistema.");

            //Generar Codigo y guardar:
            string codigo = Guid.NewGuid().ToString().Substring(0, 6).ToUpper();
            DateTime fechaExp = DateTime.UtcNow.AddMinutes(15);

            ValidateUserAccountDto validateUserAccountDto = new ValidateUserAccountDto();
            var validateUserAccount = mapper.Map<ValidateUserAccount>(validateUserAccountDto);
            validateUserAccount.CorreoEmpleado = user.Email;
            validateUserAccount.CodigoVerficacion = codigo;
            validateUserAccount.fechaExpiracion = fechaExp;
            validateUserAccount.TipoCodigo = "RecuperarClave";

            _context.ValidateUserAccounts.Add(validateUserAccount);
            await _context.SaveChangesAsync();

            //Enviar correo:
            try
            {
                string? body1 = configuration.GetSection("SMTP_Settings:bodyRegistrarUsuario").Value;
                int smtport1;
                int.TryParse(configuration.GetSection("SMTP_Settings:smtpPort").Value, out smtport1);

                string? toEmail = user.Email;
                string? subject = configuration.GetSection("SMTP_Settings:subjectRecuperarClave").Value;
                string? body = string.Format(body1, codigo);

                string? smtpServer = configuration.GetSection("SMTP_Settings:smtpServer").Value;
                int smtpPort = smtport1;
                string? smtpUsername = configuration.GetSection("SMTP_Settings:smtpUsername").Value;
                string? smtpPassword = configuration.GetSection("SMTP_Settings:smtpPassword").Value;


                using var mailMessage = new MailMessage
                {
                    From = new MailAddress(smtpUsername),
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                };
                mailMessage.To.Add(new MailAddress(toEmail));

                using var smtpClient = new SmtpClient(smtpServer, smtpPort)
                {
                    Credentials = new NetworkCredential(smtpUsername, smtpPassword),
                    EnableSsl = true
                };
                await smtpClient.SendMailAsync(mailMessage);
            }
            catch
            {
                return BadRequest("No se pudo enviar el código a su correo.");
            }

            string correoEnviadoParcial = user.Email.Substring(0, 3) + new string('*', user.Email.Length - 3);
            return Ok($"Un código de verificación le fue enviado a la dirección de correo: {correoEnviadoParcial} para la recuperación de su contraseña.");
        }



        [HttpPost("NuevaClaveRecuperarClave")]
        public async Task<ActionResult> NuevaClaveRecuperarClave(NuevaClaveRecuperarClaveDto NuevaClaveRecuperarClaveDto)
        {

            //
            var user = await userManager.FindByEmailAsync(NuevaClaveRecuperarClaveDto.Email);
            if (user != null)
            {
                var token = await userManager.GeneratePasswordResetTokenAsync(user);
                var result = await userManager.ResetPasswordAsync(user, token, NuevaClaveRecuperarClaveDto.NewPassword);

                if (result.Succeeded)
                {
                    return Ok("Su contraseña ha sido recuperada.");
                }
                else return BadRequest("No se pudo restaurar su contraseña. Verifique que su contraseña cumpla con los requisitos.");
            }
            else return BadRequest("Su usuario no puede ser encontrado.");
        }

        [HttpPost("CambiarClave")]
        ////[Authorize(Policy = "UsuarioPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> ChangePassword([FromBody] UserCredencialsCambiarClaveDto changePasswordDto)
        {
            var userEmail = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "UserEmail")?.Value;

            if (userEmail == null)
            {
                return BadRequest("Usuario no encontrado");
            }


            var user = await userManager.FindByEmailAsync(userEmail);

            if (user == null)
            {
                return NotFound("El usuario no se encuentra registrado.");
            }

            var result = await userManager.ChangePasswordAsync(user, changePasswordDto.CurrentPassword, changePasswordDto.NewPassword);

            if (result.Succeeded)
            {
                return Ok("La contraseña ha sido cambiada exitosamente.");
            }
            else
            {
                return BadRequest(result.Errors);
            }
        }

        private AuthenticationResponseDto CreateToken(UserCredencialsDto userCredencials)
        {
            var IdEmpleado = _context.Empleados.Where(e => e.Correo == userCredencials.Email).FirstOrDefault().IdEmpleado;
            var claims = new List<Claim>()
            {
                new Claim("UserEmail", userCredencials.Email),
                new Claim("Id", IdEmpleado.ToString())
            };
           

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration.GetSection("Jwt:Key").Value));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            int totaldays = 0;
            int.TryParse(configuration.GetSection("Jwt:ExpirationDate").Value, out totaldays);

            var expirationDate = DateTime.Now.AddDays(totaldays);

            var securityToken = new JwtSecurityToken(issuer: "JWTAuthenticationServer", audience: "JWTServicePostmanClient", claims: claims,
                expires: expirationDate, signingCredentials: credentials);


            var responseDto = new AuthenticationResponseDto()
            {
                Token = new JwtSecurityTokenHandler().WriteToken(securityToken),
                ExpirationDate = expirationDate
            };


            return responseDto;
        }
    }
}
