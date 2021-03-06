﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class VietVictoryCoreBankingEntities : DbContext
    {
        public VietVictoryCoreBankingEntities()
            : base("name=VietVictoryCoreBankingEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<B_AccountForBuyingTC> B_AccountForBuyingTC { get; set; }
        public DbSet<B_BuyTravellersCheque> B_BuyTravellersCheque { get; set; }
        public DbSet<B_CashWithrawalForBuyingTC> B_CashWithrawalForBuyingTC { get; set; }
        public DbSet<B_CustomerSignature> B_CustomerSignature { get; set; }
        public DbSet<B_DEBUG> B_DEBUG { get; set; }
        public DbSet<B_ExchangeBanknotesManyDeno> B_ExchangeBanknotesManyDeno { get; set; }
        public DbSet<B_ExchangeRates> B_ExchangeRates { get; set; }
        public DbSet<B_ForeignExchange> B_ForeignExchange { get; set; }
        public DbSet<B_ImportLCPayment> B_ImportLCPayment { get; set; }
        public DbSet<B_ImportLCPaymentCharge> B_ImportLCPaymentCharge { get; set; }
        public DbSet<B_SellTravellersCheque> B_SellTravellersCheque { get; set; }
        public DbSet<B_WUXOOMCashAdvance> B_WUXOOMCashAdvance { get; set; }
        public DbSet<BACCOUNTOFFICER> BACCOUNTOFFICER { get; set; }
        public DbSet<BACCOUNTS> BACCOUNTS { get; set; }
        public DbSet<BADVISINGANDNEGOTIATION> BADVISINGANDNEGOTIATION { get; set; }
        public DbSet<BADVISINGANDNEGOTIATION_CHARGES> BADVISINGANDNEGOTIATION_CHARGES { get; set; }
        public DbSet<BBANK_BRANCH> BBANK_BRANCH { get; set; }
        public DbSet<BBANKCODE> BBANKCODE { get; set; }
        public DbSet<BBANKING> BBANKING { get; set; }
        public DbSet<BBANKSWIFTCODE> BBANKSWIFTCODE { get; set; }
        public DbSet<BBENEFICIARYBANK> BBENEFICIARYBANK { get; set; }
        public DbSet<BCASHDEPOSIT> BCASHDEPOSIT { get; set; }
        public DbSet<BCASHWITHRAWAL> BCASHWITHRAWAL { get; set; }
        public DbSet<BCATEGORY> BCATEGORY { get; set; }
        public DbSet<BCATEGORY_COPY> BCATEGORY_COPY { get; set; }
        public DbSet<BCOLLATERAL> BCOLLATERAL { get; set; }
        public DbSet<BCOLLATERAL_INFOMATION> BCOLLATERAL_INFOMATION { get; set; }
        public DbSet<BCOLLATERAL_STATUS> BCOLLATERAL_STATUS { get; set; }
        public DbSet<BCOLLATERALCONTINGENT_ENTRY> BCOLLATERALCONTINGENT_ENTRY { get; set; }
        public DbSet<BCOLLATERALRIGHT> BCOLLATERALRIGHT { get; set; }
        public DbSet<BCOLLECTCHARGESBYCASH> BCOLLECTCHARGESBYCASH { get; set; }
        public DbSet<BCOLLECTCHARGESFROMACCOUNT> BCOLLECTCHARGESFROMACCOUNT { get; set; }
        public DbSet<BCOMMITMENT_CONTRACT> BCOMMITMENT_CONTRACT { get; set; }
        public DbSet<BCOMMODITY> BCOMMODITY { get; set; }
        public DbSet<BCONFIG> BCONFIG { get; set; }
        public DbSet<BCONTINGENTACCOUNTS> BCONTINGENTACCOUNTS { get; set; }
        public DbSet<BCOUNTRY> BCOUNTRY { get; set; }
        public DbSet<BCRFROMACCOUNT> BCRFROMACCOUNT { get; set; }
        public DbSet<BCURRENCY> BCURRENCY { get; set; }
        public DbSet<BCUSTOMER_INFO> BCUSTOMER_INFO { get; set; }
        public DbSet<BCUSTOMER_LIMIT_MAIN> BCUSTOMER_LIMIT_MAIN { get; set; }
        public DbSet<BCUSTOMER_LIMIT_SUB> BCUSTOMER_LIMIT_SUB { get; set; }
        public DbSet<BCUSTOMERS> BCUSTOMERS { get; set; }
        public DbSet<BCHARGECODE> BCHARGECODE { get; set; }
        public DbSet<BCHEQUEISSUE> BCHEQUEISSUE { get; set; }
        public DbSet<BCHEQUESTATUS> BCHEQUESTATUS { get; set; }
        public DbSet<BCHEQUETYPE> BCHEQUETYPE { get; set; }
        public DbSet<BDEPOSITACCTS> BDEPOSITACCTS { get; set; }
        public DbSet<BDOCUMETARYCOLLECTION> BDOCUMETARYCOLLECTION { get; set; }
        public DbSet<BDOCUMETARYCOLLECTIONCHARGES> BDOCUMETARYCOLLECTIONCHARGES { get; set; }
        public DbSet<BDOCUMETARYCOLLECTIONMT410> BDOCUMETARYCOLLECTIONMT410 { get; set; }
        public DbSet<BDRAWTYPE> BDRAWTYPE { get; set; }
        public DbSet<BDRFROMACCOUNT> BDRFROMACCOUNT { get; set; }
        public DbSet<BDYNAMICCONTROLS> BDYNAMICCONTROLS { get; set; }
        public DbSet<BDYNAMICDATA> BDYNAMICDATA { get; set; }
        public DbSet<BENCOM> BENCOM { get; set; }
        public DbSet<BENQUIRYCHECK> BENQUIRYCHECK { get; set; }
        public DbSet<BEXPORT_DOCUMETARYCOLLECTION> BEXPORT_DOCUMETARYCOLLECTION { get; set; }
        public DbSet<BEXPORT_DOCUMETARYCOLLECTIONCHARGES> BEXPORT_DOCUMETARYCOLLECTIONCHARGES { get; set; }
        public DbSet<BEXPORT_LC_ADV_NEGO> BEXPORT_LC_ADV_NEGO { get; set; }
        public DbSet<BFOREIGNEXCHANGE> BFOREIGNEXCHANGE { get; set; }
        public DbSet<BFREETEXTMESSAGE> BFREETEXTMESSAGE { get; set; }
        public DbSet<BIMPORT_DOCUMENTPROCESSING> BIMPORT_DOCUMENTPROCESSING { get; set; }
        public DbSet<BIMPORT_DOCUMENTPROCESSING_CHARGE> BIMPORT_DOCUMENTPROCESSING_CHARGE { get; set; }
        public DbSet<BIMPORT_DOCUMENTPROCESSING_MT734> BIMPORT_DOCUMENTPROCESSING_MT734 { get; set; }
        public DbSet<BIMPORT_NORMAILLC> BIMPORT_NORMAILLC { get; set; }
        public DbSet<BIMPORT_NORMAILLC_CHARGE> BIMPORT_NORMAILLC_CHARGE { get; set; }
        public DbSet<BIMPORT_NORMAILLC_MT700> BIMPORT_NORMAILLC_MT700 { get; set; }
        public DbSet<BIMPORT_NORMAILLC_MT707> BIMPORT_NORMAILLC_MT707 { get; set; }
        public DbSet<BIMPORT_NORMAILLC_MT740> BIMPORT_NORMAILLC_MT740 { get; set; }
        public DbSet<BIMPORT_NORMAILLC_MT747> BIMPORT_NORMAILLC_MT747 { get; set; }
        public DbSet<BINCOMINGCOLLECTIONPAYMENT> BINCOMINGCOLLECTIONPAYMENT { get; set; }
        public DbSet<BINCOMINGCOLLECTIONPAYMENTCHARGES> BINCOMINGCOLLECTIONPAYMENTCHARGES { get; set; }
        public DbSet<BINCOMINGCOLLECTIONPAYMENTMT202> BINCOMINGCOLLECTIONPAYMENTMT202 { get; set; }
        public DbSet<BINCOMINGCOLLECTIONPAYMENTMT400> BINCOMINGCOLLECTIONPAYMENTMT400 { get; set; }
        public DbSet<BINDUSTRY> BINDUSTRY { get; set; }
        public DbSet<BINTEREST_RATE> BINTEREST_RATE { get; set; }
        public DbSet<BINTEREST_TERM> BINTEREST_TERM { get; set; }
        public DbSet<BINTERNALBANKACCOUNT> BINTERNALBANKACCOUNT { get; set; }
        public DbSet<BINTERNALBANKPAYMENTACCOUNT> BINTERNALBANKPAYMENTACCOUNT { get; set; }
        public DbSet<BLCTYPES> BLCTYPES { get; set; }
        public DbSet<BLDACCOUNT> BLDACCOUNT { get; set; }
        public DbSet<BLOANPURPOSE> BLOANPURPOSE { get; set; }
        public DbSet<BLOANWORKINGACCOUNTS> BLOANWORKINGACCOUNTS { get; set; }
        public DbSet<BLOANGROUP> BLOANGROUP { get; set; }
        public DbSet<BMACODE> BMACODE { get; set; }
        public DbSet<BMENUTOP> BMENUTOP { get; set; }
        public DbSet<BNewLoanControl> BNewLoanControl { get; set; }
        public DbSet<BNEWNORMALLOAN> BNEWNORMALLOAN { get; set; }
        public DbSet<BOPENACCOUNT> BOPENACCOUNT { get; set; }
        public DbSet<BOPENACCOUNT_COPY> BOPENACCOUNT_COPY { get; set; }
        public DbSet<BOPENACCOUNT_INTEREST> BOPENACCOUNT_INTEREST { get; set; }
        public DbSet<BOUTGOINGCOLLECTIONPAYMENT> BOUTGOINGCOLLECTIONPAYMENT { get; set; }
        public DbSet<BOUTGOINGCOLLECTIONPAYMENTCHARGES> BOUTGOINGCOLLECTIONPAYMENTCHARGES { get; set; }
        public DbSet<BOUTGOINGCOLLECTIONPAYMENTMT910> BOUTGOINGCOLLECTIONPAYMENTMT910 { get; set; }
        public DbSet<BOVERSEASTRANSFER> BOVERSEASTRANSFER { get; set; }
        public DbSet<BOVERSEASTRANSFERCHARGECOMMISSION> BOVERSEASTRANSFERCHARGECOMMISSION { get; set; }
        public DbSet<BOVERSEASTRANSFERMT103> BOVERSEASTRANSFERMT103 { get; set; }
        public DbSet<BPaymentFrequenceControl> BPaymentFrequenceControl { get; set; }
        public DbSet<BPAYMENTMETHOD> BPAYMENTMETHOD { get; set; }
        public DbSet<BPLACCOUNT> BPLACCOUNT { get; set; }
        public DbSet<BPRODUCTLINE> BPRODUCTLINE { get; set; }
        public DbSet<BPRODUCTLINE_COPY> BPRODUCTLINE_COPY { get; set; }
        public DbSet<BPRODUCTTYPE> BPRODUCTTYPE { get; set; }
        public DbSet<BPROVINCE> BPROVINCE { get; set; }
        public DbSet<BRELATIONCODE> BRELATIONCODE { get; set; }
        public DbSet<BRESTRICT_TXN> BRESTRICT_TXN { get; set; }
        public DbSet<BRPODCATEGORY> BRPODCATEGORY { get; set; }
        public DbSet<BSalaryPaymentFrequency> BSalaryPaymentFrequency { get; set; }
        public DbSet<BSalaryPaymentFrequencyDetail> BSalaryPaymentFrequencyDetail { get; set; }
        public DbSet<BSalaryPaymentFrequencyTerm> BSalaryPaymentFrequencyTerm { get; set; }
        public DbSet<BSalaryPaymentMethod> BSalaryPaymentMethod { get; set; }
        public DbSet<BSAVING_ACC_ARREAR> BSAVING_ACC_ARREAR { get; set; }
        public DbSet<BSAVING_ACC_DISCOUNTED> BSAVING_ACC_DISCOUNTED { get; set; }
        public DbSet<BSAVING_ACC_INTEREST> BSAVING_ACC_INTEREST { get; set; }
        public DbSet<BSAVING_ACC_PERIODIC> BSAVING_ACC_PERIODIC { get; set; }
        public DbSet<BSECTOR> BSECTOR { get; set; }
        public DbSet<BSWIFTCODE> BSWIFTCODE { get; set; }
        public DbSet<BTRANSFERWITHDRAWAL> BTRANSFERWITHDRAWAL { get; set; }
        public DbSet<PROVISIONTRANSFER_DC> PROVISIONTRANSFER_DC { get; set; }
        public DbSet<Sochu> Sochu { get; set; }
        public DbSet<sysdiagrams> sysdiagrams { get; set; }
        public DbSet<AccountPeriods> AccountPeriods { get; set; }
        public DbSet<B_AddConfirmInfo> B_AddConfirmInfo { get; set; }
        public DbSet<B_Denomination> B_Denomination { get; set; }
        public DbSet<B_ImportLCPaymentMT202> B_ImportLCPaymentMT202 { get; set; }
        public DbSet<B_ImportLCPaymentMT756> B_ImportLCPaymentMT756 { get; set; }
        public DbSet<B_LOAN_CREDIT_SCORING> B_LOAN_CREDIT_SCORING { get; set; }
        public DbSet<B_LOAN_DISBURSAL_SCHEDULE> B_LOAN_DISBURSAL_SCHEDULE { get; set; }
        public DbSet<B_LOAN_PROCESS_PAYMENT> B_LOAN_PROCESS_PAYMENT { get; set; }
        public DbSet<B_NORMALLOAN_PAYMENT_SCHEDULE> B_NORMALLOAN_PAYMENT_SCHEDULE { get; set; }
        public DbSet<BAdvisingAndNegotiationLC> BAdvisingAndNegotiationLC { get; set; }
        public DbSet<BAdvisingAndNegotiationLCCharge> BAdvisingAndNegotiationLCCharge { get; set; }
        public DbSet<BCASH_REPAYMENT> BCASH_REPAYMENT { get; set; }
        public DbSet<BCOLLECTION_FOR_CRE_CARD_PAYM> BCOLLECTION_FOR_CRE_CARD_PAYM { get; set; }
        public DbSet<BEXPORT_DOCUMENTPROCESSING> BEXPORT_DOCUMENTPROCESSING { get; set; }
        public DbSet<BEXPORT_DOCUMENTPROCESSINGCHARGE> BEXPORT_DOCUMENTPROCESSINGCHARGE { get; set; }
        public DbSet<BLOANINTEREST_KEY> BLOANINTEREST_KEY { get; set; }
        public DbSet<BTRANSFER_4_CRE_CARD_PAYMENT> BTRANSFER_4_CRE_CARD_PAYMENT { get; set; }
        public DbSet<SessionHistories> SessionHistories { get; set; }
        public DbSet<Shifts> Shifts { get; set; }
    }
}
