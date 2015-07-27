namespace PdfGenerator
{
    using System;
    using System.Globalization;
    using System.IO;
    using System.Linq;

    using iTextSharp.text;
    using iTextSharp.text.pdf;

    using MsSql.Data;

    public class PdfGenerator
    {
        public static bool GeneratePdfReports(DateTime fromDate, DateTime toDate)
        {
            var context = new MsSqlEntities();
            var sales = context.Sales
                .Where(s => s.Date >= fromDate && s.Date <= toDate)
                .GroupBy(s => s.Date)
                .Select(
                    s => new
                        {
                            s.Key,
                            product = s.Select(p => new
                            {
                                p.Product.Name,
                                p.Quantity,
                                p.UnitPrice,
                                location = p.Supermarket.Name,
                                sum = p.Quantity * p.UnitPrice                        
                            })
                        });

            if (sales.Any())
            {
                using (FileStream fs = new FileStream("../../../sales-reports.pdf", FileMode.Create))
                {
                    Rectangle rec = new Rectangle(PageSize.A4);
                    Document doc = new Document(rec);
                    PdfWriter writer = PdfWriter.GetInstance(doc, fs);
                    doc.Open();

                    PdfPTable table = new PdfPTable(5);
                    table.TotalWidth = 510f;
                    table.LockedWidth = true;

                    float[] widths = { 2f, 1f, 1f, 3f, 1f };
                    table.SetWidths(widths);
                    table.HorizontalAlignment = 1;
                    table.SpacingBefore = 20f;
                    table.SpacingAfter = 30f;

                    PdfPCell cell = new PdfPCell(new Phrase("Aggregated Sales Report"));
                    cell.Colspan = 5;
                    cell.HorizontalAlignment = 1;

                    table.AddCell(cell);

                    foreach (var product in sales)
                    {
                        PdfPCell date =
                            new PdfPCell(new Phrase("Date: " + product.Key.ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture)));
                        date.Colspan = 5;
                        date.HorizontalAlignment = 0;
                        date.BackgroundColor = new BaseColor(235, 235, 235);
                        table.AddCell(date);

                        PdfPCell headerProduct = new PdfPCell(new Phrase("Product"));
                        headerProduct.HorizontalAlignment = 1;
                        headerProduct.BackgroundColor = new BaseColor(210, 210, 210);
                        table.AddCell(headerProduct);

                        PdfPCell headerQuantity = new PdfPCell(new Phrase("Quantity"));
                        headerQuantity.HorizontalAlignment = 1;
                        headerQuantity.BackgroundColor = new BaseColor(210, 210, 210);
                        table.AddCell(headerQuantity);

                        PdfPCell headerPrice = new PdfPCell(new Phrase("Unit Price"));
                        headerPrice.HorizontalAlignment = 1;
                        headerPrice.BackgroundColor = new BaseColor(210, 210, 210);
                        table.AddCell(headerPrice);

                        PdfPCell headerLocation = new PdfPCell(new Phrase("Location"));
                        headerLocation.HorizontalAlignment = 1;
                        headerLocation.BackgroundColor = new BaseColor(210, 210, 210);
                        table.AddCell(headerLocation);

                        PdfPCell headerSum = new PdfPCell(new Phrase("Sum"));
                        headerSum.HorizontalAlignment = 1;
                        headerSum.BackgroundColor = new BaseColor(210, 210, 210);
                        table.AddCell(headerSum);

                        foreach (var sale in product.product)
                        {
                            PdfPCell columnProduct = new PdfPCell(new Phrase(sale.Name));
                            date.HorizontalAlignment = 1;
                            table.AddCell(columnProduct);

                            PdfPCell columnQuantity = new PdfPCell(new Phrase(sale.Quantity.ToString()));
                            date.HorizontalAlignment = 1;
                            table.AddCell(columnQuantity);

                            PdfPCell columnPrice = new PdfPCell(new Phrase(sale.UnitPrice.ToString()));
                            date.HorizontalAlignment = 1;
                            table.AddCell(columnPrice);

                            PdfPCell columnLocation = new PdfPCell(new Phrase(sale.location));
                            date.HorizontalAlignment = 1;
                            table.AddCell(columnLocation);

                            PdfPCell columnSum = new PdfPCell(new Phrase(sale.sum.ToString()));
                            date.HorizontalAlignment = 1;
                            table.AddCell(columnSum);
                        }

                        PdfPCell footerTitle =
                            new PdfPCell(
                                new Phrase("Total sum for " + product.Key.ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture) + ": "));
                        footerTitle.Colspan = 4;
                        footerTitle.HorizontalAlignment = 2;
                        table.AddCell(footerTitle);

                        PdfPCell footerTotal =
                            new PdfPCell(
                                new Phrase(product.product.Sum(p => p.Quantity * p.UnitPrice).ToString(CultureInfo.InvariantCulture)));
                        footerTotal.HorizontalAlignment = 1;
                        table.AddCell(footerTotal);
                    }

                    doc.Add(table);
                    doc.Close();
                }

                return true;
            }

            return false;
        }
    }
}
