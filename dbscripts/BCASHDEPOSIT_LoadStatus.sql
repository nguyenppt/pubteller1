USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCASHDEPOSIT_LoadStatus]    Script Date: 23/10/2014 10:51:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BCASHDEPOSIT_LoadStatus](@RefID nvarchar(20), @Type nvarchar(50))
as
if(@Type = 'CashDeposit')
	select Status from [dbo].[BCASHDEPOSIT] where @RefID = Code
else if (@Type = 'CashWithdrawal')
	select Status from [dbo].[BCASHWITHRAWAL] where @RefID = Code
	else
	select Status from [dbo].[BTRANSFERWITHDRAWAL] where @RefID = Code


GO


