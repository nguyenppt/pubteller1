CREATE TABLE [dbo].[B_BuyTravellersCheque](
	[TTNo] [varchar](50) NOT NULL,
	[CustomerName] [nvarchar](150) NOT NULL,
	[CustomerAddress] [nvarchar](150) NOT NULL,
	[CustomerPassportNo] [varchar](50) NOT NULL,
	[CustomerPassportDateOfIssue] [varchar](10) NULL,
	[CustomerPassportPlaceOfIssue] [varchar](50) NULL,
	[CustomerPhoneNo] [varchar](50) NULL,
	[TellerID] [varchar](50) NOT NULL,
	[TCCurrency] [varchar](3) NOT NULL,
	[DrAccount] [varchar](50) NULL,
	[TCAmount] [decimal](18, 4) NOT NULL,
	[CurrencyPaid] [varchar](3) NOT NULL,
	[CrTellerID] [nchar](10) NULL,
	[CrAccount] [varchar](50) NULL,
	[ExchangeRate] [decimal](18, 4) NULL,
	[ChargeAmtLCY] [decimal](18, 4) NULL,
	[ChargeAmtFCY] [decimal](18, 4) NULL,
	[AmountPaid] [decimal](18, 4) NULL,
	[Narrative] [nvarchar](500) NULL,
	[TCIssuer] [varchar](50) NOT NULL,
	[Denomination] [varchar](200) NOT NULL,
	[Unit] [varchar](200) NOT NULL,
	[SerialNo] [varchar](200) NOT NULL,
	[Status] [varchar](3) NULL,
	[UserCreate] [varchar](50) NOT NULL,
	[DateTimeCreate] [datetime] NOT NULL,
	[UserApprove] [varchar](50) NULL,
	[DateTimeApprove] [datetime] NULL
) ON [PRIMARY]
