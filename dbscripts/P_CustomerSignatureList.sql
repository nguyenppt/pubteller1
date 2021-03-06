alter proc [dbo].[P_CustomerSignatureList](
	@Status varchar(30)=null,
	@CustomerId varchar(50), 
	@CustomerName varchar(50)
	)
as-- P_CustomerSignatureList '', ''
begin
	select a.CustomerId, dbo.F_CustomerInfo(a.CustomerId, 1) CustomerName, Signatures, a.[Status], a.UserCreate, a.DatetimeCreate
	from B_CustomerSignature a
	where (isnull(@CustomerId,'') = '' or a.CustomerId like '%' + @CustomerId + '%') 
		and (isnull(@CustomerName,'') = '' or dbo.F_CustomerInfo(a.CustomerId, 1) like '%' + @CustomerName + '%')
		and (@Status is null or [Status] = @Status)
	order by a.datetimecreate desc
end