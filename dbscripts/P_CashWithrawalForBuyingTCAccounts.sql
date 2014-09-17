ALTER proc [dbo].[P_CashWithrawalForBuyingTCAccounts](@AccountNo varchar(20) = null)
as--P_CashWithrawalForBuyingTCAccounts '03.000045632.1'
begin
	if isnull(@AccountNo,'') = '' 
	begin
		select AccountNo, AccountNo + ' - ' + AccountTitle Display
		from B_AccountForBuyingTC order by AccountNo
		---
		return
	end
	---
	select CustomerID, dbo.F_CustomerInfo(a.CustomerID, 1) CustomerName, AccountNo, AccountTitle, Currency, dbo.F_ExchangeRate(a.Currency) CurrencyRate
	from B_AccountForBuyingTC a	where AccountNo = @AccountNo
end