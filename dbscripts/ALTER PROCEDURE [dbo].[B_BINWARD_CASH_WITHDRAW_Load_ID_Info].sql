USE [bisolutions_vvcb]
GO
/****** Object:  StoredProcedure [dbo].[B_BINWARD_CASH_WITHDRAW_Load_ID_Info]    Script Date: 07/12/2014 10:46:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[B_BINWARD_CASH_WITHDRAW_Load_ID_Info](@ID nvarchar(20), @TransferType nvarchar(50))
AS
IF @TransferType = 'Cash'
SELECT ID, [Currency], [CreditAcctID], [SendingName], [ReceivingName], [IdentityCard], 
[IssueDate] ,[IssuePlace], Amount FROM [dbo].[BOUTWARD_TRANS_BY_CASH] where ID  = @ID and ProductId = '1000' and Status = 'AUT'
ELSE IF @TransferType = 'Account'

SELECT [ID]
      ,[Currency]
      ,[DebitAcctID] as [CreditAcctID]
      ,[DebitAcctName]
      ,[DebitAmount] as Amount
      ,[SendingName]
      ,[IDTaxCode]
      ,[ReceivingName] + ', '+[ReceivingName2] as [ReceivingName]
      ,[ReceivingName2]
      ,[BenAcctID]
      ,[LegalID] as [IdentityCard]
      ,[IssueDate]
      ,[IssuePlace]
      ,[ProvinceName]
      ,[Phone]
      ,[PayNumber]
      ,[ChargeAmtLCY]
      ,[ChargeVATAmt] FROM [BOUTWARD_TRANS_BY_ACCT] where ID = @ID and Status = 'AUT' and ProductId = '1000'