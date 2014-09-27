USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Load_dataView]    Script Date: 27/09/2014 8:38:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Load_dataView](@ID nvarchar(20))
AS 
SELECT [Status]
      ,[CustomerID]
      ,[CustomerName]
      ,[Address]
      ,[LegalID]
      ,convert(nvarchar(10),[IssueDate],101) as IssueDate
      ,[Telephone]
      ,[PlaceOfIssue]
      ,[TellerID]
      ,[DebitCurrency]
      ,[DebitAccount]
      ,[DebitAmt]
      ,[CreditCurrency]
      ,[CreditAccount]
      ,[DealRate]
      ,[CreditAmt]
      ,[CreditCardNumber]
      ,[WaiveCharges]
      ,[Narrative]
      ,[Narrative2]
  FROM [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM] WHERE ID = @ID ORDER BY CreatedDate, CustomerID desc

GO


