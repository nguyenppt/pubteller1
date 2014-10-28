USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[B_BMACODE_3part_varMaCode_varSP]    Script Date: 28/10/2014 2:10:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[B_BMACODE_3part_varMaCode_varSP]
(@MaCode_BMACODE nvarchar(100)
,@refix nvarchar(50)
, @flag char(1))
as
begin
DECLARE @MaxValue varchar(10), @NEWValue varchar(10), @NEW_ID nvarchar(10)

 SELECT @MaxValue=( SELECT SoTT from BMACODE WHERE MaCode=@MaCode_BMACODE)
 update BMACODE set SoTT = SoTT + 1 where MaCode=@MaCode_BMACODE

 SET @NEWValue = Replace(@MaxValue,'03.','') +1
 SET @NEW_ID = ''+
    CASE
       WHEN LEN(@NEWValue)<5
          THEN REPLICATE('0',5-LEN(@newValue))
          ELSE ''
       END +
       @NEWValue
select @refix + @flag + CONVERT(nvarchar,right(YEAR(getdate()),2))+CONVERT(nvarchar,DATEDIFF(Day,CONVERT(datetime,'1/1/' + convert(nvarchar,YEAR(getdate()),103)),getdate())) + '.'+  @NEW_ID as Code
END
GO


