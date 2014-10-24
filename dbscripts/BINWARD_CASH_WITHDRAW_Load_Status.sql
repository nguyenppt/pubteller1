USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BINWARD_CASH_WITHDRAW_Load_Status]    Script Date: 24/10/2014 9:46:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BINWARD_CASH_WITHDRAW_Load_Status](@ID nvarchar(20), @GetFor nvarchar(50))
AS
IF @GetFor = 'CashWithdraw'
SELECT Status from [dbo].[BINWARD_CASH_WITHDRAW] WHERE ID = @ID
GO


