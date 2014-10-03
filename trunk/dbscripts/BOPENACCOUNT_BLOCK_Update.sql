USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_BLOCK_Update]    Script Date: 03/10/2014 9:11:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- alter table [dbo].BOPENACCOUNT add BlockAccount bit



ALTER PROCEDURE [dbo].[BOPENACCOUNT_BLOCK_Update]
	@AccountCode [nvarchar](20),
	@Block_Amount [numeric](18,4),
	@Block_FromDate date = null,
	@Block_ToDate date = null,
	@Block_Description [nvarchar](500),
	@BlockAccount bit
AS
BEGIN
		UPDATE [dbo].BOPENACCOUNT
		   SET 
			Block_Amount=@Block_Amount,
			Block_FromDate=@Block_FromDate,
			Block_ToDate=@Block_ToDate,
			Block_Description=@Block_Description,
			Block_status='UNA',
			BlockAccount = @BlockAccount
		 WHERE AccountCode = @AccountCode
END






GO


