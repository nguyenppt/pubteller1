USE [bisolutions_vvcb]
GO
/****** Object:  StoredProcedure [dbo].[BCASHDEPOSIT_UpdateStatus]    Script Date: 24/11/2014 11:00:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[BCASHDEPOSIT_UpdateStatus]
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
			update BCASHDEPOSIT set Status = @Status, AuthorizedBy=@UserId,AuthorizedDate=GETDATE()
			where Code = @Code

			declare @customerAccountId nvarchar(20) = (select CustomerAccount from BCASHDEPOSIT where Code = @Code)

			declare @AmtPaidToCust numeric(18, 4) = (select AmtPaidToCust from BCASHDEPOSIT where Code = @Code)

			declare @AmountDeposited numeric(18, 4) = (select AmountDeposited from BCASHDEPOSIT where Code = @Code)

			declare @CashAccount nvarchar(20) = (select CashAccount from BCASHDEPOSIT where Code = @Code)

			if @AccountType = '1' --non term
			begin
			
				declare @WorkingAmount numeric(18, 4) 
				set @WorkingAmount = (select WorkingAmount from bopenaccount where AccountCode = @customerAccountId)
				--neu nap moi hoac rut het tien nap lai
				if isnull(@WorkingAmount,0) = 0
				begin
					--update lai ngay tinh lai
					declare @interestID bigint
					set @interestID = (select max(id) from bopenaccount_interest where AccountCode=@customerAccountId)

					if(@interestID > 0)
						begin
							update bopenaccount_interest set ValueDate = convert(varchar(10), GETDATE(),111) where id = @interestID
						end
					else
						begin
							declare @interestRateVND numeric(18,5)
							set @interestRateVND = (select VND from BINTEREST_RATE where term = 'NON')

							declare @interestRateUSD numeric(18,5)
							set @interestRateUSD = (select USD from BINTEREST_RATE where term = 'NON')

							insert BOPENACCOUNT_INTEREST(AccountID,AccountCode,AccountTitle,CustomerType,CustomerID,CustomerName,CategoryID,Currency,WorkingAmount,ValueDate,InterestRate,InterestAmount)
							select a.CustomerAccount, b.AccountCode,b.Accounttitle ,b.CustomerType,b.CustomerID,b.CustomerName,b.CategoryID,b.Currency,a.AmtPaidToCust, convert(date,convert(varchar(10), a.CreateDate, 111))
								, convert(numeric(18, 5), case when b.currency = 'VND' then @interestRateVND else @interestRateUSD end) as InterestRate
								, 0 as InterestAmount
							from BCASHDEPOSIT a
								join bopenaccount b on a.customeraccount = b.AccountCode

							where Code = @Code
						end
				end

				--Khi AUT thi update vao openAcc
				update BOPENACCOUNT set ActualBallance= @AmtPaidToCust+ISNULL(ActualBallance, 0),
										ClearedBallance=@AmtPaidToCust+ISNULL(ClearedBallance,0),
										WorkingAmount=@AmtPaidToCust+ISNULL(WorkingAmount,0),
										UpdatedBy=@UserId,
										UpdatedDate=GETDATE()
				where AccountCode = @customerAccountId

				--Neu cashAccount la openaccount thi tru tien
				if exists ( select ID from BOPENACCOUNT where ID = @CashAccount)
				begin
					update BOPENACCOUNT set ActualBallance= ISNULL(ActualBallance, 0) - @AmountDeposited,
											ClearedBallance=ISNULL(ClearedBallance,0)-@AmountDeposited,
											WorkingAmount=ISNULL(WorkingAmount,0)-@AmountDeposited,
											UpdatedBy=@UserId,
											UpdatedDate=GETDATE()
					where ID = @CashAccount
				end 
			end

			if @AccountType = '2' --arrear
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_ARREAR set AZPrincipal= @AmtPaidToCust+ISNULL(AZPrincipal, 0),
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId

				--Neu cashAccount la openaccount thi tru tien
				if exists ( select RefID from BSAVING_ACC_ARREAR where RefID = @CashAccount)
				begin
					update BSAVING_ACC_ARREAR set AZPrincipal= ISNULL(AZPrincipal, 0)-@AmountDeposited,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
					where RefID = @CashAccount
				end 
			end

			if @AccountType = '3' --periolic
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_PERIODIC set AZPrincipal= @AmtPaidToCust+ISNULL(AZPrincipal, 0),
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId

				--Neu cashAccount la openaccount thi tru tien
				if exists ( select RefID from BSAVING_ACC_ARREAR where RefID = @CashAccount)
				begin
					update BSAVING_ACC_PERIODIC set AZPrincipal= ISNULL(AZPrincipal, 0)-@AmountDeposited,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
					where RefID = @CashAccount
				end 
			end

			if @AccountType = '4' --discounted
			begin
				--Khi AUT thi update vao openAcc
				update BSAVING_ACC_DISCOUNTED set TDAmmount= @AmtPaidToCust+ISNULL(TDAmmount, 0),
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
				where RefID = @customerAccountId

				--Neu cashAccount la openaccount thi tru tien
				if exists ( select RefID from BSAVING_ACC_ARREAR where RefID = @CashAccount)
				begin
					update BSAVING_ACC_DISCOUNTED set TDAmmount= ISNULL(TDAmmount, 0)-@AmountDeposited,
												UpdatedBy=@UserId,
												UpdatedDate=GETDATE()
					where RefID = @CashAccount
				end 
			end

			if @AccountType = '5' --loan working account
			begin
				--Khi AUT thi update vao openAcc
				update BLOANWORKINGACCOUNTS set ActualBallance= @AmtPaidToCust+ISNULL(ActualBallance, 0),
												ClearedBallance= @AmtPaidToCust+ISNULL(ClearedBallance, 0),
												WorkingAmount= @AmtPaidToCust+ISNULL(WorkingAmount, 0)
				
				where Id = @customerAccountId

				--Neu cashAccount la openaccount thi tru tien
				if exists ( select Id from BLOANWORKINGACCOUNTS where Id = @CashAccount)
				begin
					update BLOANWORKINGACCOUNTS set ActualBallance= ISNULL(ActualBallance, 0)-@AmountDeposited,
													ClearedBallance= ISNULL(ClearedBallance, 0)-@AmountDeposited,
													WorkingAmount= ISNULL(WorkingAmount, 0)-@AmountDeposited
					where Id = @CashAccount
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
		update BCASHDEPOSIT set Status = @Status
		where Code = @Code
	end
END




