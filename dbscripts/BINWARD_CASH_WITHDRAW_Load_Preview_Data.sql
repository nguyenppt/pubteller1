
/****** Object:  StoredProcedure [dbo].[BINWARD_CASH_WITHDRAW_Load_Preview_Data]    Script Date: 29/10/2014 5:26:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BINWARD_CASH_WITHDRAW_Load_Preview_Data](@ID nvarchar(20), @GetFor nvarchar(50))
as
IF @GetFor = 'CashWithdraw'
SELECT [ID]
      ,[Status]
      ,[ClearingID]
      ,[DebitCurrency]
      ,[DebitAccount]
      ,convert(nvarchar,(convert(money,[DebitAmtLCY])),1) as DebitAmtLCY
      ,convert(nvarchar,(convert(money,[DebitAmtFCY])),1) as DebitAmtFCY
      ,convert(nvarchar,(convert(money,[CreditAmtLCY])),1) as CreditAmtLCY
      ,convert(nvarchar,(convert(money,[CreditAmtFCY])),1) as CreditAmtFCY
      
      ,[DealRate]
      ,[CreditAcctID]
      ,[CreditAcctName]
      ,[CreditCurrency]
      ,[BOName]
      ,[FOName] ,[IdentityCard]
      ,[IssueDate]
      ,[IssuePlace]
      ,[Telephone]
      ,[Narrative1]
      ,[Narrative2]FROM [dbo].[BINWARD_CASH_WITHDRAW] WHERE ID= @ID
ELSE IF @GetFor='CreditAcct'
SELECT [ID]
      ,[Status]
      ,[ClearingID]
      ,[DebitCurrency]
      ,[DebitAccount]
      , convert(nvarchar,(convert(money,[DebitAmtLCY])),1) as DebitAmtLCY
      , convert(nvarchar,(convert(money,[DebitAmtFCY])),1) as DebitAmtFCY
      
      ,[DealRate]
      ,[TempAmt]
      ,[BOName]
      ,[CreditCurrency]
      ,[CreditAcctID]
      ,[CreditAcctName]
      , convert(nvarchar,(convert(money,[CreditAmtLCY])),1) as CreditAmtLCY
      , convert(nvarchar,(convert(money,[CreditAmtFCY])),1) as CreditAmtFCY
      ,[FOName]
      ,[FOName2]
      ,[LegalID]
      ,[IssueDate]
      ,[Telephone]
      ,[IssuePlace]
      ,[Narrative]
      ,[Narrative2] FROM [dbo].[BINWARD_PROC_CRE_ACCT] WHERE ID = @ID
GO


