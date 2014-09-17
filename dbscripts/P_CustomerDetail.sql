alter proc dbo.P_CustomerDetail(
	@CustomerId varchar(20)
	)
as
begin
	select GBFullName from BCUSTOMER_INFO where CustomerID = @CustomerId
end