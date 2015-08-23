/****** Object:  StoredProcedure [dbo].[BINWARD_PROC_CRE_ACCT_Load_ClearingID]    Script Date: 29/10/2014 5:30:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BINWARD_PROC_CRE_ACCT_Load_ClearingID]
AS
SELECT ID 
 from [dbo].[BOUTWARD_TRANS_BY_ACCT] WHERE Status = 'AUT'
GO


