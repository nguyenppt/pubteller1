USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOUTWARD_TRANS_BY_ACCT_Update_Status]    Script Date: 28/10/2014 2:14:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BOUTWARD_TRANS_BY_ACCT_Update_Status](@ID nvarchar(30), @Status nvarchar(5), @DebitAcctID nvarchar(30), @Amount decimal(19,5)
, @ChargeAmt decimal(19,5), @ChargeVATAmt decimal(19,5))
AS
IF (@Status ='REV')
UPDATE [dbo].[BOUTWARD_TRANS_BY_ACCT] SET Status= @Status where ID = @ID
ELSE if(@Status ='AUT')
BEGIN
	if( (SELECT [WorkingAmount] FROM [dbo].[BOPENACCOUNT] WHERE @DebitAcctID = [AccountCode]) < (@Amount+@ChargeAmt+@ChargeVATAmt))
	SELECT 'not_enough' as check_amt
	else
	BEGIN
	SELECT 'OK' as check_amt;
	UPDATE [dbo].[BOUTWARD_TRANS_BY_ACCT] SET Status= @Status where ID = @ID;
	UPDATE [dbo].[BOPENACCOUNT] SET [ActualBallance] = [ActualBallance]-(@Amount+@ChargeAmt+@ChargeVATAmt),[ClearedBallance] = [ClearedBallance]-(@Amount+@ChargeAmt+@ChargeVATAmt),[WorkingAmount] = [WorkingAmount]-(@Amount+@ChargeAmt+@ChargeVATAmt) WHERE @DebitAcctID = [AccountCode]
	END
END
GO


