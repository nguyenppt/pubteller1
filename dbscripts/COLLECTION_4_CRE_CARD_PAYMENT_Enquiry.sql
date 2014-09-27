USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Enquiry]    Script Date: 27/09/2014 8:39:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Enquiry](@TypePayment nvarchar(20), @ID nvarchar(20), @DebitAccountID nvarchar(30), @DebitCurrency nvarchar(5),
	@CustomerID nvarchar(20) , @CustomerName nvarchar(250), @LegalID nvarchar(50), @DebitFromAmt decimal(19,2), @DebitToAmt decimal(19,2))
AS 
IF @TypePayment='Collection'
	SELECT ID, CustomerName, DebitCurrency,convert(nvarchar,convert(money, DebitAmt),1) as DebitAmt, [CreditCurrency],
			convert(nvarchar,convert(money,[CreditAmt]),1) as  CreditAmt ,Status, DebitAccount, 'Collection' as Type FROM [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM]
	WHERE (@ID IS NULL OR @ID='' OR ID LIKE N'%'+@ID+'%') AND 
			(@DebitAccountID IS NULL OR @DebitAccountID='' OR DebitAccount LIKE N'%'+@DebitAccountID+'%') AND 
			(@DebitCurrency IS NULL OR @DebitCurrency='' OR DebitCurrency LIKE N'%'+@DebitCurrency+'%') AND 
			(@CustomerID IS NULL OR @CustomerID='' OR CustomerID LIKE N'%'+@CustomerID+'%') AND 
			(@CustomerName IS NULL OR @CustomerName='' OR CustomerName LIKE N'%'+@CustomerName+'%') AND 
			(@LegalID IS NULL OR @LegalID='' OR LegalID LIKE N'%'+@LegalID+'%') AND 
			(@DebitFromAmt =0 OR @DebitFromAmt<= DebitAmt) AND
			(@DebitToAmt =0 OR @DebitToAmt>= DebitAmt) 
IF @TypePayment='Transfer'
	SELECT [ID], debitCustomerName as CustomerName, debitCustomerID as CustomerID, [DebitCurrency]
      ,[DebitAccount], convert(nvarchar,convert(money,[DebitAmt]),1) [DebitAmt] , [CreditAccount]
      ,[CreditCurrency]
      ,convert(nvarchar,convert(money,[CreditAmt]),1) [CreditAmt] , pay.Status , CreditAccount, 'Transfer' as Type
	  FROM [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT]  AS pay JOIN [dbo].[BCUSTOMER_INFO] as cus on cus.CustomerID = pay.debitCustomerID
	  WHERE  
	  (@ID IS NULL OR @ID='' OR ID LIKE N'%'+@ID+'%') AND 
			(@DebitAccountID IS NULL OR @DebitAccountID='' OR DebitAccount LIKE N'%'+@DebitAccountID+'%') AND 
			(@DebitCurrency IS NULL OR @DebitCurrency='' OR DebitCurrency LIKE N'%'+@DebitCurrency+'%') AND 
			(@CustomerID IS NULL OR @CustomerID='' OR debitCustomerID LIKE N'%'+@CustomerID+'%') AND 
			(@CustomerName IS NULL OR @CustomerName='' OR debitCustomerName LIKE N'%'+@CustomerName+'%') AND 
			(@LegalID IS NULL OR @LegalID='' OR [DocID] LIKE N'%'+@LegalID+'%') AND 
			(@DebitFromAmt =0 OR @DebitFromAmt<= DebitAmt) AND
			(@DebitToAmt =0 OR @DebitToAmt>= DebitAmt) 


GO


