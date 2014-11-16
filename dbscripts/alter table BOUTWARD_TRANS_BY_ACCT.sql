alter table [dbo].[BOUTWARD_TRANS_BY_ACCT] add CreditAcctID nvarchar(50)
alter table [dbo].[BTRANSFERWITHDRAWAL] add CustomerIDDebit nvarchar(20), CustomerNameDebit nvarchar(250), CustomerIDCredit nvarchar(20), CustomerNameCredit nvarchar(250)
alter table[dbo].[BTRANSFERWITHDRAWAL] add DebitCurrency nvarchar(5), CreditCurrency nvarchar(5)
