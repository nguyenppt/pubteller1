alter proc [dbo].[P_CustomerSignatureDetail](
	@CustomerId varchar(50)
	)
as-- P_CustomerSignatureDetail '2000138'
begin
	select a.CustomerId, dbo.F_CustomerInfo(a.CustomerId, 1) CustomerName, Signatures, a.[Status], a.UserCreate, a.DatetimeCreate, SignaturesNew
	from B_CustomerSignature a where a.CustomerId = @CustomerId
end