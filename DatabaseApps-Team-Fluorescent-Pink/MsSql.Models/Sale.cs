using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MsSql.Models
{
    public class Sale
    {
        public Sale()
        {

        }

        public Sale(Vendor vendor, int productId, Supermarket supermarket, decimal unitPrice, int quantity)
        {
            this.Vendor = vendor;
            this.ProductId = productId;
            this.Supermarket = supermarket;
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

        public virtual Supermarket Supermarket { get; set; }

        public virtual Vendor Vendor { get; set; }
    }
}