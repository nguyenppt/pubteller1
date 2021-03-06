alter proc [dbo].[P_CustomerSignatureUpdateStatus](@CustomerId varchar(50), @Status varchar(3), @UserUpdate varchar(50))
as
begin
	if @Status = 'AUT'
	begin
		update B_CustomerSignature
		set [Status] = @Status, UserApprove = @UserUpdate, DateTimeApprove = getdate(), 
			Signatures = ISNULL(SignaturesNew, Signatures), SignaturesNew = null
		where CustomerId = @CustomerId and [Status] = 'UNA'
	end
	else if @Status = 'REV'
	begin
		update B_CustomerSignature
		set [Status] = @Status, SignaturesNew = null
		where CustomerId = @CustomerId and [Status] = 'UNA'
	end
	else
	begin
		update B_CustomerSignature
		set [Status] = @Status, SignaturesNew = null
		where CustomerId = @CustomerId
	end
end