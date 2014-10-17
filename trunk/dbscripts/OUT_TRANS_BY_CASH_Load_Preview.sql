USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[OUT_TRANS_BY_CASH_Load_Preview]    Script Date: 17/10/2014 4:39:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OUT_TRANS_BY_CASH_Load_Preview](@ID nvarchar(20))
AS
SELECT  [ID]
      ,[Status]
      ,[ProductID]
      ,[ProductName]
      ,[Currency]
      ,[BenComID]
      ,[BenComName]
      ,[CreditAcctID]
      ,[CreditAcctName]
      ,[CashAccountID]
      ,[Amount]
      ,[SendingName]
      ,[SendingAddress1]
      ,[SendingAddress2]
      ,[SendingPhone]
      ,[ReceivingName]
      ,[BenAccountID]
      ,[ProvinceID]
      ,[ProvinceName]
      ,[BankCodeID]
      ,[BankCodeName]
      ,[IdentityCard]
      ,[IssueDate]
      ,[IssuePlace]
      ,[Teller]
      ,[Narrative1]
      ,[Narrative2]
      ,[Narrative3]
      ,[WaiveCharge]
      ,[VatSerial]
      ,[ChargeAmount]
      ,[VATChargeAmount]FROM [dbo].[BOUTWARD_TRANS_BY_CASH] WHERE ID = @ID
GO


