USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_UnBLOCK_GetByCode]    Script Date: 03/10/2014 9:13:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER PROCEDURE [dbo].[BOPENACCOUNT_UnBLOCK_GetByCode]
	@Code nvarchar(20)
AS
BEGIN
	select ID, AccountCode, CustomerID, CustomerType, CustomerName, CategoryID, CategoryName, Currency, AccountTitle,  
                         WorkingAmount, Block_Amount, Block_FromDate, Block_ToDate, Block_Description,UnBlock_Status, blockAccount
	 from dbo.BOPENACCOUNT
	where AccountCode =@Code and AccountStatus='LOCKED'
END








GO


