USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[BCOLLECTCHARGESFROMACCOUNT_GetbyStatus_2]    Script Date: 03/10/2014 1:21:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BCOLLECTCHARGESFROMACCOUNT_GetbyStatus_2]
as 
select aa.ID, aa.Code, at.AccountTypeName, aa.CustomerAccount ,aa.ChargAmount from 
		(select a.ID ,Code, AccountType,CustomerAccount, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY) ChargAmount
		, ValueDate, CategoryPLCode, CategoryPLName, a.DealRate, ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) VatAmount, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY) TotalAmount, a.Narrative, VatSerialNo,
							  a.CreateBy, a.CreateDate, a.UpdatedBy, a.UpdatedDate, a.AuthorizedBy, a.AuthorizedDate, a.Status
		 from dbo.BCOLLECTCHARGESFROMACCOUNT a where a.Status != 'AUT') aa
		 JOIN
		 (
		select '1' id, 'Non Term Saving Account' as AccountTypeName
		union all
		select '2', 'Saving Account - Arrear' 
		union all
		select '3', 'Saving Account - Periodic'
		union all
		select '4', 'Saving Account - Discounted'
		union all
		select '5', 'Loan Working Account'
	) at on aa.AccountType= at.id
GO


