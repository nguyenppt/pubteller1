//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BankProject.DBContext
{
    using System;
    using System.Collections.Generic;
    
    public partial class BENQUIRYCHECK
    {
        public string CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string ChequeType { get; set; }
        public string Quantity { get; set; }
        public string ChequeNo { get; set; }
        public Nullable<System.DateTime> IssueDate { get; set; }
        public string ChequeReference { get; set; }
    }
}