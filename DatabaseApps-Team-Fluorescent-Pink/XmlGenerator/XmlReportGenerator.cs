namespace XmlGenerator
{
    using System;
    using System.Globalization;
    using System.Linq;
    using System.Xml.Linq;

    using MsSql.Data;

    public static class XmlReportGenerator
    {
        public static bool GenerateXmlReports(DateTime fromDate, DateTime toDate)
        {
            var context = new MsSqlEntities();
            var vendorsName = context.Vendors
                .Select(v => v.Name)
                .Distinct();

            XElement rootElement = new XElement("sales");

            foreach (var vendorName in vendorsName)
            {
                var salesByVendor = context.Sales
                    .Where(s => s.Date >= fromDate && s.Date <= toDate && s.Vendor.Name == vendorName)
                    .OrderBy(s => s.Date)
                    .GroupBy(s => s.Date)
                    .Select(group => new
                    {
                        Date = group.Key,
                        TotalSum = group.Sum(s => s.Quantity * s.UnitPrice)
                    });

                XElement vendor = new XElement("sale");
                vendor.SetAttributeValue("vendor", vendorName);

                foreach (var sale in salesByVendor)
                {
                    XElement summary = new XElement("summary");
                    summary.SetAttributeValue("date", sale.Date.ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture));
                    summary.SetAttributeValue("total-sum", sale.TotalSum);
                    vendor.Add(summary);
                }

                rootElement.Add(vendor);
            }

            rootElement.Save("../../../Sales-by-Vendors-Report.xml");

            return true;
        }  
    }
}
