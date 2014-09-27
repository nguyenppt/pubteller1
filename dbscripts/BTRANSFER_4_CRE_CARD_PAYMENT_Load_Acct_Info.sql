USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_Load_Acct_Info]    Script Date: 27/09/2014 8:41:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_Load_Acct_Info](@AccountID nvarchar(20), @Currency nvarchar(5))
AS SELECT CustomerId, CustomerNAME, [AccountTitle], WorkingAmount from [dbo].[BOPENACCOUNT] where [AccountCode] = @AccountID AND @Currency = Currency AND
	Status = 'AUT' and AccountStatus = 'OPEN' AND CategoryType IN ('1','2')
GO


