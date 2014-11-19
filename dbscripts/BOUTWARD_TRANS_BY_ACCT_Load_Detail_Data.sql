USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOUTWARD_TRANS_BY_ACCT_Load_Detail_Data]    Script Date: 19/11/2014 6:28:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BOUTWARD_TRANS_BY_ACCT_Load_Detail_Data](@ID nvarchar(30)) 
AS
SELECT  [ID]
      ,[Status]
      ,[ProductID]
      ,[ProductName]
      ,[BenComID]
      ,[BenComName]
      ,[Currency]
      ,[DebitAcctID]
      ,[DebitAcctName]
      ,[DebitAmount]
      ,[SendingName]
      ,[SendingAddress]
      ,[IDTaxCode]
      ,[ReceivingName]
      ,[ReceivingName2]
      ,[BenAcctID]
      ,[LegalID]
      ,[IssueDate]
      ,[IssuePlace]
      ,[ProvinceCode]
      ,[ProvinceName]
      ,[Phone]
      ,[BankCode]
      ,[BankCodeDesc]
      ,[BankName]
      ,[PayNumber]
      ,[TellerID]
      ,[Narrative]
      ,[Narrative2]
      ,[WaiveCharge]
      ,[SaveTemplate]
      ,[VATSerial]
      ,[ChargeAmtLCY]
      ,[ChargeVATAmt], [OldBalance]
      ,[NewBalance]  FROM [dbo].[BOUTWARD_TRANS_BY_ACCT] where ID = @ID
GO


