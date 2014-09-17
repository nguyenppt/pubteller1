ALTER TABLE [dbo].[B_CustomerSignature]
add
	[SignaturesNew] [varchar](5000) NULL

/*CREATE TABLE [dbo].[B_CustomerSignature](
	[CustomerId] [varchar](50) NOT NULL,
	[Signatures] [varchar](5000) NOT NULL,
	[Status] [varchar](3) NULL,
	[UserCreate] [varchar](50) NOT NULL,
	[DateTimeCreate] [datetime] NOT NULL,
	[UserApprove] [varchar](50) NULL,
	[DateTimeApprove] [datetime] NULL
) ON [PRIMARY]*/