ALTER proc [dbo].[P_CashWithrawalForBuyingTCUpdateStatus](@TransID varchar(50), @Status varchar(3))
as
begin
	update B_CashWithrawalForBuyingTC
	set [Status] = @Status
	where TransID = @TransID
end