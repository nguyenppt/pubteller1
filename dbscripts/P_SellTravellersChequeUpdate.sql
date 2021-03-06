ALTER proc [dbo].[P_SellTravellersChequeUpdate](
	@Command varchar(10),
	@TTNo varchar(50),
	@CustomerName nvarchar(150),
	@CustomerAddress nvarchar(150),
	@CustomerPassportNo varchar(50),
	@CustomerPassportDateOfIssue varchar(10) ,
	@CustomerPassportPlaceOfIssue varchar(50) ,
	@CustomerPhoneNo varchar(50) ,
	@TellerID varchar(50),
	@TCCurrency varchar(3),
	@DebitAccount varchar(50),
	@TCAmount decimal(18, 4),
	@DrCurrency varchar(3),
	@CrAccount varchar(50),
	@AmountDebited decimal(18, 4) ,
	@ExchangeRate decimal(18, 4) ,
	@Narrative nvarchar(200) ,
	@UserCreate varchar(50)
) 
as
begin
	if @Command = 'new'
	begin
		insert into B_SellTravellersCheque(TTNo, CustomerName, CustomerAddress,	CustomerPassportNo,	CustomerPassportDateOfIssue,
			CustomerPassportPlaceOfIssue, CustomerPhoneNo, TellerID, TCCurrency, DebitAccount, TCAmount, DrCurrency, CrAccount,
			AmountDebited, ExchangeRate, Narrative, [Status], UserCreate, DateTimeCreate)
		values(@TTNo, @CustomerName, @CustomerAddress,	@CustomerPassportNo,	@CustomerPassportDateOfIssue,
			@CustomerPassportPlaceOfIssue, @CustomerPhoneNo, @TellerID, @TCCurrency, @DebitAccount, @TCAmount, @DrCurrency, @CrAccount,
			@AmountDebited, @ExchangeRate, @Narrative, 'UNA', @UserCreate, getdate())	
	end
	else
	begin
		update B_SellTravellersCheque
		set CustomerName = @CustomerName, CustomerAddress = @CustomerAddress,	CustomerPassportNo = @CustomerPassportNo,	
			CustomerPassportDateOfIssue = @CustomerPassportDateOfIssue, CustomerPassportPlaceOfIssue = @CustomerPassportPlaceOfIssue, 
			CustomerPhoneNo = @CustomerPhoneNo, TellerID = @TellerID, TCCurrency = @TCCurrency, DebitAccount = @DebitAccount, 
			TCAmount = @TCAmount, DrCurrency = @DrCurrency, CrAccount = @CrAccount, AmountDebited = @AmountDebited, 
			ExchangeRate = @ExchangeRate, Narrative = @Narrative, UserCreate = @UserCreate, DateTimeCreate = getdate()
		where TTNo = @TTNo and [Status] = 'UNA'
	end
end