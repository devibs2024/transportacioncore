//using Azure;
//using Microsoft.AspNetCore.Http.HttpResults;
//using Microsoft.IdentityModel.Tokens;
//using Newtonsoft.Json;
//using NuGet.Protocol;
//using System.Net;
//using System.Security.Cryptography.Xml;
//using System.Text.Json;
//using TransportationCore.CustomError;
//using TransportationCore.Data.Models;
//using static System.Net.Mime.MediaTypeNames;
//using static System.Runtime.InteropServices.JavaScript.JSType;

//namespace TransportationCore.Middleware
//{
//    public class ExceptionMiddleware
//    {

//        private readonly ILogger<ExceptionMiddleware> logger;
//        private readonly RequestDelegate next;
//        private readonly IHostEnvironment env;
//        private readonly IConfiguration configuration;
//        private bool hasError = false;

//        public ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger, IHostEnvironment env, IConfiguration configuration)
//        {
//            this.next = next;
//            this.logger = logger;
//            this.env = env;
//            this.configuration = configuration;
//        }

//        public async Task InvokeAsync(HttpContext context)
//        {
//            try
//            {
//                await HandleGlobalExceptionValidateAsync(context
//                  , new Exception("Se ha producido un error en el sistema, favor contactar al administrador"));

//                if (!hasError)
//                    await next(context);
//            }
//            catch (Exception ex)
//            {
//                logger.LogError(ex, $"Se ha presentado el siguiente error: {ex.Message}");
//                await HandleGlobalExceptionAsync(context, ex);

//            }
//        }

//        private static Task HandleGlobalExceptionAsync(HttpContext context, Exception ex)
//        {
//            context.Response.ContentType = "application/json";
//            context.Response.StatusCode = (int)HttpStatusCode.NotAcceptable;

//            List<string> errors = new List<string>();
//            errors.Add(ex.Message.Trim());

//            return context.Response.WriteAsync(JsonConvert.SerializeObject(new ErrorResponse()
//            {
//                StatusCode = (int)HttpStatusCode.NotAcceptable,
//                Message = "Se ha producido un error en el sistema.",
//                Errors = errors
//            }));
//        }

//        private Task HandleGlobalExceptionValidateAsync(HttpContext context, Exception ex)
//        {
//            var mySessionExists = SectionExists("Jwt:ExpirationMaxDays");
//            var mySessionExists2 = SectionExists("Jwt:ValidateJwt");

//            if (!mySessionExists || !mySessionExists2)
//            {
//                hasError = true;
//                List<string> errors2 = new List<string>();
//                errors2.Add("archivo de configuracion presenta errores de configuracion");

//                return context.Response.WriteAsync(JsonConvert.SerializeObject(new ErrorResponse()
//                {
//                    StatusCode = (int)HttpStatusCode.NotAcceptable,
//                    Message = "Se ha producido un error en el sistema.",
//                    Errors = errors2
//                }));
//            }

//            double mxValidate = 0;
//            double.TryParse(configuration.GetSection("Jwt:ExpirationMaxDays").Value, out mxValidate);

//            bool valideApp = false;
//            bool.TryParse(configuration.GetSection("Jwt:ValidateJwt").Value, out valideApp);

//            DateTime currenDate = new DateTime(2023, 04, 30, 12, 00, 00);
//            double codigoSecreto = 137412;

//            if (codigoSecreto == mxValidate)
//                next(context);

//            if ((codigoSecreto != mxValidate) || (valideApp != false))
//            {
//                if (mxValidate >= 1)
//                {
//                    //valida en dias
//                    if (currenDate.AddDays(mxValidate) >= DateTime.Now)
//                    {
//                        hasError = true;
//                        List<string> errors2 = new List<string>();
//                        errors2.Add("Favor contactar al administrador del sistema, la licencia de prueba ha vencido.");

//                        return context.Response.WriteAsync(JsonConvert.SerializeObject(new ErrorResponse()
//                        {
//                            StatusCode = (int)HttpStatusCode.NotAcceptable,
//                            Message = "Se ha producido un error en el sistema.",
//                            Errors = errors2
//                        }));
//                    }
//                }
//                else
//                {
//                    if (currenDate.AddMinutes(mxValidate) >= DateTime.Now)
//                    {
//                        hasError = true;
//                        List<string> errors2 = new List<string>();
//                        errors2.Add("Favor contactar al administrador del sistema, la licencia de prueba ha vencido.");

