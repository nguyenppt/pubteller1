USE [bisolutions_vvcb]
GO

/****** Object:  Table [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT]    Script Date: 27/09/2014 8:39:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT](
	[ID] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](5) NULL,
	[DebitCustomerID] [nvarchar](20) NULL,
	[DebitCustomerName] [nvarchar](250) NULL,
	[TellerID] [nvarchar](50) NULL,
	[DebitCurrency] [nvarchar](5) NULL,
	[DebitAccount] [nvarchar](20) NULL,
	[DebitAmt] [decimal](18, 2) NULL,
	[NextTransCom] [decimal](18, 2) NULL,
	[OldBalance] [decimal](18, 2) NULL,
	[NewBalance] [decimal](18, 2) NULL,
	[ValueDate] [datetime] NULL,
	[CreditAccount] [nvarchar](20) NULL,
	[CreditCurrency] [nvarchar](5) NULL,
	[CreditAmt] [decimal](19, 2) NULL,
	[ValueDate2] [datetime] NULL,
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

ALTER TABLE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT] ADD  CONSTRAINT [BTRANSFER_4_CRE_CARD_PAYMENT_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[BTRANSFER_4_CRE_CARD_PAYMENT] ADD  CONSTRAINT [BTRANSFER_4_CRE_CARD_PAYMENT_ActiveFlag]  DEFAULT ('1') FOR [ActiveFlag]
GO


