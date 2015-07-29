namespace MySql.Contex.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<MySql.Contex.MySqlEntities>
    {
        public Configuration()
        {
            AutomaticMigrationDataLossAllowed = true;
            AutomaticMigrationsEnabled = true;
            ContextKey = "MySql.Contex.MySqlEntities";
        }

        protected override void Seed(MySql.Contex.MySqlEntities context)
        {
            
        }
    }
}
