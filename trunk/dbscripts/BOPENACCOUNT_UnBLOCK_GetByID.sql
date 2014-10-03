USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_UnBLOCK_GetByID]    Script Date: 03/10/2014 9:12:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dbo].[BOPENACCOUNT_UnBLOCK_GetByID]
	@ID int
AS
BEGIN
	select ID, AccountCode, CustomerID, CustomerType, CustomerName, CategoryID, CategoryName, Currency, AccountTitle,  
                         WorkingAmount, Block_Amount, Block_FromDate, Block_ToDate, Block_Description,UnBlock_Status, [BlockAccount]
	 from dbo.BOPENACCOUNT
	where ID =@ID and AccountStatus='LOCKED'
END







GO


