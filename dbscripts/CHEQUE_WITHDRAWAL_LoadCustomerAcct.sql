USE [bisolutions_vvcb]
GO
/****** Object:  StoredProcedure [dbo].[CHEQUE_WITHDRAWAL_LoadCustomerAcct]    Script Date: 22/10/2014 7:02:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[CHEQUE_WITHDRAWAL_LoadCustomerAcct](@Currency nvarchar(5), @AccountCustomer nvarchar(30))
AS BEGIN
SELECT o.[AccountCode], o.[Currency]+' - '+o.[AccountCode] AS AcctHasName
		,o.[CustomerID], o.[CustomerName], o.[WorkingAmount]
		,[GBStreet]+', '+[GBDist]+', '+[TenTinhThanh]+', '+[CountryName] as Address
		,o.[DocID]
        ,[DocIssuePlace]
        ,[DocIssueDate], cheque.[ChequeNoStart]
        ,cheque.[ChequeNoEnd]
 from [dbo].[BOPENACCOUNT] as o JOIN [dbo].[BCUSTOMER_INFO] as c on o.CustomerID = c.CustomerID JOIN [dbo].[BCHEQUEISSUE] as cheque on cheque.workingacctID= o.[AccountCode]
 where (@Currency = o.[Currency] and @AccountCustomer = o.[AccountCode])
  --where (o.Currency = 'VND' and o.[AccountCode] = '070000001945')
end







