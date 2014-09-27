USE [bisolutions_vvcb]
GO

/****** Object:  Table [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM]    Script Date: 27/09/2014 8:35:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM](
	[ID] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](5) NULL,
	[CustomerID] [nvarchar](20) NULL,
	[CustomerName] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[LegalID] [nvarchar](50) NULL,
	[IssueDate] [datetime] NULL,
	[Telephone] [nvarchar](50) NULL,
	[PlaceOfIssue] [nvarchar](150) NULL,
	[TellerID] [nvarchar](50) NULL,
	[DebitCurrency] [nvarchar](5) NULL,
	[DebitAccount] [nvarchar](20) NULL,
	[DebitAmt] [decimal](18, 2) NULL,
	[CreditCurrency] [nvarchar](5) NULL,
	[CreditAccount] [nvarchar](20) NULL,
	[DealRate] [numeric](19, 5) NULL,
	[CreditAmt] [decimal](19, 2) NULL,
	[CreditCardNumber] [nvarchar](50) NULL,
	[WaiveCharges] [nvarchar](5) NULL,
	[Narrative] [nvarchar](350) NULL,
	[Narrative2] [nvarchar](350) NULL,
	[CreatedDate] [datetime] NULL,
	[ActiveFlag] [char](1) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM] ADD  CONSTRAINT [CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[BCOLLECTION_FOR_CRE_CARD_PAYM] ADD  CONSTRAINT [ActiveFlag]  DEFAULT ('1') FOR [ActiveFlag]
GO


