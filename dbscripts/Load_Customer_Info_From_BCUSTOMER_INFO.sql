USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[Load_Customer_Info_From_BCUSTOMER_INFO]    Script Date: 07/11/2014 11:53:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_Customer_Info_From_BCUSTOMER_INFO](@CustomerID nvarchar(30))
AS
SELECT [GBFullName]
      ,[DocID]
      ,[DocIssuePlace],[DocType]
      ,[DocIssueDate], [GBStreet] +', '+[GBDist]+', '+[TenTinhThanh]+', '+[CountryName] as Address
      ,ISNULL(NULLIF([MobilePhone],''),[OfficeNumber]) AS Phone
	   FROM [dbo].[BCUSTOMER_INFO] 
	   where Status='AUT' and @CustomerID = CustomerID
GO


