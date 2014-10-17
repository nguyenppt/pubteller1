USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[OUT_TRANS_BY_CASH_Enquiry]    Script Date: 17/10/2014 4:40:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OUT_TRANS_BY_CASH_Enquiry](@ProductID nvarchar(20), @SendingName nvarchar(250), @LegalID nvarchar(50), @ReceivingName nvarchar(250),
	@BenAccount nvarchar(250), @ReferenceID nvarchar(50), @BenCom nvarchar(50), @Currency nvarchar(5), @FromAmt numeric(19,4), @ToAmt numeric(19,4))

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
      ,[VATChargeAmount] FROM [dbo].[BOUTWARD_TRANS_BY_CASH]
	  WHERE (@ProductID IS NULL OR @ProductID ='' OR [ProductID] LIKE N'%'+@ProductID+'%') AND
	  (@SendingName IS NULL OR @SendingName ='' OR [SendingName] LIKE N'%'+@SendingName+'%') AND
	  (@LegalID IS NULL OR @LegalID ='' OR [IdentityCard] LIKE N'%'+@LegalID+'%') AND
	  (@ReceivingName IS NULL OR @ReceivingName ='' OR [ReceivingName] LIKE N'%'+@ReceivingName+'%') AND
	  (@BenAccount IS NULL OR @BenAccount ='' OR BenAccountID LIKE N'%'+@BenAccount+'%') AND
	  (@ReferenceID IS NULL OR @ReferenceID ='' OR ID LIKE N'%'+@ReferenceID+'%') AND
	  (@BenCom IS NULL OR @BenCom ='' OR BenComID LIKE N'%'+@BenCom+'%') AND
	  (@Currency IS NULL OR @Currency ='' OR Currency LIKE N'%'+@Currency+'%') AND
	  (@FromAmt = 0 OR @FromAmt <= [Amount]) AND
	  (@ToAmt = 0 OR @ToAmt >= [Amount])

GO


