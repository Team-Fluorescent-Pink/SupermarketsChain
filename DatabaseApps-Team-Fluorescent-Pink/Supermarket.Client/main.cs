namespace Supermarket.Client
{
    using MySQL.Options;
    using System;
    using System.Windows.Forms;
    class main
    {
        [STAThread]
        static void Main()
        {
            string choise;
            bool exit = true;

            while (exit)
            {
                Console.Clear();
                StaticData.Header();
                StaticData.DisplayMenu();

                Console.Write("\nPlease, select option: ");
                choise = Console.ReadLine();

                switch (choise)
                {
                    case "0": exit = false; break;
                    case "1": 
                        StaticData.Display_OracleSQL_Menu(); 
                        break;
                    case "2": 
                        StaticData.Display_MSSQL_Menu();
                        break;
                    case "3": ; break;
                    case "4": ; break;
                    case "5": ; break;
                    case "6": ; break;
                    case "7":
                        StaticData.Display_MySQL_Menu();
                        MySQLOptions();
                        break;
                    case "8": ; break;
                    default: Console.WriteLine("Invalid selection!"); break;
                }     
            }
        }

        private static void MySQLOptions()
        {
            var mysql = new MySQLOpt();
            string sqlChoise;
            bool sqlExit = true;

            while (sqlExit)
            {
                sqlChoise = Console.ReadLine();
                switch (sqlChoise)
                {
                    case "0": sqlExit = false; break;
                    case "1": mysql.AggregatedData(); break;
                    case "2": mysql.LoadData(); break;

                    default: Console.WriteLine("Invalid selection!"); break;
                }
                StaticData.Display_MySQL_Menu();
            }
        }
    }
}
