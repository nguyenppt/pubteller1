USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCASHDEPOSIT_GetByID]    Script Date: 21/11/2014 11:01:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[BCASHDEPOSIT_GetByID]
	@ID nvarchar(50)
AS SELECT 
		[ID],[AccountType],[Code],[CustomerAccount]
      ,[AccountCode]
      ,[AmtPaidToCust]
      ,[CustBallance]
      ,[NewCustBallance]
      ,[TellerName]
      ,[CurrencyDeposited]
      ,[CashAccount]
      ,[AmountDeposited]
      ,[DealRate]
      ,[WaiveCharges]
      ,[Narrative]
      ,[PrintLnNoOfPS]
      ,[CreateBy]
      ,[CreateDate]
      ,[UpdatedBy]
      ,[UpdatedDate]
      ,[AuthorizedBy]
      ,[AuthorizedDate]
      ,[Status]
      ,[CustomerID]
      ,[CustomerAcct]
      ,[CustomerName]
      ,[Currency]
  FROM [dbo].[BCASHDEPOSIT] where [Code] = @ID
--BEGIN
--	select un.*, at.AccountTypeName
--	from
--	(
--		select a.ID, Code, AccountType,CustomerAccount, b.AccountCode, AmtPaidToCust, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, DealRate, WaiveCharges, a.Narrative, 
--							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
--		 from dbo.BCASHDEPOSIT a
--			join bopenaccount b on a.CustomerAccount = convert(nvarchar(20), b.id)
--		where a.ID =@ID
--		union all
--		select a.ID, Code, AccountType,CustomerAccount, b.Refid as AccountCode, AmtPaidToCust, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, DealRate, WaiveCharges, a.Narrative, 
--							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
--		 from dbo.BCASHDEPOSIT a
--			join BSAVING_ACC_ARREAR b on a.CustomerAccount =  b.Refid
--		where a.ID =@ID
--		union all
--		select a.ID, Code, AccountType,CustomerAccount, b.Refid as AccountCode, AmtPaidToCust, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, DealRate, WaiveCharges, a.Narrative, 
--							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
--		 from dbo.BCASHDEPOSIT a
--			join BSAVING_ACC_PERIODIC b on a.CustomerAccount =  b.Refid
--		where a.ID =@ID
--		union all
--		select a.ID, Code, AccountType,CustomerAccount, b.Refid as AccountCode, AmtPaidToCust, b.TDAmmount as CustBallance, ISNULL(b.TDAmmount, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, a.DealRate, WaiveCharges, a.Narrative, 
--							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
--		 from dbo.BCASHDEPOSIT a
--			join BSAVING_ACC_DISCOUNTED b on a.CustomerAccount =  b.Refid
--		where a.ID =@ID
--		union all
--		select a.ID, Code, AccountType,CustomerAccount, b.Id as AccountCode, AmtPaidToCust, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) + AmtPaidToCust as NewCustBallance, CurrencyDeposited, AmountDeposited, a.DealRate, WaiveCharges, a.Narrative, 
--							 PrintLnNoOfPS, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status,TellerName,CashAccount
--		 from dbo.BCASHDEPOSIT a
--			join BLOANWORKINGACCOUNTS b on a.CustomerAccount =  b.Id
--		where a.ID =@ID
				
--	) un
--	join 
--	(
--		select '1' id, 'Non Term Saving Account' as AccountTypeName
--		union all
--		select '2', 'Saving Account - Arrear' 
--		union all
--		select '3', 'Saving Account - Periodic'
--		union all
--		select '4', 'Saving Account - Discounted'
--		union all
--		select '5', 'Loan Working Account'
--	) at on un.AccountType = at.id
--END





GO


