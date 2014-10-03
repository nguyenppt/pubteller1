USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BOPENACCOUNT_Search_BLocked_Acct]    Script Date: 03/10/2014 9:09:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[BOPENACCOUNT_Search_BLocked_Acct]
	@AccountCode nvarchar(20),
	@Locked bit,
	@CustomerType nvarchar(5),
	@CustomerID nvarchar(20),
	@CustomerName nvarchar(250),
	@docid nvarchar(50),
	@category nvarchar(20),
	@Currency nvarchar(10),
	@ProductLine nvarchar(20)
AS
BEGIN
	select ID, AccountCode, CustomerID, CustomerType, CustomerName, CategoryID, CategoryName, Currency, AccountTitle, ShortTitle, IntCapToAC, AccountOfficerID, 
                         AccountOfficerName, ProductLineID, ProductLineName, ChargeCode, ChargeCodeName, RestrictTxnID, RestrictTxnName, JoinHolderID, JoinHolderName, 
                         RelationCode, RelationCodeName, JoinNotes, AlternateAct, NULLIF(ActualBallance, 0) ActualBallance,NULLIF(ClearedBallance,0) ClearedBallance,
						 NULLIF(WorkingAmount,0) WorkingAmount,NULLIF(LockedAmount,0) LockedAmount, CloseOnline, CloseMode, CreditCurrency, AccountPaid, Narrative, CreateBy, 
                         CreateDate, UpdatedBy, UpdatedDate, AuthorizedBy, AuthorizedDate, Status, AccountStatus,CategoryType,DocID
	from dbo.BOPENACCOUNT
	where 1=1
	AND (nullif(@AccountCode, '') is null or AccountCode like N'%' + @AccountCode + '%')
	AND ((@Locked = 0 and AccountStatus = 'LOCKED' )or (@Locked = 1 and AccountStatus in ('LOCKED')))
	AND (nullif(@CustomerType, '') is null or CustomerType=@CustomerType)
	AND (nullif(@CustomerID, '') is null or CustomerID like N'%' + @CustomerID + '%')
	AND (nullif(@CustomerName, '') is null or CustomerName like N'%' + @CustomerName + '%')
	AND (nullif(@docid, '') is null or docid like N'%' + @docid + '%')
	AND (nullif(@category, '') is null or CategoryID=@category)
	AND (nullif(@Currency, '') is null or Currency=@Currency)
	AND (nullif(@ProductLine, '') is null or ProductLineID=@ProductLine)
	
END




GO


