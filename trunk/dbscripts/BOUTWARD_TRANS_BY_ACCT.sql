USE [bisolutions_vvcb]
GO

/****** Object:  Table [dbo].[BOUTWARD_TRANS_BY_ACCT]    Script Date: 28/10/2014 2:13:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BOUTWARD_TRANS_BY_ACCT](
	[ID] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NULL,
	[ProductID] [nvarchar](20) NULL,
	[ProductName] [nvarchar](150) NULL,
	[BenComID] [nvarchar](50) NULL,
	[BenComName] [nvarchar](150) NULL,
	[Currency] [nvarchar](20) NULL,
	[DebitAcctID] [nvarchar](50) NULL,
	[DebitAcctName] [nvarchar](150) NULL,
	[DebitAmount] [decimal](18, 5) NULL,
	[SendingName] [nvarchar](250) NULL,
	[SendingAddress] [nvarchar](250) NULL,
	[IDTaxCode] [nvarchar](50) NULL,
	[ReceivingName] [nvarchar](250) NULL,
	[ReceivingName2] [nvarchar](250) NULL,
	[BenAcctID] [nvarchar](50) NULL,
	[LegalID] [nvarchar](50) NULL,
	[IssueDate] [datetime] NULL,
	[IssuePlace] [nvarchar](250) NULL,
	[ProvinceCode] [nvarchar](20) NULL,
	[ProvinceName] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
	[BankCode] [nvarchar](50) NULL,
	[BankCodeDesc] [nvarchar](250) NULL,
	[BankName] [nvarchar](250) NULL,
	[PayNumber] [nvarchar](50) NULL,
	[TellerID] [nvarchar](50) NULL,
	[Narrative] [nvarchar](250) NULL,
	[Narrative2] [nvarchar](250) NULL,
	[WaiveCharge] [nvarchar](50) NULL,
	[SaveTemplate] [nvarchar](50) NULL,
	[VATSerial] [nvarchar](150) NULL,
	[ChargeAmtLCY] [decimal](18, 5) NULL,
	[ChargeVATAmt] [decimal](18, 5) NULL,
	[CreatedDate] [datetime] NULL,
	[ActiveFlag] [char](1) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[BOUTWARD_TRANS_BY_ACCT] ADD  CONSTRAINT [BOUTWARD_TRANS_BY_ACCT_Createddate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[BOUTWARD_TRANS_BY_ACCT] ADD  CONSTRAINT [BOUTWARD_TRANS_BY_ACCT_ActiveFlag]  DEFAULT ('1') FOR [ActiveFlag]
GO


