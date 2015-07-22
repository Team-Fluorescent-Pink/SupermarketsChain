namespace Supermarket.Client
{
    using System;
    using System.Windows.Forms;
    using MySQL.Options;
    
    public static class StaticData
    {
        public static void Header()
        {
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("---Welcome to Supermarket Chain Client---");
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("----------Team-Fluorescent-Pink----------");
        }

        public static void DisplayMenu()
        {
            Console.WriteLine();
            Console.WriteLine("Main Menu:");
            Console.WriteLine("-------------");
            Console.WriteLine("1) Oracle Options.");
            Console.WriteLine("2) MS SQL Options.");
            Console.WriteLine("3) Generate PDF Sales Reports.");
            Console.WriteLine("4) Generate XML Sales by Vendor Report.");
            Console.WriteLine("5) JSON Reports in MongoDB.");
            Console.WriteLine("6) Load Expense Data from XML.");
            Console.WriteLine("7) MySQL Options.");
            Console.WriteLine("8) Export from SQLite and MySQL to Excel.");
            Console.WriteLine("\n0) Exit.");
        }

        public static void Display_OracleSQL_Menu()
        {
            string sqlChoise;
            bool sqlExit = false;

            while (true)
            {
                Console.WriteLine("\nOracle Database Options:");
                Console.WriteLine("1) Display Aggregated Data:");
                Console.WriteLine("0) Exit.");
                Console.Write("\nPlease, select option: ");
                sqlChoise = Console.ReadLine();

                switch (sqlChoise)
                {
                    case "0": sqlExit = true; break;
                    case "1": Console.WriteLine("Selected option: " + sqlChoise); break;
                    default: Console.WriteLine("Invalid selection!"); break;
                }

                if (sqlExit)
                {
                    break;
                }
            }
        }

        public static void Display_MSSQL_Menu()
        {
            string sqlChoise;
            bool sqlExit = false;

            while (true)
            {
                Console.WriteLine("\nMS SQL Options:");
                Console.WriteLine("1) Display Aggregated Data:");
                Console.WriteLine("2) Load Data from Oracle Database.");
                Console.WriteLine("3) Load Excel Reports from ZIP File");
                Console.WriteLine("0) Exit.");
                Console.Write("\nPlease, select option: ");
                sqlChoise = Console.ReadLine();

                switch (sqlChoise)
                {
                    case "0": sqlExit = true; break;
                    case "1": Console.WriteLine("Selected option: " + sqlChoise); break;
                    case "2": Console.WriteLine("Selected option: " + sqlChoise); break;
                    case "3": OpenFile(); break;
                    default: Console.WriteLine("Invalid selection!"); break;
                }

                if (sqlExit)
                {
                    break;
                }
            }
        }       

        public static void Display_MySQL_Menu()
        {
            Console.WriteLine("\nMySQL Options:");
            Console.WriteLine("1) Display Aggregated Data:");
            Console.WriteLine("2) Load Data from MS SQL Database.");
            Console.WriteLine("0) Exit.");
            Console.Write("\nPlease, select option: ");
        }

        private static void OpenFile()
        {
            string fileName;
            OpenFileDialog fd = new OpenFileDialog();
            fd.ShowDialog();
            fileName = fd.FileName;
            Console.Write(fileName);
        }
    }
}
