USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[Load_Acct_Info_From_BOPENACCOUNT]    Script Date: 19/11/2014 6:26:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Load_Acct_Info_From_BOPENACCOUNT](@Currency nvarchar(10), @AccountID nvarchar(30))
AS
SELECT [AccountCode], [WorkingAmount]
      ,a.[CustomerID]
      ,[CustomerName],CustomerName, [GBStreet] +', '+[GBDist]+', '+[TenTinhThanh]+', '+[CountryName] as Address
      ,a.[DocID],a.[Currency] FROM [dbo].[BOPENACCOUNT] a JOIN [dbo].[BCUSTOMER_INFO]  c on a.[CustomerID] = c.[CustomerID]
	   where a.Status='AUT' and a.AccountStatus='OPEN' and @Currency = a.Currency and @AccountID = a.[AccountCode]
GO


