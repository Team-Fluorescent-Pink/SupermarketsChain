namespace MsSql.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Product
    {
        private ICollection<Sale> sales;

        public Product()
        {
            this.sales = new HashSet<Sale>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(250, MinimumLength = 3)]
        public string Name { get; set; }

        public int VendorId { get; set; }

        public virtual Vendor Vendor { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        public int MeasureId { get; set; }

        public virtual Measure Measure { get; set; }

        [Required]
        [Column(TypeName = "money")]
        public decimal Price { get; set; }

        public virtual ICollection<Sale> Sales
        {
            get
            {
                return this.sales;
            }

            set
            {
                this.sales = value;
            }
        }
    }
}