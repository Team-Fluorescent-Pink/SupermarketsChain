namespace Supermarket.Client
{
    using System;
    using System.Windows.Forms;

    using JSONReportsInMongoDB;

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
            Console.WriteLine("5) Export sales to JSON and to MongoDB database.");
            Console.WriteLine("6) Load Expense Data from XML.");
            Console.WriteLine("7) MySQL Options.");
            Console.WriteLine("8) Export from SQLite and MySQL to Excel.");
            Console.WriteLine("\n0) Exit.");
        }

        public static void DisplayOracleSqlMenu()
        {
            bool sqlExit = false;

            while (true)
            {
                Console.WriteLine("\nOracle Database Options:");
                Console.WriteLine("1) Display Aggregated Data:");
                Console.WriteLine("0) Exit.");
                Console.Write("\nPlease, select option: ");
                string sqlChoice = Console.ReadLine();

                switch (sqlChoice)
                {
                    case "0": sqlExit = true; 
                        break;
                    case "1": 
                        Console.WriteLine("Selected option: " + sqlChoice); 
                        break;
                    default: 
                        Console.WriteLine("Invalid selection!"); 
                        break;
                }

                if (sqlExit)
                {
                    break;
                }
            }
        }

        public static void DisplayMsSqlMenu()
        {
            bool sqlExit = false;

            while (true)
            {
                Console.WriteLine("\nMS SQL Options:");
                Console.WriteLine("1) Display Aggregated Data:");
                Console.WriteLine("2) Load Data from Oracle Database.");
                Console.WriteLine("3) Load Excel Reports from ZIP File");
                Console.WriteLine("0) Exit.");
                Console.Write("\nPlease, select option: ");
                string sqlChoice = Console.ReadLine();

                switch (sqlChoice)
                {
                    case "0": 
                        sqlExit = true; 
                        break;
                    case "1": 
                        Console.WriteLine("Selected option: " + sqlChoice); 
                        break;
                    case "2": 
                        Console.WriteLine("Selected option: " + sqlChoice); 
                        break;
                    case "3": 
                        OpenFile(); 
                        break;
                    default: 
                        Console.WriteLine("Invalid selection!"); 
                        break;
                }

                if (sqlExit)
                {
                    break;
                }
            }
        }       

        public static void DisplayMySqlMenu()
        {
            Console.WriteLine("\nMySQL Options:");
            Console.WriteLine("1) Display Aggregated Data:");
            Console.WriteLine("2) Load Data from MS SQL Database.");
            Console.WriteLine("0) Exit.");
            Console.Write("\nPlease, select option: ");
        }

        public static void ExportToJsonAndMongoDb()
        {
            DateTime fromDate = new DateTime();
            DateTime toDate = new DateTime();
            bool isCorrectFromDate = false;
            bool isCorrectToDate = false;

            Console.Write("Enter sales from date: ");
            while (!isCorrectFromDate)
            {
                isCorrectFromDate = DateTime.TryParse(Console.ReadLine(), out fromDate);
                if (!isCorrectFromDate)
                {
                    Console.Write("Wrong from date, please enter date again: ");
                }
            }

            Console.Write("Enter sales to date: ");
            while (!isCorrectToDate)
            {
                isCorrectToDate = DateTime.TryParse(Console.ReadLine(), out toDate);
                if (!isCorrectToDate)
                {
                    Console.Write("Wrong to date, please enter date again: ");
                }
            }

            JsonAndMongoDbExporter.ExportSalesToJsonAndMongoDb(fromDate, toDate);
        }

        private static void OpenFile()
        {
            OpenFileDialog fd = new OpenFileDialog();
            fd.ShowDialog();
            string fileName = fd.FileName;
            Console.Write(fileName);
        }
    }
}
