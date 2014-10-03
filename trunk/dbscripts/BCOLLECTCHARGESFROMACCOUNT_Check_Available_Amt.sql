USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESFROMACCOUNT_Check_Available_Amt]    Script Date: 03/10/2014 1:24:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[BCOLLECTCHARGESFROMACCOUNT_Check_Available_Amt]
	@AccountType nvarchar(5),
	@Code varchar(50)
AS
BEGIN
			declare @customerAccountId nvarchar(20) = (select CustomerAccount from BCOLLECTCHARGESFROMACCOUNT where Code = @Code)

			declare @AmtPaidToCust numeric(18, 4) = (select ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) from BCOLLECTCHARGESFROMACCOUNT where Code = @Code)
			
			if @AccountType = '1' --non term
			begin
				--Khi AUT thi update vao openAcc
				if((select WorkingAmount FROM DBO.BOPENACCOUNT where AccountCode = @customerAccountId)  >= @AmtPaidToCust)
				SELECT 'OK' AS Update_Status 
				else
				SELECT WorkingAmount AS Available_Amt, 'FALSE' AS Update_Status FROM DBO.BOPENACCOUNT
				where AccountCode = @customerAccountId
			end

			if @AccountType = '2' --arrear
			begin
				--Khi AUT thi update vao openAcc
				if((select AZPrincipal FROM DBO.BSAVING_ACC_ARREAR where RefID = @customerAccountId)  >= @AmtPaidToCust)
				SELECT 'OK' AS Update_Status 
				else
				SELECT AZPrincipal AS Available_Amt, 'FALSE' AS Update_Status FROM DBO.BSAVING_ACC_ARREAR
				where RefID = @customerAccountId
				
			end

			if @AccountType = '3' --periolic
			begin
				--Khi AUT thi update vao openAcc
				if((select AZPrincipal FROM DBO.BSAVING_ACC_PERIODIC where RefID = @customerAccountId)  >= @AmtPaidToCust)
				SELECT 'OK' AS Update_Status 
				else
				SELECT AZPrincipal AS Available_Amt, 'FALSE' AS Update_Status FROM DBO.BSAVING_ACC_PERIODIC
				where RefID = @customerAccountId
			end

			if @AccountType = '4' --discounted
			begin
				--Khi AUT thi update vao openAcc
				if((select TDAmmount FROM DBO.BSAVING_ACC_DISCOUNTED where RefID = @customerAccountId)  >= @AmtPaidToCust)
				SELECT 'OK' AS Update_Status 
				else
				SELECT TDAmmount AS Available_Amt, 'FALSE' AS Update_Status FROM DBO.BSAVING_ACC_DISCOUNTED
				where RefID = @customerAccountId
			end

			if @AccountType = '5' --loan account
			begin
				--Khi AUT thi update vao openAcc
				if((select WorkingAmount FROM DBO.BLOANWORKINGACCOUNTS where ID = @customerAccountId)  >= @AmtPaidToCust)
				SELECT 'OK' AS Update_Status 
				else
				SELECT WorkingAmount AS Available_Amt, 'FALSE' AS Update_Status FROM DBO.BLOANWORKINGACCOUNTS
				where ID = @customerAccountId
			end
END





GO


