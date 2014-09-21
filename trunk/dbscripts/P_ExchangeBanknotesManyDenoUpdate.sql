create proc [dbo].[P_ExchangeBanknotesManyDenoUpdate](
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
	@DebitAmount decimal(18, 4),
	@Narrative nvarchar(200) ,
	@ValueDate DATETIME,
	@CrTellerID varchar(50),
	@CreditAccount varchar(50),	
	@ExchangeRate decimal(18, 4) ,
	@AmountPaid decimal(18, 4) ,	
	@UserExecute varchar(50)
) 
as
begin
	if @Command = 'new'
	begin
		insert into B_ExchangeBanknotesManyDeno(TTNo, CustomerName, CustomerAddress,	CustomerPassportNo,	CustomerPassportDateOfIssue,
			CustomerPassportPlaceOfIssue, CustomerPhoneNo, TellerID, DebitCurrency, DebitAccount, DebitAmount, Narrative, ValueDate,
			CrTellerID, CreditAccount, ExchangeRate, AmountPaid, [Status], UserCreate, DateTimeCreate)
		values(@TTNo, @CustomerName, @CustomerAddress,	@CustomerPassportNo,	@CustomerPassportDateOfIssue,
			@CustomerPassportPlaceOfIssue, @CustomerPhoneNo, @TellerID, @DebitCurrency, @DebitAccount, @DebitAmount, @Narrative, @ValueDate,
			@CrTellerID, @CreditAccount, @ExchangeRate, @AmountPaid, 'UNA', @UserExecute, getdate())	
	end
	else
	begin
		update B_ExchangeBanknotesManyDeno
		set CustomerName = @CustomerName, CustomerAddress = @CustomerAddress,	CustomerPassportNo = @CustomerPassportNo,	
			CustomerPassportDateOfIssue = @CustomerPassportDateOfIssue, CustomerPassportPlaceOfIssue = @CustomerPassportPlaceOfIssue, 
			CustomerPhoneNo = @CustomerPhoneNo, TellerID = @TellerID, DebitCurrency = @DebitCurrency, DebitAccount = @DebitAccount, 
			DebitAmount = @DebitAmount, Narrative = @Narrative, ValueDate = @ValueDate, CrTellerID = @CrTellerID, 
			CreditAccount = @CreditAccount, ExchangeRate = @ExchangeRate, AmountPaid = @AmountPaid, 
			UserCreate = @UserExecute, DateTimeCreate = getdate()
		where TTNo = @TTNo and [Status] = 'UNA'
	end
end