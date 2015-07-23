namespace JsonAndMongoDbExporter
{
    using Newtonsoft.Json;

    public class Report
    {
        [JsonProperty("product-id")]
        public decimal ProductId { get; set; }

        [JsonProperty("product-name")]
        public string ProductName { get; set; }

        [JsonProperty("vendor-name")]
        public string VendorName { get; set; }

        [JsonProperty("total-quantity-sold")]
        public int TotalSoldQuantity { get; set; }

        [JsonProperty("total-incomes")]
        public decimal TotalIncomes { get; set; }
    }
}
