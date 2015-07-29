namespace MySql.Options
{
    using System;
    using System.Linq;
    using MySql.Contex;

    public static class MySqlOptions
    {
        public static void AggregatedData()
        {
            var my_db = new MySqlEntities();
            my_db.Database.CreateIfNotExists();

            var my_productsCount = my_db.Products.Count();
            var my_vendorsCount = my_db.Vendors.Count();
            var my_salesCount = my_db.Sales.Count();
            var my_expensesCount = my_db.Expenses.Count();

            Console.WriteLine(my_productsCount);
            Console.WriteLine(my_vendorsCount);
            Console.WriteLine(my_salesCount);
            Console.WriteLine(my_expensesCount);
        }
    }
}
