USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BINWARD_PROC_CRE_ACCT_Load_Detail_ID]    Script Date: 29/10/2014 5:30:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BINWARD_PROC_CRE_ACCT_Load_Detail_ID](@ID nvarchar(30))
AS
SELECT [BenComID]
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
      ,[Narrative]
      ,[Narrative2]
      ,[WaiveCharge]
      ,[SaveTemplate]
      ,[VATSerial]
      ,[ChargeAmtLCY]
      ,[ChargeVATAmt] 
 from [dbo].[BOUTWARD_TRANS_BY_ACCT] WHERE ID = @ID
GO


