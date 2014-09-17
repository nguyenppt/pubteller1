alter function dbo.F_CustomerInfo(
	@CustomerId varchar(50),
	@InfoType smallint)
returns nvarchar(max)
as
begin
	if @InfoType = 1--Customer fullname
	begin
		return (select GBFullName from BCUSTOMER_INFO where CustomerId = @CustomerId)
	end
	
	return null
end