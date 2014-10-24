USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BINWARD_CASH_WITHDRAW_Insert]    Script Date: 24/10/2014 9:44:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BINWARD_CASH_WITHDRAW_Insert](@ID nvarchar(20),@Status nvarchar(20),@ClearingID nvarchar(50),@DebitCurrency nvarchar(20)
,@DebitAccount nvarchar(50),@DebitAmtLCY decimal(19,5),@DebitAmtFCY decimal(19,5),@DealRate decimal(19,5),@CreditAcctID nvarchar(20),@CreditAcctName nvarchar(250)
      ,@CreditCurrency nvarchar(20),@CreditAmtLCY decimal(19,5),@CreditAmtFCY decimal(19,5),@BOName nvarchar(250),@FOName nvarchar(250),@IdentityCard nvarchar(50)
      ,@IssueDate datetime,@IssuePlace nvarchar(250),@Telephone nvarchar(50),@Narrative1 nvarchar(250),@Narrative2 nvarchar(250), @CreatedUser nvarchar(50))
AS
IF EXISTS (SELECT ID FROM [dbo].[BINWARD_CASH_WITHDRAW] WHERE ID = @ID)
UPDATE [dbo].[BINWARD_CASH_WITHDRAW] SET [ID] = @ID
      ,[Status] = @Status,[ClearingID] = @ClearingID,[DebitCurrency] = @DebitCurrency,[DebitAccount] = @DebitAccount,[DebitAmtLCY] = @DebitAmtLCY
      ,[DebitAmtFCY] = @DebitAmtFCY,[DealRate] = @DealRate,[CreditAcctID] = @CreditAcctID,[CreditAcctName] = @CreditAcctName,[CreditCurrency] = @CreditCurrency
      ,[CreditAmtLCY] = @CreditAmtLCY,[CreditAmtFCY] = @CreditAmtFCY,[BOName] = @BOName,[FOName] = @FOName,[IdentityCard] = @IdentityCard,[IssueDate] = @IssueDate
      ,[IssuePlace] = @IssuePlace,[Telephone] = @Telephone,[Narrative1] = @Narrative1,[Narrative2] = @Narrative2 , CreatedUser = @CreatedUser WHERE ID = @ID
ELSE INSERT INTO [dbo].[BINWARD_CASH_WITHDRAW]( [ID],[Status],[ClearingID],[DebitCurrency],[DebitAccount],[DebitAmtLCY],[DebitAmtFCY],[DealRate],[CreditAcctID]
      ,[CreditAcctName],[CreditCurrency],[CreditAmtLCY],[CreditAmtFCY],[BOName],[FOName],[IdentityCard]      ,[IssueDate],[IssuePlace],[Telephone],[Narrative1]
      ,[Narrative2],CreatedUser)
	  VALUES (@ID,@Status,@ClearingID,@DebitCurrency,@DebitAccount,@DebitAmtLCY,@DebitAmtFCY,@DealRate,@CreditAcctID,@CreditAcctName,@CreditCurrency,@CreditAmtLCY
      ,@CreditAmtFCY,@BOName,@FOName,@IdentityCard,@IssueDate,@IssuePlace,@Telephone,@Narrative1,@Narrative2 ,@CreatedUser)
GO


