using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Security.Claims;
using TransportationCore.Data.Models;
using TransportationCore.GeneralClass;

namespace TransportationCore.Controllers
{
    //////[Authorize(Policy = "AdministradorPolicy", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class PermisosController : ControllerBase
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public PermisosController(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        [HttpPost("CreateRole")]
        public async Task<IActionResult> CreateRole(string roleName)
        {
            var roleExists = await _roleManager.RoleExistsAsync(roleName);
            if (!roleExists)
            {
                var result = await _roleManager.CreateAsync(new IdentityRole(roleName));
                return Ok(result);
            }
            return StatusCode(StatusCodes.Status409Conflict, $"Rol '{roleName}' ya existe.");
        }

        [HttpPost("AddPermissionToRole")]
        public async Task<IActionResult> AddPermissionToRole(string roleName, string permission)
        {
            var role = await _roleManager.FindByNameAsync(roleName);
            if (role == null)
            {
                return NotFound($"No se encontró el rol '{roleName}'.");
            }

            var claims = await _roleManager.GetClaimsAsync(role);
            var claimExists = claims.Any(c => c.Type == "Permission" && c.Value == permission);
            if (claimExists)
            {
                return StatusCode(StatusCodes.Status409Conflict, $"El rol '{roleName}' ya tiene el permiso '{permission}'.");
            }

            var result = await _roleManager.AddClaimAsync(role, new Claim("Permission", permission));
            return Ok(result);
        }


        [HttpPost("AssignRoleToUser")]
        public async Task<IActionResult> AssignRoleToUser(string userId, string roleName)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
            {
                return NotFound($"No se encontró usuario con Id '{userId}'.");
            }

            var roleExists = await _roleManager.RoleExistsAsync(roleName);
            if (!roleExists)
            {
                return NotFound($"No se encontró el rol '{roleName}'.");
            }

            var result = await _userManager.AddToRoleAsync(user, roleName);
            return Ok(result);
        }

        [HttpGet("GetAllPermissions")]
        public IActionResult GetAllPermissions()
        {
            return Ok(ListaPermisos.Permisos);
        }

        [HttpGet("GetAllRolesWithPermissions")]
        public async Task<IActionResult> GetAllRolesWithPermissions()
        {
            var roles = await _roleManager.Roles.ToListAsync();
            var rolePermissionList = new List<PermisosRoles>();

            foreach (var role in roles)
            {
                var claims = await _roleManager.GetClaimsAsync(role);
                var permissions = claims.Where(c => c.Type == "Permission").Select(c => c.Value).ToList();
                rolePermissionList.Add(new PermisosRoles { RoleName = role.Name, Permissions = permissions });
            }

            return Ok(rolePermissionList);
        }

        [HttpGet("GetAllRoles")]
        public async Task<IActionResult> GetAllRoles()
        {
            var roles = await _roleManager.Roles.ToListAsync();
            

            return Ok(roles);
        }


        [HttpGet("GetAllUsersWhithRoles")]
        public async Task<ActionResult<IEnumerable<object>>> GetAllUsersWithRoles()
        {
            var users = await _userManager.Users.ToListAsync();

            var usersWithRoles = users.Select(async user => new
            {
                user.Id,
                user.UserName,
                user.Email,
                UserRoles = await _userManager.GetRolesAsync(user)
            }).Select(t => t.Result);

            return Ok(usersWithRoles);
        }

        // GET: api/Users/registered
        [HttpGet("GetAllUsers")]
        public async Task<ActionResult<IEnumerable<IdentityUser>>> GetRegisteredUsers()
        {
            var users = await _userManager.Users.ToListAsync();
            return users;
        }
    }
}
