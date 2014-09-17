USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[B_SAVING_ACC_GET_NEWID]    Script Date: 17/09/2014 3:22:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[B_SAVING_ACC_GET_NEWID] 
	@SavingAccFunc varchar(30) = NULL
as
DECLARE @MAXValue VARCHAR(10)
		,@NEWValue VARCHAR(10)
		,@NEW_ID VARCHAR(10);

IF @SavingAccFunc != 'ARREAR' AND 
	@SavingAccFunc != 'PERIODIC' AND
	@SavingAccFunc != 'DISCOUNTED'
BEGIN
	RAISERROR ('Input parameter is invalid!', 16, 1)
END

SELECT @MAXValue=(select SoTT from BMACODE where MaCode = 'BDEPOSITACCTS')
UPDATE BMACODE SET SoTT = SoTT + 1 where MaCode = 'BDEPOSITACCTS'
SET @NEWValue= REPLACE(@MaxValue,'03.','')+1

SET @NEW_ID = ''+
    CASE
       WHEN LEN(@NEWValue)<9
          THEN REPLICATE('0',9-LEN(@newValue))
          ELSE ''
       END +
       @NEWValue

IF @SavingAccFunc = 'ARREAR'		
BEGIN
	select '07' + @NEW_ID+ '7' as Code
END
ELSE IF @SavingAccFunc = 'PERIODIC'
BEGIN
	select '07' + @NEW_ID+ '8' as Code
END
ELSE IF @SavingAccFunc = 'DISCOUNTED'
BEGIN
	select '07' + @NEW_ID+ '9' as Code
END
GO

