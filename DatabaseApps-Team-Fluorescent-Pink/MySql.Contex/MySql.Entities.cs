namespace MySql.Contex
{
    using System.Data.Entity;
    using MySql.Models;
    using MySql.Data.Entity;
    using MySql.Contex.Migrations;

    [DbConfigurationType(typeof(MySqlEFConfiguration))]
    public class MySqlEntities : DbContext
    {
        public MySqlEntities()
            : base("MySqlEntities")
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<MySqlEntities, Configuration>());
        }

        public virtual DbSet<MyExpense> Expenses { get; set; }
        public virtual DbSet<MyProduct> Products { get; set; }
        public virtual DbSet<MySale> Sales { get; set; }
        public virtual DbSet<MyVendor> Vendors { get; set; }
    }
}