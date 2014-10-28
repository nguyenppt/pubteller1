USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[OUTWARD_TRANFER_BY_ACCT_LoadDebitAcct]    Script Date: 28/10/2014 2:12:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OUTWARD_TRANFER_BY_ACCT_LoadDebitAcct](@Currency nvarchar(30))
AS
SELECT [AccountCode], [Currency] +' - '+[AccountCode] as AccountHasName FROM [dbo].[BOPENACCOUNT]
where [AccountStatus]='OPEN' and Status ='AUT' and Currency = @Currency
GO


