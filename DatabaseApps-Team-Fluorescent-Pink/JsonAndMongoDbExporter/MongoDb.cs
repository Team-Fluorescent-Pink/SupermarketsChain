namespace JsonAndMongoDbExporter
{
    using System.Collections.Generic;
    using System.Globalization;

    using MongoDB.Bson;
    using MongoDB.Driver;

    public static class MongoDb
    {
        public static void InsertReportsInDatabase(List<Report> reports)
        {
            MongoClient client = new MongoClient("mongodb://localhost");
            var database = client.GetDatabase("Sales");
            var collection = database.GetCollection<BsonDocument>("SalesByProductReports");

            foreach (var report in reports)
            {
                BsonDocument document = new BsonDocument
                {
                    { "product-id", report.ProductId.ToString(CultureInfo.InvariantCulture) },
                    { "product-name", report.ProductName },
                    { "vendor-name", report.VendorName },
                    { "total-quantity-sold", report.TotalSoldQuantity },
                    { "total-incomes", report.TotalIncomes.ToString(CultureInfo.InvariantCulture) }
                };

                collection.InsertOneAsync(document);
            }
        }
    }
}
