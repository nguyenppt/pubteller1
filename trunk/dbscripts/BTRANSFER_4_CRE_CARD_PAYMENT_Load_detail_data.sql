USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_Load_detail_data]    Script Date: 27/09/2014 8:41:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_Load_detail_data](@ID nvarchar(20))
AS SELECT [ID]
      ,[Status]
      ,[DebitCustomerID]
      ,[DebitCustomerName]
      ,[TellerID]
      ,[DebitCurrency]
      ,[DebitAccount]
      ,[DebitAmt]
      ,[NextTransCom]
      ,[OldBalance]
      ,[NewBalance]
      ,[ValueDate]
      ,[CreditAccount]
      ,[CreditCurrency]
      ,[CreditAmt]
      ,[ValueDate2]
      ,[CreditCardNumber]
      ,[WaiveCharges]
      ,[Narrative]
      ,[Narrative2]
  FROM [bisolutions_vvcb].[dbo].[BTRANSFER_4_CRE_CARD_PAYMENT] WHERE ID = @ID
GO


