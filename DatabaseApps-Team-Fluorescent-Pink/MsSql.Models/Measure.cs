using System.ComponentModel.DataAnnotations;

namespace MsSql.Models
{
    public class Measure
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 1)]
        public string Name { get; set; }
    }
}