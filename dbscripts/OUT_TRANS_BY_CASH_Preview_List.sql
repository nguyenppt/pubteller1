USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[OUT_TRANS_BY_CASH_Preview_List]    Script Date: 17/10/2014 4:39:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OUT_TRANS_BY_CASH_Preview_List]
AS
SELECT [ID]
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
      ,[ReceivingName]
      ,[BenAccountID]
      ,[ProvinceID]
      ,[ProvinceName]
      ,[BankCodeID]
      ,[BankCodeName]
      ,[VatSerial]
      ,[ChargeAmount]
      ,[VATChargeAmount] FROM [dbo].[BOUTWARD_TRANS_BY_CASH] WHERE Status != 'AUT'
GO


