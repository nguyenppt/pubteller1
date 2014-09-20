create proc [dbo].[P_BuyTravellersChequeUpdateStatus](
	@TTNo varchar(50),
	@Status varchar(3),
	@UserUpdate varchar(50)
) 
as
begin
	if @Status = 'AUT' or @Status = 'REV'
	begin
		update B_BuyTravellersCheque
		set [Status] = @Status, UserApprove = @UserUpdate, DateTimeApprove = getdate()
		where TTNo = @TTNo
	end
	else  
	begin
		update B_BuyTravellersCheque
		set [Status] = @Status
		where TTNo = @TTNo
	end
end