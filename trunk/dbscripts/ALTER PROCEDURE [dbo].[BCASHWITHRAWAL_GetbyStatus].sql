USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCASHWITHRAWAL_GetbyStatus]    Script Date: 21/11/2014 11:05:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dbo].[BCASHWITHRAWAL_GetbyStatus]
	@Status varchar(50),
	@UserId varchar(5)
AS
BEGIN
	SELECT un.[ID],[AccountType],[Code],[CustomerAccount],[AccountCode],[Amount]
      ,[Narrative], AT.AccountTypeName
      ,[TellerName]
      ,[CurrencyPaid]
      ,[CashAccount]
      ,[DealRate]
      ,[AmountPaid]
      ,[CustBallance]
      ,[NewCustBallance]
      ,[WaiveCharges]
      ,[PrintLnNoOfPS]
      ,[CreateBy]
      ,[CreateDate]
      ,[UpdatedBy]
      ,[UpdatedDate]
      ,[AuthorizedBy]
      ,[AuthorizedDate]
      ,[Status]
      ,[CustomerID]
      ,[CustomerName]
      ,[Currency]
	 from dbo.BCASHWITHRAWAL AS UN 
	--select un.*, at.AccountTypeName
	--from
	--(
	--	select a.ID, Code, AccountType, CustomerAccount, b.AccountCode, AmountPaid,  b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, DealRate, WaiveCharges, a.Narrative, 
	--						 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
	--	 from dbo.BCASHWITHRAWAL a
	--		join bopenaccount b on a.CustomerAccount = convert(nvarchar(20), b.id)
	--	where a.Status = @Status
	--	and a.CreateBy = @UserId
	--	union all
	--	select a.ID, Code, AccountType, CustomerAccount, b.RefID as AccountCode, AmountPaid,  b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, DealRate, WaiveCharges, a.Narrative, 
	--						 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
	--	 from dbo.BCASHWITHRAWAL a
	--		join BSAVING_ACC_ARREAR b on a.CustomerAccount = b.RefID
	--	where a.Status = @Status
	--	and a.CreateBy = @UserId
	--	union all
	--	select a.ID, Code, AccountType, CustomerAccount, b.RefID as AccountCode, AmountPaid,  b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, DealRate, WaiveCharges, a.Narrative, 
	--						 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
	--	 from dbo.BCASHWITHRAWAL a
	--		join BSAVING_ACC_PERIODIC b on a.CustomerAccount = b.RefID
	--	where a.Status = @Status
	--	and a.CreateBy = @UserId
	--	union all
	--	select a.ID, Code, AccountType, CustomerAccount, b.RefID as AccountCode, AmountPaid,  b.TDAmmount as CustBallance, ISNULL(b.TDAmmount, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, a.DealRate, WaiveCharges, a.Narrative, 
	--						 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
	--	 from dbo.BCASHWITHRAWAL a
	--		join BSAVING_ACC_DISCOUNTED b on a.CustomerAccount = b.RefID
	--	where a.Status = @Status
	--	and a.CreateBy = @UserId
	--	union all
	--	select a.ID, Code, AccountType, CustomerAccount, b.ID as AccountCode, AmountPaid,  b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) - Amount as NewCustBallance, CurrencyPaid, Amount, a.DealRate, WaiveCharges, a.Narrative, 
	--						 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
	--	 from dbo.BCASHWITHRAWAL a
	--		join BLOANWORKINGACCOUNTS b on a.CustomerAccount = b.ID
	--	where a.Status = @Status
	--	and a.CreateBy = @UserId
	--) un
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
	) at on un.AccountType = at.id where un.Status !='AUT'
END






GO


