USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESFROMACCOUNT_Enquiry]    Script Date: 07/10/2014 5:51:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BCOLLECTCHARGESFROMACCOUNT_Enquiry](@CollectionType nvarchar(50), @RefID nvarchar(30), @AccountType nvarchar(10), @AccountID nvarchar(50), @CustomerID nvarchar(50)
	,	@CustomerName nvarchar(250), @LegalID nvarchar(50), @FromChargesAmt decimal, @ToChargesAmt decimal)
AS
IF(@CollectionType = 'Account')
BEGIN
SELECT ch.[ID] ---,ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmountLCY 
      ,[Code],[CustomerAccount],[ChargAmountLCY]
      ,[ChargAmountFCY]
      ,[CategoryPLName], ch.Status, at.AccountTypeName FROM [dbo].[BCOLLECTCHARGESFROMACCOUNT] ch JOIN [dbo].[BCUSTOMER_INFO] ac on ch.CustomerID = ac.CustomerID 
																		   JOIN (
																				select '1' id, 'Non Term Saving Account' as AccountTypeName
																				union all
																				select '2', 'Saving Account - Arrear' 
																				union all
																				select '3', 'Saving Account - Periodic'
																				union all
																				select '4', 'Saving Account - Discounted'
																				union all
																				select '5', 'Loan Working Account'
																			) at on ch.AccountType = at.id
	  WHERE 
	  (@RefID IS NULL OR @RefID='' OR  [Code] like N'%'+@RefID+'%') AND
	  (@AccountType IS NULL OR @AccountType = '' OR  [AccountType] like N'%'+@AccountType+'%') AND
	  (@AccountID IS NULL OR @AccountID = '' OR [CustomerAccount] like N'%'+@AccountID+'%') AND
	  (@CustomerID IS NULL OR @CustomerID = '' OR  ch.CustomerID like N'%'+@CustomerID+'%') AND
	  (@CustomerName IS NULL OR @CustomerName = '' OR CustomerName like N'%'+@CustomerName+'%') AND
	  (@LegalID IS NULL OR @LegalID = '' OR  [DocID] like N'%'+@LegalID+'%') AND
	  (@FromChargesAmt = 0 or @FromChargesAmt <= [ChargAmountLCY]) AND
	  (@ToChargesAmt = 0 or @ToChargesAmt >= [ChargAmountLCY])
													 



END
GO


