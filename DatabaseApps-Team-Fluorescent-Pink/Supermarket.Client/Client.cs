using MsSql.Data;

namespace Supermarket.Client
{
    using System;
    using System.Linq;
    //using MySQL.Options;

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
                    case "0": exit = false;
                        break;
                    case "1":
                        StaticData.DisplayOracleSqlMenu();
                        break;
                    case "2":
                        StaticData.DisplayMsSqlMenu();
                        break;
                    case "3":
                        break;
                    case "4":
                        break;
                    case "5":
                        StaticData.ExportToJsonAndMongoDb();
                        break;
                    case "6":
                        break;
                    case "7":
                        StaticData.DisplayMySqlMenu();
                        MySqlOptions();
                        break;
                    case "8":
                        break;
                    default:
                        Console.WriteLine("Invalid selection!");
                        break;
                }
            }
        }

        private static void MySqlOptions()
        {
            //var mysql = new MySQLOpt();
            bool sqlExit = true;

            while (sqlExit)
            {
                string sqlChoise = Console.ReadLine();
                switch (sqlChoise)
                {
                    case "0": 
                        sqlExit = false; 
                        break;
                    case "1": 
                        //mysql.AggregatedData(); 
                        break;
                    case "2": 
                        //mysql.LoadData(); 
                        break;
                    default: 
                        Console.WriteLine("Invalid selection!");
                        break;
                }

                StaticData.DisplayMySqlMenu();
            }
        }
    }
}
