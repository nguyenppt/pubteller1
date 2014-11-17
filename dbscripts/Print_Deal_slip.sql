USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[Print_Deal_slip]    Script Date: 17/11/2014 6:29:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Print_Deal_slip](@type nvarchar(50),@typeProduct nvarchar(50), @RefID nvarchar(50))
AS
DECLARE @NUM decimal

IF(@type = 'Trans_By_Acct')
	BEGIN
	IF (@typeProduct = 'CITAD')
		BEGIN
	
			set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
			update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'
	
			SELECT [ID] AS RefID, day([CreatedDate]) as day, month([CreatedDate]) as month, year([CreatedDate]) as year,
			 right('0'+ convert(nvarchar,day(getdate())),2) +  right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) + ' .' + right('00000'+ convert(nvarchar,@NUM),6) as CT, sendingNaME as CustomerName, [DebitAcctID] as DebitAcct, [IDTaxCode] as LegalID_send, 
			convert(nvarchar,convert(money,[DebitAmount]) ,1) +'  '+ [Currency] as Amt_cur, dbo.f_CurrencyToText([DebitAmount],[Currency] ) as sotienchu, [CreditAcctID] as CreditAcct, [LegalID] as LegalID_rec
			, [Narrative]+ ', '+[Narrative2]   as Narrative , TellerID as Teller 
			FROM [dbo].[BOUTWARD_TRANS_BY_ACCT] WHERE @RefID = ID
		END ELSE IF(@typeProduct = 'CMND')
		BEGIN
			set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
			update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'
	
			SELECT [ID] AS RefID, day([CreatedDate]) as day, month([CreatedDate]) as month, year([CreatedDate]) as year,
			 right('0'+ convert(nvarchar,day(getdate())),2) +  right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) +  ' .' + right('00000'+ convert(nvarchar,@NUM),6) as CT, sendingNaME as CustomerName, [DebitAcctID] as DebitAcct, [IDTaxCode] as LegalID_send, 
			convert(nvarchar,convert(money,[DebitAmount]) ,1) +'  '+ [Currency] as Amt_cur, dbo.f_CurrencyToText([DebitAmount],[Currency] ) as sotienchu, [CreditAcctID] as CreditAcct, '' as LegalID_rec
			, [Narrative]+ ', '+[Narrative2]   as Narrative  , TellerID as Teller 
			FROM [dbo].[BOUTWARD_TRANS_BY_ACCT] WHERE @RefID = ID
		END
	END
ELSE IF (@type = 'Trans_By_Cash')	
	BEGIN
	IF(@typeProduct = 'CITAD')
		BEGIN
		set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
		update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'
		SELECT [SendingName] , [SendingAddress1]+', '+ [SendingAddress2] as SendingAddress, [SendingPhone], [ReceivingName], [BenAccountID],[BankCodeID]
		,[CashAccountID] as TKNo, convert(nvarchar,convert(money,[Amount]) ,1) +'  '+ [Currency] as Amt_cur, dbo.f_CurrencyToText([Amount],[Currency] ) as sotienchu
		,[Narrative1]+', '+[Narrative2]+', '+[Narrative3] as Narrative, [ID] AS RefID,  day([CreatedDate]) as day, month([CreatedDate]) as month, year([CreatedDate]) as year,
		right('0'+ convert(nvarchar(2),day(getdate())),2) +  right('0'+ convert(nvarchar(2),month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) + ' .' +right('00000'+ convert(nvarchar,@NUM),6) as CT
		,[CreditAcctID] as TKCo, Teller as Teller 
		FROM [dbo].[BOUTWARD_TRANS_BY_CASH] WHERE @RefID = ID
		END
	ELSE IF (@typeProduct = 'CMND')
		BEGIN
		set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
		update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'
		SELECT [SendingName] , [SendingAddress1]+', '+ [SendingAddress2] as SendingAddress, [SendingPhone], [ReceivingName], [IdentityCard] AS LegalID_Rece, LEFT(convert(nvarchar,[IssueDate],103),10) as IssueDate,[IssuePlace]
		,[CashAccountID] as TKNo, convert(nvarchar,convert(money,[Amount]) ,1) +'  '+ [Currency] as Amt_cur, dbo.f_CurrencyToText([Amount],[Currency] ) as sotienchu
		,[Narrative1]+', '+[Narrative2]+', '+[Narrative3] as Narrative, [ID] AS RefID,  day([CreatedDate]) as day, month([CreatedDate]) as month, year([CreatedDate]) as year,
		right('0'+ convert(nvarchar,day(getdate())),2) +  right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) + ' .' + right('00000'+ convert(nvarchar,@NUM),6) as CT
		,[CreditAcctID] as TKCo, Teller as Teller 
		FROM [dbo].[BOUTWARD_TRANS_BY_CASH] WHERE @RefID = ID
		END
	END
