alter PROC dbo.P_BINTERNALBANKACCOUNT
AS
BEGIN
	SELECT [CODE]      ,[ACCOUNT]      ,[Currency], [Currency] + ' - ' + [ACCOUNT] Display
	FROM [dbo].[BINTERNALBANKACCOUNT]
	ORDER BY Currency
END
	