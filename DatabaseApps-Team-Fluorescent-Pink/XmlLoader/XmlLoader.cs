using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Xml.XPath;
using MsSql.Data;
using MsSql.Models;

namespace XmlLoader
{
    class XmlLoader
    {
        public static bool LoadXmlReports()
        {
            string documentPath = "../../Vendor-Expenses.xml)";
            var xmlDocument = new XDocument();
            try
            {
                xmlDocument = XDocument.Load(documentPath);
            }
            catch (FileNotFoundException)
            {
                return false;
            }

            var nodes = xmlDocument.XPathSelectElements("//expenses-by-month/vendor");

            foreach (var vendor in nodes)
            {
                string vendorName = vendor.Attribute("name").Value;
                var expenses = vendor.Elements("expenses");

                foreach (var expense in expenses)
                {
                    DateTime month = DateTime.Parse(expense.Attribute("month").Value);
                    decimal amount = decimal.Parse(expense.Value);
                    var context = new Supermarket(); // Nah... should be something else.. NOTE: Do NOT code at 2:40AM...
                    var vendorId = context.Vendors
                        .Where(v => v.VendorName.Trim() == vendorName)
                        .Select(v => v.Id).First();

                    Expense expenseEntity = new Expense();
                    expenseEntity.VendorId = vendorId;
                    expenseEntity.Date = expenseDate;
                    expenseEntity.Amount = expenseAmount;
                    context.Expenses.Add(expenseEntity);
                    context.SaveChanges();
                }
            } 

            return true;
        }
    }
}
