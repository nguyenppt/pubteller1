USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESBYCASH_GetByID]    Script Date: 09/10/2014 3:08:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER PROCEDURE [dbo].[BCOLLECTCHARGESBYCASH_GetByID]
	@ID int
AS
BEGIN
	select un.*, at.AccountTypeName
	from
	(
		select a.ID, a.Code, AccountType,a.CustomerID, a.CustomerAddress, a.DocID, a.DocIssueDate, a.DocIssuePlace, a.Teller,a.Currency,CustomerAccount, b.AccountCode AccountCode,ChargAmountFCY,ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) - ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountFCY) as NewCustBallance
		, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate, VatAmountFCY,VatAmountLCY,ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount, TotalAmountFCY,TotalAmountLCY,ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status, a.CustomerName, a.CUstomerName_vanglai
		 from dbo.BCOLLECTCHARGESBYCASH a
			 join bopenaccount b on a.CustomerAccount = convert(nvarchar(20), b.id)
		where a.ID =@ID
		union all
		select a.ID, a.Code, AccountType,a.CustomerID, a.CustomerAddress, a.DocID, a.DocIssueDate, a.DocIssuePlace, a.Teller,a.Currency,CustomerAccount, b.Refid AccountCode,ChargAmountFCY,ChargAmountFCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) - ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountFCY) as NewCustBallance
		, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate,VatAmountFCY,VatAmountLCY, ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount,TotalAmountFCY,TotalAmountLCY, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status, a.CustomerName, a.CUstomerName_vanglai
		 from dbo.BCOLLECTCHARGESBYCASH a
			 join BSAVING_ACC_ARREAR b on a.CustomerAccount =  b.Refid
		where a.ID =@ID
		union all
		select a.ID, a.Code, AccountType,a.CustomerID, a.CustomerAddress, a.DocID, a.DocIssueDate, a.DocIssuePlace, a.Teller,a.Currency,CustomerAccount, b.Refid AccountCode,ChargAmountFCY,ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.AZPrincipal as CustBallance, ISNULL(b.AZPrincipal, 0) - ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountFCY) as NewCustBallance
		, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate,VatAmountFCY ,VatAmountLCY,ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount,TotalAmountFCY,TotalAmountLCY, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status, a.CustomerName, a.CUstomerName_vanglai
		 from dbo.BCOLLECTCHARGESBYCASH a
			 join BSAVING_ACC_PERIODIC b on a.CustomerAccount =  b.Refid
		where a.ID =@ID
		union all
		select a.ID, a.Code, AccountType,a.CustomerID, a.CustomerAddress, a.DocID, a.DocIssueDate, a.DocIssuePlace, a.Teller,a.Currency,CustomerAccount, b.Refid AccountCode,ChargAmountFCY,ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.TDAmmount as CustBallance, ISNULL(b.TDAmmount, 0) - ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountFCY) as NewCustBallance
		, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate,VatAmountFCY, VatAmountLCY,ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount,TotalAmountFCY,TotalAmountLCY, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status, a.CustomerName, a.CUstomerName_vanglai
		 from dbo.BCOLLECTCHARGESBYCASH a
			 join BSAVING_ACC_DISCOUNTED b on a.CustomerAccount =  b.Refid
		where a.ID =@ID
		union all
		select a.ID, a.Code, AccountType,a.CustomerID, a.CustomerAddress, a.DocID, a.DocIssueDate, a.DocIssuePlace, a.Teller,a.Currency,CustomerAccount, b.Account AccountCode,ChargAmountFCY,ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, 0 CustBallance, 0 NewCustBallance
		, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate,VatAmountFCY,VatAmountLCY, ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount,TotalAmountFCY,TotalAmountLCY, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status, a.CustomerName, a.CUstomerName_vanglai
		 from dbo.BCOLLECTCHARGESBYCASH a
			 join BINTERNALBANKACCOUNT b on a.CustomerAccount = b.Code
		where a.ID =@ID
		union all
		select a.ID, a.Code, AccountType,a.CustomerID, a.CustomerAddress, a.DocID, a.DocIssueDate, a.DocIssuePlace, a.Teller,a.Currency,CustomerAccount, b.id AccountCode,ChargAmountFCY,ChargAmountLCY, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount, b.WorkingAmount as CustBallance, ISNULL(b.WorkingAmount, 0) - ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountFCY) as NewCustBallance
		, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate, VatAmountFCY,VatAmountLCY,ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount, TotalAmountFCY,TotalAmountLCY,ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status, a.CustomerName, a.CUstomerName_vanglai
		 from dbo.BCOLLECTCHARGESBYCASH a
			 join BLOANWORKINGACCOUNTS b on a.CustomerAccount = b.id
		where a.ID =@ID
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
END









GO


