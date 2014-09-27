USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Insert_Update]    Script Date: 27/09/2014 8:37:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[COLLECTION_4_CRE_CARD_PAYMENT_Insert_Update](@ID nvarchar(20) ,@Status nvarchar(20),@CustomerID nvarchar(20)
      ,@CustomerName nvarchar(250),@Address nvarchar(350),@LegalID nvarchar(50),@IssueDate datetime,@Telephone nvarchar(50),@PlaceOfIssue nvarchar(150)
      ,@TellerID nvarchar(20),@DebitCurrency nvarchar(20),@DebitAccount nvarchar(20),@DebitAmt decimal(19,2),@CreditCurrency nvarchar(5)
      ,@CreditAccount nvarchar(20),@DealRate numeric(10,5),@CreditAmt decimal(19,2),@CreditCardNumber nvarchar(20),@WaiveCharges nvarchar(20),@Narrative nvarchar(250)
      ,@Narrative2 nvarchar(250))
AS
IF EXISTS (SELECT ID FROM [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM] WHERE ID = @ID)
UPDATE  [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM]  SET [ID] = @ID,[Status] = @Status,[CustomerID] = @CustomerID,[CustomerName] = @CustomerName,[Address] = @Address
      ,[LegalID] = @LegalID,[IssueDate] = @IssueDate,[Telephone] = @Telephone,[PlaceOfIssue] = @PlaceOfIssue,[TellerID] = @TellerID,[DebitCurrency] = @DebitCurrency
      ,[DebitAccount] = @DebitAccount,[DebitAmt] = @DebitAmt,[CreditCurrency] = @CreditCurrency,[CreditAccount] = @CreditAccount,[DealRate] = @DealRate
      ,[CreditAmt] = @CreditAmt,[CreditCardNumber] = @CreditCardNumber,[WaiveCharges] = @WaiveCharges,[Narrative] = @Narrative,[Narrative2] = @Narrative2
	WHERE ID = @ID
ELSE
INSERT INTO [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM] ([ID],[Status],[CustomerID],[CustomerName],[Address],[LegalID],[IssueDate]      ,[Telephone],[PlaceOfIssue]
      ,[TellerID],[DebitCurrency],[DebitAccount],[DebitAmt],[CreditCurrency],[CreditAccount],[DealRate],[CreditAmt],[CreditCardNumber],[WaiveCharges],[Narrative]
      ,[Narrative2]) VALUES
	  (@ID,@Status,@CustomerID,@CustomerName,@Address,@LegalID,@IssueDate,@Telephone,@PlaceOfIssue,@TellerID,@DebitCurrency,@DebitAccount,@DebitAmt,@CreditCurrency
      ,@CreditAccount,@DealRate,@CreditAmt,@CreditCardNumber,@WaiveCharges,@Narrative,@Narrative2)


GO


