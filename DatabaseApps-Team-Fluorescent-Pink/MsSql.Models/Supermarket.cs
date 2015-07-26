using System.ComponentModel.DataAnnotations;

namespace MsSql.Models
{
    public class Supermarket
    {
        public int Id { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 3)]
        public string Name { get; set; }
    }
}