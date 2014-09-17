USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[OPEN_INDIVIDUAL_CUSTOMER_CheckDocID_Exists]    Script Date: 17/09/2014 2:35:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OPEN_INDIVIDUAL_CUSTOMER_CheckDocID_Exists](@CustomerID nvarchar(20),@CustomerType char(1),@DocID nvarchar(50))
AS
IF Exists(select DocID from [dbo].[BCUSTOMER_INFO] Where @DocID = DocID and @CustomerType=CustomerType and Status= 'AUT')
SELECT 'YES' AS [Exists] 
ELSE SELECT 'NO' AS [Exists] 

GO


