using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MsSql.Models
{
    public class Expense
    {
        public int Id { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime Date { get; set; }

        [Column(TypeName = "money")]
        public decimal Sum { get; set; }

        public int VendorId { get; set; }

        public virtual Vendor Vendor { get; set; }
    }
}