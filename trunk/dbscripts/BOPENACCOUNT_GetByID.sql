USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_GetByID]    Script Date: 03/10/2014 9:11:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[BOPENACCOUNT_GetByID]
	@ID int
AS
BEGIN
	select ID, AccountCode, CustomerID, CustomerType, CustomerName, CategoryID, CategoryName, Currency, AccountTitle, ShortTitle, IntCapToAC, AccountOfficerID, 
                         AccountOfficerName, ProductLineID, ProductLineName, ChargeCode, ChargeCodeName, RestrictTxnID, RestrictTxnName, JoinHolderID, JoinHolderName, 
                         RelationCode, RelationCodeName, JoinNotes, AlternateAct, ActualBallance,ClearedBallance,WorkingAmount, CloseOnline, CloseMode, CreditCurrency, AccountPaid, Narrative, CreateBy, 
                         CreateDate, UpdatedBy, UpdatedDate, AuthorizedBy, AuthorizedDate, Status, AccountStatus,DocID,CategoryType, BlockAccount
	 from dbo.BOPENACCOUNT
	where ID =@ID
END



GO


