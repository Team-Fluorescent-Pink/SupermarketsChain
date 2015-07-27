using System;
using System.Collections.Generic;
using System.Globalization;
using MsSql.Models;
using MsSql.Data;
using System.IO;
using System.IO.Compression;
using System.Linq;
using Bytescout.Spreadsheet;

namespace ExcelImporter
{
    public class ExcelImport
    {
        private const string DefaultZipPath = "../../SalesReports";
        private const string DefaultZipName = "Sample-Sales-Reports.zip";
        private const string DefaultDateFormat = "dd-MMM-yyyy";
        private static readonly WorksheetSettings WorksheetSettings =
            new WorksheetSettings
            {
                StartCell = 1,
                StartCollumn = 1,
                StartRow = 1,
                EndRowContent = "Total sum:",
                FirstContentRow = 3,
                ProductCell = 1,
                QuantityCell = 2,
                UnitPriceCell = 3,
                ProductSumCell = 4
            };

        public ExcelImport(string zipPath = DefaultZipPath, string zipName = DefaultZipName)
        {
            this.ZipPath = zipPath;
            this.ZipName = zipName;
        }

        public string ZipPath { get; set; }

        public string ZipName { get; set; }

        public IList<Sale> GetSales(MsSqlEntities msContext)
        {
            
            var sales = new List<Sale>();
            ExtractZip(this.ZipPath, this.ZipName);
            var reportsDirectories = Directory.GetDirectories(this.ZipPath);
            foreach (var directory in reportsDirectories)
            {
                var files = Directory.GetFiles(directory);
                var salesDate = Path.GetFileName(directory);
                var date = DateTime.ParseExact(salesDate, DefaultDateFormat, CultureInfo.InvariantCulture);

                foreach (var file in files)
                {
                    var sale = GetSaleFromXls(msContext, file, date);
                    sales.AddRange(sale);
                }
            }
            
            msContext.Sales.AddRange(sales);
            msContext.SaveChanges();
            
            return sales;
        }

        private IList<Sale> GetSaleFromXls(MsSqlEntities msContext, string file, DateTime date)
        {
            IList<Sale> sales = new List<Sale>();
            var report = new Spreadsheet();
            using (report)
            {
                report.LoadFromFile(file);
                Worksheet worksheet = report.Workbook.Worksheets.ByName("Sales");
                
                var supermarketName = worksheet.Cell(WorksheetSettings.StartRow, WorksheetSettings.StartCell).Value.ToString();
                string productName;
                Supermarket supermarket;
                Product product;
                int quantity;
                decimal sum;
                int currentRow = WorksheetSettings.FirstContentRow;
                string checkContent = worksheet.Cell(currentRow, WorksheetSettings.ProductCell).ValueAsString;
                while (checkContent != WorksheetSettings.EndRowContent)
                {
                    productName = worksheet.Cell(currentRow, WorksheetSettings.ProductCell).ValueAsString; 
                    quantity = worksheet.Cell(currentRow, WorksheetSettings.QuantityCell).ValueAsInteger;
                    sum = decimal.Parse(worksheet.Cell(currentRow, WorksheetSettings.ProductSumCell).ValueAsString);
                    product = CheckValidProduct(productName, msContext);
                    supermarket = CheckSupermarketExist(supermarketName, msContext);
                    
                    var sale = new Sale
                    {
                        Product = product,
                        Supermarket = supermarket,
                        Quantity = quantity,
                        Sum = sum,
                        Date = date,
                        Vendor = product.Vendor
                    };

                    sales.Add(sale);
                    currentRow++;
                    checkContent = worksheet.Cell(currentRow, WorksheetSettings.ProductCell).ValueAsString;
                }
            }

            return sales;
        }

        private static Supermarket CheckSupermarketExist(string supermarketName, MsSqlEntities context)
        {
            var supermarket = context.Supermarkets.FirstOrDefault(s => s.Name == supermarketName);

            if (supermarket == null)
            {                
                // TODO: Add new supermarket from report.
                supermarket = new Supermarket {Name = supermarketName};

                context.Supermarkets.Add(supermarket);
                context.SaveChanges();
            }

            return supermarket;
        }

        private static Product CheckValidProduct(string productName, MsSqlEntities context)
        {
            var product = context.Products.FirstOrDefault(p => p.Name == productName);

            if (product == null)
            {
                // TODO: Add new products from report fuctionality.
                product = new Product
                {
                    Name = productName,
                    CategoryId = 2,
                    MeasureId = 2,
                    VendorId = 4,
                    Price = 31.2m
                };

                context.Products.Add(product);
                context.SaveChanges();
            }


            return product;
        }

        private void ExtractZip(string pathToArchive, string archiveName)
        {
            if (Directory.Exists(pathToArchive))
            {
                Directory.Delete(pathToArchive, true);
            }

            ZipFile.ExtractToDirectory("../../" + archiveName, pathToArchive);
        }
    }
}