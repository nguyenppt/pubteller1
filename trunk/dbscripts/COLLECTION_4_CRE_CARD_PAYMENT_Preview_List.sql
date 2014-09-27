USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Preview_List]    Script Date: 27/09/2014 8:37:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Preview_List]
AS
SELECT ID, CustomerName, DebitCurrency,convert(nvarchar,convert(money, DebitAmt),1) as DebitAmt, [CreditCurrency],
	convert(nvarchar,convert(money,[CreditAmt]),1) as  CreditAmt ,Status, DebitAccount FROM [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM]
where Status !='AUT'
GO


