alter proc dbo.P_TellerForeignExchangeList(
	@TabId int,
	@Status varchar(50))
as -- P_TellerForeignExchangeList 150, 'UNA'
begin
	if @TabId = 150
	begin
		select TransID TTNo, Account, AmtFCY Amount, a.Currency, a.[Status], dbo.F_CustomerInfo(b.CustomerID, 1) CustomerName, '' CustomerPassportNo
		from dbo.B_CashWithrawalForBuyingTC a
			inner join dbo.B_AccountForBuyingTC b on a.Account = b.AccountNo
		where a.[Status] = case when @Status is null then 'AUT' else 'UNA' end
	end
	else if @TabId = 151
	begin
		select TTNo, DebitAccount Account, TCAmount Amount, TCCurrency Currency, [Status], CustomerName, CustomerPassportNo
		from dbo.B_SellTravellersCheque
		where [Status] = case when @Status is null then 'AUT' else 'UNA' end
	end
	else if @TabId = 152
	begin
		select TTNo, DrAccount Account, TCAmount Amount, TCCurrency Currency, [Status], CustomerName, CustomerPassportNo
		from dbo.B_BuyTravellersCheque
		where [Status] = case when @Status is null then 'AUT' else 'UNA' end
	END
	else if @TabId = 153
	begin
		select TTNo, DebitAccount Account, DebitAmtFCY Amount, DebitCurrency Currency, [Status], CustomerName, CustomerPassportNo
		from dbo.B_ForeignExchange
		where [Status] = case when @Status is null then 'AUT' else 'UNA' end
	END
	else if @TabId = 154
	begin
		select TTNo, DebitAccount Account, DebitAmtFCY Amount, DebitCurrency Currency, [Status], CustomerName, CustomerPassportNo
		from dbo.B_WUXOOMCashAdvance
		where [Status] = case when @Status is null then 'AUT' else 'UNA' end
	END
	else if @TabId = 280
	begin
		select TTNo, DebitAccount Account, DebitAmount Amount, DebitCurrency Currency, [Status], CustomerName, CustomerPassportNo
		from dbo.B_ExchangeBanknotesManyDeno
		where [Status] = case when @Status is null then 'AUT' else 'UNA' end
	end
end