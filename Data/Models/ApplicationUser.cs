using Microsoft.AspNetCore.Identity;

namespace TransportationCore.Data.Models
{
    public class ApplicationUser : IdentityUser
    {
        public virtual ICollection<string> UserRoles { get; set; }
    }
}
