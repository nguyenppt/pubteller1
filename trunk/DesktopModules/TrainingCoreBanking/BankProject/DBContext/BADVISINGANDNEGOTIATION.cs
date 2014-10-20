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
    
    public partial class BADVISINGANDNEGOTIATION
    {
        public long AdvisingLCID { get; set; }
        public string AdvisingLCCode { get; set; }
        public string LCType { get; set; }
        public string LCNumber { get; set; }
        public string BeneficiaryCustNo { get; set; }
        public string BeneficiaryAddr { get; set; }
        public string BeneficiaryAcct { get; set; }
        public string IssuingBankNo { get; set; }
        public string IssBankAddr { get; set; }
        public string IssBankAcct { get; set; }
        public string ApplicantNo { get; set; }
        public string ApplicantAddr { get; set; }
        public string ApplicantBank { get; set; }
        public string ReimbBankRef { get; set; }
        public string ReimbBankNo { get; set; }
        public string ReimbBankAddr { get; set; }
        public string AdviceThruBank { get; set; }
        public string AdvThruAddr { get; set; }
        public string AvailablewithCustno { get; set; }
        public string AvailablewithAddr { get; set; }
        public string Currency { get; set; }
        public string Amount { get; set; }
        public string ToleranceIncr { get; set; }
        public string ToleranceDecr { get; set; }
        public Nullable<System.DateTime> IssuingDate { get; set; }
        public Nullable<System.DateTime> ExpiryDate { get; set; }
        public string ExpiryPlace { get; set; }
        public Nullable<System.DateTime> ContingentExpiryDate { get; set; }
        public string Commodity { get; set; }
        public string AdvisedBySacombank { get; set; }
        public string GenerateDelivery { get; set; }
        public string Status { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string CreateBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string AuthorizedBy { get; set; }
        public Nullable<System.DateTime> AuthorizedDate { get; set; }
    }
}