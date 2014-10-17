USE [bisolutions_vvcb]
GO

/****** Object:  StoredProcedure [dbo].[OUT_TRANS_BY_CASH_Update_Status]    Script Date: 17/10/2014 4:39:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OUT_TRANS_BY_CASH_Update_Status](@Status nvarchar(20),@ID nvarchar(20))
AS
update  [dbo].[BOUTWARD_TRANS_BY_CASH] set status = @status WHERE ID = @ID
GO


