USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCATEGORY_GetAll_2]    Script Date: 22/09/2014 1:40:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[BCATEGORY_GetAll_2]
AS
BEGIN
select ID, CODE, NAME, TYPE,CODE + ' - ' + NAME as Display from dbo.BCATEGORY where COde in ('1000','2000')
END


GO


