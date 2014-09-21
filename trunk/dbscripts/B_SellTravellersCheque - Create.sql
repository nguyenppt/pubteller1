CREATE TABLE [dbo].[B_SellTravellersCheque](
	[TTNo] [varchar](50) NOT NULL,
	[CustomerName] [nvarchar](150) NOT NULL,
	[CustomerAddress] [nvarchar](150) NOT NULL,
	[CustomerPassportNo] [varchar](50) NOT NULL,
	[CustomerPassportDateOfIssue] [varchar](10) NULL,
	[CustomerPassportPlaceOfIssue] [varchar](50) NULL,
	[CustomerPhoneNo] [varchar](50) NULL,
	[TellerID] [varchar](50) NOT NULL,
	[TCCurrency] [varchar](3) NOT NULL,
	[DebitAccount] [varchar](50) NOT NULL,
	[TCAmount] [decimal](18, 4) NOT NULL,
	[DrCurrency] [varchar](3) NOT NULL,
	[CrAccount] [varchar](50) NOT NULL,
	[AmountDebited] [decimal](18, 4) NULL,
	[ExchangeRate] [decimal](18, 4) NULL,
	[Narrative] [nvarchar](200) NULL,
	[Status] [varchar](3) NULL,
	[UserCreate] [varchar](50) NOT NULL,
	[DateTimeCreate] [datetime] NOT NULL,
	[UserApprove] [varchar](50) NULL,
	[DateTimeApprove] [datetime] NULL
) ON [PRIMARY]

