USE [bisolutions_vvcb]
GO
/****** Object:  StoredProcedure [dbo].[BCASHWITHRAWAL_UpdateStatus]    Script Date: 24/11/2014 11:39:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



						
ALTER PROCEDURE [dbo].[BCASHWITHRAWAL_UpdateStatus]
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
			update BCASHWITHRAWAL set Status = @Status, AuthorizedBy=@UserId,AuthorizedDate=GETDATE()
			where Code = @Code
			--Khi AUT thi update vao openAcc
			declare @customerAccountId nvarchar(20) = (select CustomerAccount from BCASHWITHRAWAL where Code = @Code)
			declare @Amount numeric(18, 4) = (select Amount from BCASHWITHRAWAL where Code = @Code)
			declare @CashAccount nvarchar(20) = (select CashAccount from BCASHWITHRAWAL where Code = @Code)
			declare @AmountPaid numeric(18, 4) = (select AmountPaid from BCASHWITHRAWAL where Code = @Code)

			if @AccountType = '1' --openaccount
			begin
				update BOPENACCOUNT set ActualBallance= ISNULL(ActualBallance, 0)-@Amount,
										ClearedBallance=ISNULL(ClearedBallance,0)-@Amount,
										WorkingAmount=ISNULL(WorkingAmount,0)-@Amount,
										UpdatedBy=@UserId,
										UpdatedDate=GETDATE()
				where AccountCode = @customerAccountId

				--Neu cashAccount la openaccount thi cong tien
				if exists ( select ID from BOPENACCOUNT where ID = @CashAccount)
				begin
					update BOPENACCOUNT set ActualBallance= ISNULL(ActualBallance, 0) + @AmountPaid,
											ClearedBallance=ISNULL(ClearedBallance,0)+@AmountPaid,
											WorkingAmount=ISNULL(WorkingAmount,0)+@AmountPaid,
											UpdatedBy=@UserId,
											UpdatedDate=GETDATE()
					where ID = @CashAccount
				end 
			end 

			if @AccountType = '2' --arrear
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_ARREAR set AZPrincipal= ISNULL(AZPrincipal, 0)-@Amount,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId

				--Neu cashAccount la openaccount thi tru tien
				if exists ( select RefID from BSAVING_ACC_ARREAR where RefID = @CashAccount)
				begin
					update BSAVING_ACC_ARREAR set AZPrincipal= ISNULL(AZPrincipal, 0) + @AmountPaid,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
					where RefID = @CashAccount
				end 
			end

			if @AccountType = '3' --periolic
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_PERIODIC set AZPrincipal= ISNULL(AZPrincipal, 0)-@Amount,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId

				--Neu cashAccount la openaccount thi tru tien
				if exists ( select RefID from BSAVING_ACC_ARREAR where RefID = @CashAccount)
				begin
					update BSAVING_ACC_PERIODIC set AZPrincipal= @AmountPaid+ISNULL(AZPrincipal, 0),
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
					where RefID = @CashAccount
				end 
			end

			if @AccountType = '4' --discounted
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_DISCOUNTED set TDAmmount= ISNULL(TDAmmount, 0)-@Amount,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId

				--Neu cashAccount la openaccount thi tru tien
				if exists ( select RefID from BSAVING_ACC_ARREAR where RefID = @CashAccount)
				begin
					update BSAVING_ACC_DISCOUNTED set TDAmmount= @AmountPaid+ISNULL(TDAmmount, 0),
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
					where RefID = @CashAccount
				end 
			end

			if @AccountType = '5' --Loan Account
			begin
				update BLOANWORKINGACCOUNTS set ActualBallance= ISNULL(ActualBallance, 0)-@Amount,
										ClearedBallance=ISNULL(ClearedBallance,0)-@Amount,
										WorkingAmount=ISNULL(WorkingAmount,0)-@Amount
				where ID = @customerAccountId

				--Neu cashAccount la openaccount thi cong tien
				if exists ( select ID from BOPENACCOUNT where ID = @CashAccount)
				begin
					update BLOANWORKINGACCOUNTS set ActualBallance= ISNULL(ActualBallance, 0) + @AmountPaid,
											ClearedBallance=ISNULL(ClearedBallance,0)+@AmountPaid,
											WorkingAmount=ISNULL(WorkingAmount,0)+@AmountPaid
					where ID = @CashAccount
				end 
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
		update BCASHWITHRAWAL set Status = @Status
		where Code = @Code
	end
END





