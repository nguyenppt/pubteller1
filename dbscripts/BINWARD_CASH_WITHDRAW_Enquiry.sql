
/****** Object:  StoredProcedure [dbo].[BINWARD_CASH_WITHDRAW_Enquiry]    Script Date: 29/10/2014 5:23:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BINWARD_CASH_WITHDRAW_Enquiry](@TransactionType nvarchar(50), @BOName nvarchar(250), @FOName nvarchar(250), @FOLegalID nvarchar(50)
,@ID nvarchar(30) , @Currency nvarchar(20), @FromAmt decimal(18,4), @ToAmt decimal(18,4))
as
IF(@TransactionType = 'CashWithdraw')
BEGIN
SELECT [ID]
      ,[Status]
      ,[ClearingID]
      ,[DebitCurrency]
      ,[DebitAccount]
      ,[DebitAmtLCY]
      ,[DebitAmtFCY]
      ,[DealRate]
      ,[CreditAcctID]
      ,[CreditAcctName]
      ,[CreditCurrency]
      ,[CreditAmtLCY]
      ,[CreditAmtFCY]
      ,[BOName]
      ,[FOName], 'CashWithdraw'  as tu FROM [dbo].[BINWARD_CASH_WITHDRAW] WHERE 
	   (@BOName is null or @BOName='' or [BOName] like N'%'+@BOName+'%') AND
	   (@FOName is null or @FOName='' or [FOName] like N'%'+@FOName+'%') AND
	   (@FOLegalID is null or @FOLegalID='' or IdentityCard like N'%'+@FOLegalID+'%') AND
	   (@Currency is null or @Currency='' or [CreditCurrency] like N'%'+@Currency+'%') AND
	   (@ID is null or @ID='' or ID like N'%'+@ID+'%') AND
	   (@FromAmt = 0 or @FromAmt <= ISNULL(NULLIF([CreditAmtLCY],0),[CreditAmtFCY])) AND
	   (@ToAmt = 0 or ISNULL(NULLIF([CreditAmtLCY],0),[CreditAmtFCY]) <=  @ToAmt)
	   END
ELSE IF(@TransactionType = 'CreditAccount')
	BEGIN
	SELECT	[ID]
      ,[Status]
      ,[ClearingID]
      ,[DebitCurrency]
      ,[DebitAccount]
      ,[DebitAmtLCY]
      ,[DebitAmtFCY]
      ,[DealRate]
      ,[TempAmt]
      ,[BOName]
      ,[CreditCurrency]
      ,[CreditAcctID]
      ,[CreditAcctName]
      ,[CreditAmtLCY]
      ,[CreditAmtFCY]
      ,ISNULL(nullIF([FOName],''),[FOName2]) AS FOName
      ,[FOName2] ,'CreditAccount'  as tu
	  FROM [dbo].[BINWARD_PROC_CRE_ACCT] WHERE  
	  (@BOName is null or @BOName='' or [BOName] like N'%'+@BOName+'%') AND
	   (@FOName is null or @FOName='' or ISNULL(NULLIF([FOName],''),[FOName2]) like N'%'+@FOName+'%') AND
	   (@FOLegalID is null or @FOLegalID='' or [LegalID] like N'%'+@FOLegalID+'%') AND
	   (@Currency is null or @Currency='' or [CreditCurrency] like N'%'+@Currency+'%') AND
	   (@ID is null or @ID='' or ID like N'%'+@ID+'%') AND
	   (@FromAmt = 0 or @FromAmt <= ISNULL(NULLIF([CreditAmtLCY],0),[CreditAmtFCY])) AND
	   (@ToAmt = 0 or ISNULL(NULLIF([CreditAmtLCY],0),[CreditAmtFCY]) <=  @ToAmt)
	END


GO


