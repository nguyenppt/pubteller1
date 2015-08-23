
/****** Object:  StoredProcedure [dbo].[BCASHWITHRAWAL_Print_GetByCode]    Script Date: 17/11/2014 6:30:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BCASHWITHRAWAL_Print_GetByCode]
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
		, un.AmountPaid as PaidAmount
		, un.Currency
		, un.Narrative
		, un.Amount
		,un.CurrencyPaid
		, rtrim(dbo.fuDocSoThanhChu(AmountPaid)) + case when un.Currency = 'VND' then N' đồng' else N' đô la Mỹ' end NumberWords
	from
	(
		select a.ID, Code,b.customerId, b.currency, AccountType, CustomerAccount, b.AccountCode, AmountPaid,  b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHWITHRAWAL a
			join bopenaccount b on a.CustomerAccount = convert(nvarchar(20), b.id)
		where Code =@Code
		union all
		select a.ID, Code,b.customerId, b.currency, AccountType, CustomerAccount, b.RefID as AccountCode, AmountPaid,  b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHWITHRAWAL a
			join BSAVING_ACC_ARREAR b on a.CustomerAccount = b.RefID
		where Code =@Code
		union all
		select a.ID, Code,b.customerId, b.currency, AccountType, CustomerAccount, b.RefID as AccountCode, AmountPaid,  b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHWITHRAWAL a
			join BSAVING_ACC_PERIODIC b on a.CustomerAccount = b.RefID
		where Code =@Code
		union all
		select a.ID, Code,b.customerId, b.tdcurrency, AccountType, CustomerAccount, b.RefID as AccountCode, AmountPaid,  b.TDAmmount as CustBallance, ISNULL(b.TDAmmount, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, a.DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		 from dbo.BCASHWITHRAWAL a
			join BSAVING_ACC_DISCOUNTED b on a.CustomerAccount = b.RefID
		where Code =@Code
		union all
		select a.ID, Code,b.customerId, b.CurrencyCode, AccountType, CustomerAccount, b.ID as AccountCode, AmountPaid,  b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, a.DealRate, WaiveCharges, a.Narrative, 
							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
		from dbo.BCASHWITHRAWAL a
			join BLOANWORKINGACCOUNTS b on a.CustomerAccount = b.ID
		where Code =@Code
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


