namespace JsonAndMongoDbExporter
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    using Newtonsoft.Json;

    using SqlSupermarketEntities;

    public static class JsonAndMongoDbExporter
    {
        public static void ExportSalesToJsonAndMongoDb(DateTime fromDate, DateTime toDate)
        {
            var context = new supermarketEntities();
            var productIds = context.SALES.Select(s => s.PRODUCT_ID).Distinct();

            List<Report> reports = new List<Report>();

            foreach (var productId in productIds)
            {
                var productName = context.SALES
                    .Where(s => s.PRODUCT_ID == productId &&
                        s.REPORT_DATE >= fromDate && 
                        s.REPORT_DATE <= toDate)
                    .Select(s => s.PRODUCT.NAME)
                    .FirstOrDefault();

                var vendorName = context.SALES
                    .Where(s => s.PRODUCT_ID == productId &&
                        s.REPORT_DATE >= fromDate &&
                        s.REPORT_DATE <= toDate)
                    .Select(s => s.PRODUCT.VENDOR.VENDOR_NAME)
                    .FirstOrDefault();

                var quantity = context.SALES
                    .Where(s => s.PRODUCT_ID == productId &&
                        s.REPORT_DATE >= fromDate &&
                        s.REPORT_DATE <= toDate)
                    .Sum(s => s.QUANTITY);

                var totalPrice = context.SALES
                    .Where(s => s.PRODUCT_ID == productId &&
                        s.REPORT_DATE >= fromDate &&
                        s.REPORT_DATE <= toDate)
                    .Sum(s => s.QUANTITY * s.UNIT_PRICE);

                Report newReport = new Report
                {
                    ProductId = productId,
                    ProductName = productName,
                    VendorName = vendorName,
                    TotalSoldQuantity = quantity,
                    TotalIncomes = totalPrice
                };

                reports.Add(newReport);
            }

            foreach (var report in reports)
            {
                Console.WriteLine(JsonConvert.SerializeObject(report));
            }

            Console.ReadLine();
        }
    }
}
