using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace TransportationCore.CustomError
{
    public class ErrorResponse
    {
        public ErrorResponse(string msg)
        {
            List<string> lstMsg = new List<string>();
            lstMsg.Add(msg);

            this.StatusCode = 400;
            this.Errors = lstMsg;            
            this.Message = "Error validacion logica de negocios";
        }

        public ErrorResponse()
        {
            
        }
        public int StatusCode { get; set; }
        public string Message { get; set; }
        public IEnumerable<string> Errors { get; set; }
    }
}
