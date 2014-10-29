USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BINWARD_CASH_WITHDRAW_Update_Status]    Script Date: 29/10/2014 5:24:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BINWARD_CASH_WITHDRAW_Update_Status](@ID nvarchar(20), @Status nvarchar(5), @UpdateFor nvarchar(50))
as
if @UpdateFor = 'CashWithdraw'
	Update [dbo].[BINWARD_CASH_WITHDRAW] set Status = @Status where ID= @ID
ELSE if @UpdateFor = 'CreditAcct'
	Update [dbo].[BINWARD_PROC_CRE_ACCT] set Status = @Status where ID= @ID
	
GO


