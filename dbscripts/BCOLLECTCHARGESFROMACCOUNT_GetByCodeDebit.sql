USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESFROMACCOUNT_GetByCodeDebit]    Script Date: 03/10/2014 1:21:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BCOLLECTCHARGESFROMACCOUNT_GetByCodeDebit](@DebitCode nvarchar(30))
as
SELECT [ID],CustomerID ,CustomerName ,Currency 
      ,[Code]
      ,[AccountType]
      ,[CustomerAccount]
      ,[Narrative]
      ,[AccountCode]
      ,[ChargAmountLCY]
      ,[ChargAmountFCY]
      ,[ValueDate]
      ,[CategoryPLCode]
      ,[CategoryPLName]
      ,[DealRate]
      ,[VatAmountLCY]
      ,[VatAmountFCY]
      ,[TotalAmountLCY]
      ,[TotalAmountFCY]
      ,[VatSerialNo]
      ,[CreateBy]
      ,[CreateDate]
      ,[Status]
  FROM [dbo].[BCOLLECTCHARGESFROMACCOUNT] where [Code] = @DebitCode
GO


