USE [bisolutions_vvcb]
GO

/****** Object:  Table [dbo].[BINWARD_PROC_CRE_ACCT]    Script Date: 29/10/2014 5:28:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BINWARD_PROC_CRE_ACCT](
	[ID] [nvarchar](20) NULL,
	[Status] [nvarchar](5) NULL,
	[ClearingID] [nvarchar](20) NULL,
	[DebitCurrency] [nvarchar](5) NULL,
	[DebitAccount] [nvarchar](20) NULL,
	[DebitAmtLCY] [decimal](18, 5) NULL,
	[DebitAmtFCY] [decimal](18, 5) NULL,
	[DealRate] [numeric](18, 5) NULL,
	[TempAmt] [decimal](18, 5) NULL,
	[BOName] [nvarchar](250) NULL,
	[CreditCurrency] [nvarchar](5) NULL,
	[CreditAcctID] [nvarchar](30) NULL,
	[CreditAcctName] [nvarchar](50) NULL,
	[CreditAmtLCY] [decimal](18, 5) NULL,
	[CreditAmtFCY] [decimal](18, 5) NULL,
	[FOName] [nvarchar](250) NULL,
	[FOName2] [nvarchar](250) NULL,
	[LegalID] [nvarchar](50) NULL,
	[IssueDate] [datetime] NULL,
	[Telephone] [nvarchar](50) NULL,
	[IssuePlace] [nvarchar](250) NULL,
	[Narrative] [nvarchar](250) NULL,
	[Narrative2] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[ActiveFlag] [char](1) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[BINWARD_PROC_CRE_ACCT] ADD  CONSTRAINT [BINWARD_PROC_CRE_ACCT_Createddate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[BINWARD_PROC_CRE_ACCT] ADD  CONSTRAINT [BINWARD_PROC_CRE_ACCT_ActiveFlag]  DEFAULT ('1') FOR [ActiveFlag]
GO


