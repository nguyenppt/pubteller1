create proc [dbo].[P_WUXOOMCashAdvanceDetailOrList](
	@TTNo varchar(50),
	@Status varchar(3),
	@CustomerName varchar(200),
	@PassportNo varchar(50),
	@PhoneNo varchar(50)
) 
as -- P_SellTravellersChequeDetailOrList null, 'UNA', null, null, null
begin
	if isnull(@TTNo,'') = ''
	begin
		select TTNo, CustomerName, CustomerPassportNo, CustomerPhoneNo, DebitAmtFCY, DebitCurrency, [Status]
		from B_WUXOOMCashAdvance
		where [Status] = isnull(@Status, [Status]) and CustomerName like '%' + isnull(@CustomerName,'') + '%'
			and CustomerPassportNo like '%' + isnull(@PassportNo,'') + '%' and CustomerPhoneNo like '%' + isnull(@PhoneNo,'') + '%'
		
		return
	end
	---get detail
	select * from B_WUXOOMCashAdvance
	where TTNo = @TTNo and [Status] = isnull(@Status, [Status])
end