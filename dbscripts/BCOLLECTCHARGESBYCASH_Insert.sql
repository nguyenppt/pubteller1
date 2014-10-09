USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESBYCASH_Insert]    Script Date: 09/10/2014 3:07:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER PROCEDURE [dbo].[BCOLLECTCHARGESBYCASH_Insert]
	@AccountType nvarchar(5),
	@Code nvarchar(20),
	@CustomerID nvarchar(20), 
	@CustomerAddress nvarchar(3000), 
	@DocID nvarchar(50), 
	@DocIssueDate datetime, 
	@DocIssuePlace nvarchar(100), 
	@Teller nvarchar(50),
	@Currency nvarchar(10),
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
	@UserId int, 
	@CustomerName nvarchar(250),
	@CustomerName_vangLai nvarchar(250),@AccountID nvarchar(50)
AS
BEGIN
	--update binh thuong hoac neu la loai 2 thi ko cho insert chi update tk cu
	if not exists(select Code from dbo.BCOLLECTCHARGESBYCASH where Code = @Code)
	begin
		INSERT INTO dbo.BCOLLECTCHARGESBYCASH
			   (Code, AccountType, CustomerID, CustomerAddress, DocID, DocIssueDate, DocIssuePlace, Teller,Currency,CustomerAccount, ChargAmountLCY, ChargAmountFCY, ValueDate, CategoryPLCode, CategoryPLName, DealRate, 
                         VatAmountLCY, VatAmountFCY, TotalAmountLCY, TotalAmountFCY, VatSerialNo, Narrative, 
						 CreateBy, 
                         CreateDate, 
						 Status, CustomerName, CUstomerName_vanglai,AccountID
			   )
		 VALUES
			   (@Code, @AccountType, @CustomerID, @CustomerAddress, @DocID, @DocIssueDate, @DocIssuePlace, @Teller,@Currency,@CustomerAccount, @ChargAmountLCY, @ChargAmountFCY, @ValueDate, @CategoryPLCode, @CategoryPLName, @DealRate, 
                         @VatAmountLCY, @VatAmountFCY, @TotalAmountLCY, @TotalAmountFCY, @VatSerialNo, @Narrative 
				, @UserId   
				, getdate()
				, 'UNA', @CustomerName,@CustomerName_vangLai,@AccountID
			)
	end
	else 
	begin
		UPDATE dbo.BCOLLECTCHARGESBYCASH
		   SET 
			 AccountType=@AccountType
			 , CustomerID=@CustomerID
			 , CustomerAddress=@CustomerAddress
			 , DocID=@DocID
			 , DocIssueDate=@DocIssueDate
			 , DocIssuePlace=@DocIssuePlace
			 , Teller=@Teller
			 , Currency=@Currency
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
			,status='UNA', CustomerName = @CustomerName,CustomerName_vangLai = @CustomerName_vangLai, AccountID = @AccountID
		 WHERE Code = @Code
	end
END









GO


