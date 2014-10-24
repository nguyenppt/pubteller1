USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[Load_ClearingID]    Script Date: 24/10/2014 9:41:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_ClearingID]
AS
SELECT ID FROM [dbo].[BOUTWARD_TRANS_BY_CASH]
GO


