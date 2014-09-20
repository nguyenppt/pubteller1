alter proc [dbo].[P_BuyTravellersChequeUpdate](
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
	@DrAccount varchar(50) ,
	@TCAmount decimal(18, 4),
	@CurrencyPaid varchar(3),
	@CrTellerID nchar(10) ,
	@CrAccount varchar(50) ,
	@ExchangeRate decimal(18, 4) ,
	@ChargeAmtLCY decimal(18, 4) ,
	@ChargeAmtFCY decimal(18, 4) ,
	@AmountPaid decimal(18, 4) ,
	@Narrative nvarchar(500) ,
	@TCIssuer varchar(50),
	@Denomination varchar(200),
	@Unit varchar(200),
	@SerialNo varchar(200),
	@UserExecute varchar(50)
) 
as
begin
	if @Command = 'new'
	begin
		insert into B_BuyTravellersCheque(TTNo, CustomerName, CustomerAddress, CustomerPassportNo, CustomerPassportDateOfIssue , CustomerPassportPlaceOfIssue , CustomerPhoneNo , 
			TellerID, TCCurrency, DrAccount , TCAmount, CurrencyPaid, CrTellerID, CrAccount , ExchangeRate , ChargeAmtLCY , ChargeAmtFCY , AmountPaid , Narrative , TCIssuer, 
			Denomination, Unit, SerialNo, [Status] , UserCreate, DateTimeCreate)
		values(@TTNo,@CustomerName, @CustomerAddress, @CustomerPassportNo, @CustomerPassportDateOfIssue , @CustomerPassportPlaceOfIssue , @CustomerPhoneNo , 
			@TellerID, @TCCurrency, @DrAccount , @TCAmount, @CurrencyPaid, @CrTellerID, @CrAccount , @ExchangeRate , @ChargeAmtLCY , @ChargeAmtFCY , @AmountPaid , @Narrative , @TCIssuer, 
			@Denomination, @Unit, @SerialNo, 'UNA', @UserExecute, getdate())	
	end
	else
	begin
		update B_BuyTravellersCheque
		set CustomerName = @CustomerName, CustomerAddress = @CustomerAddress, CustomerPassportNo = @CustomerPassportNo, CustomerPassportDateOfIssue = @CustomerPassportDateOfIssue , 
			CustomerPassportPlaceOfIssue = @CustomerPassportPlaceOfIssue , CustomerPhoneNo = @CustomerPhoneNo , TellerID = @TellerID, TCCurrency = @TCCurrency, DrAccount = @DrAccount , 
			TCAmount = @TCAmount, CurrencyPaid = @CurrencyPaid, CrTellerID = @CrTellerID, CrAccount = @CrAccount , ExchangeRate = @ExchangeRate , ChargeAmtLCY = @ChargeAmtLCY , 
			ChargeAmtFCY = @ChargeAmtFCY , AmountPaid = @AmountPaid , Narrative = @Narrative , TCIssuer = @TCIssuer, Denomination = @Denomination, Unit = @Unit, SerialNo = @SerialNo, 
			UserCreate = @UserExecute, DateTimeCreate = getdate()
		where TTNo = @TTNo and [Status] = 'UNA'
	end
end