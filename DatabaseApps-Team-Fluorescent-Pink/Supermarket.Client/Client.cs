namespace Supermarket.Client
{
    using System;

    public class Client
    {
        [STAThread]
        public static void Main()
        {
  
            bool exit = true;

            while (exit)
            {
                Console.Clear();
                StaticData.Header();
                StaticData.DisplayMenu();
                Console.Write("\nPlease, select option: ");
                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "0":
                        exit = false;
                        break;
                    case "1":
                        StaticData.DisplayOracleSqlMenu();
                        break;
                    case "2":
                        StaticData.DisplayMsSqlMenu();
                        break;
                    case "3":
                        StaticData.GeneratePdfSalesReports();
                        break;
                    case "4":
                        StaticData.GenerateXmlSalesByVendorReport();
                        break;
                    case "5":
                        StaticData.ExportToJsonAndMongoDb();
                        break;
                    case "6":
                        StaticData.LoadExpenseDataFromXml();
                        break;
                    case "7":
                        StaticData.DisplayMySqlMenu();
                        break;
                    case "8":
                        break;
                    default:
                        Console.WriteLine("Invalid selection!");
                        break;
                }
            }
        }
    }
}