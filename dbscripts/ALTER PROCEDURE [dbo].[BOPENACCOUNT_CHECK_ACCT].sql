USE [bisolutions_vvcb]
GO
/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_CHECK_ACCT]    Script Date: 25/11/2014 11:07:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BOPENACCOUNT_CHECK_ACCT](@CustomerID nvarchar(20), @ProductLineID nvarchar(20), @Currency nvarchar(5), @AccountCode nvarchar(20))
AS 
IF @ProductLineID ='10001'
SELECT [AccountCode]
      ,[CustomerID], [Currency], [ProductLineID], STATUS FROM [dbo].[BOPENACCOUNT]
	  WHERE [CustomerID]= @CustomerID and [ProductLineID] = '10001' and Currency = @Currency and @AccountCode !=  AccountCode