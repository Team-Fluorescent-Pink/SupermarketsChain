namespace Supermarket.Client
{
    using System;
    using System.IO;
    using System.Windows.Forms;

    using ExcelImporter;

    using JsonAndMongoDbExporter;
    using MsSql.Data;
    using MySql.Options;
    using OracleImporter;
    using PdfGenerator;
    using XmlGenerator;
    using XmlLoader;
    
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
                    case "0":
                        sqlExit = true;
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
                        CloneOracleDbToSql.Run();
                        break;
                    case "3":
                        Console.WriteLine("Selected option: " + sqlChoice);
                        var context = new MsSqlEntities();
                        var selectedFile = OpenFile();
                        var fileName = ExtractFileName(selectedFile);
                        var path = Path.GetDirectoryName(selectedFile);
                        var data = new ExcelImport(path, fileName).GetSales(context);
                        context.Sales.AddRange(data);
                        context.SaveChanges();
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

        public static void GeneratePdfSalesReports()
        {
            DateTime fromDate;
            DateTime toDate;
            ReadDateInterval(out fromDate, out toDate);

            bool successfullyGeneratedPdf = PdfGenerator.GeneratePdfReports(fromDate, toDate);

            if (successfullyGeneratedPdf)
            {
                Console.WriteLine("PDF Sales Reports succsessfully generated.");
                Console.WriteLine("Pess ENTER to continue");
                Console.ReadLine();
            }
            else
            {
                Console.WriteLine("There are now sales in this period");
                Console.WriteLine("Pess ENTER to continue");
                Console.ReadLine();
            }
        }

        public static void GenerateXmlSalesByVendorReport()
        {
            DateTime fromDate;
            DateTime toDate;
            ReadDateInterval(out fromDate, out toDate);

            bool successfullyGeneratedXml = XmlGenerator.GenerateXmlReports(fromDate, toDate);

            if (successfullyGeneratedXml)
            {
                Console.WriteLine("Xml Sales Reports succsessfully generated.");
                Console.WriteLine("Pess ENTER to continue");
                Console.ReadLine();
            }
            else
            {
                Console.WriteLine("Error");
                Console.WriteLine("Pess ENTER to continue");
                Console.ReadLine();
            }
        }
        
        public static void DisplayMySqlMenu()
        {
            bool sqlExit = true;
            
            while (sqlExit)
            {
                Console.WriteLine("\nMySQL Options:");
                Console.WriteLine("1) Display Aggregated Data:");
                Console.WriteLine("2) Load Data from MS SQL Database.");
                Console.WriteLine("0) Exit.");
                Console.Write("\nPlease, select option: ");

                string sqlChoise = Console.ReadLine();
                switch (sqlChoise)
                {

                    case "0":
                        sqlExit = false;
                        break;
                    case "1":
                        MySqlOptions.AggregatedData();
                        break;
                    case "2":
                        Console.WriteLine("MySQL Option 2");
                        break;
                    default:
                        Console.WriteLine("Invalid selection!");
                        break;
                }
            }
        }

        public static void LoadExpenseDataFromXml()
        {
            
            bool successfullyGeneratedXml = XmlGenerator.LoadXmlReports();

            if (successfullyLoadedXml)
            {
                Console.WriteLine("Xml Sales Reports succsessfully loaded.");
                Console.WriteLine("Pess ENTER to continue");
                Console.ReadLine();
            }
            else
            {
                Console.WriteLine("Error");
                Console.WriteLine("Pess ENTER to continue");
                Console.ReadLine();
            }
        }

        public static void ExportToJsonAndMongoDb()
        {
            DateTime fromDate;
            DateTime toDate;
            ReadDateInterval(out fromDate, out toDate);

            bool succsessfullExport = JsonAndMongoDbExporter.ExportSalesToJsonAndMongoDb(fromDate, toDate);

            if (succsessfullExport)
            {
                Console.WriteLine("Reports succsessfully exported to json files and imported to MongoDb database.");
                Console.WriteLine("Pess ENTER to continue");
                Console.ReadLine();
            }
            else
            {
                Console.WriteLine("There are now sales in this period");
                Console.WriteLine("Pess ENTER to continue");
                Console.ReadLine();
            }
        }

        private static string OpenFile()
        {
            OpenFileDialog fd = new OpenFileDialog();
            fd.ShowDialog();
            string path = fd.FileName;

            return path;
        }

        // private static object ExtractPath(string openFile)
        // {

        // }

        // Source - MSDN 
        private static string ExtractFileName(string filepath)
        {
            // If path ends with a "\", it's a path only so return String.Empty.
            if (filepath.Trim().EndsWith(@"\"))
            {
                return string.Empty;
            }

            // Determine where last backslash is. 
            int position = filepath.LastIndexOf('\\');

            // If there is no backslash, assume that this is a filename. 
            if (position == -1)
            {
                // Determine whether file exists in the current directory. 
                if (File.Exists(Environment.CurrentDirectory + Path.DirectorySeparatorChar + filepath))
                {
                    return filepath;
                }

                return string.Empty;
            }

            // Determine whether file exists using filepath. 
            if (File.Exists(filepath))
            {
                // Return filename without file path. 
                return filepath.Substring(position + 1);
            }

            return string.Empty;
        }

        private static void ReadDateInterval(out DateTime fromDate, out DateTime toDate)
        {
            fromDate = new DateTime();
            toDate = new DateTime();
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
                if (toDate < fromDate)
                {
                    isCorrectToDate = false;
                }

                if (!isCorrectToDate)
                {
                    Console.WriteLine("To date must be after or equal to from date.");
                    Console.Write("Wrong to date, please enter date again: ");
                }
            }
        }
    }
}
