CREATE TABLE [dbo].tblDetails(  
    [Id] [int] IDENTITY(1,1) NOT NULL,  
    [month] varchar NULL,  
    [reim] [varchar] NULL,  
    [date] [datetime] NULL,  
	[from][varchar](50)null,
	[to] [varchar](50)null,
	[end] [varchar](50)null,
	[purpose] [varchar] null,
	[mode][varchar] null,
	[km] [varchar] null,
	[invno][varchar] null,
	[amt][varchar]null,
	[attachement][varchar]null
  
) 


Create Procedure [dbo].[InsertData]  
(  
@month varchar(50),  
@reim Varchar(50),  
@date varchar(50) , 
@from varchar(50),
@to varchar(50),
  @end varchar(50),  
@purpose Varchar(50),  
@mode varchar(50)  ,
@km varchar(50),
@invno varchar(50),
@amt varchar(50),
@attachement varchar(50)
)  
as  
begin  
  
INSERT INTO [dbo].[tblDetails]  
           ([month],  [reim],  [date] , [from],[to],[end],[purpose],[mode],[km],[invno],[amt],[attachement])  
     VALUES  
           (  
           @month,  
           @reim,  
           @date ,@from,@to,@end,@purpose,@mode,@km,@invno,@amt,@attachement
		  
          )  
End 


Create procedure [dbo].[GetDataByDate]

@date dateTime

as

begin

Select * from [tblDetails] where date=@date

End