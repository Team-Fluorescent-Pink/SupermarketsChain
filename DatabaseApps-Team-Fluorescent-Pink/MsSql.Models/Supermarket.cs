namespace MsSql.Models
{
    using System.ComponentModel.DataAnnotations;

    public class Supermarket
    {
        public int Id { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 3)]
        public string Name { get; set; }
    }
}