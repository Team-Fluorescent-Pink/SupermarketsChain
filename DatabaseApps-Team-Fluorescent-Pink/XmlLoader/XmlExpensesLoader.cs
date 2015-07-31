namespace XmlLoader
{
    using System;
    using System.Linq;
    using System.Xml.Linq;
    using System.Xml.XPath;

    using MsSql.Data;
    using MsSql.Models;

    public static class XmlExpensesLoader
    {
        public static void ImportExpensesInDatabase(string fileName)
        {
            var context = new MsSqlEntities();
            XDocument doc = XDocument.Load(fileName);
            var vendorsXml = doc.XPathSelectElements("expenses-by-month/vendor");

            foreach (var vendorXml in vendorsXml)
            {
                string vendorName = vendorXml.Attribute("name").Value;
                var expensesXml = vendorXml.XPathSelectElements("expenses");
                foreach (var expsenseXml in expensesXml)
                {
                    DateTime month = DateTime.Parse(expsenseXml.Attribute("month").Value);
                    decimal sum = decimal.Parse(expsenseXml.Value);
                    Vendor vendor = context.Vendors
                        .FirstOrDefault(v => v.Name == vendorName);

                    if (vendor == null)
                    {
                        Vendor newVendor = new Vendor();
                        newVendor.Name = vendorName;
                        context.Vendors.Add(newVendor);
                        context.SaveChanges();
                        vendor = newVendor;
                    }

                    int vendorId = vendor.Id;

                    Expense newExpense = new Expense();
                    newExpense.Date = month;
                    newExpense.Sum = sum;
                    newExpense.VendorId = vendorId;

                    context.Expenses.Add(newExpense);
                }
            }

            context.SaveChanges();
        }
    }
}
