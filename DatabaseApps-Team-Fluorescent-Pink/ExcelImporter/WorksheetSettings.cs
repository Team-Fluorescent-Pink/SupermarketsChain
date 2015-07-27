namespace ExcelImporter
{
    internal class WorksheetSettings
    {
        public int StartCell { get; set; }

        public int StartCollumn { get; set; }

        public int StartRow { get; set; }

        public string EndRowContent { get; set; }

        public int FirstContentRow { get; set; }

        public int ProductCell { get; set; }

        public int QuantityCell { get; set; }

        public int UnitPriceCell { get; set; }

        public int ProductSumCell { get; set; }
    }
}