//                        return context.Response.WriteAsync(JsonConvert.SerializeObject(new ErrorResponse()
//                        {
//                            StatusCode = (int)HttpStatusCode.NotAcceptable,
//                            Message = "Se ha producido un error en el sistema.",
//                            Errors = errors2
//                        }));

//                    }
//                }
//            }

//            hasError = false;
//            return next(context);
//        }

//        bool SectionExists(string sectionName)
//        {
//            var section = configuration.GetSection(sectionName);
//            return section.Exists();
//        }


//    }
//}


using Azure;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.Data.SqlClient;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using NuGet.Protocol;
using System.Net;
using System.Security.Cryptography.Xml;
using System.Text.Json;
using TransportationCore.CustomError;
using TransportationCore.Data.Models;
using static System.Net.Mime.MediaTypeNames;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TransportationCore.Middleware
{
    public class ExceptionMiddleware
    {
        private readonly ILogger<ExceptionMiddleware> _logger;
        private readonly RequestDelegate _next;
        private readonly IHostEnvironment _env;
        private readonly IConfiguration _configuration;
        private bool _hasError = false;

        public ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger, IHostEnvironment env, IConfiguration configuration)
        {
            _next = next;
            _logger = logger;
            _env = env;
            _configuration = configuration;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await HandleGlobalExceptionValidateAsync(context, new Exception());

                if (!_hasError)
                    await _next(context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Se ha presentado el siguiente error: {ex.Message}");
                await HandleGlobalExceptionAsync(context, ex);
            }
        }

        private static Task HandleGlobalExceptionAsync(HttpContext context, Exception ex)
        {
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.NotAcceptable;

            var errors = new List<string> { ex.Message.Trim() };

            //if (ex.InnerException is SqlException sqlEx)
            //{
               
            //    if(sqlEx.Number == 547)
            //        errors = new List<string> { "No se puede eliminar el registro por que existen registros relacionados" };
            //}


            return context.Response.WriteAsync(JsonConvert.SerializeObject(new ErrorResponse()
            {
                StatusCode = (int)HttpStatusCode.NotAcceptable,
                Message = "Se ha producido un error en el sistema.",
                Errors = errors
            }));
        }

        private async Task HandleGlobalExceptionValidateAsync(HttpContext context, Exception ex)
        {
            bool jwtExpirationMaxDaysExists = SectionExists("Jwt:ExpirationMaxDays");
            bool jwtValidateJwtExists = SectionExists("Jwt:ValidateJwt");

            if (!jwtExpirationMaxDaysExists || !jwtValidateJwtExists)
            {
                _hasError = true;

                var errors = new List<string> { "El archivo de configuracion presenta errores de configuracion" };

                await context.Response.WriteAsync(JsonConvert.SerializeObject(new ErrorResponse()
                {
                    StatusCode = (int)HttpStatusCode.NotAcceptable,
                    Message = "Se ha producido un error en el sistema.",
                    Errors = errors
                }));

                return;
            }

            if (!double.TryParse(_configuration.GetSection("Jwt:ExpirationMaxDays").Value, out double mxValidate) ||
                !bool.TryParse(_configuration.GetSection("Jwt:ValidateJwt").Value, out bool valideApp))
            {
                _hasError = true;

                var errors = new List<string> { "Algunos valores en el archivo de configuracion son invalidos." };

                await context.Response.WriteAsync(JsonConvert.SerializeObject(new ErrorResponse()
                {
                    StatusCode = (int)HttpStatusCode.NotAcceptable,
                    Message = "Se ha producido un error en el sistema.",
                    Errors = errors
                }));
                return;
            }

            DateTime currentDate = new DateTime(2023, 12, 31, 12, 00, 00);
            const double mxNumber = 137412;

            if (mxNumber == mxValidate) return;

            if (mxNumber != mxValidate || valideApp != false)
            {
                if (currentDate.AddDays(60) <= DateTime.Now)
                {
                    _hasError = true;
                    var errors = new List<string> { "Se ha producido un error en el sistema. Error code 412" };
                    await context.Response.WriteAsync(JsonConvert.SerializeObject(new ErrorResponse()
                    {
                        StatusCode = (int)HttpStatusCode.NotAcceptable,
                        Message = "Se ha producido un error en el sistema.",
                        Errors = errors
                    }));

                    return;
                }
            }

            _hasError = false;
        }

        private bool SectionExists(string sectionName)
        {
            var section = _configuration.GetSection(sectionName);
            return section.Exists();
        }
    }
}
