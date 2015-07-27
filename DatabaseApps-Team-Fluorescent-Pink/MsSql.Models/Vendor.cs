namespace MsSql.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Vendor
    {
        private ICollection<Expense> expenses;

        private ICollection<Product> products;

        private ICollection<Sale> sales;

        public Vendor()
        {
            this.products = new HashSet<Product>();
            this.sales = new HashSet<Sale>();
            this.expenses = new HashSet<Expense>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(250, MinimumLength = 5)]
        public string Name { get; set; }

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

        public virtual ICollection<Product> Products
        {
            get
            {
                return this.products;
            }

            set
            {
                this.products = value;
            }
        }

        public virtual ICollection<Expense> Expenses
        {
            get
            {
                return this.expenses;
            }

            set
            {
                this.expenses = value;
            }
        }
    }
}