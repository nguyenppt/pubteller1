USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCASHDEPOSIT_Print_GetByCode]    Script Date: 21/11/2014 11:01:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dbo].[BCASHDEPOSIT_Print_GetByCode]
	@Code nvarchar(20)
AS
DECLARE @NUM decimal
BEGIN
	set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
	update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'
	select 
		 un.Code
		,un.TellerName
		,un.AccountCode
		, day(createdate) as CreateDate_Day
		, Month(createdate) as CreateDate_Month
		, year(createdate) as CreateDate_Year
		, right('0'+ convert(nvarchar,day(getdate())),2) +  right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) + ' .' + right('00000'+ convert(nvarchar,@NUM),6) as CT
		,cus.gbfullname as customername
		,cus.GBStreet + ', ' + GBDist + ', ' + TenTinhThanh customerAddress
		,cus.Docid
		, cus.DocIssueDate as IssueDate
		, cus.DocIssuePlace as IssuePlace
		, un.AmountDeposited as DepositAmount
		, un.Currency
		, un.Narrative
		, un.AmtPaidToCust
		,un.CurrencyDeposited, dbo.f_CurrencyToText(un.AmountDeposited,un.CurrencyDeposited) as NumberWords
		--, rtrim(dbo.fuDocSoThanhChu(AmountDeposited)) + case when un.Currency = 'VND' then N' đồng' else N' đô la Mỹ' end NumberWords
	from
	(
		select a.ID, Code,b.customerID,b.currency, AccountType,CustomerAccount, b.AccountCode, AmtPaidToCust, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHDEPOSIT a
			join bopenaccount b on a.CustomerAccount = convert(nvarchar(20), b.id)
		where a.Code =@Code
		union all
		select a.ID, Code, b.customerID,b.currency,AccountType,CustomerAccount, b.Refid as AccountCode, AmtPaidToCust, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHDEPOSIT a
			join BSAVING_ACC_ARREAR b on a.CustomerAccount =  b.Refid
		where a.Code =@Code
		union all
		select a.ID, Code, b.customerID,b.currency,AccountType,CustomerAccount, b.Refid as AccountCode, AmtPaidToCust, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHDEPOSIT a
			join BSAVING_ACC_PERIODIC b on a.CustomerAccount =  b.Refid
		where a.Code =@Code
		union all
		select a.ID, Code, b.customerID,b.tdcurrency,AccountType,CustomerAccount, b.Refid as AccountCode, AmtPaidToCust, b.TDAmmount as CustBallance, ISNULL(b.TDAmmount, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, a.DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHDEPOSIT a
			join BSAVING_ACC_DISCOUNTED b on a.CustomerAccount =  b.Refid
		where a.Code =@Code
		union all
		select a.ID, Code,b.customerID,b.currencyCode, AccountType,CustomerAccount, b.ID as AccountCode, AmtPaidToCust, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHDEPOSIT a
			join BLOANWORKINGACCOUNTS b on a.CustomerAccount =  b.Id
		where a.Code =@Code
		
	) un
	join 
	(
		select '1' id, 'Non Term Saving Account' as AccountTypeName
		union all
		select '2', 'Saving Account - Arrear' 
		union all
		select '3', 'Saving Account - Periodic'
		union all
		select '4', 'Saving Account - Discounted'
		union all
		select '5', 'Loan Working Account'
	) at on un.AccountType = at.id
	join bcustomer_info cus on un.customerid = cus.customerid
	
END







GO


