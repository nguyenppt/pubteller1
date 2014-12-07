USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[Print_Deal_theo_ID]    Script Date: 07/12/2014 10:50:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Print_Deal_theo_ID](@RefID nvarchar(30))
as
DECLARE @NUM decimal
BEGIN
set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
			update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'
	
			SELECT [ID] AS RefID, day([CreatedDate]) as day, month([CreatedDate]) as month, year([CreatedDate]) as year,
			 right('0'+ convert(nvarchar,day(getdate())),2) +  right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) + ' .' + right('00000'+ convert(nvarchar,@NUM),6) as CT, FONAme as Beneficiary_Name, [DebitAccount] as DebitAccount, [IdentityCard] as LegalID, 
			convert(nvarchar(10),[IssueDate],103) as IssueDate,[IssuePlace], 
			convert(nvarchar,convert(money,ISNULL(NULLIF([CreditAmtLCY],0.0000),[CreditAmtfCY])),1) +'  '+ [CreditCurrency] as So_tien,
			 dbo.f_CurrencyToText(ISNULL(NULLIF([CreditAmtLCY],0.0000),[CreditAmtfCY]),[CreditCurrency] ) as sotienchu,
			[Narrative1]+ ', '+[Narrative2]   as Narrative , CreatedUser as Teller 
			FROM [dbo].[BINWARD_CASH_WITHDRAW] WHERE @RefID = ID
END
GO


