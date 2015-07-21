namespace Supermarket.Client
{
    using System;
    using System.Windows.Forms;
    class main
    {
        [STAThread]
        static void Main()
        {
            string choise;
            bool exit = false;

            while (true)
            {
                Console.Clear();
                StaticData.Header();
                StaticData.DisplayMenu();

                Console.Write("\nPlease, select option: ");
                choise = Console.ReadLine();

                switch (choise)
                {
                    case "0": exit = true; break;
                    case "1":
                        StaticData.Display_OracleSQL_Menu();
                        break;
                    case "2": 
                        StaticData.Display_MSSQL_Menu();
                        break;
                    case "3": 
                        MessageBox.Show("You have select: " + choise); break;
                    case "4": 
                        MessageBox.Show("You have select: " + choise); break;
                    case "5": 
                        MessageBox.Show("You have select: " + choise); break;
                    case "6": 
                        MessageBox.Show("You have select: " + choise); break;
                    case "7":
                        StaticData.Display_MySQL_Menu();
                        break;
                    case "8": 
                        MessageBox.Show("You have select: " + choise); break;
                    default: 
                        MessageBox.Show("Invalid selection!"); break;
                }

                if (exit)
                {
                    break;
                }
            }
        }
    }
}
