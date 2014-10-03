USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESFROMACCOUNT_Insert]    Script Date: 03/10/2014 1:23:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dbo].[BCOLLECTCHARGESFROMACCOUNT_Insert]
	(@AccountType nvarchar(5),
	@Code nvarchar(20),
	@CustomerAccount nvarchar(20),
	@ChargAmountLCY numeric(18, 0),
	@ChargAmountFCY numeric(18, 4),
	@ValueDate date = null,
	@CategoryPLCode varchar(50),
	@CategoryPLName nvarchar(500),
	@DealRate numeric(18, 5),
	@VatAmountLCY numeric(18, 0),
	@VatAmountFCY numeric(18, 4),
	@TotalAmountLCY numeric(18, 0),
	@TotalAmountFCY numeric(18, 4),
	@VatSerialNo nvarchar(250),
	@Narrative nvarchar(250),
	@UserId int, @CustomerID nvarchar(20), @CustomerName nvarchar(250), @Currency nvarchar(5))
AS
BEGIN
	--update binh thuong hoac neu la loai 2 thi ko cho insert chi update tk cu
	if not exists(select Code from dbo.BCOLLECTCHARGESFROMACCOUNT where Code = @Code)
	begin
		INSERT INTO dbo.BCOLLECTCHARGESFROMACCOUNT
			   (Code, AccountType, CustomerAccount, ChargAmountLCY, ChargAmountFCY, ValueDate, CategoryPLCode, CategoryPLName, DealRate, 
                         VatAmountLCY, VatAmountFCY, TotalAmountLCY, TotalAmountFCY, VatSerialNo, Narrative, 
						 CreateBy, 
                         CreateDate, 
						 Status, CustomerID, CustomerName, Currency
			   )
		 VALUES
			   (@Code, @AccountType, @CustomerAccount, @ChargAmountLCY, @ChargAmountFCY, @ValueDate, @CategoryPLCode, @CategoryPLName, @DealRate, 
                         @VatAmountLCY, @VatAmountFCY, @TotalAmountLCY, @TotalAmountFCY, @VatSerialNo, @Narrative 
				, @UserId   
				, getdate()
				, 'UNA', @CustomerID, @CustomerName, @Currency
			)
	end
	else 
	begin
		UPDATE dbo.BCOLLECTCHARGESFROMACCOUNT
		   SET 
			 AccountType=@AccountType
			 , CustomerAccount=@CustomerAccount
			 , ChargAmountLCY=@ChargAmountLCY
			 , ChargAmountFCY=@ChargAmountFCY
			 , ValueDate=@ValueDate
			 , CategoryPLCode=@CategoryPLCode
			 , CategoryPLName=@CategoryPLName
			 , DealRate=@DealRate
			 , VatAmountLCY=@VatAmountLCY
			 , VatAmountFCY=@VatAmountFCY
			 , TotalAmountLCY=@TotalAmountLCY
			 , TotalAmountFCY=@TotalAmountFCY
			 , VatSerialNo=@VatSerialNo
			 , Narrative=@Narrative
			,UpdatedDate = getdate()  
			,UpdatedBy = @UserId 
			,status='UNA', CustomerID = @CustomerID, CustomerName = @CustomerName, Currency = @Currency
		 WHERE Code = @Code
	end
END








GO


