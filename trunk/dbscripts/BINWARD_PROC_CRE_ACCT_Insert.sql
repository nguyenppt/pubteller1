USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BINWARD_PROC_CRE_ACCT_Insert]    Script Date: 29/10/2014 5:27:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BINWARD_PROC_CRE_ACCT_Insert](@ID nvarchar(20), @Status nvarchar(20),@ClearingID nvarchar(20),@DebitCurrency nvarchar(20),@DebitAccount nvarchar(20)
      ,@DebitAmtLCY decimal(18,5),@DebitAmtFCY decimal(18,5),@DealRate decimal(18,5),@TempAmt decimal(18,5),@BOName nvarchar(250),@CreditCurrency nvarchar(20)
      ,@CreditAcctID nvarchar(20),@CreditAcctName nvarchar(250),@CreditAmtLCY decimal(18,5),@CreditAmtFCY decimal(18,5),@FOName nvarchar(250),@FOName2 nvarchar(250)
      ,@LegalID nvarchar(50),@IssueDate datetime,@Telephone nvarchar(50),@IssuePlace nvarchar(250),@Narrative nvarchar(250),@Narrative2 nvarchar(250))
as
if EXISTS (SELECT ID FROM [dbo].[BINWARD_PROC_CRE_ACCT] WHERE ID = @ID)
UPDATE [dbo].[BINWARD_PROC_CRE_ACCT] SET [ID] = @ID ,[Status] = @Status,[ClearingID] = @ClearingID,[DebitCurrency] = @DebitCurrency,[DebitAccount] = @DebitAccount
      ,[DebitAmtLCY] = @DebitAmtLCY,[DebitAmtFCY] = @DebitAmtFCY,[DealRate] = @DealRate,[TempAmt] = @TempAmt,[BOName] = @BOName,[CreditCurrency] = @CreditCurrency
      ,[CreditAcctID] = @CreditAcctID,[CreditAcctName] = @CreditAcctName,[CreditAmtLCY] = @CreditAmtLCY,[CreditAmtFCY] = @CreditAmtFCY,[FOName] = @FOName
      ,[FOName2] = @FOName2,[LegalID] = @LegalID,[IssueDate] = @IssueDate,[Telephone] = @Telephone,[IssuePlace] = @IssuePlace,[Narrative] = @Narrative
      ,[Narrative2] = @Narrative2 WHERE ID = @ID
ELSE INSERT INTO [dbo].[BINWARD_PROC_CRE_ACCT]([ID],[Status],[ClearingID],[DebitCurrency],[DebitAccount],[DebitAmtLCY],[DebitAmtFCY],[DealRate],[TempAmt]
      ,[BOName],[CreditCurrency],[CreditAcctID],[CreditAcctName],[CreditAmtLCY],[CreditAmtFCY],[FOName],[FOName2],[LegalID],[IssueDate],[Telephone]
      ,[IssuePlace],[Narrative],[Narrative2]) VALUES
	  (@ID,@Status,@ClearingID,@DebitCurrency,@DebitAccount,@DebitAmtLCY,@DebitAmtFCY,@DealRate,@TempAmt,@BOName,@CreditCurrency,@CreditAcctID,@CreditAcctName
      ,@CreditAmtLCY,@CreditAmtFCY,@FOName,@FOName2,@LegalID,@IssueDate,@Telephone,@IssuePlace,@Narrative,@Narrative2)
GO


