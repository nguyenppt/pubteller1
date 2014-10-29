USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BINWARD_PROC_CRE_ACCT_Preview_List]    Script Date: 29/10/2014 5:27:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BINWARD_PROC_CRE_ACCT_Preview_List]
AS select 
[ID]
      ,[Status]
      ,[ClearingID]
      ,[DebitCurrency]
      ,[DebitAccount]
      ,[DebitAmtLCY]
      ,[DebitAmtFCY]
      ,[DealRate]
      ,[TempAmt]
      ,[BOName]
      ,[CreditCurrency]
      ,[CreditAcctID]
      ,[CreditAcctName]
      ,[CreditAmtLCY]
      ,[CreditAmtFCY]
      ,[FOName]
      ,[FOName2] 
	  FROM [dbo].[BINWARD_PROC_CRE_ACCT] where Status !='AUT'
GO


