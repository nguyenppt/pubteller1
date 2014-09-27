USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_UpdateStatus]    Script Date: 27/09/2014 8:42:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_UpdateStatus](@ID nvarchar(20),@Status nvarchar(5), @DebitAccountID nvarchar(20), @DebitAmt decimal(19,2),
		@Currency nvarchar(5))
AS 

IF @Status='AUT'
	BEGIN
	UPDATE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT] SET Status = 'AUT' WHERE ID = @ID;
	UPDATE [dbo].[BOPENACCOUNT] SET [WorkingAmount]  = [WorkingAmount]- @DebitAmt WHERE @DebitAccountID = [AccountCode] AND @Currency = Currency
	END
IF  @Status='REV'
	UPDATE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT] SET Status = 'REV' WHERE ID = @ID

GO


