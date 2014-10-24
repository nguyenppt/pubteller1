USE [bisolutions_vvcb]
GO

/****** Object:  Table [dbo].[BINWARD_CASH_WITHDRAW]    Script Date: 24/10/2014 9:43:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BINWARD_CASH_WITHDRAW](
	[ID] [nvarchar](20) NULL,
	[Status] [nvarchar](5) NULL,
	[ClearingID] [nvarchar](20) NULL,
	[DebitCurrency] [nvarchar](5) NULL,
	[DebitAccount] [nvarchar](20) NULL,
	[DebitAmtLCY] [decimal](18, 4) NULL,
	[DebitAmtFCY] [decimal](18, 4) NULL,
	[DealRate] [numeric](18, 5) NULL,
	[CreditAcctID] [nvarchar](20) NULL,
	[CreditAcctName] [nvarchar](50) NULL,
	[CreditCurrency] [nvarchar](5) NULL,
	[CreditAmtLCY] [decimal](18, 4) NULL,
	[CreditAmtFCY] [decimal](18, 4) NULL,
	[BOName] [nvarchar](250) NULL,
	[FOName] [nvarchar](250) NULL,
	[IdentityCard] [nvarchar](50) NULL,
	[IssueDate] [datetime] NULL,
	[IssuePlace] [nvarchar](250) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Narrative1] [nvarchar](250) NULL,
	[Narrative2] [nvarchar](250) NULL,
	[CreatedUser] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[ActiveFlag] [char](1) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[BINWARD_CASH_WITHDRAW] ADD  CONSTRAINT [BINWARD_CASH_WITHDRAW_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[BINWARD_CASH_WITHDRAW] ADD  CONSTRAINT [BINWARD_CASH_WITHDRAW_ActiveFlag]  DEFAULT ('1') FOR [ActiveFlag]
GO


