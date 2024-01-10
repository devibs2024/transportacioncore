using System.ComponentModel.DataAnnotations;

namespace TransportationCore.Data.Models
{
    public class AuditLog
    {
        [Key]
        public long Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string TableName { get; set; }

        [Required]
        [MaxLength(450)]
        public string EntityId { get; set; }

        [Required]
        [MaxLength(12)]
        public string ActionType { get; set; }

        [MaxLength(75)]
        public string UserId { get; set; }
        
        public string OldValues { get; set; }
        
        public string NewValues { get; set; }

        [Required]
        public DateTime ActionDate { get; set; }
    }
}
