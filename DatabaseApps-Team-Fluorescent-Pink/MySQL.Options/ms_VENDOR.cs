//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MySQL.Options
{
    using System;
    using System.Collections.Generic;
    
    public partial class ms_VENDOR
    {
        public ms_VENDOR()
        {
            this.PRODUCTS = new HashSet<ms_PRODUCT>();
        }
    
        public decimal ID { get; set; }
        public string VENDOR_NAME { get; set; }
    
        public virtual ICollection<ms_PRODUCT> PRODUCTS { get; set; }
    }
}