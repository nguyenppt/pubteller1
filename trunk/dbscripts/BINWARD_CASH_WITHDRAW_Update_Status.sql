USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BINWARD_CASH_WITHDRAW_Update_Status]    Script Date: 24/10/2014 9:45:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BINWARD_CASH_WITHDRAW_Update_Status](@ID nvarchar(20), @Status nvarchar(5), @UpdateFor nvarchar(50))
as
if @UpdateFor = 'CashWithdraw'
Update [dbo].[BINWARD_CASH_WITHDRAW] set Status = @Status where ID= @ID
GO


