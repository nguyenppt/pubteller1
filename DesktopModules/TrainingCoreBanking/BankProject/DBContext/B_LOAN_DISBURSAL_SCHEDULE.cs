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
    
    public partial class B_LOAN_DISBURSAL_SCHEDULE
    {
        public int ID { get; set; }
        public string Code { get; set; }
        public Nullable<System.DateTime> DisbursalDate { get; set; }
        public Nullable<double> DisbursalAmount { get; set; }
        public Nullable<System.DateTime> DrawdownDate { get; set; }
    }
}
