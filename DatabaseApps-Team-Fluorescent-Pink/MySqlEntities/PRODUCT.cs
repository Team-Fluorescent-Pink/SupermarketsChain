//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MySqlEntities
{
    using System;
    using System.Collections.Generic;
    
    public partial class PRODUCT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PRODUCT()
        {
            this.SALES = new HashSet<SALE>();
        }
    
        public decimal ID { get; set; }
        public string NAME { get; set; }
        public decimal VENDOR_ID { get; set; }
        public decimal MEASURE_ID { get; set; }
        public decimal CATEGORY_ID { get; set; }
        public decimal PRICE { get; set; }
    
        public virtual CATEGORY CATEGORY { get; set; }
        public virtual MEASURE MEASURE { get; set; }
        public virtual VENDOR VENDOR { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SALE> SALES { get; set; }
    }
}
