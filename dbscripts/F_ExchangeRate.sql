create function [dbo].[F_ExchangeRate](
	@Currency varchar(3))
returns decimal(18,4)
as
begin
	return (select Rate from B_ExchangeRates where Currency = @Currency)
end