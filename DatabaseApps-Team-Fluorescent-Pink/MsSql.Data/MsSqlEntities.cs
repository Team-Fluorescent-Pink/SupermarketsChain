using System.Data.Entity;
using MsSql.Models;

namespace MsSql.Data
{
    public class MsSqlEntities : DbContext
    {
        public MsSqlEntities()
            : base("name=MsSqlEntities")
        {
        }

        public virtual DbSet<Product> Products { get; set; }

        public virtual DbSet<Sale> Sales { get; set; }

        public virtual DbSet<Vendor> Vendors { get; set; }

        public virtual DbSet<Measure> Measures { get; set; }

        public virtual DbSet<Supermarket> Supermarkets { get; set; }

        public virtual DbSet<Category> Categories { get; set; }

        public virtual DbSet<Expense> Expenses { get; set; } 
    }
}