namespace JSONReportsInMongoDB
{
    using System;

    public static class JsonAndMongoDbExporter
    {
        public static void ExportSalesToJsonAndMongoDb(DateTime fromDate, DateTime toDate)
        {
            Console.WriteLine(fromDate);
            Console.WriteLine(toDate);
            Console.ReadLine();
        }
    }
}
