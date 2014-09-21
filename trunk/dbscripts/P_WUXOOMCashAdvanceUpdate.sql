create proc [dbo].[P_WUXOOMCashAdvanceUpdate](
	@Command varchar(10),
	@TTNo varchar(50),
	@CustomerName nvarchar(150),
	@CustomerAddress nvarchar(150),
	@CustomerPassportNo varchar(50),
	@CustomerPassportDateOfIssue varchar(10) ,
	@CustomerPassportPlaceOfIssue varchar(50) ,
	@CustomerPhoneNo varchar(50) ,
	@TellerID varchar(50),
	@DebitCurrency varchar(3),
	@DebitAccount varchar(50),
	@DebitAmtLCY decimal(18, 4),
	@DebitAmtFCY decimal(18, 4),
	@CreditCurrency varchar(3),
	@CrTellerID varchar(50),
	@CreditAccount varchar(50),	
	@DealRate decimal(18, 4) ,
	@AmountPaid decimal(18, 4) ,
	@Narrative nvarchar(200) ,
	@UserExecute varchar(50)
) 
as
begin
	if @Command = 'new'
	begin
		insert into B_WUXOOMCashAdvance(TTNo, CustomerName, CustomerAddress,	CustomerPassportNo,	CustomerPassportDateOfIssue,
			CustomerPassportPlaceOfIssue, CustomerPhoneNo, TellerID, DebitCurrency, DebitAccount, DebitAmtLCY, DebitAmtFCY,
			CreditCurrency, CrTellerID, CreditAccount, DealRate, AmountPaid, Narrative, [Status], UserCreate, DateTimeCreate)
		values(@TTNo, @CustomerName, @CustomerAddress,	@CustomerPassportNo,	@CustomerPassportDateOfIssue,
			@CustomerPassportPlaceOfIssue, @CustomerPhoneNo, @TellerID, @DebitCurrency, @DebitAccount, @DebitAmtLCY, @DebitAmtFCY,
			@CreditCurrency, @CrTellerID, @CreditAccount, @DealRate, @AmountPaid, @Narrative, 'UNA', @UserExecute, getdate())	
	end
	else
	begin
		update B_WUXOOMCashAdvance
		set CustomerName = @CustomerName, CustomerAddress = @CustomerAddress,	CustomerPassportNo = @CustomerPassportNo,	
			CustomerPassportDateOfIssue = @CustomerPassportDateOfIssue, CustomerPassportPlaceOfIssue = @CustomerPassportPlaceOfIssue, 
			CustomerPhoneNo = @CustomerPhoneNo, TellerID = @TellerID, DebitCurrency = @DebitCurrency, DebitAccount = @DebitAccount, 
			DebitAmtLCY = @DebitAmtLCY, DebitAmtFCY = @DebitAmtFCY, CreditCurrency = @CreditCurrency, CrTellerID = @CrTellerID, 
			CreditAccount = @CreditAccount, DealRate = @DealRate, AmountPaid = @AmountPaid, Narrative = @Narrative, 
			UserCreate = @UserExecute, DateTimeCreate = getdate()
		where TTNo = @TTNo and [Status] = 'UNA'
	end
end