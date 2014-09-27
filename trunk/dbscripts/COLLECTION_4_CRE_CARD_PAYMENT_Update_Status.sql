USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Update_Status]    Script Date: 27/09/2014 8:38:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Update_Status](@ID nvarchar(20), @Status nvarchar(5))
AS
UPDATE  [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM] SET STATUS = @Status where ID= @ID
GO