ELSE IF(@type = 'Cheque' AND @typeProduct = 'withdrwal')
	BEGIN
		set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
		update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'
		SELECT [BeneficialName] , [LegalID] ,[PlaceOfIssue],[CustomerName] AS TenTKNo,[AccountCode] as SoTKNo, LEFT(convert(nvarchar,[IssuedDate],103),10) as IssueDate
		, convert(nvarchar,convert(money,[AmountLCY]) ,1) +'  '+ [Currency] as Amt_cur, dbo.f_CurrencyToText([AmountLCY],[Currency] ) as sotienchu,[Narrative]
		,[ChequeNo], [ID] AS RefID,  day([CreatedDate]) as day, month([CreatedDate]) as month, year([CreatedDate]) as year, TellerID as Teller,
		right('0'+ convert(nvarchar,day(getdate())),2) +  right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) + ' .' + right('00000'+ convert(nvarchar,@NUM),6) as CT
		FROM [dbo].[BCHEQUE_WITHDRAWAL] WHERE @RefID = ID
	END
ELSE IF(@type = 'Transfer' AND @typeProduct = 'Withdrawal')
	BEGIN
		set @num = (select [SoTT] from [dbo].[BMACODE] where [MaCode] = 'INCREASE_NUM')
		update [dbo].[BMACODE]  set SoTT = SoTT + 1 where [MaCode] = 'INCREASE_NUM'

		SELECT convert(nvarchar,convert(money,[DebitAmount]) ,1) +'  '+ [DebitCurrency] as Amt_cur_Debit, tr.Teller as Teller,
		 dbo.f_CurrencyToText([DebitAmount],[DebitCurrency] ) as sotienchu_Debit,
		convert(nvarchar,convert(money,[AmountCreditForCustomer]) ,1) +'  '+ [CreditCurrency] as Amt_cur_Credit,
		 dbo.f_CurrencyToText([AmountCreditForCustomer],[CreditCurrency] ) as sotienchu_Credit
		,[Narrative], tr.code as RefID
		, day(tr.[CreateDate]) as day, month(tr.[CreateDate]) as month, year(tr.[CreateDate]) as year,
		right('0'+ convert(nvarchar,day(getdate())),2) +  right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,year(getdate())),4) + ' .' + right('00000'+ convert(nvarchar,@NUM),6) as CT,
		[DebitAccount] as DebitAcct , [CustomerNameDebit] as Customer_Debit, [CreditAccount] as CreditAcct ,[CustomerNameCredit] as Customer_Credit,
		cus.[DocID] as LegalID, cus2.[DocID] as LegalID_Credit, [Narrative]
		FROM [dbo].[BTRANSFERWITHDRAWAL] as tr JOIN [dbo].[BCUSTOMER_INFO] as cus on tr.[CustomerIDDebit] = cus.[CustomerID] join [dbo].[BCUSTOMER_INFO] as cus2
		on cus2.[CustomerID] = tr.[CustomerIDCredit]
		WHERE @RefID = Code
	END

GO


