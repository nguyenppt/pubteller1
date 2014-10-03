USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_GetByCode_OPEN]    Script Date: 03/10/2014 1:24:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dbo].[BOPENACCOUNT_GetByCode_OPEN]
	@Code nvarchar(20),
	@AccountType nvarchar(5)
AS
BEGIN
	if @AccountType = '1' --nonterm
	begin
		select ID, AccountCode, CustomerID, CustomerType, CustomerName, CategoryID, CategoryName, Currency, AccountTitle, ShortTitle, IntCapToAC, AccountOfficerID, 
							 AccountOfficerName, ProductLineID, ProductLineName, ChargeCode, ChargeCodeName, RestrictTxnID, RestrictTxnName, JoinHolderID, JoinHolderName, 
							 RelationCode, RelationCodeName, JoinNotes, AlternateAct, ActualBallance,ClearedBallance,WorkingAmount, CloseOnline, CloseMode, CreditCurrency, AccountPaid, Narrative, CreateBy, 
							 CreateDate, UpdatedBy, UpdatedDate, AuthorizedBy, AuthorizedDate, Status, AccountStatus,DocId,CategoryType
							 ,AccountCode + ' - ' + AccountTitle as Display
		 from dbo.BOPENACCOUNT
		where  AccountCode = @Code and Status='AUT' and CategoryType in ('1','2')
			and AccountStatus in ('OPEN')
	end

	if @AccountType = '2'--arrear
	begin
		select  RefId as Id, b.customerType, a.Status, a.CustomerId, a.CustomerName, a.AccTitle as AccountTitle, a.Currency, 
				a.AZPrincipal as WorkingAmount,RefId + ' - ' + AccTitle as Display
		 from dbo.BSAVING_ACC_ARREAR a
			join BCUSTOMER_INFO b on a.CustomerId = b.CustomerId
		where  RefId = @Code
			and a.Status='AUT' and (CloseStatus !='AUT' or CloseStatus is null)
	end

	if @AccountType = '3' --periolic
	begin
		select  RefId as Id, b.customerType, a.Status, a.CustomerId, a.CustomerName, a.AccTitle as AccountTitle, a.Currency, 
				a.AZPrincipal as WorkingAmount,RefId + ' - ' + AccTitle as Display
		 from dbo.BSAVING_ACC_PERIODIC a
			join BCUSTOMER_INFO b on a.CustomerId = b.CustomerId
		where  RefId = @Code
			and a.Status='AUT' and (CloseStatus !='AUT' or CloseStatus is null)
	end

	if @AccountType = '4'--discounted
	begin
		select  RefId as Id, b.customerType, a.Status, a.CustomerId, b.GBFullName as CustomerName, '' as AccountTitle, a.TDCurrency as Currency, 
				a.TDAmmount as WorkingAmount,RefId as Display
		 from dbo.BSAVING_ACC_DISCOUNTED a
			join BCUSTOMER_INFO b on a.CustomerId = b.CustomerId
		where  RefId = @Code
			and a.Status='AUT' and (CloseStatus !='AUT' or CloseStatus is null)
	end

	if @AccountType = '5' --loanaccount
	begin
		select ID, a.CustomerID, b.CustomerType, a.GBFullName as CustomerName, CurrencyCode as Currency, AccountName as AccountTitle,
							 WorkingAmount, a.Status, a.DocId,CategoryType
							 ,ID + ' - ' + AccountName as Display
		 from dbo.BLOANWORKINGACCOUNTS a
			join BCUSTOMER_INFO b on a.CustomerId = b.CustomerId
		where  ID = @Code
			and a.Status='AUT'
	end
END






GO


