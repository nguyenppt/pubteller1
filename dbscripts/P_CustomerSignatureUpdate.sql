alter proc [dbo].[P_CustomerSignatureUpdate](
	@CustomerId [varchar](50),
	@Signatures [varchar](5000),
	@UserCreate [varchar](50)
) 
as
begin
	if exists(select CustomerId from B_CustomerSignature where CustomerId = @CustomerId)
	begin
		update B_CustomerSignature
		set SignaturesNew = @Signatures, [Status] = 'UNA',
			UserCreate = @UserCreate, DateTimeCreate = getdate(),
			UserApprove = null, DateTimeApprove = null			
		where CustomerId = @CustomerId --and [status] = 'REV'
	end
	else
	begin
		insert into B_CustomerSignature(CustomerId, Signatures, [Status], UserCreate, DateTimeCreate)
		values(@CustomerId, @Signatures, 'UNA', @UserCreate, GETDATE())
	end
end