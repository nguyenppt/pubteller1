USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOUTWARD_TRANS_BY_ACCT_Load_Detail_Data]    Script Date: 28/10/2014 2:14:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BOUTWARD_TRANS_BY_ACCT_Load_Detail_Data](@ID nvarchar(30)) 
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
      ,[ChargeVATAmt]  FROM [dbo].[BOUTWARD_TRANS_BY_ACCT] where ID = @ID
GO


