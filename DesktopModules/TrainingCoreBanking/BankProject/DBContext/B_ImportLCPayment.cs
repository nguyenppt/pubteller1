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
    
    public partial class B_ImportLCPayment
    {
        public long Id { get; set; }
        public long DocId { get; set; }
        public string LCCode { get; set; }
        public string DrawType { get; set; }
        public double DrawingAmount { get; set; }
        public string DepositAccount { get; set; }
        public Nullable<double> ExchangeRate { get; set; }
        public string AmtDRFrAcctCcy { get; set; }
        public Nullable<double> ProvAmtRelease { get; set; }
        public string ProvCoverAcct { get; set; }
        public Nullable<double> ProvExchangeRate { get; set; }
        public Nullable<double> CoverAmount { get; set; }
        public string PaymentMethod { get; set; }
        public string NostroAcct { get; set; }
        public Nullable<double> AmountCredited { get; set; }
        public string PaymentRemarks { get; set; }
        public string FullyUtilised { get; set; }
        public string WaiveCharges { get; set; }
        public string ChargeRemarks { get; set; }
        public string VATNo { get; set; }
        public string Status { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string CreateBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> AuthorizedDate { get; set; }
        public string AuthorizedBy { get; set; }
        public string Currency { get; set; }
    }
}
