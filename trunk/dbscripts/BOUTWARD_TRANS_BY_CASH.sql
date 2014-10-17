USE [bisolutions_vvcb]
GO

/****** Object:  Table [dbo].[BOUTWARD_TRANS_BY_CASH]    Script Date: 17/10/2014 4:37:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BOUTWARD_TRANS_BY_CASH](
	[ID] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NULL,
	[ProductID] [nvarchar](20) NULL,
	[ProductName] [nvarchar](150) NULL,
	[Currency] [nvarchar](5) NULL,
	[BenComID] [nvarchar](20) NULL,
	[BenComName] [nvarchar](150) NULL,
	[CreditAcctID] [nvarchar](50) NULL,
	[CreditAcctName] [nvarchar](200) NULL,
	[CashAccountID] [nvarchar](50) NULL,
	[Amount] [numeric](18, 4) NULL,
	[SendingName] [nvarchar](250) NULL,
	[SendingAddress1] [nvarchar](250) NULL,
	[SendingAddress2] [nvarchar](250) NULL,
	[SendingPhone] [nvarchar](50) NULL,
	[ReceivingName] [nvarchar](250) NULL,
	[BenAccountID] [nvarchar](50) NULL,
	[ProvinceID] [nvarchar](20) NULL,
	[ProvinceName] [nvarchar](250) NULL,
	[BankCodeID] [nvarchar](50) NULL,
	[BankCodeName] [nvarchar](250) NULL,
	[IdentityCard] [nvarchar](50) NULL,
	[IssueDate] [date] NULL,
	[IssuePlace] [nvarchar](250) NULL,
	[Teller] [nvarchar](200) NULL,
	[Narrative1] [nvarchar](250) NULL,
	[Narrative2] [nvarchar](250) NULL,
	[Narrative3] [nvarchar](250) NULL,
	[WaiveCharge] [nvarchar](50) NULL,
	[VatSerial] [nvarchar](50) NULL,
	[ChargeAmount] [numeric](18, 4) NULL,
	[VATChargeAmount] [numeric](18, 4) NULL,
	[ActiveFlag] [varchar](1) NULL,
	[CreatedDate] [date] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[BOUTWARD_TRANS_BY_CASH] ADD  CONSTRAINT [BOUTWARD_TRANS_BY_CASH_ActiveFlag]  DEFAULT ('1') FOR [ActiveFlag]
GO

ALTER TABLE [dbo].[BOUTWARD_TRANS_BY_CASH] ADD  CONSTRAINT [BOUTWARD_TRANS_BY_CASH_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO


