using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySQL.Options
{
    public class MySQLOpt
    {
        public void AggregatedData()
        {

            using (MySQLEntities my_db = new MySQLEntities())
            {
                try
                {
                    int countProducts = my_db.my_product.Count();
                    int countVendors = my_db.my_vendor.Count();
                    int countMeasures = my_db.my_measure.Count();
                    int countCategories = my_db.my_category.Count();

                    Console.WriteLine("----------------------------------");
                    Console.WriteLine(
                        "Records in table: Products".PadRight(26) + " - " + countProducts.ToString().PadLeft(5));
                    Console.WriteLine(
                        "Records in table: Vendors".PadRight(26) + " - " + countVendors.ToString().PadLeft(5));
                    Console.WriteLine(
                        "Records in table: Measre".PadRight(26) + " - " + countMeasures.ToString().PadLeft(5));
                    Console.WriteLine(
                        "Records in table: Category".PadRight(26) + " - " + countCategories.ToString().PadLeft(5));
                    Console.WriteLine("----------------------------------");
                }
                catch (Exception e)
                {
                    Console.WriteLine("\r\nError in MySQL connection or missing table!\r\n\r\n" + e);
                }
            }
        }

        public void LoadData()
        {
            Console.WriteLine("Load data from MS SQL database");
        }
    }
}
