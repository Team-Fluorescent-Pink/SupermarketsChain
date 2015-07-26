using System;
using System.Linq;
using MsSql.Data;
using MsSql.Models;
using Oracle.Data;

namespace OracleImporter
{
    public static class CloneOracleDbToSql
    {
        public static void Run()
        {
            var con = new MsSqlEntities();
            var conp = con.Products.FirstOrDefault();
            Console.WriteLine(conp);

            try
            {
                using (var msContext = new MsSqlEntities())
                {
                    using (var oracleContext = new OracleEntities())
                    {
                        var productToAdd = oracleContext.PRODUCTS.ToList();
                        var existingProductsNames = msContext.Products.Select(p => p.Name);

                        productToAdd.RemoveAll(p => existingProductsNames.Contains(p.NAME));

                        foreach (var p in productToAdd)
                        {
                            var product = new Product
                            {
                                Price = p.PRICE,
                                Name = p.NAME,
                                Category = new Category {Name = p.CATEGORY.NAME},
                                Measure = new Measure {Name = p.MEASURE.MEASURE_NAME},
                                Vendor = new Vendor {Name = p.VENDOR.VENDOR_NAME}
                            };

                            msContext.Products.Add(product);
                        }

                        msContext.SaveChanges();
                    }
                }
            }
            catch (Exception)
            {
                throw new Exception("Something wrong.");
            }
        }
    }
}