namespace JsonAndMongoDbExporter
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    using MsSql.Data;

    public static class JsonAndMongoDbExporter
    {
        public static bool ExportSalesToJsonAndMongoDb(DateTime fromDate, DateTime toDate)
        {
            var context = new MsSqlEntities();
            var productIds = context.Sales
                .Where(s => s.Date >= fromDate && s.Date <= toDate)
                .Select(s => s.ProductId)
                .Distinct();

            if (!productIds.Any())
            {
                return false;
            }

            List<Report> reports = new List<Report>();

            foreach (var productId in productIds)
            {
                var productName = context.Sales
                    .Where(s => s.ProductId == productId &&
                        s.Date >= fromDate && 
                        s.Date <= toDate)
                    .Select(s => s.Product.Name)
                    .FirstOrDefault();

                var vendorName = context.Sales
                    .Where(s => s.ProductId == productId &&
                        s.Date >= fromDate &&
                        s.Date <= toDate)
                    .Select(s => s.Product.Vendor.Name)
                    .FirstOrDefault();

                var quantity = context.Sales
                    .Where(s => s.ProductId == productId &&
                        s.Date >= fromDate &&
                        s.Date <= toDate)
                    .Sum(s => s.Quantity);

                var totalPrice = context.Sales
                    .Where(s => s.ProductId == productId &&
                        s.Date >= fromDate &&
                        s.Date <= toDate)
                    .Sum(s => s.Quantity * s.UnitPrice);

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

            Json.GenerateJsonReports(reports);
            MongoDb.InsertReportsInDatabase(reports);

            return true;
        }
    }
}
