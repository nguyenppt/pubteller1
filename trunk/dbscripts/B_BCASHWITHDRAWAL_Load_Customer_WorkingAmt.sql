USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[B_BCASHWITHDRAWAL_Load_Customer_WorkingAmt]    Script Date: 18/09/2014 1:36:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[B_BCASHWITHDRAWAL_Load_Customer_WorkingAmt](@AccountType nvarchar(5),@AccountCode nvarchar(20), @Currency nvarchar(5))
AS 
--declare @AccountType nvarchar(5), @AccountCode nvarchar(20), @Currency nvarchar(5)
--set @AccountType='5'
--set @AccountCode='07.000000135.6'
--set  @Currency='VND'
IF(@AccountType ='1')
	SELECT [WorkingAmount] FROM [dbo].[BOPENACCOUNT] WHERE  @AccountCode = [AccountCode] AND STATUS='AUT'
ELSE 
IF(@AccountType ='2')
	SELECT [AZPrincipal] AS WorkingAmount FROM [dbo].[BSAVING_ACC_ARREAR] WHERE  @AccountCode = [RefId] AND STATUS='AUT'
	ELSE 
IF(@AccountType ='3')
	SELECT [AZPrincipal] AS WorkingAmount FROM [dbo].[BSAVING_ACC_PERIODIC] WHERE  @AccountCode = [RefId] AND STATUS='AUT'
	ELSE 
IF(@AccountType ='4')
	SELECT [TDAmmount] AS WorkingAmount FROM [dbo].[BSAVING_ACC_DISCOUNTED] WHERE  @AccountCode = [refId] AND STATUS='AUT'   
	ELSE 
IF(@AccountType ='5' )
	SELECT [WorkingAmount] AS WorkingAmount FROM [dbo].[BLOANWORKINGACCOUNTS] WHERE  @AccountCode = ID AND STATUS='AUT'  


GO


