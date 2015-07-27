namespace MsSql.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Sale
    {
        private Vendor vendor;

        private Supermarket supermarket;

        public Sale()
        {
        }

        public Sale(Vendor vendor, int productId, Supermarket supermarket, decimal unitPrice, int quantity)
        {
            this.vendor = vendor;
            this.ProductId = productId;
            this.supermarket = supermarket;
            this.UnitPrice = unitPrice;
            this.Quantity = quantity;
            this.Sum = this.Quantity * this.UnitPrice;
            this.Date = DateTime.Now;
        }

        public int Id { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime Date { get; set; }

        [Required]
        public int ProductId { get; set; }

        public virtual Product Product { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int Quantity { get; set; }

        [Required]
        public decimal UnitPrice { get; set; }

        public decimal Sum { get; set; }

        public virtual Supermarket Supermarket
        {
            get
            {
                return this.supermarket;
            }

            set
            {
                this.supermarket = value;
            }
        }

        public virtual Vendor Vendor
        {
            get
            {
                return this.vendor;
            }

            set
            {
                this.vendor = value;
            }
        }
    }
}