USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[B_BINWARD_CASH_WITHDRAW_Load_ID_Info]    Script Date: 24/10/2014 9:42:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[B_BINWARD_CASH_WITHDRAW_Load_ID_Info](@ID nvarchar(20))
AS
SELECT ID, [Currency], [CreditAcctID], [SendingName], [ReceivingName], [IdentityCard], 
[IssueDate] ,[IssuePlace], Amount FROM [dbo].[BOUTWARD_TRANS_BY_CASH] where ID  = @ID
GO


