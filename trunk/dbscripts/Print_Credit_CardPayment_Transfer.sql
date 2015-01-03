USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[Print_Credit_CardPayment_Transfer]    Script Date: 02/01/2015 10:47:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Print_Credit_CardPayment_Transfer](@RefID nvarchar(30))
as
DECLARE @NUM decimal
BEGIN
set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
			update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'
	
			SELECT [ID] AS RefID, day([CreatedDate]) as day, month([CreatedDate]) as month, year([CreatedDate]) as year,
			 right('0'+ convert(nvarchar,day(getdate())),2) +  right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) + ' .' + right('00000'+ convert(nvarchar,@NUM),6) as CT,  
			debitCustomerName ,DebitAccount ,CreditAccount, 
			convert(nvarchar,convert(money,ISNULL(NULLIF([debitAmt],0.0000),[debitAmt])),1) +'  '+ [DebitCurrency] as So_tien_Debit,
			 dbo.f_CurrencyToText(ISNULL(NULLIF([DebitAmt],0.0000),[DebitAmt]),[DebitCurrency] ) as sotienchu_Debit,
			 CreditCardNumber,
			convert(nvarchar,convert(money,ISNULL(NULLIF([CreditAmt],0.0000),[CreditAmt])),1) +'  '+ [CreditCurrency] as So_tien_Credit,
			 dbo.f_CurrencyToText(ISNULL(NULLIF([CreditAmt],0.0000),[CreditAmt]),[CreditCurrency] ) as sotienchu_Credit,
			[Narrative]+ ', '+[Narrative2]   as Narrative , tellerID as Teller 
			FROM [dbo].BTRANSFER_4_CRE_CARD_PAYMENT WHERE @RefID = ID
END
GO


