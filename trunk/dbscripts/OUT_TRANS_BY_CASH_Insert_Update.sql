USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[OUT_TRANS_BY_CASH_Insert_Update]    Script Date: 17/10/2014 4:38:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OUT_TRANS_BY_CASH_Insert_Update]( @ID nvarchar(20),@Status nvarchar(50),@ProductID nvarchar(20),@ProductName nvarchar(150),@Currency nvarchar(20)
      ,@BenComID nvarchar(50),@BenComName nvarchar(200),@CreditAcctID nvarchar(50),@CreditAcctName nvarchar(200),@CashAccountID nvarchar(50),@Amount numeric(19,4)
      ,@SendingName nvarchar(250),@SendingAddress1 nvarchar(250),@SendingAddress2 nvarchar(250),@SendingPhone nvarchar(50),@ReceivingName nvarchar(250)
      ,@BenAccountID nvarchar(50),@ProvinceID nvarchar(50),@ProvinceName nvarchar(250),@BankCodeID nvarchar(50),@BankCodeName nvarchar(250),@IdentityCard nvarchar(50)
      ,@IssueDate date,@IssuePlace nvarchar(200),@Teller nvarchar(50),@Narrative1 nvarchar(250),@Narrative2 nvarchar(250),@Narrative3 nvarchar(250),@WaiveCharge nvarchar(50)
      ,@VatSerial nvarchar(50),@ChargeAmount numeric(19,4),@VATChargeAmount numeric(19,4))
AS
IF EXISTS ( SELECT ID FROM DBO.BOUTWARD_TRANS_BY_CASH WHERE ID = @ID )
UPDATE  DBO.BOUTWARD_TRANS_BY_CASH SET  [ID] = @ID,[Status] = @Status,[ProductID] = @ProductID,[ProductName] = @ProductName,[Currency] = @Currency,[BenComID] = @BenComID
      ,[BenComName] = @BenComName,[CreditAcctID] = @CreditAcctID,[CreditAcctName] = @CreditAcctName,[CashAccountID] = @CashAccountID,[Amount] = @Amount
      ,[SendingName] = @SendingName,[SendingAddress1] = @SendingAddress1,[SendingAddress2] = @SendingAddress2,[SendingPhone] = @SendingPhone,[ReceivingName] = @ReceivingName
      ,[BenAccountID] = @BenAccountID,[ProvinceID] = @ProvinceID,[ProvinceName] = @ProvinceName,[BankCodeID] = @BankCodeID,[BankCodeName] = @BankCodeName
      ,[IdentityCard] = @IdentityCard,[IssueDate] = @IssueDate,[IssuePlace] = @IssuePlace,[Teller] = @Teller,[Narrative1] = @Narrative1,[Narrative2] = @Narrative2
      ,[Narrative3] = @Narrative3,[WaiveCharge] = @WaiveCharge,[VatSerial] = @VatSerial,[ChargeAmount] = @ChargeAmount,[VATChargeAmount] = @VATChargeAmount
	WHERE ID = @ID
ELSE
INSERT INTO DBO.BOUTWARD_TRANS_BY_CASH( [ID],[Status],[ProductID],[ProductName],[Currency],[BenComID],[BenComName],[CreditAcctID],[CreditAcctName],[CashAccountID]
      ,[Amount],[SendingName],[SendingAddress1],[SendingAddress2],[SendingPhone],[ReceivingName],[BenAccountID],[ProvinceID],[ProvinceName],[BankCodeID],[BankCodeName]
      ,[IdentityCard],[IssueDate],[IssuePlace],[Teller],[Narrative1],[Narrative2],[Narrative3],[WaiveCharge],[VatSerial],[ChargeAmount],[VATChargeAmount])
	  VALUES
	  (@ID, @Status, @ProductID,@ProductName, @Currency, @BenComID, @BenComName, @CreditAcctID, @CreditAcctName, @CashAccountID, @Amount, @SendingName, @SendingAddress1,
	  @SendingAddress2, @SendingPhone, @ReceivingName, @BenAccountID, @ProvinceID, @ProvinceName, @BankCodeID, @BankCodeName, @IdentityCard, @IssueDate, @IssuePlace,
	  @Teller, @Narrative1, @Narrative2, @Narrative3, @WaiveCharge, @VatSerial,@ChargeAmount, @VATChargeAmount )
GO


