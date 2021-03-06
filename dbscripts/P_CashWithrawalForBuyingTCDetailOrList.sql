alter proc [dbo].[P_CashWithrawalForBuyingTCDetailOrList](
	@Status varchar(3) = null,
	@TransID varchar(50) = null,
	@CustomerID varchar(50) = null,
	@CustomerName varchar(50) = null
	)
as-- P_CashWithrawalForBuyingTCDetailOrList 'UNA', null, '', ''
begin
	if isnull(@TransID,'') != ''
	begin
		select a.*, b.AccountTitle, b.CustomerID, dbo.F_CustomerInfo(b.CustomerID, 1) CustomerName
		from B_CashWithrawalForBuyingTC a 
			left join dbo.B_AccountForBuyingTC b on a.Account = b.AccountNo
		where a.TransID = @TransID
		
		return
	end
	----
	select TransID ReperenceNo, Account, b.AccountTitle CustomerAccount, AmtLCY, AmtFCY, a.[Status], a.UserCreate, a.DatetimeCreate, replace(TransID,'/','') LCCode
	from B_CashWithrawalForBuyingTC a 
		left join B_AccountForBuyingTC b on a.Account = b.AccountNo
			left join dbo.BCUSTOMER_INFO c on b.CustomerId = c.CustomerID
	where b.CustomerID like '%' + isnull(@CustomerID, '') + '%' and c.GBFullName like '%' + isnull(@CustomerName, '') + '%'
		and (@Status is null or a.[Status] = @Status)
	order by a.datetimecreate desc
end