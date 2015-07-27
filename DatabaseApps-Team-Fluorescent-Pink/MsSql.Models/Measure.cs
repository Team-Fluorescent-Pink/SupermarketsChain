namespace MsSql.Models
{
    using System.ComponentModel.DataAnnotations;

    public class Measure
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 1)]
        public string Name { get; set; }
    }
}