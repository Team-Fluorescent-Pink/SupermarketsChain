using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Xml.XPath;

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

            return true;
        }
    }
}
