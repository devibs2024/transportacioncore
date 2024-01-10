using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using TransportationCore.CustomError;

namespace TransportationCore.CustomError
{
    public class ValidateModelAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (!context.ModelState.IsValid)
            {
                var errors = context.ModelState
                                    .Where(e => e.Value.Errors.Count > 0)
                                    .Select(e => new
                                    {
                                        StatusCode = 400,
                                        Message = "Error en la validacion del modelo",
                                        Errors = e.Value?.Errors.Select(err => err.ErrorMessage)
                                    });

                context.Result = new BadRequestObjectResult(errors);
            }          
        }
    }

}
