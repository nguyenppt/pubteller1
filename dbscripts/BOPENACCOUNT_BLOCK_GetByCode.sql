USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_BLOCK_GetByCode]    Script Date: 03/10/2014 9:12:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dbo].[BOPENACCOUNT_BLOCK_GetByCode]
	@Code nvarchar(20)
AS
BEGIN
	select ID, AccountCode, CustomerID, CustomerType, CustomerName, CategoryID, CategoryName, Currency, AccountTitle,  
                         WorkingAmount, Block_Amount, Block_FromDate, Block_ToDate, Block_Description,Block_Status, BlockAccount
	 from dbo.BOPENACCOUNT
	where AccountCode =@Code
END







GO


