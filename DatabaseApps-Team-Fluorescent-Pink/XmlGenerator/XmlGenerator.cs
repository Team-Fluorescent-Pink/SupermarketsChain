using System;
using System.Text;
using System.Xml;
namespace XmlGenerator
{
    class XmlGenerator
    {
        public static bool GenerateXmlReports(DateTime fromDate, DateTime toDate)
        {
            var encoding = Encoding.GetEncoding("utf-8");
            string documentPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\report.xml";
            using (var writer = new XmlTextWriter(documentPath,encoding))
            {
                writer.Formatting = Formatting.Indented;
                writer.IndentChar = '\t';
                writer.Indentation = 1;

                writer.WriteStartDocument();
                writer.WriteStartElement("sales");
			    using (var context = new // ? :/ )
                {
                    foreach (var vendor in context.Vendors.ToList())
                    {
                        var totalSalesSumByDate = context.Sales
                            .Where(sale =>
                                sale.Product.VendorId == vendor.Id &&
                                sale.DateofSale >= startDate &&
                                sale.DateofSale <= endDate)
                            .OrderBy(sale => sale.DateofSale)
                            .GroupBy(sale => sale.DateofSale)
                            .Select(group => new
                            {
                                Date = group.Key,
                                TotalSum = group.Sum(g => g.PricePerUnit * g.Quantity)
                            })
                            .ToList();

                        if (totalSalesSumByDate.Any())
                        {
                            writer.WriteStartElement("sale");
                            writer.WriteAttributeString("vendor", vendor.VendorName);
                            foreach (var sale in totalSalesSumByDate)
                            {
                                AddSaleToVendor(writer, sale.Date, sale.TotalSum);
							                writer.WriteStartElement("summary");
										    writer.WriteAttributeString("date", sale.Date.ToString("d-MMM-yyyy"));
										    writer.WriteAttributeString("total-sum", sale.TotalSum.ToString("F2"));
										    writer.WriteEndElement();
                            }

                            writer.WriteEndElement();
                        }
                    }
                }
                writer.WriteEndDocument();
            }
            return true;
        }    
    }
}
