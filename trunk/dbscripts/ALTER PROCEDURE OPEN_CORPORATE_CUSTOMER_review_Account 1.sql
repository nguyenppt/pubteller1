USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[OPEN_CORPORATE_CUSTOMER_review_Account]    Script Date: 19/09/2014 10:11:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[OPEN_CORPORATE_CUSTOMER_review_Account](@CustomerID nvarchar(20), @Status nvarchar(3), @CustomerType char(1)
						,@LoadFor_List1_review2 nvarchar(2))
as
begin
	IF @LoadFor_List1_review2 = '1'
	BEGIN 
			SELECT cus.CustomerID, cus.[Status], GBShortName, GBFullName,IncorpDate , GBStreet, GBDist, MaTinhThanh, TenTinhThanh,
                CountryCode, CountryName, NationalityCode, NationalityName, ResidenceCode, ResidenceName
            , DocType, DocID, DocIssuePlace, DocIssueDate, DocExpiryDate, ContactPerson, Position, Telephone, EmailAddress, Remarks
            , SectorCode, SectorName, SubSectorCode, SubSectorName, IndustryCode, IndustryName, SubIndustryCode
            , SubIndustryName, TargetCode, AccountOfficer, ContactDate, RelationCode, OfficeNumber
            , TotalCapital, NoOfEmployee, TotalAssets, TotalRevenue, CustomerLiability, LegacyRef,ApprovedUser,[Signatures]
			FROM BCUSTOMER_INFO as cus LEFT JOIN [B_CustomerSignature] as sig on cus.CustomerID = sig.[CustomerId] WHERE cus.Status=@Status and cus.CustomerType=@CustomerType
			ORDER BY ContactDate DESC
	END
	ELSE
	BEGIN
		SELECT cus.CustomerID, cus.[Status], GBShortName, GBFullName,IncorpDate , GBStreet, GBDist, MaTinhThanh, TenTinhThanh,
                CountryCode, CountryName, NationalityCode, NationalityName, ResidenceCode, ResidenceName
            , DocType, DocID, DocIssuePlace, DocIssueDate, DocExpiryDate, ContactPerson, Position, Telephone, EmailAddress, Remarks
            , SectorCode, SectorName, SubSectorCode, SubSectorName, IndustryCode, IndustryName, SubIndustryCode
            , SubIndustryName, TargetCode, AccountOfficer, ContactDate, RelationCode, OfficeNumber
            , TotalCapital, NoOfEmployee, TotalAssets, TotalRevenue, CustomerLiability, LegacyRef,ApprovedUser,[Signatures]
			FROM BCUSTOMER_INFO as cus LEFT JOIN [B_CustomerSignature] as sig on cus.CustomerID = sig.[CustomerId] WHERE cus.CustomerID=@CustomerID and cus.Status=@Status and cus.CustomerType=@CustomerType
			ORDER BY ContactDate DESC
	END
END


GO


