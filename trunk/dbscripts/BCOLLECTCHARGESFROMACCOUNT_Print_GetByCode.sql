USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESFROMACCOUNT_Print_GetByCode]    Script Date: 09/10/2014 2:03:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dbo].[BCOLLECTCHARGESFROMACCOUNT_Print_GetByCode]
	@Code nvarchar(20)
AS
BEGIN
	select
		N'' + convert(nvarchar(50), un.VatSerialNo) as VatNo
		, cus.GBFullName as CustomerName
		, cus.GBStreet + ', ' + GBDist + ', ' + TenTinhThanh CustomerAddress
		, un.Code as DocCollectCode
		, N'host' as UserNameLogin
		, un.CustomerID
		, cus.DocID as IdentityNo
		, N'CHUYỂN KHOẢN' as VatType
		, un.AccountCode as ChargeAcct
		, un.Narrative as ChargeRemarks
		, un.VatAmount as VAT
		, convert(nvarchar,convert(money, un.ChargAmount),1) as SoTienThanhToan
		, convert(nvarchar,convert(money, un.TotalAmount),1) as Tong
		, rtrim(dbo.f_CurrencyToText(un.TotalAmount,un.Currency)) SoTienBangChu
		, un.CategoryPLCode, un.CategoryPLName
	from
	(
		select a.ID, Code, AccountType,CustomerAccount, b.AccountCode, b.customerID, ChargAmountFCY, ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) - ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountFCY) as NewCustBallance
		,b.currency, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate, VatAmountFCY, VatAmountLCY, ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount, TotalAmountFCY,TotalAmountLCY, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
		 from dbo.BCOLLECTCHARGESFROMACCOUNT a
			join bopenaccount b on a.CustomerAccount = convert(nvarchar(20), b.id)
		where a.Code =@Code
		union all
		select a.ID, Code, AccountType,CustomerAccount, b.Refid as AccountCode, b.customerID,ChargAmountFCY, ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) - ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountFCY) as NewCustBallance
		,b.currency, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate, VatAmountFCY,VatAmountLCY, ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount, TotalAmountFCY, TotalAmountLCY, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
		 from dbo.BCOLLECTCHARGESFROMACCOUNT a
			join BSAVING_ACC_ARREAR b on a.CustomerAccount =  b.Refid
		where a.Code =@Code
		union all
		select a.ID, Code, AccountType,CustomerAccount, b.Refid as AccountCode, b.customerID,ChargAmountFCY,ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) - ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountFCY) as NewCustBallance
		,b.currency, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate, VatAmountFCY, VatAmountLCY, ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount, TotalAmountFCY, TotalAmountLCY, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
		 from dbo.BCOLLECTCHARGESFROMACCOUNT a
			join BSAVING_ACC_PERIODIC b on a.CustomerAccount =  b.Refid
		where a.Code =@Code
		union all
		select a.ID, Code, AccountType,CustomerAccount, b.Refid as AccountCode, b.customerID,ChargAmountFCY,ChargAmountLCY,ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.TDAmmount as CustBallance, ISNULL(b.TDAmmount, 0) - ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountFCY) as NewCustBallance
		,b.TDcurrency, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate, VatAmountFCY,VatAmountLCY,ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount, TotalAmountFCY,TotalAmountLCY,ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
		 from dbo.BCOLLECTCHARGESFROMACCOUNT a
			join BSAVING_ACC_DISCOUNTED b on a.CustomerAccount =  b.Refid
		where a.Code =@Code
		union all
		select a.ID, Code, AccountType,CustomerAccount, b.id as AccountCode, b.customerID, ChargAmountFCY, ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) - ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountFCY) as NewCustBallance
		,b.currencycode, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate, VatAmountFCY, VatAmountLCY, ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount, TotalAmountFCY,TotalAmountLCY, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
		 from dbo.BCOLLECTCHARGESFROMACCOUNT a
			join BLOANWORKINGACCOUNTS b on a.CustomerAccount = b.id
		where a.Code =@Code
	) un
	join BCUSTOMER_INFO cus on un.CustomerID = cus.CustomerID
END







GO


