ALTER proc [dbo].[P_CashWithrawalForBuyingTCUpdate](
	@TransID [varchar](50),
	@Account [varchar](50),
	@Currency [varchar](3) ,
	@ExchangeRate [decimal](18, 4) ,
	@AmtLCY [decimal](18, 4) ,
	@AmtFCY [decimal](18, 4) ,
	@CurrencyPaid [varchar](3) ,
	@DealRate [decimal](18, 4) ,
	@AmtPaidToCust [decimal](18, 4),
	@TellerID [bigint],
	@WaiveCharges [varchar](50) ,
	@Narrative [nvarchar](200),
	@UserCreate [varchar](50)
) 
as--P_CashWithrawalForBuyingTC
begin
	insert into B_CashWithrawalForBuyingTC(TransID, Account, Currency, ExchangeRate, AmtLCY, AmtFCY, CurrencyPaid, DealRate, AmtPaidToCust, TellerID, WaiveCharges, Narrative, [Status], UserCreate, DateTimeCreate)
	values(@TransID, @Account, @Currency, @ExchangeRate, @AmtLCY, @AmtFCY, @CurrencyPaid, @DealRate, @AmtPaidToCust, @TellerID, @WaiveCharges, @Narrative, 'UNA', @UserCreate, GETDATE())
end