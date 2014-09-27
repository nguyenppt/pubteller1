USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[B_OPEN_LOANWORK_ACCT_Get_ALLCustomerID]    Script Date: 27/09/2014 8:32:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[B_OPEN_LOANWORK_ACCT_Get_ALLCustomerID] 
as 
BEGIN

SELECT [CustomerID],
      [GBFullName],[CustomerID]+' - ' +[GBFullName] as CustomerHasName,
	  [DocType],[DocID], [DocIssuePlace]
      ,[DocIssueDate]
      ,[DocExpiryDate], GbStreet+', '+ gbdist+', '+ TentinhThanh+', ' as Address, 
	  case 
		when MobilePhone ='' or MobilePhone is null  then  OfficeNumber
		when MobilePhone !='' then MobilePhone
	  end as Telephone, convert(nvarchar(10),isnull([DocIssueDate],''),101) as DocIssueDate2
	   from [dbo].[BCUSTOMER_INFO] order by [CustomerID]
END




GO


