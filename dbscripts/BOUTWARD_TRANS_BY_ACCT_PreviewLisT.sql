USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOUTWARD_TRANS_BY_ACCT_PreviewLisT]    Script Date: 28/10/2014 2:14:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BOUTWARD_TRANS_BY_ACCT_PreviewLisT]
AS
SELECT [ID]
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
      ,ISNULL(NULLIF([ReceivingName],''),[ReceivingName2]) AS ReceivingName
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
     
      ,[ChargeAmtLCY]
      ,[ChargeVATAmt]  FROM [dbo].[BOUTWARD_TRANS_BY_ACCT] where status !='AUT'
GO


