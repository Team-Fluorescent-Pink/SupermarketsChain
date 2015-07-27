namespace OracleImporter
{
    using System;
    using System.Linq;

    using MsSql.Data;
    using MsSql.Models;

    using Oracle.Data;

    public static class CloneOracleDbToSql
    {
        public static void Run()
        {
            try
            {
                using (var context = new MsSqlEntities())
                {
                    using (var oracleContext = new OracleEntities())
                    {
                        var productToAdd = oracleContext.PRODUCTS.ToList();
                        var existingProductsNames = context.Products.Select(p => p.Name);

                        productToAdd.RemoveAll(p => existingProductsNames.Contains(p.NAME));

                        foreach (var p in productToAdd)
                        {
                            var product = new Product
                                              {
                                                  Price = p.PRICE, 
                                                  Name = p.NAME, 
                                                  Category = new Category { Name = p.CATEGORY.NAME }, 
                                                  Measure = new Measure { Name = p.MEASURE.MEASURE_NAME }, 
                                                  Vendor = new Vendor { Name = p.VENDOR.VENDOR_NAME }
                                              };

                            context.Products.Add(product);
                        }

                        context.SaveChanges();
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