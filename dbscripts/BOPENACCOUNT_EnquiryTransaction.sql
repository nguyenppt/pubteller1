/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_EnquiryTransaction]    Script Date: 03/11/2014 3:36:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[BOPENACCOUNT_EnquiryTransaction]
	@AccountType nvarchar(5),
	@TransactionType nvarchar(5),
	@RefID nvarchar(20),
	@Currency nvarchar(10),
	@CustomerType nvarchar(5),
	@CustomerID nvarchar(20),
	@CustomerName nvarchar(250),
	@AccountCode nvarchar(20),
	@AmountFrom numeric(18,4),
	@AmountTo numeric(18,4),
	@Date date
AS
BEGIN
	if @TransactionType ='0' 
		begin
			 select a.Code,at.AccountTypeName,b.AccountCode,b.CustomerName,b.Currency, NULLIF(a.AmountDeposited,0) as TransactionAmount, 'Cash_deposit' as get_for, a.Id, a.Status
			 from BCASHDEPOSIT a
				join 
				(
					select convert(nvarchar(20), id) id, AccountCode, customername, CustomerType, CustomerID ,currency
					from bopenaccount 
					union all
					select Refid, Refid, customername,d.CustomerType, d.CustomerID, c.currency
					from BSAVING_ACC_ARREAR c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID
					union all
					select Refid, Refid, customername,d.CustomerType, d.CustomerID, c.currency
					from BSAVING_ACC_PERIODIC c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID 
					union all
					select Refid, Refid, d.GBFullName,d.CustomerType, d.CustomerID, c.TDcurrency
					from BSAVING_ACC_DISCOUNTED c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID
					union all
					select Id, Id, d.GBFullName,d.CustomerType, d.CustomerID, c.CurrencyCode
					from BLOANWORKINGACCOUNTS c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID
				) b on a.CustomerAccount = b.id
				join 
				(
					select '1' id, 'Non Term Saving Account' as AccountTypeName
					union all
					select '2', 'Saving Account - Arrear' 
					union all
					select '3', 'Saving Account - Periodic'
					union all
					select '4', 'Saving Account - Discounted'
					union all
					select '5', 'Loan Working Account'
				) at on a.AccountType = at.id
			where 1=1
			AND (nullif(@RefID, '') is null or a.Code like N'%' + @RefID + '%')
			AND (nullif(@Currency, '') is null or b.Currency=@Currency)
			AND (nullif(@AccountType, '') is null or a.AccountType=@AccountType)
			AND (nullif(@CustomerType, '') is null or b.CustomerType=@CustomerType)
			AND (nullif(@CustomerID, '') is null or b.CustomerID like N'%' + @CustomerID + '%')
			AND (nullif(@CustomerName, '') is null or b.CustomerName like N'%' + @CustomerName +'%')
			AND (nullif(@AccountCode, '') is null or b.AccountCode like N'%' + @AccountCode +'%')
			AND (nullif(@AmountFrom, 0) is null or  a.AmountDeposited >= @AmountFrom)
			AND (nullif(@AmountTo, 0) is null or  a.AmountDeposited <= @AmountTo)
			AND (nullif(@Date, '1900/01/01') is null or convert(date,convert(varchar(10), a.createdate, 111)) =@Date)
		end

	if @TransactionType ='1' 
		begin
			 select a.Code,at.AccountTypeName,b.AccountCode,b.CustomerName,b.Currency, NULLIF(a.AmountPaid,0) as TransactionAmount, 'Cash_withraw' as get_for, a.Id, a.Status
			 from BCASHWITHRAWAL a
				join 
				(
					select convert(nvarchar(20), id) id, AccountCode, customername,CustomerType, CustomerID, currency
					from bopenaccount 
					union all
					select Refid, Refid, customername,d.CustomerType, d.CustomerID, c.currency
					from BSAVING_ACC_ARREAR c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID
					union all
					select Refid, Refid, customername,d.CustomerType, d.CustomerID, c.currency
					from BSAVING_ACC_PERIODIC c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID 
					union all
					select Refid, Refid, d.GBFullName,d.CustomerType, d.CustomerID, c.TDcurrency
					from BSAVING_ACC_DISCOUNTED c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID
				) b on a.CustomerAccount = b.id
				join 
				(
					select '1' id, 'Non Term Saving Account' as AccountTypeName
					union all
					select '2', 'Saving Account - Arrear' 
					union all
					select '3', 'Saving Account - Periodic'
					union all
					select '4', 'Saving Account - Discounted'
				) at on a.AccountType = at.id
			where 1=1
			AND (nullif(@RefID, '') is null or a.Code like N'%' + @RefID +'%')
			AND (nullif(@Currency, '') is null or b.Currency=@Currency)
			AND (nullif(@CustomerType, '') is null or b.CustomerType=@CustomerType)
			AND (nullif(@AccountType, '') is null or a.AccountType=@AccountType)
			AND (nullif(@CustomerID, '') is null or b.CustomerID like N'%' + @CustomerID +'%')
			AND (nullif(@CustomerName, '') is null or b.CustomerName like N'%' + @CustomerName +'%')
			AND (nullif(@AccountCode, '') is null or b.AccountCode like N'%' + @AccountCode +'%')
			AND (nullif(@AmountFrom, 0) is null or  a.AmountPaid >= @AmountFrom)
			AND (nullif(@AmountTo, 0) is null or  a.AmountPaid <= @AmountTo)
			AND (nullif(@Date, '1900/01/01') is null or convert(date,convert(varchar(10), a.createdate, 111)) =@Date)
		end

	if @TransactionType ='2' 
		begin
			 select a.Code,at.AccountTypeName, b.AccountCode,b.CustomerName,b.Currency, NULLIF(a.DebitAmount,0) as TransactionAmount, 'Transfer_Withdraw' as get_for, a.Id, a.Status
			 from BTRANSFERWITHDRAWAL a
				join 
				(
					select convert(nvarchar(20), id) id, customername,AccountCode, CustomerType, CustomerID, currency
					from bopenaccount 
					union all
					select Refid, Refid, customername,d.CustomerType, d.CustomerID, c.currency
					from BSAVING_ACC_ARREAR c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID
					union all
					select Refid, Refid, customername,d.CustomerType, d.CustomerID, c.currency
					from BSAVING_ACC_PERIODIC c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID 
					union all
					select Refid, Refid, d.GBFullName,d.CustomerType, d.CustomerID, c.TDcurrency
					from BSAVING_ACC_DISCOUNTED c
						left join BCUSTOMER_INFO d on c.customerID=d.customerID
				) b on a.DebitAccount = b.id
				join 
				(
					select '1' id, 'Non Term Saving Account' as AccountTypeName
					union all
					select '2', 'Saving Account - Arrear' 
					union all
					select '3', 'Saving Account - Periodic'
					union all
					select '4', 'Saving Account - Discounted'
				) at on a.AccountType = at.id
			where 1=1
			AND (nullif(@RefID, '') is null or a.Code like N'%' + @RefID +'%')
			AND (nullif(@Currency, '') is null or b.Currency=@Currency)
			AND (nullif(@CustomerType, '') is null or b.CustomerType=@CustomerType)
			AND (nullif(@AccountType, '') is null or a.AccountType=@AccountType)
			AND (nullif(@CustomerID, '') is null or b.CustomerID like N'%' + @CustomerID +'%')
			AND (nullif(@CustomerName, '') is null or b.CustomerName like N'%' + @CustomerName +'%')
			AND (nullif(@AccountCode, '') is null or b.AccountCode like N'%' + @AccountCode +'%')
			AND (nullif(@AmountFrom, 0) is null or  a.DebitAmount >= @AmountFrom)
			AND (nullif(@AmountTo, 0) is null or  a.DebitAmount <= @AmountTo)
			AND (nullif(@Date, '1900/01/01') is null or convert(date,convert(varchar(10), a.DebitValueDate, 111)) =@Date)
		end
	
END




