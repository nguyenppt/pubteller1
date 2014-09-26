alter PROC dbo.P_BINTERNALBANKPAYMENTACCOUNT(
	@AccountPrefix VARCHAR(20))
AS -- P_BINTERNALBANKPAYMENTACCOUNT '1011'
BEGIN
	IF isnull(@AccountPrefix,'') != ''
	begin
		SELECT t.ACCOUNT, t.Currency, t.Name, t.Currency + ' - ' + t.ACCOUNT Display
		FROM dbo.BINTERNALBANKPAYMENTACCOUNT t
		WHERE t.ACCOUNT LIKE @AccountPrefix + '%'
		
		return
	END
	---
	SELECT t.ACCOUNT, t.Currency, t.Name, t.Currency + ' - ' + t.ACCOUNT Display 
	FROM dbo.BINTERNALBANKPAYMENTACCOUNT t
END