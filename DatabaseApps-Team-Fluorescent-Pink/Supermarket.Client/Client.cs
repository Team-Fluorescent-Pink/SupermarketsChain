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
                CommandExecutor.Header();
                CommandExecutor.DisplayMenu();
                Console.Write("\nPlease, select option: ");
                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "0":
                        exit = false;
                        break;
                    case "1":
                        CommandExecutor.DisplayOracleSqlMenu();
                        break;
                    case "2":
                        CommandExecutor.DisplayMsSqlMenu();
                        break;
                    case "3":
                        CommandExecutor.GeneratePdfSalesReports();
                        break;
                    case "4":
                        CommandExecutor.GenerateXmlSalesByVendorReport();
                        break;
                    case "5":
                        CommandExecutor.ExportToJsonAndMongoDb();
                        break;
                    case "6":
                        CommandExecutor.LoadExpensesByVendorAndMonth();
                        break;
                    case "7":
                        CommandExecutor.DisplayMySqlMenu();
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