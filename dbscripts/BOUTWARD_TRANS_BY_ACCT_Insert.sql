/****** Object:  StoredProcedure [dbo].[BOUTWARD_TRANS_BY_ACCT_Insert]    Script Date: 19/11/2014 6:27:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BOUTWARD_TRANS_BY_ACCT_Insert]( @ID nvarchar(20),@Status nvarchar(20),@ProductID nvarchar(20),@ProductName nvarchar(250),@BenComID nvarchar(50)
      ,@BenComName nvarchar(250),@Currency nvarchar(20),@DebitAcctID nvarchar(50),@DebitAcctName nvarchar(250),@DebitAmount decimal(18,5),@SendingName nvarchar(250)
      ,@SendingAddress nvarchar(250),@IDTaxCode nvarchar(50),@ReceivingName nvarchar(250),@ReceivingName2 nvarchar(250),@BenAcctID nvarchar(50),@LegalID nvarchar(50)
      ,@IssueDate datetime,@IssuePlace nvarchar(250),@ProvinceCode nvarchar(50),@ProvinceName nvarchar(250),@Phone nvarchar(50),@BankCode nvarchar(50),@BankCodeDesc nvarchar(250)
      ,@BankName nvarchar(250),@PayNumber nvarchar(50),@TellerID nvarchar(50),@Narrative nvarchar(250),@Narrative2 nvarchar(250),@WaiveCharge nvarchar(50)
      ,@SaveTemplate nvarchar(50),@VATSerial nvarchar(50),@ChargeAmtLCY decimal(18,5),@ChargeVATAmt decimal(18,5), @CreditAcctID nvarchar(50)
	  ,@OldBalance decimal(19,5), @NewBalance decimal(19,5))
AS
if Exists(SELECT  @ID FROM DBO.BOUTWARD_TRANS_BY_ACCT WHERE ID = @ID)
UPDATE DBO.BOUTWARD_TRANS_BY_ACCT SET [ID] = @ID,[Status] = @Status,[ProductID] = @ProductID,[ProductName] = @ProductName,[BenComID] = @BenComID
      ,[BenComName] = @BenComName,[Currency] = @Currency,[DebitAcctID] = @DebitAcctID,[DebitAcctName] = @DebitAcctName,[DebitAmount] = @DebitAmount
      ,[SendingName] = @SendingName,[SendingAddress] = @SendingAddress,[IDTaxCode] = @IDTaxCode,[ReceivingName] = @ReceivingName
      ,[ReceivingName2] = @ReceivingName2,[BenAcctID] = @BenAcctID,[LegalID] = @LegalID,[IssueDate] = @IssueDate,[IssuePlace] = @IssuePlace,[ProvinceCode] = @ProvinceCode
      ,[ProvinceName] = @ProvinceName,[Phone] = @Phone,[BankCode] = @BankCode,[BankCodeDesc] = @BankCodeDesc,[BankName] = @BankName,[PayNumber] = @PayNumber
      ,[TellerID] = @TellerID,[Narrative] = @Narrative,[Narrative2] = @Narrative2,[WaiveCharge] = @WaiveCharge,[SaveTemplate] = @SaveTemplate,[VATSerial] = @VATSerial
      ,[ChargeAmtLCY] = @ChargeAmtLCY,[ChargeVATAmt] = @ChargeVATAmt , CreditAcctID = @CreditAcctID ,OldBalance = @OldBalance , NewBalance = @NewBalance where [ID] = @ID
ELSE 
INSERT INTO DBO.BOUTWARD_TRANS_BY_ACCT([ID],[Status],[ProductID],[ProductName],[BenComID],[BenComName],[Currency],[DebitAcctID],[DebitAcctName],[DebitAmount]
      ,[SendingName],[SendingAddress],[IDTaxCode],[ReceivingName],[ReceivingName2],[BenAcctID],[LegalID],[IssueDate],[IssuePlace],[ProvinceCode],[ProvinceName]
      ,[Phone],[BankCode],[BankCodeDesc],[BankName],[PayNumber],[TellerID],[Narrative],[Narrative2],[WaiveCharge],[SaveTemplate],[VATSerial],[ChargeAmtLCY]
      ,[ChargeVATAmt], CreditAcctID , OldBalance,NewBalance) VALUES 
	  (@ID ,@Status ,@ProductID ,@ProductName ,@BenComID ,@BenComName ,@Currency ,@DebitAcctID ,@DebitAcctName ,@DebitAmount ,@SendingName ,@SendingAddress 
      ,@IDTaxCode ,@ReceivingName ,@ReceivingName2 ,@BenAcctID ,@LegalID ,@IssueDate ,@IssuePlace ,@ProvinceCode ,@ProvinceName ,@Phone ,@BankCode ,@BankCodeDesc 
      ,@BankName ,@PayNumber ,@TellerID ,@Narrative ,@Narrative2 ,@WaiveCharge ,@SaveTemplate ,@VATSerial ,@ChargeAmtLCY ,@ChargeVATAmt, @CreditAcctID, @OldBalance,@NewBalance)
GO


