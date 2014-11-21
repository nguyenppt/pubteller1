USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCASHWITHRAWAL_Insert]    Script Date: 21/11/2014 11:05:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[BCASHWITHRAWAL_Insert]
	@AccountType nvarchar(5),
	@Code nvarchar(20),
	@CustomerAccount nvarchar(20),
	@AmountPaid numeric(18, 4),
	@CustBallance numeric(18, 4),
	@NewCustBallance numeric(18, 4),
	@CurrencyPaid nvarchar(10),
	@Amount numeric(18, 4),
	@DealRate numeric(18, 5),
	@WaiveCharges varchar(10),
	@Narrative nvarchar(250),
	@PrintLnNoOfPS varchar(10),
	@UserId int,
	@TellerName nvarchar(250),
	@CashAccount nvarchar(10), @CustomerID nvarchar(20), @CustomerName nvarchar(250), @Currency nvarchar(5)
AS
BEGIN
	--update binh thuong hoac neu la loai 2 thi ko cho insert chi update tk cu
	if not exists(select Code from dbo.BCASHWITHRAWAL where Code = @Code)
	begin
		INSERT INTO dbo.BCASHWITHRAWAL
			   (AccountType,Code, CustomerAccount, AmountPaid, CustBallance, NewCustBallance, CurrencyPaid, Amount, DealRate, WaiveCharges, Narrative, 
                         PrintLnNoOfPS,TellerName,CashAccount,
						 CreateBy, 
                         CreateDate, 
						 Status, CustomerID, CustomerName, Currency
			   )
		 VALUES
			   (@AccountType,@Code, @CustomerAccount, @AmountPaid, @CustBallance, @NewCustBallance, @CurrencyPaid, @Amount, 
				@DealRate, @WaiveCharges, @Narrative, @PrintLnNoOfPS,@TellerName,@CashAccount
				, @UserId   
				, getdate()
				, 'UNA', @CustomerID , @CustomerName, @Currency
			)
	end
	else 
	begin
		UPDATE dbo.BCASHWITHRAWAL
		   SET 
			AccountType=@AccountType
		   , Code=@Code
		   , CustomerAccount=@CustomerAccount
		   , AmountPaid=@AmountPaid
		   , CustBallance=@CustBallance
		   , NewCustBallance=@NewCustBallance
		   , CurrencyPaid=@CurrencyPaid
		   , Amount=@Amount
		   , DealRate=@DealRate
		   , WaiveCharges=@WaiveCharges
		   , Narrative=@Narrative
		   , PrintLnNoOfPS=@PrintLnNoOfPS
			,UpdatedDate = getdate()  
			,UpdatedBy = @UserId 
			,TellerName = @TellerName
			,CashAccount=@CashAccount
			,status='UNA', CustomerID = @CustomerID, CustomerName = @CustomerName, Currency = @Currency
		 WHERE Code = @Code
	end
END






GO


