ALTER proc [dbo].[P_ExchangeRate]
as
select Currency + '#' + cast(Rate as varchar) Value, Currency Title
			from B_ExchangeRates
		order by Title