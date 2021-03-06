USE [bisolutions_vvcb]
GO
/****** Object:  StoredProcedure [dbo].[BTRANSFERWITHDRAWAL_UpdateStatus]    Script Date: 24/11/2014 12:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[BTRANSFERWITHDRAWAL_UpdateStatus]
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
			update BTRANSFERWITHDRAWAL set Status = @Status, AuthorizedBy=@UserId,AuthorizedDate=GETDATE()
			where Code = @Code

			declare @DebitAccountId nvarchar(20) = (select DebitAccount from BTRANSFERWITHDRAWAL where Code = @Code)
			declare @DebitAmount numeric(18, 4) = (select DebitAmount from BTRANSFERWITHDRAWAL where Code = @Code)
			declare @CreditAccountId nvarchar(20) = (select CreditAccount from BTRANSFERWITHDRAWAL where Code = @Code)
			declare @CreditAmount numeric(18, 4) = (select AmountCreditForCustomer from BTRANSFERWITHDRAWAL where Code = @Code)

			if @AccountType ='1'
			begin
				--Khi AUT thi tru working amount vao debitaccount vao openAcc
				update BOPENACCOUNT set ActualBallance= ISNULL(ActualBallance, 0) - @DebitAmount,
										ClearedBallance=ISNULL(ClearedBallance,0) - @DebitAmount,
										WorkingAmount=ISNULL(WorkingAmount,0) - @DebitAmount,
										UpdatedBy=@UserId,
										UpdatedDate=GETDATE()
				where AccountCode = @DebitAccountId

				--Khi AUT thi tang working amount vao creditaccount vao openAcc
				if exists (select ID from BOPENACCOUNT where AccountCode = @CreditAccountId)
				begin
					update BOPENACCOUNT set ActualBallance= @CreditAmount+ISNULL(ActualBallance, 0),
											ClearedBallance=@CreditAmount+ISNULL(ClearedBallance,0),
											WorkingAmount=@CreditAmount+ISNULL(WorkingAmount,0),
											UpdatedBy=@UserId,
											UpdatedDate=GETDATE()
					where AccountCode = @CreditAccountId
				end
			end

			if @AccountType ='2'
			begin
				--Khi AUT thi tru working amount vao debitaccount vao openAcc
				update BSAVING_ACC_ARREAR set AZPrincipal= ISNULL(AZPrincipal, 0) - @DebitAmount,
										UpdatedBy=@UserId,
										UpdatedDate=GETDATE()
				where RefID = @DebitAccountId

				--Khi AUT thi tang working amount vao creditaccount vao openAcc
				if exists ( select RefID from BSAVING_ACC_ARREAR where RefID = @CreditAccountId)
				begin
					update BSAVING_ACC_ARREAR set AZPrincipal= @CreditAmount+ISNULL(AZPrincipal, 0),
											UpdatedBy=@UserId,
											UpdatedDate=GETDATE()
					where RefID = @CreditAccountId
				end
			end

			if @AccountType ='3'
			begin
				--Khi AUT thi tru working amount vao debitaccount vao openAcc
				update BSAVING_ACC_PERIODIC set AZPrincipal= ISNULL(AZPrincipal, 0) - @DebitAmount,
										UpdatedBy=@UserId,
										UpdatedDate=GETDATE()
				where RefID = @DebitAccountId

				--Khi AUT thi tang working amount vao creditaccount vao openAcc
				if exists ( select RefID from BSAVING_ACC_PERIODIC where RefID = @CreditAccountId)
				begin
					update BSAVING_ACC_PERIODIC set AZPrincipal= @CreditAmount+ISNULL(AZPrincipal, 0),
											UpdatedBy=@UserId,
											UpdatedDate=GETDATE()
					where RefID = @CreditAccountId
				end
			end

			if @AccountType ='4'
			begin
				--Khi AUT thi tru working amount vao debitaccount vao openAcc
				update BSAVING_ACC_DISCOUNTED set TDAmmount= ISNULL(TDAmmount, 0) - @DebitAmount,
										UpdatedBy=@UserId,
										UpdatedDate=GETDATE()
				where RefID = @DebitAccountId

				--Khi AUT thi tang working amount vao creditaccount vao openAcc
				if exists ( select RefID from BSAVING_ACC_DISCOUNTED where RefID = @CreditAccountId)
				begin
					update BSAVING_ACC_DISCOUNTED set TDAmmount= @CreditAmount+ISNULL(TDAmmount, 0),
											UpdatedBy=@UserId,
											UpdatedDate=GETDATE()
					where RefID = @CreditAccountId
				end
			end

			if @AccountType ='5'
			begin
				--Khi AUT thi tru working amount vao debitaccount vao openAcc
				update BLOANWORKINGACCOUNTS set ActualBallance= ISNULL(ActualBallance, 0) - @DebitAmount,
										ClearedBallance=ISNULL(ClearedBallance,0) - @DebitAmount,
										WorkingAmount=ISNULL(WorkingAmount,0) - @DebitAmount
				where ID = @DebitAccountId

				--Khi AUT thi tang working amount vao creditaccount vao openAcc
				if exists (select ID from BOPENACCOUNT where AccountCode = @CreditAccountId)
				begin
					update BLOANWORKINGACCOUNTS set ActualBallance= @CreditAmount+ISNULL(ActualBallance, 0),
											ClearedBallance=@CreditAmount+ISNULL(ClearedBallance,0),
											WorkingAmount=@CreditAmount+ISNULL(WorkingAmount,0)
					where ID = @CreditAccountId
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
		update BTRANSFERWITHDRAWAL set Status = @Status
		where Code = @Code
	end
END





