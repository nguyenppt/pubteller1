USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BINWARD_CASH_WITHDRAW_Load_Status]    Script Date: 28/10/2014 2:15:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BINWARD_CASH_WITHDRAW_Load_Status](@ID nvarchar(20), @GetFor nvarchar(50))
AS
IF @GetFor = 'CashWithdraw'
SELECT Status from [dbo].[BINWARD_CASH_WITHDRAW] WHERE ID = @ID
else IF @GetFor='trans_by_acct'
SELECT Status from [dbo].[BOUTWARD_TRANS_BY_ACCT] WHERE ID = @ID

GO


