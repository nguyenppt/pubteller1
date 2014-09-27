USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_Preview_List]    Script Date: 27/09/2014 8:41:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_Preview_List]
AS 
SELECT [ID], debitCustomerName as CustomerName, debitCustomerID as CustomerID, [DebitCurrency]
      ,[DebitAccount], convert(nvarchar,convert(money,[DebitAmt]),1) [DebitAmt] , [CreditAccount]
      ,[CreditCurrency]
      ,convert(nvarchar,convert(money,[CreditAmt]),1) [CreditAmt] , Status , CreditAccount
	  FROM [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT]  
	  where Status !='AUT' order by Createddate, CustomerName desc
GO


