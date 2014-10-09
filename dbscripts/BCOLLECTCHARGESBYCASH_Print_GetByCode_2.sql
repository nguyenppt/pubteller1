CREATE PROCEDURE DBO.[BCOLLECTCHARGESBYCASH_Print_GetByCode_2] (@Code nvarchar(40))
AS BEGIN
SELECT N'' + convert(nvarchar(50), VatSerialNo) as VatNo, 
		ISNULL(NULLIF(CustomerName,''),CUstomerName_vanglai) as CustomerName,
		CustomerAddress as CustomerAddress,
		teller as UserNameLogin,
		CustomerID,
		Code as DocCollectCode,
		DocID as IdentityNo,
		N'THU TIỀN MẶT' as VatType,
		AccountID as ChargeAcct,
		Narrative as ChargeRemarks,
		ISNULL(NULLIF(VatAmountFCY, 0), VatAmountLCY) as VAT,
		convert(nvarchar,convert(money, ISNULL(NULLIF(ChargAmountFCY, 0), ChargAmountLCY)),1) as SoTienThanhToan,
		convert(nvarchar,convert(money, ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY)),1) as Tong,  --+ case when Currency = 'VND' then N' đồng' else N' đô la Mỹ' end
		rtrim(dbo.f_CurrencyToText(ISNULL(NULLIF(TotalAmountFCY, 0), TotalAmountLCY),Currency))  SoTienBangChu
		,[CategoryPLCode]
		,[CategoryPLName]
		
FROM [dbo].[BCOLLECTCHARGESBYCASH] where @Code = Code
END
-- select rtrim(dbo.f_CurrencyToTextVN())  SoTienBangChu