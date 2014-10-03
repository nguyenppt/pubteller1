USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESFROMACCOUNT_UpdateStatus]    Script Date: 03/10/2014 1:23:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[BCOLLECTCHARGESFROMACCOUNT_UpdateStatus]
	@AccountType nvarchar(5),
	@Status varchar(50),
	@Code varchar(50),
	@UserId varchar(10)
AS
BEGIN
if @Status = 'AUT'
	begin
		BEGIN TRANSACTION
		BEGIN TRY
			update BCOLLECTCHARGESFROMACCOUNT set Status = @Status, AuthorizedBy=@UserId,AuthorizedDate=GETDATE()
			where Code = @Code

			declare @customerAccountId nvarchar(20) = (select CustomerAccount from BCOLLECTCHARGESFROMACCOUNT where Code = @Code)

			declare @AmtPaidToCust numeric(18, 4) = (select ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) from BCOLLECTCHARGESFROMACCOUNT where Code = @Code)

			if @AccountType = '1' --non term
			begin
				--Khi AUT thi update vao openAcc
				update BOPENACCOUNT set ActualBallance= ISNULL(ActualBallance, 0)-@AmtPaidToCust,
										ClearedBallance=ISNULL(ClearedBallance,0)-@AmtPaidToCust,
										WorkingAmount=ISNULL(WorkingAmount,0)-@AmtPaidToCust,
										UpdatedBy=@UserId,
										UpdatedDate=GETDATE()
				where AccountCode = @customerAccountId
			end

			if @AccountType = '2' --arrear
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_ARREAR set AZPrincipal= ISNULL(AZPrincipal, 0)-@AmtPaidToCust,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId
			end

			if @AccountType = '3' --periolic
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_PERIODIC set AZPrincipal= ISNULL(AZPrincipal, 0)-@AmtPaidToCust,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId
			end

			if @AccountType = '4' --discounted
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_DISCOUNTED set TDAmmount= ISNULL(TDAmmount, 0)-@AmtPaidToCust,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId
			end

			if @AccountType = '5' --loan account
			begin
				--Khi AUT thi update vao openAcc
				update BLOANWORKINGACCOUNTS set ActualBallance= ISNULL(ActualBallance, 0)-@AmtPaidToCust,
										ClearedBallance=ISNULL(ClearedBallance,0)-@AmtPaidToCust,
										WorkingAmount=ISNULL(WorkingAmount,0)-@AmtPaidToCust
				where ID = @customerAccountId
			end
		COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK
			DECLARE @ErrorMessage VARCHAR(2000)
		   SELECT @ErrorMessage = 'Lỗi: ' + ERROR_MESSAGE()
		   RAISERROR(@ErrorMessage, 16, 1)
		END CATCH
	end
else
	begin
		update BCOLLECTCHARGESFROMACCOUNT set Status = @Status
		where Code = @Code
	end
END






GO


