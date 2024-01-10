using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TransportationCore;
using TransportationCore.Data;

namespace TransportationCore.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PruebaController : ControllerBase
    {
        private readonly ILogger<PruebaController> _logger;
        private readonly ApplicationDbContext _context;

        public PruebaController(ILogger<PruebaController> logger, ApplicationDbContext _context)
        {
            _logger = logger;
            this._context = _context;
        }

        [HttpPost]
        public IActionResult Post([FromBody] PhotoData photoData)
        {
            try
            {
                string photoPath = Path.Combine("Photos", $"{photoData.UserId}_{DateTime.UtcNow.ToString("yyyyMMdd_HHmmss")}.jpeg");
                byte[] photoBytes = Convert.FromBase64String(photoData.Image.Split(",")[1]);
                System.IO.File.WriteAllBytes(photoPath, photoBytes);

                return Ok(new { message = "Foto recibida y almacenada." });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Error al procesar la foto: {ex.Message}" });
            }

            return Ok();
        }

        //[HttpGet("{userId}")]
        //public async Task<ActionResult<PhotoRecord>> Get(string userId)
        //{
        //    var photoRecord = await _context.PhotoRecords.FindAsync(userId);
        //    if (photoRecord == null)
        //    {
        //        return NotFound();
        //    }
        //    return photoRecord;
        //}

    }
    public class PhotoData
    {
        public string UserId { get; set; }
        public string Image { get; set; }
    }

}


