USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BTRANSFERWITHDRAWAL_GetByID]    Script Date: 21/11/2014 11:03:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dbo].[BTRANSFERWITHDRAWAL_GetByID]
	@ID NVARCHAR(50)
AS
SELECT [ID]
      ,[AccountType]
      ,[Code]
      ,[DebitAccount]
      ,[DebitAmount]
      ,[CustBallance]
      ,[NewCustBallance]
      ,[DebitValueDate]
      ,[CreditAccount]
      ,[AmountCreditForCustomer]
      ,[DealRate]
      ,[CreditValueDate]
      ,[WaiveCharges]
      ,[Narrative]
      ,[Status]
      ,[CustomerIDDebit]
      ,[CustomerNameDebit]
      ,[CustomerIDCredit]
      ,[CustomerNameCredit]
      ,[DebitCurrency]
      ,[CreditCurrency]
      ,[Teller]
  FROM [dbo].[BTRANSFERWITHDRAWAL] where @ID = [Code]

--BEGIN
--	select un.*, at.AccountTypeName
--	from
--	(
--		select a.ID,AccountType, Code, DebitAccount, b.AccountCode as DebitAccountCode, DebitAmount, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount,0) - DebitAmount as NewCustBallance, DebitValueDate, c.AccountCode as CreditAccountCode,  CreditAccount, AmountCreditForCustomer, DealRate, WaiveCharges, a.Narrative, 
--							  CreditValueDate, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
--		 from dbo.BTRANSFERWITHDRAWAL a
--			join bopenaccount b on a.DebitAccount = convert(nvarchar(20),b.id)
--			join bopenaccount C on a.CreditAccount = convert(nvarchar(20),c.id)
--		where a.ID =@ID
--		union all
--		select a.ID,AccountType, Code, DebitAccount, b.refid as DebitAccountCode, DebitAmount, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal,0) - DebitAmount as NewCustBallance, DebitValueDate, c.refid as CreditAccountCode,  CreditAccount, AmountCreditForCustomer, DealRate, WaiveCharges, a.Narrative, 
--							  CreditValueDate, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
--		 from dbo.BTRANSFERWITHDRAWAL a
--			join BSAVING_ACC_ARREAR b on a.DebitAccount = b.refid
--			join BSAVING_ACC_ARREAR C on a.CreditAccount = c.refid
--		where a.ID =@ID
--		union all
--		select a.ID,AccountType, Code, DebitAccount, b.refid as DebitAccountCode, DebitAmount, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal,0) - DebitAmount as NewCustBallance, DebitValueDate, c.refid as CreditAccountCode,  CreditAccount, AmountCreditForCustomer, DealRate, WaiveCharges, a.Narrative, 
--							  CreditValueDate, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
--		 from dbo.BTRANSFERWITHDRAWAL a
--			join BSAVING_ACC_PERIODIC b on a.DebitAccount = b.refid
--			join BSAVING_ACC_PERIODIC C on a.CreditAccount = c.refid
--		where a.ID =@ID
--		union all
--		select a.ID,AccountType, Code, a.DebitAccount, b.refid as DebitAccountCode, DebitAmount, b.TDAmmount as CustBallance, ISNULL(b.TDAmmount,0) - DebitAmount as NewCustBallance, DebitValueDate, c.refid as CreditAccountCode,  CreditAccount, AmountCreditForCustomer, a.DealRate, WaiveCharges, a.Narrative, 
--							  CreditValueDate, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
--		 from dbo.BTRANSFERWITHDRAWAL a
--			join BSAVING_ACC_DISCOUNTED b on a.DebitAccount = b.refid
--			join BSAVING_ACC_DISCOUNTED C on a.CreditAccount = c.refid
--		where a.ID =@ID
--		union all
--		select a.ID,AccountType, Code, a.DebitAccount, b.ID as DebitAccountCode, DebitAmount, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount,0) - DebitAmount as NewCustBallance, DebitValueDate, c.ID as CreditAccountCode,  CreditAccount, AmountCreditForCustomer, a.DealRate, WaiveCharges, a.Narrative, 
--							  CreditValueDate, a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
--		 from dbo.BTRANSFERWITHDRAWAL a
--			join BLOANWORKINGACCOUNTS b on a.DebitAccount = b.ID
--			join BLOANWORKINGACCOUNTS C on a.CreditAccount = c.ID
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


