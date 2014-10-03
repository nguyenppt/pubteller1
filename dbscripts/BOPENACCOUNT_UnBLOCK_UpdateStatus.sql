USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_UnBLOCK_UpdateStatus]    Script Date: 03/10/2014 9:12:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dbo].[BOPENACCOUNT_UnBLOCK_UpdateStatus]
	@Status varchar(50),
	@Code varchar(50),
	@UserId varchar(10),
	@BlockAccount_temp bit
AS
BEGIN

	update BOPENACCOUNT set [UnBlock_Status] = @Status,UpdatedBy=@UserId,UpdatedDate=GETDATE(), UnBlockAccount_temp = @BlockAccount_temp
		where AccountCode = @Code

	if @Status = 'AUT'
		begin
		BEGIN TRANSACTION
		BEGIN TRY
				update BOPENACCOUNT 
				set AccountStatus='OPEN',  
					workingamount=workingamount + LockedAmount,
					LockedAmount=0, 
					Block_Amount=null,
					Block_FromDate=null,
					Block_ToDate=null,
					Block_Description=null,
					Block_Status=null,
					AuthorizedBy=@UserId,
					AuthorizedDate=GETDATE(),
					BlockAccount = UnBlockAccount_temp,
					UnBlockAccount_temp = '1'
				where AccountCode = @Code
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK
			DECLARE @ErrorMessage VARCHAR(2000)
		   SELECT @ErrorMessage = 'Lỗi: ' + ERROR_MESSAGE()
		   RAISERROR(@ErrorMessage, 16, 1)
		END CATCH
		end
END






GO


