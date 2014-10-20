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
    
    public partial class BCUSTOMER_LIMIT_MAIN
    {
        public string MainLimitID { get; set; }
        public string CustomerID { get; set; }
        public string CommitmentType { get; set; }
        public string CurrencyCode { get; set; }
        public string CurrencyDescription { get; set; }
        public string CountryCode { get; set; }
        public string CountryName { get; set; }
        public Nullable<System.DateTime> ApprovedDate { get; set; }
        public Nullable<System.DateTime> OfferedUntil { get; set; }
        public Nullable<System.DateTime> ExpiryDate { get; set; }
        public Nullable<System.DateTime> ProposalDate { get; set; }
        public Nullable<System.DateTime> Availabledate { get; set; }
        public Nullable<decimal> InternalLimitAmt { get; set; }
        public Nullable<decimal> AdvisedAmt { get; set; }
        public Nullable<decimal> OriginalLimit { get; set; }
        public string Note { get; set; }
        public string Mode { get; set; }
        public Nullable<decimal> MaxTotal { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string ApprovedUser { get; set; }
        public string ActiveFlag { get; set; }
    }
}