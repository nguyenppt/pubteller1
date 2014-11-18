USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[INWARD_TRANS_LIST]    Script Date: 18/11/2014 5:14:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INWARD_TRANS_LIST](@DocID nvarchar(50))
AS
SELECT TEMP.[ID], TEMP.[SendingName], TEMP.[ReceivingName], TEMP.[IdentityCard],TEMP.TXN_Type, TEMP.Amount, TEMP.Currency  FROM (
SELECT [ID], [SendingName], [ReceivingName], [IdentityCard], 'By Cash' as TXN_Type, Amount, Currency  
FROM [dbo].[BOUTWARD_TRANS_BY_CASH] 
	 WHERE ProductID = '1000' AND status = 'AUT' AND ID NOT IN(
SELECT [ID] FROM [dbo].[BOUTWARD_TRANS_BY_CASH] AS CA 
	JOIN (SELECT [ClearingID] FROM [dbo].[BINWARD_CASH_WITHDRAW] WHERE Status = 'AUT' ) AS UN ON UN.[ClearingID] = CA.ID
	WHERE CA.status = 'AUT' and CA.ProductID = '1000')

UNION ALL 

SELECT [ID], [SendingName], [ReceivingName] + [ReceivingName2] AS ReceivingName, [LegalID] AS IdentityCard, 'By Account' as TXN_Type,DebitAmount as Amount, Currency 
FROM [dbo].[BOUTWARD_TRANS_BY_ACCT] 
	WHERE ProductID = '1000' AND status = 'AUT' AND 
			ID NOT IN(
SELECT [ID] FROM [dbo].[BOUTWARD_TRANS_BY_ACCT] AS CA 
	JOIN (SELECT [ClearingID] FROM [dbo].[BINWARD_PROC_CRE_ACCT] WHERE Status = 'AUT' ) AS UN ON UN.[ClearingID] = CA.ID
	WHERE CA.status = 'AUT' and CA.ProductID = '1000') ) AS TEMP WHERE TEMP.IdentityCard LIKE N'%'+@DocID+'%' OR @DocID='' 
	order by [ID],[SendingName], [ReceivingName], Amount desc
GO


