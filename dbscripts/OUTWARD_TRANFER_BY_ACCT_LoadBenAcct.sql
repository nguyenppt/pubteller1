
/****** Object:  StoredProcedure [dbo].[OUTWARD_TRANFER_BY_ACCT_LoadBenAcct]    Script Date: 28/10/2014 2:12:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OUTWARD_TRANFER_BY_ACCT_LoadBenAcct](@AccountCode nvarchar(30))
AS
SELECT c.GBFullName, c.DocID, c.DocIssuePlace, c.DocIssueDate , c.MobilePhone  
 FROM [dbo].[BOPENACCOUNT] as o JOIN [dbo].[BCUSTOMER_INFO] as c on o.CUstomerID  = c.CustomerID
where o.[AccountStatus]='OPEN' and o.Status ='AUT' and o.[AccountCode] = @AccountCode
GO


