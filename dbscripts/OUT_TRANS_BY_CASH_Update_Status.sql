
/****** Object:  StoredProcedure [dbo].[OUT_TRANS_BY_CASH_Update_Status]    Script Date: 29/10/2014 3:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[OUT_TRANS_BY_CASH_Update_Status](@Status nvarchar(20),@ID nvarchar(20), @AccountCode nvarchar(30), @Amount decimal(18,5), @Currency nvarchar(5))
AS
if EXISTS (SELECT [AccountCode] FROM [dbo].[BOPENACCOUNT] WHERE Status='AUT' and AccountStatus='OPEN' and [AccountCode] = @AccountCode) --exits acct trong BOPEN thi cong tien, khong thi update binh thuong
	BEGIN
	IF EXISTS (SELECT Currency from [dbo].[BOPENACCOUNT] where Status='AUT' and AccountStatus='OPEN' and [AccountCode] = @AccountCode and Currency = @Currency)
		BEGIN
			update  [dbo].[BOUTWARD_TRANS_BY_CASH] set status = @status WHERE ID = @ID;
			UPDATE [dbo].[BOPENACCOUNT] SET [ActualBallance] = [ActualBallance]+ @Amount ,[ClearedBallance] = [ClearedBallance]+ @Amount, [WorkingAmount] = [WorkingAmount]+@Amount WHERE [AccountCode] = @AccountCode AND Status='AUT' and AccountStatus='OPEN';
		END
	ELSE SELECT Currency from [dbo].[BOPENACCOUNT] where Status='AUT' and AccountStatus='OPEN' and [AccountCode] = @AccountCode
	END
ELSE 
update  [dbo].[BOUTWARD_TRANS_BY_CASH] set status = @status WHERE ID = @ID