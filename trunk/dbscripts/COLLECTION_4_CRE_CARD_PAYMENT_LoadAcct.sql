USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_LoadAcct]    Script Date: 27/09/2014 8:36:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_LoadAcct](@Currency nvarchar(5))
AS
SELECT [ACCOUNT],[Currency]+' - '+[ACCOUNT] AccountHasName, Currency+' - '+ [ThuChiHoAccount] as ThuChiHoHasName, [ThuChiHoAccount]
from [dbo].[BINTERNALBANKACCOUNT]
 WHERE @Currency= [Currency]
GO


