USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_Insert]    Script Date: 27/09/2014 8:40:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

					 
CREATE PROCEDURE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT_Insert](@ID nvarchar(20),@Status nvarchar(5),@DebitCustomerID nvarchar(20),@DebitCustomerName nvarchar(250)
      ,@TellerID nvarchar(50),@DebitCurrency nvarchar(5),@DebitAccount nvarchar(20),@DebitAmt decimal(18,2),@NextTransCom decimal(18,2),@OldBalance decimal(18,2)
      ,@NewBalance decimal(18,2),@ValueDate datetime,@CreditAccount nvarchar(30),@CreditCurrency nvarchar(5)
      ,@CreditAmt decimal(18,2),@ValueDate2 datetime,@CreditCardNumber nvarchar(50),@WaiveCharges nvarchar(20),@Narrative nvarchar(350)
      ,@Narrative2 nvarchar(350))
AS 
IF EXISTS (SELECT ID FROM DBO.BTRANSFER_4_CRE_CARD_PAYMENT WHERE ID = @ID)
	UPDATE DBO.BTRANSFER_4_CRE_CARD_PAYMENT SET ID=@ID,[Status] = @Status,[DebitCustomerID] = @DebitCustomerID,[DebitCustomerName] = @DebitCustomerName
      ,[TellerID] = @TellerID,[DebitCurrency] = @DebitCurrency,[DebitAccount] = @DebitAccount,[DebitAmt] = @DebitAmt,[NextTransCom] = @NextTransCom
      ,[OldBalance] = @OldBalance,[NewBalance] = @NewBalance,[ValueDate] = @ValueDate
      ,[CreditAccount] = @CreditAccount,[CreditCurrency] = @CreditCurrency,[CreditAmt] = @CreditAmt,[ValueDate2] = @ValueDate2
      ,[CreditCardNumber] = @CreditCardNumber,[WaiveCharges] = @WaiveCharges,[Narrative] = @Narrative,[Narrative2] = @Narrative2 WHERE ID = @ID
ELSE 
	INSERT INTO DBO.BTRANSFER_4_CRE_CARD_PAYMENT([ID],[Status],[DebitCustomerID],[DebitCustomerName],[TellerID],[DebitCurrency],[DebitAccount],[DebitAmt]
      ,[NextTransCom],[OldBalance],[NewBalance],[ValueDate],[CreditAccount],[CreditCurrency],[CreditAmt]
      ,[ValueDate2],[CreditCardNumber],[WaiveCharges],[Narrative],[Narrative2]) values
	  (@ID,@Status,@DebitCustomerID,@DebitCustomerName,@TellerID,@DebitCurrency,@DebitAccount,@DebitAmt,@NextTransCom,@OldBalance,@NewBalance,@ValueDate
      ,@CreditAccount,@CreditCurrency,@CreditAmt,@ValueDate2,@CreditCardNumber,@WaiveCharges,@Narrative
      ,@Narrative2)

GO


