--Updating NCLEX data with the 2017 data to update the Mktintel reports with the most current data, 
--this is already loaded in the HM database in NCLEXInstitutionPassRate_2017passrate
IF (EXISTS (SELECT * 
                 FROM ATIAnalytics.INFORMATION_SCHEMA.TABLES 
                 WHERE 
					TABLE_SCHEMA = 'Reports' 
                 AND  TABLE_NAME = 'MktIntel_NCLEX'))

BEGIN
    
	Truncate Table [ATIAnalytics].[Reports].[MktIntel_NCLEX]

END

ELSE

Begin

CREATE TABLE [ATIAnalytics].[Reports].[MktIntel_NCLEX](
	[InstitutionID] [int] NOT NULL,
	[NCLEXPassRateID] [int] NOT NULL,
	[PassRateYear] [smallint] NULL,
	[PassRate] [decimal](10, 2) NULL,
	[loaddate] [datetime] NULL,
	[Guid] [varchar](100) NULL
) ON [PRIMARY]
	

End


BEGIN

IF EXISTS (SELECT NAME FROM ATIAnalytics.sys.indexes 
                 WHERE NAME = 'NCL_INDX_MktIntel_NCLEXByInstitutionID')

	DROP INDEX NCL_INDX_MktIntel_NCLEXByInstitutionID ON [ATIAnalytics].[Reports].[MktIntel_NCLEX];   



--Populate the table
insert into [ATIAnalytics].[Reports].[MktIntel_NCLEX]
select bb.[InstitutionID], bb.[NCLEXPassRateID],bb.[PassRateYear],bb.[PassRate],bb.[TableUpdated],bb.[Guid]
from (
	select [InstitutionID],[NCLEXPassRateID],[PassRateYear],[PassRate],[TableUpdated],[Guid],
	ROW_NUMBER() over (partition by [InstitutionID] order by [PassRateYear] desc,[NCLEXPassRateID]) as PR_Rank
	from
		(
		select a.[InstitutionID], a.[NCLEXPassRateID],a.[PassRateYear],a.[PassRate],a.[TableUpdated],a.[Guid],
		ROW_NUMBER() over (partition by a.[InstitutionID],a.[PassRateYear] order by a.[NCLEXPassRateID] desc) as Rec_Rank
		from HM.dbo.NCLEXInstitutionPassRate_2017passrate a
		join ATIAnalytics.[Reports].[MktIntel_NCLEX] c
		on a.[InstitutionID] = c.[InstitutionID] 
		) non_dups --Ensure no duplications of Inst and PassRateYear
	where Rec_Rank = 1
	) bb
where PR_Rank < 4 --Pull the last 3 NCLEX Pass Rates
order by 1,3 desc
END


BEGIN
    
	CREATE NONCLUSTERED INDEX NCL_INDX_MktIntel_NCLEXByInstitutionID
	ON ATIAnalytics.[Reports].[MktIntel_NCLEX] ([InstitutionID])

END

