CREATE PROCEDURE DBO.BOPENACCOUNT_CHECK_ACCT(@CustomerID nvarchar(20), @ProductLineID nvarchar(20), @Currency nvarchar(5))
AS
SELECT [AccountCode]
      ,[CustomerID], [Currency], [ProductLineID], STATUS FROM [dbo].[BOPENACCOUNT]
	  WHERE [CustomerID]= @CustomerID and [ProductLineID] = '10001' and Currency = @Currency