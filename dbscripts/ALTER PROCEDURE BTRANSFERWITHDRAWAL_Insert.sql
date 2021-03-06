USE [bisolutions_vvcb]
GO
/****** Object:  StoredProcedure [dbo].[BTRANSFERWITHDRAWAL_Insert]    Script Date: 26/11/2014 6:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[BTRANSFERWITHDRAWAL_Insert]
	@AccountType nvarchar(5),
	@Code nvarchar(20),
	@DebitAccount nvarchar(20),
	@DebitAmount numeric(18, 4),
	@CustBallance numeric(18, 4),
	@NewCustBallance numeric(18, 4),
	@DebitValueDate Date = Null,
	@CreditAccount nvarchar(20),
	@AmountCreditForCustomer numeric(18, 4),
	@DealRate numeric(18, 5),
	@CreditValueDate Date = Null,
	@WaiveCharges varchar(10),
	@Narrative nvarchar(250),
	@UserId int, @CustomerIDDebit nvarchar(20), @CustomerNameDebit nvarchar(250), @CustomerIDCredit nvarchar(20), @CustomerNameCredit nvarchar(250),
	@DebitCurrency nvarchar(5), @CreditCurrency nvarchar(5), @Teller nvarchar(50), @Credit_OldBalance decimal(18,5), @Credit_NewBalance decimal(18,5)
AS
BEGIN
	--update binh thuong hoac neu la loai 2 thi ko cho insert chi update tk cu
	if not exists(select Code from dbo.BTRANSFERWITHDRAWAL where Code = @Code)
	begin
		INSERT INTO dbo.BTRANSFERWITHDRAWAL
			   (AccountType,Code, DebitAccount, DebitAmount, CustBallance, NewCustBallance, DebitValueDate, CreditAccount, AmountCreditForCustomer, DealRate, CreditValueDate, WaiveCharges, Narrative, 
						 CreateBy, 
                         CreateDate, 
						 Status, CustomerIDDebit, CustomerNameDebit, CustomerIDCredit, CustomerNameCredit, DebitCurrency, CreditCurrency, Teller, Credit_OldBalance
						 , Credit_NewBalance
			   )
		 VALUES
			   (@AccountType,@Code, @DebitAccount, @DebitAmount, @CustBallance, @NewCustBallance, @DebitValueDate, @CreditAccount, @AmountCreditForCustomer, 
				 @DealRate, @CreditValueDate, @WaiveCharges, @Narrative
				, @UserId   
				, getdate()
				, 'UNA', @CustomerIDDebit, @CustomerNameDebit, @CustomerIDCredit, @CustomerNameCredit, @DebitCurrency, @CreditCurrency, @Teller, @Credit_OldBalance
				, @Credit_NewBalance
			)
	end
	else 
	begin
		UPDATE dbo.BTRANSFERWITHDRAWAL
		   SET 
			AccountType=@AccountType
		   , Code=@Code
		   , DebitAccount=@DebitAccount
		   , DebitAmount=@DebitAmount
		   , CustBallance=@CustBallance
		   , NewCustBallance=@NewCustBallance
		   , DebitValueDate=@DebitValueDate
		   , CreditAccount=@CreditAccount
		   , AmountCreditForCustomer=@AmountCreditForCustomer
		   , DealRate=@DealRate
		   , CreditValueDate=@CreditValueDate
		   , WaiveCharges=@WaiveCharges
		   , Narrative=@Narrative
			,UpdatedDate = getdate()  
			,UpdatedBy = @UserId 
			,status='UNA', CustomerIDDebit = @CustomerIDDebit, CustomerNameDebit=@CustomerNameDebit, CustomerIDCredit=@CustomerIDCredit, 
			CustomerNameCredit = @CustomerNameCredit, DebitCurrency = @DebitCurrency, CreditCurrency = @CreditCurrency, Teller = @Teller
			,Credit_OldBalance=  @Credit_OldBalance , Credit_NewBalance = @Credit_NewBalance
		 WHERE Code = @Code
	end
END





