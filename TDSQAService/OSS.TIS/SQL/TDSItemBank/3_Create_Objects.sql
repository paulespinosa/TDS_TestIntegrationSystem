/****** Object:  Schema [qa]    Script Date: 01/28/2015 15:21:28 ******/
CREATE SCHEMA [qa] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [tp]    Script Date: 01/28/2015 15:21:28 ******/
CREATE SCHEMA [tp] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[TestCohort]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestCohort](
	[_fk_AdminSubject] [varchar](200) NOT NULL,
	[Cohort] [int] NOT NULL,
	[ItemRatio] [float] NOT NULL,
 CONSTRAINT [PK_TestCohort] PRIMARY KEY CLUSTERED 
(
	[_fk_AdminSubject] ASC,
	[Cohort] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStimulus]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStimulus](
	[_efk_ItemBank] [bigint] NOT NULL,
	[_efk_ITSKey] [bigint] NOT NULL,
	[ClientID] [varchar](100) NULL,
	[FilePath] [varchar](50) NULL,
	[FileName] [varchar](50) NULL,
	[Version] [varchar](150) NULL,
	[DateLastUpdated] [datetime] NULL,
	[_Key] [varchar](150) NOT NULL,
	[ContentSize] [int] NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
 CONSTRAINT [PK_tblStimulus_1] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_tblStimulus] ON [dbo].[tblStimulus] 
(
	[_efk_ItemBank] ASC,
	[_efk_ITSKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAlternateTest]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAlternateTest](
	[_Key] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[_fk_AdminSubject] [bigint] NOT NULL,
	[FormLang] [char](128) NOT NULL,
	[FilePath] [char](255) NOT NULL,
 CONSTRAINT [PK_tblAlternateTest] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[SubjectCodes]    Script Date: 01/28/2015 15:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SubjectCodes]
as
select 'Mathematics' as Subject, 'MA' as SubjectCode 
union select 'Math' as Subject, 'MA' as SubjectCode 
union select  'Reading' as Subject, 'RE' as SubjectCode 
union select  'Science' as Subject, 'SC' as SubjectCode 
union select  'Social Sciences' as Subject, 'SS' as SubjectCode 
union select  'Social Studies' as Subject, 'SS' as SubjectCode 
union select  'ELA' as Subject, 'EL' as SubjectCode 
union select  'Writing' as Subject, 'WR' as SubjectCode 
union select  'ELPA Speaking' as Subject, 'ELPA' as SubjectCode 
union select  'ELPA' as Subject, 'ELPA' as SubjectCode
GO
/****** Object:  Table [dbo].[tblItem]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblItem](
	[_efk_ItemBank] [bigint] NOT NULL,
	[_efk_Item] [bigint] NOT NULL,
	[ItemType] [varchar](50) NULL,
	[Answer] [varchar](50) NULL,
	[ScorePoint] [int] NULL,
	[FilePath] [varchar](50) NULL,
	[FileName] [varchar](50) NULL,
	[Version] [varchar](150) NULL,
	[DateLastUpdated] [datetime] NULL,
	[ItemID] [varchar](80) NULL,
	[_Key] [varchar](150) NOT NULL,
	[ContentSize] [int] NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
 CONSTRAINT [PK_tblItem_1] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblItem] ON [dbo].[tblItem] 
(
	[_efk_ItemBank] ASC,
	[_efk_Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigsLoaded]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConfigsLoaded](
	[ConfigID] [int] NOT NULL,
	[BankKey] [bigint] NOT NULL,
	[ClientName] [varchar](200) NOT NULL,
	[Contract] [varchar](200) NOT NULL,
	[_date] [datetime] NOT NULL,
	[_error] [varchar](max) NULL,
	[TDSConfigs_Updated] [datetime] NULL,
	[_Key] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ConfigsLoaded] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AllowedItemProps]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllowedItemProps](
	[propertyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AllowedProps] PRIMARY KEY CLUSTERED 
(
	[propertyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_dblatency]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_dblatency](
	[duration] [int] NOT NULL,
	[endtime] [datetime] NOT NULL,
	[procname] [varchar](50) NOT NULL,
	[starttime] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[CharCount]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CharCount]
(
	@StringToCheck varchar(256),
	@Char char(1)
)
RETURNS int
AS
BEGIN
	return len(@StringToCheck) - len(replace(@StringToCheck, @Char, ''))
END
GO
/****** Object:  Table [dbo].[AA_ItemCL]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AA_ItemCL](
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[_fk_Item] [varchar](25) NOT NULL,
	[ContentLevel] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ItemCL] PRIMARY KEY CLUSTERED 
(
	[_fk_AdminSubject] ASC,
	[_fk_Item] ASC,
	[ContentLevel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_AAItemkey] ON [dbo].[AA_ItemCL] 
(
	[_fk_Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_TestUpdate]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_TestUpdate](
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[configID] [bigint] NOT NULL,
	[_date] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Sys_FormtestItems]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Sys_FormtestItems](
	[testID] [varchar](100) NOT NULL,
	[bankKey] [bigint] NOT NULL,
	[itemKey] [bigint] NOT NULL,
 CONSTRAINT [PK_SysFormItems] PRIMARY KEY CLUSTERED 
(
	[testID] ASC,
	[bankKey] ASC,
	[itemKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split] 
(
	@value varchar(max),
	@delim varchar(1),
	@leftSideIsLabel bit
)
RETURNS 
@DistinctValues TABLE 
(
	Label varchar(max),
	Value varchar(max)
)
AS
BEGIN
	declare @indStart int
	declare @indEnd int

	set @indStart = 0
	
	-- find the first occurrence of the delimiter
	set @indEnd = charindex(@delim, @value, @indStart)
	
	-- if there is no delimiter, insert the entire value as the Value
	if(0 = @indEnd)
		begin
			insert into @DistinctValues(Label, Value) values (null, @value)
		end
	else
		begin
			-- loop through and find all Values (and labels) in the delimited string
			--	If @leftSideIsLabel = 0, the Label will be null
			declare @label varchar(max)
			declare @i int

			set @label = null
			set @i = 0

			while @indEnd > 0 
				begin
					-- if the left side of the delimiter is not the label or
					--	if this is the value (meaning we got the label on the 
					--	previous iteration), then do the insert.
					if (@leftSideIsLabel = 0) or ((@i + 1) % 2) = 0
						insert into @DistinctValues(Label, Value)
							values (@label, substring(@value, @indStart + 1, (@indEnd - @indStart - 1)))
					else	
						-- this is a label; grab it and we'll insert it on the next iteration
						--	when we have the Value
						set @label = substring(@value, @indStart + 1, (@indEnd - @indStart - 1))
		
					-- increment the start index, the end index, and i
					set @indStart = @indEnd
					set @indEnd = charindex(@delim, @value, @indStart + 1)
					set @i = @i + 1
				end -- while

				-- insert the last one
				insert into @DistinctValues(Label, Value)
						values (@label, substring(@value, @indStart + 1, 999999))
		end	-- else

	RETURN 
END
GO
/****** Object:  Table [dbo].[ImportTestCohorts]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImportTestCohorts](
	[Blueprint Key] [varchar](150) NULL,
	[TestName] [varchar](150) NULL,
	[Cohort Number] [varchar](150) NULL,
	[Cohort Ratio] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImportItemCohorts]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImportItemCohorts](
	[BankKey] [varchar](150) NULL,
	[Blueprint Key] [varchar](150) NULL,
	[TestName] [varchar](150) NULL,
	[ItemID] [varchar](150) NULL,
	[Cohort Number] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [qa].[InsertComputationRuleParameter]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[InsertComputationRuleParameter]
	@Client bigint,
    @AdminSubject varchar(150),
    @MeasureOf varchar(150),
    @MeasureLabel varchar(150),
    @IsScaled bit,
    @ComputationRule varchar(256),
    @ComputationOrder int,
    @ComputationLocation varchar(32),
	@ParameterName varchar(128),
    @ParameterPosition int,
    @IndexType varchar(16),
	@Index varchar(256),
    @Type varchar(16),
	@Value varchar(256)
AS
BEGIN
	if not exists (
		select *
		from TestScoreFeature
		where
			_fk_Client = @Client
			and _fk_AdminSubject = @AdminSubject
			and MeasureOf = @MeasureOf
			and MeasureLabel = @MeasureLabel
			and IsScaled = @IsScaled
			and ComputationRule = @ComputationRule
			and ComputationOrder = @ComputationOrder
			and ComputationLocation = @ComputationLocation
		) 
	begin
		insert TestScoreFeature (_fk_Client,_fk_AdminSubject,MeasureOf,MeasureLabel,IsScaled,ComputationRule,ComputationOrder,ComputationLocation)
		values (@Client,@AdminSubject,@MeasureOf,@MeasureLabel,@IsScaled,@ComputationRule,@ComputationOrder,@ComputationLocation)
	end

	if @ParameterName != ''
	begin
		if not exists (
			select *
			from ComputationRuleParameters
			where 
				ComputationRule = @ComputationRule
				and ParameterName = @ParameterName
				and ParameterPosition = @ParameterPosition
				and IndexType = @IndexType
				and [Type] = @Type
			)
		begin
			insert ComputationRuleParameters (ComputationRule, ParameterName, ParameterPosition, IndexType, [Type])
			values (@ComputationRule, @ParameterName, @ParameterPosition, @IndexType, @Type)
		end

		insert ComputationRuleParameterValue (_fk_TestScoreFeature, _fk_Parameter, [Index], [Value])
		select tsv._Key, cp._Key, @Index, @Value
		from
			TestScoreFeature tsv,
			ComputationRuleParameters cp
		where
			tsv._fk_Client = @Client
			and tsv._fk_AdminSubject = @AdminSubject
			and tsv.MeasureOf = @MeasureOf
			and tsv.MeasureLabel = @MeasureLabel
			and cp.ComputationRule = @ComputationRule
			and cp.ParameterName = @ParameterName;
	end
END
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[_Key] [int] NOT NULL,
	[_fk_Client] [bigint] NULL,
	[Description] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PerformanceLevels]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PerformanceLevels](
	[_fk_content] [varchar](250) NOT NULL,
	[PLevel] [int] NOT NULL,
	[ThetaLo] [float] NOT NULL,
	[ThetaHi] [float] NOT NULL,
	[ScaledLo] [float] NULL,
	[ScaledHi] [float] NULL,
 CONSTRAINT [PK_PerformanceLevels] PRIMARY KEY CLUSTERED 
(
	[_fk_content] ASC,
	[PLevel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MeasurementParameter]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MeasurementParameter](
	[_fk_measurementModel] [int] NOT NULL,
	[parmnum] [int] NOT NULL,
	[parmname] [varchar](50) NOT NULL,
	[parmdescription] [varchar](50) NULL,
 CONSTRAINT [PK_MeasurementParameter] PRIMARY KEY CLUSTERED 
(
	[_fk_measurementModel] ASC,
	[parmnum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MeasurementModel]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MeasurementModel](
	[ModelNumber] [int] NOT NULL,
	[ModelName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MeasurementModel] PRIMARY KEY CLUSTERED 
(
	[ModelNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_XML]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tp].[Loader_XML](
	[XMLData] [xml] NULL,
	[LoadedDateTime] [datetime] NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ix_clus_Loader_XML_ldt] ON [tp].[Loader_XML] 
(
	[LoadedDateTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [tp].[Loader_TestPoolProperties]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestPoolProperties](
	[_fk_Package] [varchar](350) NULL,
	[PropName] [varchar](50) NULL,
	[PropValue] [varchar](128) NULL,
	[PropLabel] [varchar](150) NULL,
	[ItemCount] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestPassages]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestPassages](
	[_fk_Package] [varchar](350) NULL,
	[FileName] [varchar](50) NULL,
	[FilePath] [varchar](50) NULL,
	[PassageID] [varchar](150) NULL,
	[PassageName] [varchar](100) NULL,
	[PassageValue] [varchar](200) NULL,
	[Version] [int] NULL,
	[_efk_ItemBank] [bigint] NULL,
	[_efk_ITSKey] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_testpackageproperties]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_testpackageproperties](
	[_fk_Package] [varchar](350) NULL,
	[PropName] [varchar](200) NULL,
	[PropValue] [varchar](200) NULL,
	[PropLabel] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestPackage]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestPackage](
	[PackageKey] [varchar](350) NULL,
	[Purpose] [varchar](100) NULL,
	[Publisher] [varchar](255) NULL,
	[PublishDate] [date] NULL,
	[PackageVersion] [varchar](20) NULL,
	[TestKey] [varchar](250) NULL,
	[TestName] [varchar](200) NULL,
	[TestLabel] [varchar](200) NULL,
	[TestVersion] [int] NULL,
	[Year] [varchar](50) NULL,
	[Season] [varchar](50) NULL,
	[ClientKey] [int] NULL,
	[SubjectKey] [varchar](100) NULL,
	[SubjectName] [varchar](100) NULL,
	[TestAdmin] [varchar](250) NULL,
	[_efk_ItemBank] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_testitemrefs]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_testitemrefs](
	[_fk_Package] [varchar](350) NULL,
	[TestItemID] [varchar](150) NULL,
	[RefType] [varchar](50) NULL,
	[Ref] [varchar](150) NULL,
	[RefCategory] [varchar](250) NULL,
	[TreeLevel] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestItemPoolProperties]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestItemPoolProperties](
	[_fk_Package] [varchar](350) NULL,
	[TestItemID] [varchar](150) NULL,
	[PropName] [varchar](50) NULL,
	[PropValue] [varchar](128) NULL,
	[PropLabel] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestItem]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestItem](
	[_fk_Package] [varchar](350) NULL,
	[FileName] [varchar](200) NULL,
	[FilePath] [varchar](200) NULL,
	[ItemType] [varchar](50) NULL,
	[TestItemID] [varchar](150) NULL,
	[TestItemName] [varchar](80) NULL,
	[Version] [int] NULL,
	[_efk_ItemBank] [bigint] NULL,
	[_efk_Item] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestForms]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestForms](
	[_fk_Package] [varchar](350) NULL,
	[TestFormID] [varchar](200) NULL,
	[TestFormName] [varchar](200) NULL,
	[TestFormLength] [int] NULL,
	[Version] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestFormProperties]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestFormProperties](
	[_fk_Package] [varchar](350) NULL,
	[TestFormID] [varchar](200) NULL,
	[isPool] [bit] NULL,
	[PropName] [varchar](200) NULL,
	[PropLabel] [varchar](200) NULL,
	[PropValue] [varchar](200) NULL,
	[ItemCount] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestFormPartition]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestFormPartition](
	[_fk_Package] [varchar](350) NULL,
	[TestFormID] [varchar](200) NULL,
	[FormPartitionID] [varchar](200) NULL,
	[FormPartitionName] [varchar](250) NULL,
	[Version] [int] NULL,
	[_efk_ITSBank] [bigint] NULL,
	[_efk_ITSKey] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestFormItemGroup]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestFormItemGroup](
	[_fk_Package] [varchar](350) NULL,
	[TestFormID] [varchar](200) NULL,
	[FormPartitionID] [varchar](200) NULL,
	[FormItemgroupID] [varchar](200) NULL,
	[FormItemgroupName] [varchar](200) NULL,
	[FormItemgroupLabel] [varchar](200) NULL,
	[Version] [int] NULL,
	[FormPosition] [int] NULL,
	[MaxItems] [varchar](30) NULL,
	[MaxResponses] [varchar](30) NULL,
	[PassageID] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestFormGroupItems]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestFormGroupItems](
	[_fk_Package] [varchar](350) NULL,
	[TestFormID] [varchar](200) NULL,
	[FormItemGroupID] [varchar](200) NULL,
	[ItemID] [varchar](150) NULL,
	[FormPosition] [int] NULL,
	[GroupPosition] [int] NULL,
	[AdminRequired] [bit] NULL,
	[ResponseRequired] [bit] NULL,
	[isActive] [bit] NULL,
	[isFieldTest] [bit] NULL,
	[BlockID] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_TestBluePrint]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_TestBluePrint](
	[_fk_Package] [varchar](350) NULL,
	[ElementType] [varchar](100) NULL,
	[bpElementID] [varchar](250) NULL,
	[bpElementName] [varchar](255) NULL,
	[bpElmentLabel] [varchar](200) NULL,
	[MinOPItems] [int] NULL,
	[MaxOPItems] [int] NULL,
	[MinFTItems] [int] NULL,
	[MaxFTItems] [int] NULL,
	[OPItemCount] [int] NULL,
	[FTItemCount] [int] NULL,
	[ParentID] [varchar](150) NULL,
	[Version] [int] NULL,
	[TreeLevel] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_SetOfItemStrands]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_SetOfItemStrands](
	[_fk_Package] [varchar](350) NULL,
	[_fk_Item] [varchar](150) NULL,
	[_fk_Strand] [varchar](150) NULL,
	[_fk_AdminSubject] [varchar](250) NULL,
	[Version] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_SegmentPoolPassageRef]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_SegmentPoolPassageRef](
	[_fk_Package] [varchar](350) NULL,
	[SegmentID] [varchar](250) NULL,
	[ItemGroupID] [varchar](100) NULL,
	[PassageID] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_SegmentPoolGroupItem]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_SegmentPoolGroupItem](
	[_fk_Package] [varchar](350) NULL,
	[SegmentID] [varchar](250) NULL,
	[ItemGroupID] [varchar](100) NULL,
	[GroupItemID] [varchar](150) NULL,
	[GroupPosition] [int] NULL,
	[AdminRequired] [bit] NULL,
	[ResponseRequired] [bit] NULL,
	[isFieldTest] [bit] NULL,
	[isActive] [bit] NULL,
	[BlockID] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_SegmentPool]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_SegmentPool](
	[_fk_Package] [varchar](350) NULL,
	[SegmentID] [varchar](250) NULL,
	[ItemGroupID] [varchar](100) NULL,
	[ItemGroupName] [varchar](100) NULL,
	[MaxItems] [varchar](30) NULL,
	[MaxResponses] [varchar](30) NULL,
	[Version] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_SegmentItemSelectionProperties]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_SegmentItemSelectionProperties](
	[_fk_Package] [varchar](350) NULL,
	[SegmentID] [varchar](250) NULL,
	[ItemSelectorID] [varchar](500) NULL,
	[bpElementID] [varchar](250) NULL,
	[PropName] [varchar](200) NULL,
	[PropValue] [varchar](100) NULL,
	[PropLabel] [varchar](500) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_SegmentForm]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_SegmentForm](
	[_fk_Package] [varchar](350) NULL,
	[SegmentID] [varchar](250) NULL,
	[FormPartitionID] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_SegmentBluePrint]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_SegmentBluePrint](
	[_fk_Package] [varchar](350) NULL,
	[SegmentID] [varchar](250) NULL,
	[SegmentbpElementID] [varchar](150) NULL,
	[MinOPItems] [int] NULL,
	[MaxOPItems] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_Segment]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_Segment](
	[_fk_Package] [varchar](350) NULL,
	[SegmentID] [varchar](250) NULL,
	[Position] [int] NULL,
	[ItemSelection] [varchar](100) NULL,
	[ItemSelectorType] [varchar](100) NULL,
	[ItemSelectorID] [varchar](200) NULL,
	[ItemSelectorName] [varchar](200) NULL,
	[ItemSelectorLabel] [varchar](200) NULL,
	[Version] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_ScoringConversionTuple]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_ScoringConversionTuple](
	[_fk_Package] [varchar](350) NULL,
	[ConversionTableID] [varchar](250) NULL,
	[InValue] [varchar](150) NULL,
	[OutValue] [varchar](150) NULL,
	[isOutValueString] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_ScoringConversionTable]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_ScoringConversionTable](
	[_fk_Package] [varchar](350) NULL,
	[ConversionTableID] [varchar](250) NULL,
	[ConversionTableName] [varchar](150) NULL,
	[Version] [float] NULL,
	[MeasureID] [varchar](150) NULL,
	[Purpose] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_ScoringComputationRuleParameterValue]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_ScoringComputationRuleParameterValue](
	[_fk_Package] [varchar](350) NULL,
	[RuleID] [varchar](250) NULL,
	[ParameterID] [varchar](250) NULL,
	[Index] [varchar](256) NULL,
	[Value] [varchar](256) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_ScoringComputationRuleParameter]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_ScoringComputationRuleParameter](
	[_fk_Package] [varchar](350) NULL,
	[RuleID] [varchar](250) NULL,
	[ParameterType] [varchar](16) NULL,
	[Position] [int] NULL,
	[ParameterName] [varchar](128) NULL,
	[Version] [float] NULL,
	[ParameterID] [varchar](250) NULL,
	[PropName] [varchar](200) NULL,
	[PropValue] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_ScoringComputationRule]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_ScoringComputationRule](
	[_fk_Package] [varchar](350) NULL,
	[bpElementID] [varchar](250) NULL,
	[ComputationOrder] [int] NULL,
	[RuleID] [varchar](250) NULL,
	[RuleName] [varchar](200) NULL,
	[RuleLabel] [varchar](200) NULL,
	[Version] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_PerformanceLevels]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_PerformanceLevels](
	[_fk_Package] [varchar](350) NULL,
	[bpElementID] [varchar](250) NULL,
	[pLevel] [int] NULL,
	[Scaledlo] [float] NULL,
	[Scaledhi] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loader_MeasurementParameter]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loader_MeasurementParameter](
	[modelNum] [float] NOT NULL,
	[parmnum] [float] NULL,
	[parmname] [nvarchar](255) NULL,
	[parmdescription] [nvarchar](255) NULL,
	[modelName] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [tp].[Loader_ItemScoreDimensionProperties]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_ItemScoreDimensionProperties](
	[_fk_Package] [varchar](350) NULL,
	[TestItemID] [varchar](150) NULL,
	[DimensionName] [varchar](200) NULL,
	[PropName] [varchar](200) NULL,
	[PropValue] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [tp].[Loader_ItemScoreDimension]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_ItemScoreDimension](
	[_fk_Package] [varchar](350) NULL,
	[TestItemID] [varchar](150) NULL,
	[MeasureModel] [varchar](100) NULL,
	[MeasureModelKey] [int] NULL,
	[DimensionName] [varchar](200) NULL,
	[ScorePoints] [int] NULL,
	[Weight] [float] NULL,
	[MeasurementParam] [varchar](50) NULL,
	[MeasurementParamNum] [int] NULL,
	[MeasurementValue] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loader_Itembank]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loader_Itembank](
	[BankKey] [bigint] NOT NULL,
	[ClientName] [nvarchar](255) NULL,
	[Contract] [nvarchar](255) NULL,
	[SchoolYear] [nvarchar](255) NULL,
	[Season] [nvarchar](255) NULL,
	[ConfigID] [int] NULL,
 CONSTRAINT [PK_LoaderItembank] PRIMARY KEY CLUSTERED 
(
	[BankKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tp].[Loader_Errors]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [tp].[Loader_Errors](
	[TestKey] [varchar](250) NOT NULL,
	[TestPackageVersion] [varchar](20) NULL,
	[Severity] [varchar](100) NOT NULL,
	[ErrorMsg] [varchar](max) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Load_MeasurementParameters]    Script Date: 01/28/2015 15:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_MeasurementParameters] (@overwrite bit = 0)
AS
begin

-- The following represents an alteration of the definition of IRTPCL. 
-- The slope parameter has been removed and is assumed to be 1.0
-- This approach was taken because of data that had already been generated under this assumption in contradiction to the way the model had been defined.

update MeasurementParameter set Parmname = 'b0', parmdescription = 'Difficulty cut 0 (b0)'
where _fk_measurementModel = 2 and parmnum = 0;

-- also with the 3pl model
update MeasurementParameter set parmname = 'a', parmdescription = 'Slope (a)' 
where _fk_MeasurementModel = 1 and parmnum = 0
update MeasurementParameter set parmname = 'b', parmdescription = 'Difficulty (b)' 
where _fk_MeasurementModel = 1 and parmnum = 1

-- NOTE That ItemScoreDimension depends upon MeasurementModel and ItemMeasurementParameter depends upon MeasurementParameter
-- They are not linked by foreign key cascade constraints, but a missing reference can cause needed item scoring data to fail to reach the scoring engine
    delete from Loader_MeasurementParameter;    -- make sure this is up to date

   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(1.0, 0.0, N'a', N'Slope (a)', N'IRT3pl')

    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(1.0, 1.0, N'b', N'Difficulty (b)', N'IRT3pl')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(1.0, 2.0, N'c', N'Guessing (c)', N'IRT3pl')
   
-- assume slope = 1.0 for IRTPCL, per Paul Van Wamelen
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(2.0, 0.0, N'b0', N'Difficulty cut 0 (b0)', N'IRTPCL')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(2.0, 1.0, N'b1', N'Difficulty cut 1 (b1)', N'IRTPCL')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(2.0, 2.0, N'b2', N'Difficulty cut 2 (b2)', N'IRTPCL')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(2.0, 3.0, N'b3', N'Difficulty cut 3 (b3)', N'IRTPCL')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(2.0, 4.0, N'b4', N'Difficulty cut 4 (b4)', N'IRTPCL')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(2.0, 5.0, N'b5', N'Difficulty cut 5 (b5)', N'IRTPCL')

    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      values (3, null, null, 'Raw (not IRT) scoring model', 'raw')

    
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(4, 0.0, N'a', N'Slope (a)', N'IRT3PLn')

    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(4, 1.0, N'b', N'Difficulty (b)', N'IRT3PLn')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(4, 2.0, N'c', N'Guessing (c)', N'IRT3PLn')



    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(5, 0.0, N'a', N'Slope (a)', N'IRTGPC')

    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(5, 1.0, N'b0', N'Difficulty cut 0 (b0)', N'IRTGPC')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(5, 2.0, N'b1', N'Difficulty cut 1 (b1)', N'IRTGPC')

    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(5, 3.0, N'b2', N'Difficulty cut 2 (b2)', N'IRTGPC')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(5, 4.0, N'b3', N'Difficulty cut 3 (b3)', N'IRTGPC')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(5, 5.0, N'b4', N'Difficulty cut 4 (b4)', N'IRTGPC')
   
    INSERT INTO "dbo"."Loader_MeasurementParameter"("modelNum", "parmnum", "parmname", "parmdescription", "modelName")
      VALUES(5, 6.0, N'b5', N'Difficulty cut 5 (b5)', N'IRTGPC')


    declare @nmodels int;
    declare @nparms int;
    declare @models int;
    declare @parms int;
    select @nmodels = count (distinct modelNum) from Loader_MeasurementParameter;
    select @nparms = count(*) from Loader_MeasurementParameter;
    select @models = count(*) from MeasurementModel;
    select @parms = count(*) from MeasurementParameter;
        
    if (@overwrite = 1 or @nmodels <> @models or @nparms <> @parms) begin   

        delete from MeasurementParameter;
        delete from MeasurementModel;
        INSERT INTO [dbo].[MeasurementModel]([ModelNumber], [ModelName]) 
        select distinct [modelNum], [modelName] 
        FROM [dbo].[Loader_MeasurementParameter];

        INSERT INTO [dbo].[MeasurementParameter]([_fk_measurementModel], [parmnum], [parmname], [parmdescription]) 
        SELECT [modelNum], [parmnum], [parmname], [parmdescription]
        FROM [dbo].[Loader_MeasurementParameter] where parmnum is not null;
    end
   
end
GO
/****** Object:  StoredProcedure [tp].[spLoader_TestScoringRules]    Script Date: 01/28/2015 15:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_TestScoringRules] (
/*
Description: This procedure extracts data from <performancelevels> 

Sample XML: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			12/18/2014		AIR 			--
*/
	@TestPackageKey  VARCHAR(350)
  ,	@hDoc  			 INT
  , @Path 			 VARCHAR(300)
)
AS
BEGIN

	DECLARE @RulesPath VARCHAR(300);

	-- example: v_path = 'testspecification/scoring/scoringrules'     
	SET @RulesPath = '';
	SET @RulesPath = @Path + '/computationrule/identifier';
	
	
	INSERT INTO tp.Loader_ScoringComputationRule(_fk_Package, bpElementID, ComputationOrder, RuleID, RuleName, RuleLabel, Version)
	SELECT @TestPackageKey
		 , bpElementID
		 , ComputationOrder
		 , RuleID
		 , RuleName
		 , RuleLabel
		 , Version
	  FROM OPENXML(@hDoc, @RulesPath)        
	  WITH ( bpElementID 		VARCHAR(250) '..//@bpelementid'
		   , ComputationOrder	INT			 '..//@computationorder'
		   , RuleID				VARCHAR(250) '@uniqueid'
		   , RuleName			VARCHAR(200) '@name'
	       , RuleLabel			VARCHAR(200) '@label'
	       , Version			FLOAT		 '@version');	


	/**/
	-- extract data from <computationruleparameter>
	SET @RulesPath = '';
	SET @RulesPath = @Path + '/computationrule/computationruleparameter/identifier';
	
	SELECT RuleID
		 , ParameterType
		 , Position
		 , ParameterName
		 , Version
		 , ParameterID
	  INTO #ComputationRuleParam	 
	  FROM OPENXML(@hDoc, @RulesPath)        
	  WITH ( RuleID				VARCHAR(250) '../..//@uniqueid'
		   , ParameterType		VARCHAR(16)  '../@parametertype'
		   , Position			INT			 '../@position'
		   , ParameterName		VARCHAR(128) '@name'
		   , Version			FLOAT		 '@version'
		   , ParameterID		VARCHAR(250) '@uniqueid');	
	       	
	SET @RulesPath = '';
	SET @RulesPath = @Path + '/computationrule/computationruleparameter/property';
	
	SELECT RuleID
		 , ParameterID
		 , PropName
		 , PropValue
	  INTO #ParamProperty
	  FROM OPENXML(@hDoc, @RulesPath)        
	  WITH ( RuleID				VARCHAR(250) '../..//@uniqueid'
		   , ParameterID		VARCHAR(250) '..//@uniqueid'
		   , PropName			VARCHAR(200) '@name'
		   , PropValue			VARCHAR(200) '@value');
		   

	INSERT INTO tp.Loader_ScoringComputationRuleParameter(_fk_Package, RuleID, ParameterType, Position, ParameterName, Version, ParameterID, PropName, PropValue)
	SELECT @TestPackageKey
		 , crp.RuleID
		 , crp.ParameterType
		 , crp.Position
		 , crp.ParameterName
		 , crp.Version
		 , crp.ParameterID
		 , pp.PropName
		 , pp.PropValue
	  FROM #ComputationRuleParam crp
	  LEFT JOIN #ParamProperty pp ON pp.RuleID = crp.RuleID AND pp.ParameterID = crp.ParameterID
	

	/**/
	-- extract data from <computationruleparametervalue>	
	SET @RulesPath = '';
	SET @RulesPath = @Path + '/computationrule/computationruleparameter/computationruleparametervalue';

	INSERT INTO tp.Loader_ScoringComputationRuleParameterValue(_fk_Package, RuleID, ParameterID, [Index], Value)	
	SELECT @TestPackageKey
		 , RuleID
		 , ParameterID
		 , [Index]
		 , Value
	  FROM OPENXML(@hDoc, @RulesPath)        
	  WITH ( RuleID				VARCHAR(250) '../..//@uniqueid'
		   , ParameterID		VARCHAR(250) '..//@uniqueid'
		   , [Index]			VARCHAR(200) '@index'
		   , Value				VARCHAR(200) '@value');
		   
	/**/
	-- extract data from <conversiontable>	
	SET @RulesPath = '';
	SET @RulesPath = @Path + '/conversiontable';
	
	INSERT INTO tp.Loader_ScoringConversionTable(_fk_Package, ConversionTableID, ConversionTableName, Version, MeasureID, Purpose)
	SELECT @TestPackageKey
		 , ConversionTableID
		 , ConversionTableName
		 , Version
		 , MeasureID
		 , Purpose
	  FROM OPENXML(@hDoc, @RulesPath)        
	  WITH ( ConversionTableID		VARCHAR(250) '@uniqueid'
		   , ConversionTableName	VARCHAR(150) '@name'
		   , Version				FLOAT		 '@version'
		   , MeasureID				VARCHAR(150) '@measureid'
		   , Purpose				VARCHAR(150) '@purpose');
		   

	/**/
	-- extract data from <conversiontuple>	
	SET @RulesPath = '';
	SET @RulesPath = @Path + '/conversiontable/conversiontuple';
	
	INSERT INTO tp.Loader_ScoringConversionTuple(_fk_Package, ConversionTableID, InValue, OutValue)
	SELECT @TestPackageKey
		 , ConversionTableID
		 , InValue
		 , OutValue
	  FROM OPENXML(@hDoc, @RulesPath)        
	  WITH ( ConversionTableID	VARCHAR(250) '..//@uniqueid'
		   , InValue			VARCHAR(150) '@invalue'
		   , OutValue			FLOAT		 '@outvalue');




	/*Clean-up*/
	DROP TABLE #ParamProperty;
	DROP TABLE #ComputationRuleParam;


END
GO
/****** Object:  StoredProcedure [tp].[spLoader_TestPoolProperties]    Script Date: 01/28/2015 15:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_TestPoolProperties] (
/*
Description: This procedure extracts data from <poolproperty> 

Sample XML: <testblueprint>....</testblueprint>
			<poolproperty property="" value="" label="" itemcount=""/>
			:
			:
			<itempool>....</itempool>

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/18/2014		AIR 			--
*/
	@TestPackageKey  VARCHAR(350)
  ,	@hDoc  			 INT
  , @Path 			 VARCHAR(300)
)
AS
BEGIN

	INSERT INTO tp.Loader_TestPoolProperties (_fk_Package, PropName, PropValue, PropLabel, ItemCount)
	SELECT @TestPackageKey
		 , PropName
		 , PropValue
		 , PropLabel
		 , ItemCount
	  FROM OPENXML(@hDoc, @Path)        
	  WITH ( PropName	VARCHAR(50)		'@property'
		   , PropValue	VARCHAR(128)	'@value'
		   , PropLabel	VARCHAR(128)	'@label'
		   , ItemCount	INT				'@itemcount');

END
GO
/****** Object:  StoredProcedure [tp].[spLoader_TestPerformanceLevels]    Script Date: 01/28/2015 15:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_TestPerformanceLevels] (
/*
Description: This procedure extracts data from <performancelevels> 

Sample XML: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			12/18/2014		AIR 			--
*/
	@TestPackageKey  VARCHAR(350)
  ,	@hDoc  			 INT
  , @Path 			 VARCHAR(300)
)
AS
BEGIN

	DECLARE @PerfLevelPath VARCHAR(300);

	-- example: v_path = 'testspecification/scoring/performancelevels'     
	SET @PerfLevelPath = '';
	SET @PerfLevelPath = @Path + '/performancelevel';

	INSERT INTO tp.Loader_PerformanceLevels (_fk_Package, bpElementID, pLevel, Scaledlo, Scaledhi)
	SELECT @TestPackageKey
		 , bpElementID
		 , pLevel
		 , Scaledlo
		 , Scaledhi
	  FROM OPENXML(@hDoc, @PerfLevelPath)        
	  WITH ( bpElementID 		VARCHAR(250) '@bpelementid'
		   , pLevel				INT			 '@plevel'
		   , Scaledlo			FLOAT		 '@scaledlo'
		   , Scaledhi			FLOAT		 '@scaledhi');


END
GO
/****** Object:  StoredProcedure [tp].[spLoader_TestPackageProperties]    Script Date: 01/28/2015 15:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_TestPackageProperties] (
/*
Description: A general-purpose element used especially to create extensibility of objects in the test package 

Sample XML: <property name="subject" value="Reading" label="Reading"/>
			<property name="grade" value="5" label="grade 5"/>

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/18/2014		AIR 			--
*/
	@TestPackageKey	 VARCHAR(350)
  ,	@hDoc  	  		 INT
  , @Path 	  		 VARCHAR(300)
)
AS
BEGIN
 
	INSERT INTO tp.Loader_TestPackageProperties (_fk_Package, PropName, PropValue, PropLabel)
	SELECT @TestPackageKey
		 , Name
		 , Value
		 , Label
	  FROM OPENXML(@hDoc, @Path)
	  WITH ( Name	VARCHAR(200) '@name'
		   , Value	VARCHAR(200) '@value'
	       , Label	VARCHAR(200) '@label');

END
GO
/****** Object:  StoredProcedure [tp].[spLoader_TestItemPool]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_TestItemPool] (
/*
Description: This procedure extracts data from <itempool> 

Sample XML: <itempool>
				<passage filename="">
					<identifier uniqueid="" name="" version=""/>
				</passage>
				:
				:
				<testitem filename="" itemtype="">
					<identifier uniqueid="" name="" version=""/>
					<bpref></bpref>
					:
					:
					<passageref></passageref>
					<poolproperty property="" value="" label=""/>
					<itemscoredimension measuremodel="" scorepoints="" weight="">
						<itemscoreparameter measurementparameter="" value=""/>
						<itemscoreparameter measurementparameter="" value=""/>
						<itemscoreparameter measurementparameter="" value=""/>
					</itemscoredimension>
				</testitem>
			:
			:
			</itempool>

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/18/2013		AIR 			Original Code.
*/
	@TestPackageKey  VARCHAR(350)
  ,	@hDoc  			 INT
  , @Path 			 VARCHAR(300)
)
AS
BEGIN
	     
	DECLARE @ItemPath VARCHAR(300);

	-- example: v_path = 'testspecification/administration/itempool';
	SET @ItemPath = '';
	SET @ItemPath = @Path + '/passage/identifier';

	INSERT INTO tp.Loader_TestPassages (_fk_Package, FileName, PassageID, PassageName, Version)
	SELECT @TestPackageKey
		 , FileName
		 , PassageID
		 , PassageName
		 , Version
	  FROM OPENXML(@hDoc, @ItemPath)        
	  WITH ( FileName	  VARCHAR(50)	'../@filename'	
		   , PassageID	  VARCHAR(150)	'@uniqueid'
		   , PassageName  VARCHAR(100)	'@name'
		   , Version	  INT			'@version');

	/**/
	SET @ItemPath = '';
	SET @ItemPath = @Path + '/testitem/identifier';
	
	INSERT INTO tp.Loader_TestItem (_fk_Package, FileName, ItemType, TestItemID, TestItemName, Version)
	SELECT @TestPackageKey
		 , FileName
		 , ItemType
		 , TestItemID
		 , TestItemName
		 , Version
	  FROM OPENXML(@hDoc, @ItemPath)        
	  WITH ( FileName		VARCHAR(200)	'../@filename'
		   , ItemType		VARCHAR(50)		'../@itemtype'
		   , TestItemID		VARCHAR(150)	'@uniqueid'
		   , TestItemName	VARCHAR(80)		'@name'
		   , Version		INT				'@version');
		   			 
	/**/
	SET @ItemPath = '';
	SET @ItemPath = @Path + '/testitem/bpref';
	
	INSERT INTO tp.Loader_TestItemRefs (_fk_Package, TestItemID, RefType, Ref)
	SELECT @TestPackageKey
		 , TestItemID
		 , 'bp'
		 , Ref
	  FROM OPENXML(@hDoc, @ItemPath)        
	  WITH ( TestItemID	VARCHAR(150) '..//@uniqueid'
		   , Ref		VARCHAR(150) '.');

	/**/
	SET @ItemPath = '';
	SET @ItemPath = @Path + '/testitem/passageref';	
	
	INSERT INTO tp.Loader_TestItemRefs (_fk_Package, TestItemID, RefType, Ref)
	SELECT @TestPackageKey
		 , TestItemID
		 , 'passage'
		 , Ref
	  FROM OPENXML(@hDoc, @ItemPath)        
	  WITH ( TestItemID	VARCHAR(150) '..//@uniqueid'	
		   , Ref		VARCHAR(150) '.');

	/**/
	SET @ItemPath = '';
	SET @ItemPath = @Path + '/testitem/poolproperty';
	
	INSERT INTO tp.Loader_TestItemPoolProperties (_fk_Package, TestItemID, PropName, PropValue, PropLabel)
	SELECT @TestPackageKey
		 , TestItemID
		 , PropName
		 , PropValue
		 , PropLabel
	  FROM OPENXML(@hDoc, @ItemPath)        
	  WITH ( TestItemID	VARCHAR(150) '..//@uniqueid'
		   , PropName	VARCHAR(50)	 '@property'
	 	   , PropValue	VARCHAR(128) '@value'	
		   , PropLabel	VARCHAR(150) '@label');

	/**/
	SET @ItemPath = '';
	SET @ItemPath = @Path + '/testitem/itemscoredimension/itemscoreparameter';	

	INSERT INTO tp.Loader_ItemScoreDimension (_fk_Package, TestItemID, MeasureModel, DimensionName, ScorePoints, Weight, MeasurementParam, MeasurementValue)
	SELECT @TestPackageKey
		 , TestItemID
		 , MeasureModel
		 , COALESCE(DimensionName, '')
		 , ScorePoints
		 , [Weight]
		 , MeasurementParam
		 , MeasurementValue
	  FROM OPENXML(@hDoc, @ItemPath)        
	  WITH ( TestItemID			VARCHAR(150) '../..//@uniqueid'
		   , MeasureModel 		VARCHAR(100) '../@measurementmodel'	
		   , DimensionName		VARCHAR(200) '../@dimension'
		   , ScorePoints 		INT			 '../@scorepoints'
		   , Weight 			FLOAT		 '../@weight'
		   , MeasurementParam	VARCHAR(50)	 '@measurementparameter'		
		   , MeasurementValue	FLOAT		 '@value');

	/**/
	SET @ItemPath = '';
	SET @ItemPath = @Path + '/testitem/itemscoredimension';	
		   			 
	-- Logic to process itemscoredimension when itemscoreparamter is not present
	-- itemscoreparameter is not present for FieldTest items in particular; i.e, the XML will have value "RAWSCORE"	
	INSERT INTO tp.Loader_ItemScoreDimension (_fk_Package, TestItemID, MeasureModel, DimensionName, ScorePoints, Weight, MeasurementParam, MeasurementValue)
	SELECT @TestPackageKey
		 , TestItemID
		 , MeasureModel
		 , COALESCE(DimensionName, '')
		 , ScorePoints
		 , [Weight]
		 , NULL AS MeasurementParam
		 , NULL AS MeasurementValue
	  FROM OPENXML(@hDoc, @ItemPath)        
	  WITH ( TestItemID			VARCHAR(150) '..//@uniqueid'
		   , MeasureModel 		VARCHAR(100) '@measurementmodel'	
		   , DimensionName		VARCHAR(200) '@dimension'
		   , ScorePoints 		INT			 '@scorepoints'
		   , Weight 			FLOAT		 '@weight') x
	 WHERE NOT EXISTS (SELECT 1
						 FROM tp.Loader_ItemScoreDimension isd
						WHERE isd._fk_Package = @TestPackageKey 
						  AND x.TestItemID = isd.TestItemID);   



END

GO
/****** Object:  StoredProcedure [tp].[spLoader_TestForms]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_TestForms] (
/*
Description: This procedure extracts data from <testform> 

Sample XML: <testform length="">
			  <identifier uniqueid="" name="" version=""/>
			  <property name="" value="" label=""/>
			  <poolproperty property="" value="" label="" itemcount=""/>
			  :
			  <formpartition>
				<identifier uniqueid="" name="" version=""/>
				<itemgroup formposition="" maxitems="" maxresponses="">
				  <identifier uniqueid="" name="" version=""/>
				  <groupitem itemid="" formposition="" groupposition="" adminrequired="" responserequired="" isactive="" isfieldtest="" blockid=""/>
				</itemgroup>
				:
			  </formpartition>
			</testform>

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/18/2014		AIR 			--
*/
	@TestPackageKey  VARCHAR(350)
  ,	@hDoc  			 INT
  , @Path 			 VARCHAR(300)
)
AS
BEGIN
    
	DECLARE @FormPath VARCHAR(300);

	-- example: v_path = 'testspecification/administration/testform';
	SET @FormPath = '';
	SET @FormPath = @Path + '/identifier';

	INSERT INTO tp.Loader_TestForms (_fk_Package, TestFormID, TestFormName, TestFormLength, Version)
	SELECT @TestPackageKey
		 , TestFormID
		 , TestFormName
		 , TestFormLength
		 , Version
	  FROM OPENXML(@hDoc, @FormPath)        
	  WITH ( TestFormID		VARCHAR(200)	'@uniqueid'
		   , TestFormName	VARCHAR(200)	'@name'
		   , TestFormLength	INT				'../@length'
		   , Version		INT				'@version');

	/**/	
	-- ** testform can have <property> or <poolproperty> or both. there can one or more of these properties** --
	-- ** for both these attributes values extracted are written to the same table ** --
	-- first process <property>			   		   
	SET @FormPath = '';
	SET @FormPath = @Path + '/property';

	INSERT INTO tp.Loader_TestFormProperties (_fk_Package, TestFormID, isPool, PropName, PropLabel, PropValue, ItemCount)
	SELECT @TestPackageKey
		 , TestFormID
		 , 0			AS isPool
		 , PropName
		 , PropLabel
		 , PropValue
		 , NULL			AS ItemCount
	  FROM OPENXML(@hDoc, @FormPath)        
	  WITH ( TestFormID	VARCHAR(200) '..//@uniqueid'
		   , PropName	VARCHAR(200) '@name'
		   , PropLabel	VARCHAR(200) '@label'
		   , PropValue	VARCHAR(200) '@value');

	/**/	
	-- now process <poolproperty>
	-- use the same path variable, overwrite earlier value		   		   
	SET @FormPath = '';
	SET @FormPath = @Path + '/poolproperty';

	INSERT INTO tp.Loader_TestFormProperties (_fk_Package, TestFormID, isPool, PropName, PropLabel, PropValue, ItemCount)
	SELECT @TestPackageKey
		 , TestFormID
		 , 1			AS isPool
		 , PropName
		 , PropLabel
		 , PropValue
		 , NULL			AS ItemCount
	  FROM OPENXML(@hDoc, @FormPath)        
	  WITH ( TestFormID	VARCHAR(200) '..//@uniqueid'
		   , PropName	VARCHAR(200) '@property'
		   , PropLabel	VARCHAR(200) '@label'
		   , PropValue	VARCHAR(200) '@value'
		   , ItemCount	INT			 '@itemcount');

	/**/	
	-- extract data from <formpartition>	   		   
	SET @FormPath = '';
	SET @FormPath = @Path + '/formpartition/identifier';

	INSERT INTO tp.Loader_TestFormPartition (_fk_Package, TestFormID, FormPartitionID, FormPartitionName, Version)
	SELECT @TestPackageKey
		 , TestFormID
		 , FormPartitionID
		 , FormPartitionName
		 , Version
	  FROM OPENXML(@hDoc, @FormPath)        
	  WITH ( TestFormID			VARCHAR(200) '../..//@uniqueid'
		   , FormPartitionID	VARCHAR(200) '@uniqueid'
		   , FormPartitionName  VARCHAR(250) '@name'
		   , Version 			INT			 '@version');

		   		   		   
	/**/	
	-- extract data from <itemgroup>	   		   
	SET @FormPath = '';
	SET @FormPath = @Path + '/formpartition/itemgroup/identifier';

	INSERT INTO tp.Loader_TestFormItemGroup (_fk_Package, TestFormID, FormPartitionID, FormItemGroupID, FormItemGroupName, Version, FormPosition, MaxItems, MaxResponses, PassageID)
	SELECT @TestPackageKey
		 , TestFormID
		 , FormPartitionID
		 , FormItemgroupID
		 , FormItemgroupName
		 , Version
		 , FormPosition
		 , MaxItems
		 , MaxResponses
		 , PassageID
	  FROM OPENXML(@hDoc, @FormPath)        
	  WITH ( TestFormID			 VARCHAR(200) '../../..//@uniqueid'
		   , FormPartitionID	 VARCHAR(200) '../..//@uniqueid'
		   , FormItemgroupID 	 VARCHAR(200) '@uniqueid'
		   , FormItemgroupName	 VARCHAR(200) '@name'
		 --, FormItemgroupLabel	 VARCHAR(200) '@label'
		   , Version 			 INT		  '@version'	
		   , FormPosition		 INT		  '../@formposition'
		   , MaxItems			 VARCHAR(30)  '../@maxitems'
		   , MaxResponses		 VARCHAR(30)  '../@maxresponses'
		   , PassageID			 VARCHAR(100) '../passageref');


	/**/	
	-- extract data from <groupitem>	   		   
	SET @FormPath = '';
	SET @FormPath = @Path + '/formpartition/itemgroup/groupitem';

	INSERT INTO tp.Loader_TestFormGroupItems (_fk_Package, TestFormID, FormItemGroupID, ItemID, FormPosition, GroupPosition, AdminRequired, ResponseRequired, isActive, isFieldTest, BlockID)
	SELECT @TestPackageKey
		 , TestFormID
		 , FormItemgroupID
		 , ItemID
		 , FormPosition
		 , GroupPosition
		 , CASE AdminRequired WHEN 'true'  THEN 1
							  WHEN 'false' THEN 0
		   END
		 , CASE ResponseRequired WHEN 'true'  THEN 1
								 WHEN 'false' THEN 0
		   END
		 , CASE isActive WHEN 'true'  THEN 1
						 WHEN 'false' THEN 0
		   END
		 , CASE isFieldTest WHEN 'true'  THEN 1
							WHEN 'false' THEN 0
		   END
		 , BlockID  		   		   		    
	  FROM OPENXML(@hDoc, @FormPath)        
	  WITH ( TestFormID			VARCHAR(200) '../../..//@uniqueid'
		   , FormItemgroupID 	VARCHAR(200) '..//@uniqueid'
		   , ItemID				VARCHAR(150) '@itemid'
		   , FormPosition 		INT			 '@formposition'
		   , GroupPosition 		INT			 '@groupposition'
		   , AdminRequired		VARCHAR(10)	 '@adminrequired'
		   , ResponseRequired	VARCHAR(10)  '@responserequired'
		   , isActive			VARCHAR(10)  '@isactive'
		   , isFieldTest		VARCHAR(10)  '@isfieldtest'
		   , BlockID			VARCHAR(10)  '@blockid');
		   

END
GO
/****** Object:  StoredProcedure [tp].[spLoader_TestBluePrint]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_TestBluePrint](
/*
Description: This procedure extracts data from <testblueprint> 
		  -- Test or segment top-level blueprint specification.
		  -- Test-level blueprint is needed to score or report a test. 

Sample XML: <testblueprint>
				<bpelement elementtype="" minopitems="" maxopitems="" minftitems="" maxftitems="" opitemcount="" ftitemcount="">
					<identifier uniqueid="" name="" version=""/>
				</bpelement>
			:
			:
			</testblueprint>

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/18/2014		AIR 			--
*/
	@TestPackageKey  VARCHAR(350)
  ,	@hDoc  			 INT
  , @Path 			 VARCHAR(300)
)
AS
BEGIN

	INSERT INTO tp.Loader_TestBluePrint (_fk_Package, ElementType, bpElementID, bpElementName, MinOPItems, MaxOPItems, MinFTItems, MaxFTItems, OPItemCount, FTItemCount, ParentID, Version)
	SELECT @TestPackageKey
		 , ElementType
		 , bpElementID
		 , bpElementName
		 , MinOPItems
		 , MaxOPItems
		 , MinFTItems
		 , MaxFTItems
		 , OPItemCount
		 , FTItemCount
		 , ParentID
		 , Version
	  FROM OPENXML(@hDoc, @Path)        
	  WITH ( ElementType 	VARCHAR(100)	'../@elementtype'
		   , bpElementID	VARCHAR(250)	'@uniqueid'
		   , bpElementName  VARCHAR(255)	'@name'
		   , MinOPItems		INT				'../@minopitems'
		   , MaxOPItems		INT				'../@maxopitems'
		   , MinFTItems		INT				'../@minftitems'
		   , MaxFTItems		INT				'../@maxftitems'
		   , OPItemCount	INT				'../@opitemcount'
		   , FTItemCount	INT				'../@ftitemcount'
		   , ParentID		VARCHAR(150)	'../@parentid'
		   , Version 		INT				'@version');

		
END
GO
/****** Object:  StoredProcedure [tp].[spLoader_Segment]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_Segment] (
/*
Description: This procedure extracts data from <adminsegment> 

Sample XML: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/18/2014		AIR 			--
*/
	@TestPackageKey  VARCHAR(350)
  ,	@hDoc  			 INT
  , @Path 			 VARCHAR(300)
)
AS
BEGIN

	DECLARE @SegmentPath VARCHAR(300);

	-- example: v_path = 'testspecification/administration/adminsegment'     
	SET @SegmentPath = '';
	SET @SegmentPath = @Path + '/itemselector/identifier';

	INSERT INTO tp.Loader_Segment (_fk_Package, SegmentID, Position, ItemSelection, ItemSelectorType, ItemSelectorID, ItemSelectorName, ItemSelectorLabel, Version)
	SELECT @TestPackageKey
		 , SegmentID
		 , Position
		 , ItemSelection
		 , ItemSelectorType
		 , ItemSelectorID
		 , ItemSelectorName
		 , ItemSelectorLabel
		 , Version
	  FROM OPENXML(@hDoc, @SegmentPath)        
	  WITH ( SegmentID 			VARCHAR(250) '../../@segmentid'
		   , Position			INT			 '../../@position'
		   , ItemSelection 		VARCHAR(100) '../../@itemselection'
		   , ItemSelectorType   VARCHAR(100) '../@type'
		   , ItemSelectorID  	VARCHAR(200) '@uniqueid'
		   , ItemSelectorName  	VARCHAR(200) '@name'
		   , ItemSelectorLabel 	VARCHAR(200) '@label'
		   , Version 			FLOAT		 '@version');	

	/**/
	-- extract data from <segmentblueprint>
	SET @SegmentPath = '';
	SET @SegmentPath = @Path + '/segmentblueprint/segmentbpelement';

	INSERT INTO tp.Loader_SegmentBluePrint (_fk_Package, SegmentID, SegmentbpElementID, MinOPItems, MaxOPItems)
	SELECT @TestPackageKey
		 , SegmentID
		 , SegmentbpElementID
		 , MinOPItems
		 , MaxOPItems
	  FROM OPENXML(@hDoc, @SegmentPath)        
	  WITH ( SegmentID 			VARCHAR(250) '../../@segmentid'
		   , SegmentbpElementID	VARCHAR(150) '@bpelementid'
		   , MinOPItems			INT			 '@minopitems'
		   , MaxOPItems			INT			 '@maxopitems');
		   
	/**/
	-- extract data from <itemselectionparameter>
	-- there is can be mulitple <itemselectionparameter> and within that there can be mutliple properties(<property>)
	SET @SegmentPath = '';
	SET @SegmentPath = @Path + '/itemselector/itemselectionparameter/property';

	INSERT INTO tp.Loader_SegmentItemSelectionProperties (_fk_Package, SegmentID, ItemSelectorID, bpElementID, PropName, PropValue, PropLabel)
 	SELECT @TestPackageKey
		 , SegmentID
		 , ItemSelectorID
		 , bpElementID
		 , PropName
		 , PropValue
		 , PropLabel
	  FROM OPENXML(@hDoc, @SegmentPath)        
	  WITH ( SegmentID 		VARCHAR(250) '../../../@segmentid'
		   , ItemSelectorID VARCHAR(500) '../..//@uniqueid'
		   , bpElementID	VARCHAR(250) '../@bpelementid'
		   , PropName		VARCHAR(200) '@name'
		   , PropValue		VARCHAR(100) '@value'
		   , PropLabel		VARCHAR(500) '@label');
		
	/**/
	-- extract data from <segmentpool>
	SET @SegmentPath = '';
	SET @SegmentPath = @Path + '/segmentpool/itemgroup/identifier';

	INSERT INTO tp.Loader_SegmentPool (_fk_Package, SegmentID, ItemGroupID, ItemGroupName, MaxItems, MaxResponses, Version)
 	SELECT @TestPackageKey
		 , SegmentID
		 , ItemGroupID
		 , ItemGroupName
		 , MaxItems
		 , MaxResponses
		 , Version
	  FROM OPENXML(@hDoc, @SegmentPath)        
	  WITH ( SegmentID 		VARCHAR(250) '../../../@segmentid'
		   , ItemGroupID	VARCHAR(500) '@uniqueid'
		   , ItemGroupName	VARCHAR(250) '@name'
		   , MaxItems		VARCHAR(200) '../@maxitems'
		   , MaxResponses	VARCHAR(100) '../@maxresponses'
		   , Version		VARCHAR(500) '@version');	

	/**/
	-- extract data from <segmentpool>
	SET @SegmentPath = '';
	SET @SegmentPath = @Path + '/segmentpool/itemgroup/passageref';

	INSERT INTO tp.Loader_SegmentPoolPassageRef (_fk_Package, SegmentID, ItemGroupID, PassageID)
 	SELECT @TestPackageKey
		 , SegmentID
		 , ItemGroupID
		 , PassageID
	  FROM OPENXML(@hDoc, @SegmentPath)        
	  WITH ( SegmentID 		VARCHAR(250) '../../../@segmentid'
		   , ItemGroupID	VARCHAR(500) '..//@uniqueid'
		   , PassageID		VARCHAR(500) '.');	

	/**/	
	-- extract data from <groupitem>	   		   
	SET @SegmentPath = '';
	SET @SegmentPath = @Path + '/segmentpool/itemgroup/groupitem';

	INSERT INTO tp.Loader_SegmentPoolGroupItem (_fk_Package, SegmentID, ItemGroupID, GroupItemID, GroupPosition, AdminRequired, ResponseRequired, isFieldTest, isActive, BlockID)
	SELECT @TestPackageKey
		 , SegmentID
		 , ItemgroupID
		 , GroupItemID
		 , GroupPosition
		 , CASE AdminRequired WHEN 'true'  THEN 1
							  WHEN 'false' THEN 0
		   END
		 , CASE ResponseRequired WHEN 'true'  THEN 1
								 WHEN 'false' THEN 0
		   END
		 , CASE isFieldTest WHEN 'true'  THEN 1
							WHEN 'false' THEN 0
		   END
		 , CASE isActive WHEN 'true'  THEN 1
						 WHEN 'false' THEN 0
		   END
		 , BlockID  		   		   		    
	  FROM OPENXML(@hDoc, @SegmentPath)        
	  WITH ( SegmentID			VARCHAR(200) '../../../@segmentid'
		   , ItemgroupID 		VARCHAR(200) '..//@uniqueid'
		   , GroupItemID		VARCHAR(150) '@itemid'
		   , GroupPosition 		INT			 '@groupposition'
		   , AdminRequired		VARCHAR(10)	 '@adminrequired'
		   , ResponseRequired	VARCHAR(10)  '@responserequired'
		   , isActive			VARCHAR(10)  '@isactive'
		   , isFieldTest		VARCHAR(10)  '@isfieldtest'
		   , BlockID			VARCHAR(10)  '@blockid');
	
		   	
	/**/
	-- extract data from <segmentform>
	SET @SegmentPath = '';
	SET @SegmentPath = @Path + '/segmentform';

	INSERT INTO tp.Loader_SegmentForm (_fk_Package, SegmentID, FormPartitionID)
 	SELECT @TestPackageKey
		 , SegmentID
		 , FormPartitionID
	  FROM OPENXML(@hDoc, @SegmentPath)        
	  WITH ( SegmentID 			VARCHAR(250) '../@segmentid'
		   , FormPartitionID	VARCHAR(200) '@formpartitionid')
	 WHERE SegmentID IN (SELECT SegmentID FROM tp.Loader_Segment WHERE ItemSelectorType = 'fixedform');


END

GO
/****** Object:  StoredProcedure [tp].[spLoader_Clear]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_Clear] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350) = NULL
)
AS
BEGIN

	DELETE FROM dbo.Loader_MeasurementParameter;    
	
	/*Admin Loader Tables*/
	DELETE FROM tp.Loader_SetOfItemStrands WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	
	DELETE FROM tp.Loader_ItemScoreDimension WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_ItemScoreDimensionProperties WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_Segment WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
 	DELETE FROM tp.Loader_SegmentBluePrint WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_SegmentForm WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_SegmentItemSelectionProperties WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL; 
	DELETE FROM tp.Loader_SegmentPool WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_SegmentPoolGroupItem WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_SegmentPoolPassageRef WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestBluePrint WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL; 
	DELETE FROM tp.Loader_TestFormGroupItems WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestFormItemGroup WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestFormPartition WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestFormProperties WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestForms WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestItem WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestItemRefs WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestItemPoolProperties WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestPackageProperties WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestPassages WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;
	DELETE FROM tp.Loader_TestPoolProperties WHERE _fk_Package = @TestPackageKey OR @TestPackageKey  IS NULL;


	/*Scoring Loader Tables*/
	DELETE FROM tp.Loader_PerformanceLevels WHERE _fk_Package = @TestPackageKey OR @TestPackageKey IS NULL;
	DELETE FROM tp.Loader_ScoringComputationRule WHERE _fk_Package = @TestPackageKey OR @TestPackageKey IS NULL;
	DELETE FROM tp.Loader_ScoringComputationRuleParameter WHERE _fk_Package = @TestPackageKey OR @TestPackageKey IS NULL;
	DELETE FROM tp.Loader_ScoringComputationRuleParameterValue WHERE _fk_Package = @TestPackageKey OR @TestPackageKey IS NULL;
	DELETE FROM tp.Loader_ScoringConversionTable WHERE _fk_Package = @TestPackageKey OR @TestPackageKey IS NULL;
	DELETE FROM tp.Loader_ScoringConversionTuple WHERE _fk_Package = @TestPackageKey OR @TestPackageKey IS NULL;


	DELETE FROM tp.Loader_TestPackage WHERE PackageKey = @TestPackageKey OR @TestPackageKey  IS NULL;

END
GO
/****** Object:  StoredProcedure [tp].[spLoad_Items]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_Items] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	/*
	** _efk_itembank & _efk_Item:- testitemid is a comnibation of itembank value and item seperated by '-'. 
	   For e.g: if the testitemid = 148-100240 then, itembankkey = 148 and _efk_Item = 100240	

	** FilePath:- strip out the .xml extension from the filename value and append '\'
	*/

	DECLARE @ReseedNum BIGINT;
	
	DECLARE @ScorePoints TABLE (
		TestItemID  VARCHAR(150)
	  , ScorePoints INT
	);

	-- _efk_Item column in table tblItem should be unique in combination with _efk_ItemBank as per index IX_tblItem
	-- Since, these values are not part of the test package, we need to generate identity values for atleast one column
	BEGIN TRANSACTION
	
		SET @ReseedNum = (SELECT COALESCE(MAX(_efk_Item), 0) FROM dbo.tblItem (TABLOCKX));	  
		
		-- load the nonexistent items barebones conditionally first, then update from Loader_Items
		INSERT INTO dbo.tblItem (_efk_ItemBank, _efk_Item, ItemType, FilePath, FileName, DateLastUpdated, ItemID, _Key, LoadConfig)
		SELECT COALESCE(ti._efk_ItemBank, pkg._efk_ItemBank)												
			 , COALESCE(ti._efk_Item, (@ReseedNum + ROW_NUMBER() OVER(ORDER BY pkg._efk_ItemBank)))
			 , ItemType
			 , FilePath
			 , FileName
			 , GETDATE()
			 , TestItemName
			 , TestItemID
			 , Version
		  FROM tp.Loader_TestItem ti
		  JOIN tp.Loader_TestPackage pkg ON pkg.PackageKey = ti._fk_Package 
		 WHERE NOT EXISTS (SELECT * 
							 FROM tblItem 
							WHERE _Key = ti.TestItemID)
		   AND _fk_Package = @TestPackageKey;

	COMMIT TRANSACTION

	INSERT INTO @ScorePoints
	SELECT DISTINCT TestItemID, ScorePoints 
	  FROM tp.Loader_ItemScoreDimension
	 WHERE _fk_Package = @TestPackageKey;

	UPDATE i
	   SET i.ScorePoint   = sp.ScorePoints
		 , i.updateConfig = ti.Version
	  FROM tblItem i
	  JOIN @ScorePoints sp ON sp.TestItemID = i._Key
	  JOIN tp.Loader_TestItem ti ON ti.TestItemID = i._Key;
		   
	-- do we need to update any of the data??
	
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_Stimuli]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_Stimuli] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			Original Code.
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	/*
	** _efk_itembank & clientid:- passageid is a comnibation of itembank value and clientid seperated by '-'. 
	   For e.g: if the passageid = 148-100240 then, itembankkey = 148 and client = 100240

	** _efk_itskey:- itskey value is considered to be same as clientid	

	** FilePath:- strip out the .xml extension from the filename value and append '\'
	*/

	--  load the stimuli conditionally first
	INSERT INTO dbo.tblStimulus (_efk_ItemBank, _efk_ITSKey, ClientID, FilePath, FileName, DateLastUpdated, _Key, LoadConfig)
	SELECT COALESCE(p._efk_ItemBank, pkg._efk_ItemBank)		--In future, if the splitting key values to derive ItemBank and ITSKeys are discontinued, this will cover for that
		 , COALESCE(p._efk_ITSKey, 0)						--In future, if the splitting key values to derive ItemBank and ITSKeys are discontinued, this will cover for that
		 , NULL 
		 , FilePath
		 , FileName
		 , GETDATE()
		 , PassageID
		 , Version
	  FROM tp.Loader_TestPassages p
	  JOIN tp.Loader_TestPackage pkg ON pkg.PackageKey = p._fk_Package 
	 WHERE NOT EXISTS (SELECT 1
						 FROM dbo.tblStimulus 
						WHERE passageid = _key)
	   AND _fk_package = @TestPackageKey;


	-- do we need to update any of the data??

END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringTestScoreFeature]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringTestScoreFeature] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	INSERT INTO dbo.SCORECONFIGS_TestScoreFeature(_Key, ClientName, TestID, MeasureOf, MeasureLabel, IsScaled, ComputationRule, ComputationOrder)
	SELECT DISTINCT cr.RuleID
		 , tp.Publisher
		 , tp.TestName
		 , REPLACE(CASE WHEN TestKey = cr.bpElementID THEN 'Overall' 
						WHEN tbp.bpElementID IS NOT NULL THEN tbp.bpElementName
						ELSE cr.bpElementID 
					END
				, '&amp;', '&')
		 , cr.RuleLabel
		 , CASE WHEN cr.RuleLabel LIKE 'scale%' THEN 1 ELSE 0 END
		 , cr.RuleName
		 , cr.ComputationOrder
	  FROM tp.Loader_ScoringComputationRule cr
	  JOIN tp.Loader_TestPackage tp ON tp.PackageKey = cr._fk_Package
	  LEFT JOIN tp.Loader_TestBluePrint tbp ON tbp._fk_Package = cr._fk_Package
										   AND tbp.bpElementID = cr.bpElementID				
	 WHERE tp.PackageKey = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.SCORECONFIGS_TestScoreFeature tsf 
						WHERE tsf._Key = cr.RuleID);

END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringTestGrades]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringTestGrades] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	INSERT INTO dbo.SCORECONFIGS_TestGrades(ClientName, TestID, ReportingGrade) 
	SELECT tp.Publisher, tp.TestName, tpp.PropValue
	  FROM tp.Loader_TestPackage tp
	  JOIN tp.Loader_TestPackageProperties tpp ON tpp._fk_Package = tp.PackageKey
	 WHERE tpp.PropName = 'grade'
	   AND tp.PackageKey = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.SCORECONFIGS_TestGrades t
						WHERE t.ClientName = tp.Publisher
						  AND t.TestID = tp.TestName	
					);	
					
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringTest]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringTest] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	INSERT INTO dbo.SCORECONFIGS_Test(ClientName, TestID, _efk_Subject) 
	SELECT tp.Publisher, tp.TestName, tpp.PropValue
	  FROM tp.Loader_TestPackage tp
	  JOIN tp.Loader_TestPackageProperties tpp ON tpp._fk_Package = tp.PackageKey
	 WHERE tpp.PropName = 'subject'
	   AND tp.PackageKey = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.SCORECONFIGS_TestGrades t
						WHERE t.ClientName = tp.Publisher
						  AND t.TestID = tp.TestName	
					);	
					
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringPerformanceLevels]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringPerformanceLevels] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN 

	INSERT INTO dbo.PerformanceLevels(_fk_content, PLevel, ThetaLo, ThetaHi, ScaledLo, ScaledHi)
	select distinct bpElementID
		 , PLevel
		 , 0
		 , 0
		 , ScaledLo
		 , ScaledHi
	  FROM tp.Loader_PerformanceLevels l
	 WHERE l._fk_Package = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.PerformanceLevels pl
						WHERE pl._fk_content = l.bpElementID);
										
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringConversionTables]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringConversionTables] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN 

	INSERT INTO dbo.SCORECONFIGS_ConversionTables(tablename, invalue, /*isinvaluestring,*/ outvalue, /*isoutvaluestring,*/ clientname)
	SELECT DISTINCT ct.ConversionTableName
		 , tup.InValue
		 --, CASE WHEN ISNUMERIC(tup.InValue) = 1 THEN 0 ELSE 1 END
		 , tup.OutValue
		 --, CASE WHEN ISNUMERIC(tup.OutValue) = 1 THEN 0 ELSE 1 END
		 , tp.Publisher
	  FROM tp.Loader_ScoringConversionTable ct
	  JOIN tp.Loader_ScoringConversionTuple tup ON tup._fk_Package = ct._fk_Package	
											   AND tup.conversiontableid = ct.conversiontableid
	  JOIN tp.Loader_TestPackage tp on tp.PackageKey = ct._fk_Package	
	 WHERE ct._fk_Package = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.SCORECONFIGS_ConversionTables t
						WHERE t.TableName = ct.ConversionTableName);
											
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringConversionTableDesc]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringConversionTableDesc] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN 

	INSERT INTO dbo.SCORECONFIGS_ConversionTableDesc(_Key, TableName, _fk_Client)
	SELECT DISTINCT ConversionTableID
		 , ConversionTableName
		 , tp.Publisher
	  FROM tp.Loader_ScoringConversionTable ct
	  JOIN tp.Loader_TestPackage tp ON tp.PackageKey = ct._fk_Package	
	 WHERE ct._fk_Package = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.SCORECONFIGS_ConversionTableDesc ctd
						WHERE ctd._Key = ct.ConversionTableID);
											
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringComputationRuleParameterValue]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringComputationRuleParameterValue] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	INSERT INTO dbo.SCORECONFIGS_ComputationRuleParameterValue(_fk_TestScoreFeature, _fk_Parameter, [Index], Value)
	SELECT DISTINCT l.RuleID
		 , l.ParameterID
		 , COALESCE(l.[Index], '')
		 , l.Value
	  FROM tp.Loader_ScoringComputationRuleParameterValue l
	 WHERE l._fk_Package = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.SCORECONFIGS_ComputationRuleParameterValue crpv 
						WHERE crpv._fk_TestScoreFeature = l.RuleID
						  AND crpv._fk_Parameter = l.ParameterID
						  AND crpv.[Index] = COALESCE(l.[Index], ''));
											
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringComputationRuleParameter]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringComputationRuleParameter] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	INSERT INTO dbo.SCORECONFIGS_ComputationRuleParameters(_Key, ComputationRule, ParameterName, ParameterPosition, IndexType, Type)
	SELECT DISTINCT lcrp.ParameterID
		 , cr.RuleName
		 , lcrp.ParameterName
		 , lcrp.Position
		 , CASE WHEN lcrp.PropName = 'indextype' THEN lcrp.PropValue ELSE '' END
		 , lcrp.ParameterType
	  FROM tp.Loader_ScoringComputationRuleParameter lcrp
	  JOIN tp.Loader_ScoringComputationRule cr ON cr.RuleID = lcrp.RuleID
											  AND cr._fk_Package = lcrp._fk_Package
	 WHERE lcrp._fk_Package = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.SCORECONFIGS_ComputationRuleParameters crp 
						WHERE crp._Key = lcrp.parameterid);
											
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ScoringComputationLocation]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ScoringComputationLocation] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	INSERT INTO dbo.SCORECONFIGS_Feature_ComputationLocation(_fk_TestScoreFeature, Location)
	SELECT DISTINCT cr.RuleID
		 , 'TIS' -- This column is used to configure which type of computations should be done for which system. For OSS, this value is static
	  FROM tp.Loader_ScoringComputationRule cr
	  JOIN tp.Loader_TestPackage tp ON tp.PackageKey = cr._fk_Package
	 WHERE tp.PackageKey = @TestPackageKey
	   AND NOT EXISTS (SELECT 1
						 FROM dbo.SCORECONFIGS_Feature_ComputationLocation cl 
						WHERE cl._fk_TestScoreFeature = cr.RuleID)
	   AND EXISTS (SELECT 1
				     FROM dbo.SCORECONFIGS_TestScoreFeature tsf 
					WHERE tsf._Key = cr.RuleID);

END
GO
/****** Object:  View [qa].[ConversionTables]    Script Date: 01/28/2015 15:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [qa].[ConversionTables] as
select clientname, TableName, InValue, OutValue
from SCORECONFIGS_ConversionTables
GO
/****** Object:  UserDefinedFunction [dbo].[_makeCLString]    Script Date: 01/28/2015 15:21:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Make a string from the set of content level IDs for quick retrieval by adaptive algorithm (this will be stored with the item, see Load_AdminItems)
CREATE FUNCTION [dbo].[_makeCLString] (@testkey varchar(250), @itemkey varchar(50))
	RETURNS varchar(max) AS
BEGIN
    declare @str varchar(max), @cl varchar(100);
	declare @cltbl table (cl varchar(100));
    insert into @cltbl (cl)
    select ContentLevel from AA_ItemCL where _fk_AdminSubject = @testkey and _fk_item = @itemkey order by ContentLevel;

    while (exists (select * from @cltbl)) begin
        select top 1 @cl = cl from @cltbl;
        if (@str is null) set @str = @cl;
        else set @str = @str + ';' + @cl;
        delete from @cltbl where cl = @cl;
    end
    return @str;
END
GO
/****** Object:  StoredProcedure [qa].[ApplyConversionTable]    Script Date: 01/28/2015 15:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[ApplyConversionTable]
	@ClientName varchar(100),
	@TableName varchar(128),
	@InValue int
AS
BEGIN
	select 
		OutValue
	from 
		SCORECONFIGS_ConversionTables
	where
		clientname = @ClientName
		and TableName = @TableName
		and InValue = @InValue
END
GO
/****** Object:  Table [dbo].[tblClient]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblClient](
	[_Key] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](255) NULL,
	[HomePath] [varchar](250) NULL,
 CONSTRAINT [PK_tblClient] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblItemProps]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblItemProps](
	[_fk_Item] [varchar](150) NOT NULL,
	[Propname] [varchar](50) NOT NULL,
	[Propvalue] [varchar](128) NOT NULL,
	[PropDescription] [varchar](150) NULL,
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ItemProps] PRIMARY KEY CLUSTERED 
(
	[_fk_AdminSubject] ASC,
	[_fk_Item] ASC,
	[Propname] ASC,
	[Propvalue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSetofItemStrands]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSetofItemStrands](
	[_fk_Item] [varchar](150) NOT NULL,
	[_fk_Strand] [varchar](150) NOT NULL,
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[loadConfig] [bigint] NULL,
 CONSTRAINT [PK_ItemStrands] PRIMARY KEY CLUSTERED 
(
	[_fk_Item] ASC,
	[_fk_Strand] ASC,
	[_fk_AdminSubject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSetofItemStimuli]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSetofItemStimuli](
	[_fk_Item] [varchar](150) NOT NULL,
	[_fk_Stimulus] [varchar](150) NOT NULL,
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[loadConfig] [bigint] NULL,
 CONSTRAINT [PK_ItemStimuli] PRIMARY KEY CLUSTERED 
(
	[_fk_Item] ASC,
	[_fk_Stimulus] ASC,
	[_fk_AdminSubject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [qa].[TestkeyAccommodations]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [qa].[TestkeyAccommodations] (@testkey varchar(250))
	RETURNS TABLE AS
RETURN
(
    -- first, get all TDS tools directly related to this client's tests, 0 represents the global test scope, while segment positions are local segment score
	SELECT distinct 0 as Segment,TType.DisableOnGuestSession, TType.SortOrder as ToolTypeSortOrder, TT.SortOrder as ToolValueSortOrder, TType.TestMode
         as TypeMode, TT.TestMode as ToolMode, Type as AccType, Value as AccValue, Code as AccCode, IsDefault, AllowCombine
        , IsFunctional, AllowChange, IsSelectable, IsVisible, studentControl
        FROM TDSCONFIGS_Client_TestToolType TType, TDSCONFIGS_Client_TestTool TT, TDSCONFIGS_Client_TestMode MODE
        where MODE.testkey = @testkey and
            TType.ContextType = 'TEST' and TType.Context = MODE.testID and TType.ClientName = MODE.clientname
            and TT.ContextType = 'TEST' and TT.Context = MODE.testID and TT.ClientName = MODE.clientname and TT.Type = TType.Toolname
            and (TType.TestMode = 'ALL' or TType.TestMode = MODE.mode) and (TT.TestMode = 'ALL' or TT.TestMode = MODE.mode)
-- get all the segment-specific accommodations
    union all
   	SELECT distinct SegmentPosition ,TType.DisableOnGuestSession, TType.SortOrder , TT.SortOrder, TType.TestMode , TT.TestMode 
        , Type , Value , Code , IsDefault, AllowCombine, IsFunctional, AllowChange
        , IsSelectable, IsVisible, studentControl
        FROM TDSCONFIGS_Client_TestToolType TType, TDSCONFIGS_Client_TestTool TT, TDSCONFIGS_Client_SegmentProperties SEG, TDSCONFIGS_Client_TestMode MODE
        where parentTest = MODE.testID and MODE.testkey = @testkey and SEG.modekey = @testkey
            and TType.ContextType = 'SEGMENT' and TType.Context = segmentID and TType.ClientName = MODE.clientname
            and TT.ContextType = 'SEGMENT' and TT.Context = segmentID and TT.ClientName = MODE.clientname and TT.Type = TType.Toolname
            and (TType.TestMode = 'ALL' or TType.TestMode = MODE.mode) and (TT.TestMode = 'ALL' or TT.TestMode = MODE.mode)

    union all  -- now get all test tools that have 'wild card' (i.e. '*') assignments (segments and languages NEVER have wildcard assignments)
        select distinct 0,TType.DisableOnGuestSession,  TType.SortOrder , TT.SortOrder, TType.TestMode , TT.TestMode 
        , Type , Value , Code , IsDefault, AllowCombine
        , IsFunctional, AllowChange, IsSelectable, IsVisible, studentControl
        FROM  TDSCONFIGS_Client_TestToolType TType, TDSCONFIGS_Client_TestTool TT, TDSCONFIGS_Client_TestMode MODE
        where MODE.testkey = @testkey and TType.ContextType = 'TEST' and TType.Context = '*' and TType.ClientName = MODE.clientname
            and TT.ContextType = 'TEST' and TT.Context = '*' and TT.ClientName = MODE.clientname and TT.Type = TType.Toolname 
            and (TType.TestMode = 'ALL' or TType.TestMode = MODE.mode) and (TT.TestMode = 'ALL' or TT.TestMode = MODE.mode)
            and not exists
                    (select * from TDSCONFIGS_Client_TestToolType Tool 
                    where Tool.ContextType = 'TEST' and Tool.Context = MODE.testID and Tool.Toolname = TType.Toolname and Tool.Clientname = MODE.clientname)    
)
GO
/****** Object:  UserDefinedFunction [qa].[TestAccommodations]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [qa].[TestAccommodations] (@clientname varchar(100))
	RETURNS TABLE AS
RETURN
(
    -- first, get all TDS tools directly related to this client's tests, 0 represents the global test scope, while segment positions are local segment score
	SELECT distinct MODE.TestID, 0 as Segment,TType.DisableOnGuestSession, TType.SortOrder as ToolTypeSortOrder, TT.SortOrder as ToolValueSortOrder, TType.TestMode
         as TypeMode, TT.TestMode as ToolMode, Type as AccType, Value as AccValue, Code as AccCode, IsDefault, AllowCombine
        , IsFunctional, AllowChange, IsSelectable, IsVisible, studentControl
    FROM TDSCONFIGS_Client_TestToolType TType, TDSCONFIGS_Client_TestTool TT, TDSCONFIGS_Client_TestMode MODE
        where MODE.clientname = @clientname 
            and TType.ContextType = 'TEST' and TType.Context = MODE.testID and TType.ClientName = MODE.clientname
            and TT.ContextType = 'TEST' and TT.Context = MODE.testID and TT.ClientName = MODE.clientname and TT.Type = TType.Toolname
            and (TType.TestMode = 'ALL' or TType.TestMode = MODE.mode) and (TT.TestMode = 'ALL' or TT.TestMode = MODE.mode)
-- get all the segment-specific accommodations
    union all
   	SELECT distinct MODE.testID, SegmentPosition ,TType.DisableOnGuestSession, TType.SortOrder , TT.SortOrder, TType.TestMode , TT.TestMode 
        , Type , Value , Code , IsDefault, AllowCombine, IsFunctional, AllowChange
        , IsSelectable, IsVisible, studentControl
        FROM TDSCONFIGS_Client_TestToolType TType, TDSCONFIGS_Client_TestTool TT, TDSCONFIGS_Client_SegmentProperties SEG, TDSCONFIGS_Client_TestMode MODE
        where MODE.clientname = @clientname and parentTest = MODE.testID and SEG.modekey = MODE.testkey
            and TType.ContextType = 'SEGMENT' and TType.Context = segmentID and TType.ClientName = MODE.clientname
            and TT.ContextType = 'SEGMENT' and TT.Context = segmentID and TT.ClientName = MODE.clientname and TT.Type = TType.Toolname
            and (TType.TestMode = 'ALL' or TType.TestMode = MODE.mode) and (TT.TestMode = 'ALL' or TT.TestMode = MODE.mode)

    union all  -- now get all test tools that have 'wild card' (i.e. '*') assignments (segments and languages NEVER have wildcard assignments)
        select distinct MODE.TestID, 0,TType.DisableOnGuestSession,  TType.SortOrder , TT.SortOrder, TType.TestMode , TT.TestMode 
        , Type , Value , Code , IsDefault, AllowCombine
        , IsFunctional, AllowChange, IsSelectable, IsVisible, studentControl
     FROM  TDSCONFIGS_Client_TestToolType TType, TDSCONFIGS_Client_TestTool TT, TDSCONFIGS_Client_TestMode MODE
        where MODE.clientname = @clientname and TType.ContextType = 'TEST' and TType.Context = '*' and TType.ClientName = MODE.clientname
            and TT.ContextType = 'TEST' and TT.Context = '*' and TT.ClientName = MODE.clientname and TT.Type = TType.Toolname 
            and (TType.TestMode = 'ALL' or TType.TestMode = MODE.mode) and (TT.TestMode = 'ALL' or TT.TestMode = MODE.mode)
            and not exists
                    (select * from TDSCONFIGS_Client_TestToolType Tool 
                    where Tool.ContextType = 'TEST' and Tool.Context = MODE.testID and Tool.Toolname = TType.Toolname and Tool.Clientname = MODE.clientname)    
)
GO
/****** Object:  StoredProcedure [qa].[Test_PerformanceLevels]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[Test_PerformanceLevels](
	@TestName varchar(255)
)
AS
BEGIN
	SELECT _fk_Content as TestName, 'Overall' as Domain, PLevel, ScaledLo, ScaledHi		
	FROM PerformanceLevels
	WHERE _fk_Content = @TestName
END
GO
/****** Object:  Table [dbo].[tblItemBank]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblItemBank](
	[_fk_Client] [bigint] NOT NULL,
	[HomePath] [varchar](255) NULL,
	[ItemPath] [varchar](50) NULL,
	[StimuliPath] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[_efk_ItemBank] [bigint] NOT NULL,
	[_Key] [bigint] NOT NULL,
	[Contract] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblItemBank_1] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTestAdmin]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTestAdmin](
	[SchoolYear] [varchar](25) NOT NULL,
	[Season] [varchar](10) NOT NULL,
	[Description] [varchar](255) NULL,
	[_Key] [varchar](150) NOT NULL,
	[_fk_Client] [bigint] NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
 CONSTRAINT [PK_tblTestAdmin_1] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubject](
	[Name] [varchar](100) NOT NULL,
	[Grade] [varchar](64) NULL,
	[_Key] [varchar](150) NOT NULL,
	[_fk_Client] [bigint] NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
 CONSTRAINT [PK_tblSubject_1] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [ClientDelete]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AIR
-- Create date: <Create Date,,>
-- Description:	Set up an internal 'replication subscriber' so that proctor reads and participation reports
--   can be isolated from the student testing performance requirements
-- =============================================
CREATE TRIGGER [dbo].[ClientDelete]
   ON  [dbo].[tblClient]
   AFTER Delete
AS 
BEGIN

	SET NOCOUNT ON;

    update ConfigsLoaded set _date = getdate(), _error = 'Client deleted'
    from Deleted D 
    where clientname = name and _error is null;

end
GO
/****** Object:  StoredProcedure [qa].[GetTestAccommodations]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[GetTestAccommodations]
	@testName varchar(255)
AS
BEGIN
	SELECT DISTINCT AccCode AS Code, AccType AS Type, AccValue AS Description, AllowCombine as MultiSelection, IsDefault, Segment  
	from qa.TestkeyAccommodations(@testName)
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_Scoring]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_Scoring] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	/*** STEP 1: Process and load scoring engine data into itembank and TestScoring tables ***/	
	EXEC tp.spLoad_ScoringTest @TestPackageKey;
	EXEC tp.spLoad_ScoringTestGrades @TestPackageKey;
	EXEC tp.spLoad_ScoringTestScoreFeature @TestPackageKey;
	EXEC tp.spLoad_ScoringComputationLocation @TestPackageKey;
	EXEC tp.spLoad_ScoringComputationRuleParameter @TestPackageKey;
	EXEC tp.spLoad_ScoringComputationRuleParameterValue @TestPackageKey;

	EXEC tp.spLoad_ScoringConversionTableDesc @TestPackageKey;
	EXEC tp.spLoad_ScoringConversionTables @TestPackageKey;
	
	EXEC tp.spLoad_ScoringPerformanceLevels @TestPackageKey;	
	
		
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_LinkItemsToStrands]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_LinkItemsToStrands] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	DELETE 
	  FROM tp.Loader_SetofItemStrands
	 WHERE _fk_Package = @TestPackageKey;

	DECLARE @Segments TABLE (
		TestItemID	VARCHAR(150)
	  , Segments    VARCHAR(250)
	);

	DECLARE @strands TABLE (
		TestItemID	VARCHAR(150)
	  , Strands   	VARCHAR(150)
	  , Lvl			INT
	);

    DECLARE @Affinity TABLE (
        TestItemID    VARCHAR(150)
      , Affinity      VARCHAR(150)
    );

	DECLARE @MaxLvlStrands TABLE (
		TestItemID	VARCHAR(150)
	  , Max_Lvl		INT
	);

	-- load items related to segments   
	INSERT INTO @Segments
	SELECT DISTINCT TestItemID
		 , Ref
	  FROM tp.Loader_TestItemRefs
	 WHERE RefType = 'bp'
	   and RefCategory = 'segment'
	   and _fk_Package = @TestPackageKey;

	INSERT INTO @Strands (TestItemID, Strands, Lvl)
	SELECT distinct TestItemID
		 , Ref
		 , TreeLevel
	  FROM tp.Loader_TestItemRefs 
	 WHERE RefType = 'bp'
	   AND RefCategory IN ('strand', 'contentlevel')
	   AND _fk_Package = @TestPackageKey; 

    INSERT INTO @Affinity (TestItemID, Affinity)
    SELECT DISTINCT TestItemID
         , Ref
      FROM tp.Loader_TestItemRefs 
     WHERE RefType = 'bp'
       AND RefCategory = 'affinitygroup'
       AND _fk_package = @TestPackageKey; 


	INSERT INTO @MaxLvlStrands
	SELECT TestItemID, MAX(Lvl) Max_Lvl
	  FROM @Strands
	GROUP BY TestItemID;

    DELETE cl
	  FROM dbo.AA_ItemCL cl
	 WHERE EXISTS ( SELECT * 
					  FROM @Segments seg 
					 WHERE seg.Segments = cl._fk_AdminSubject AND seg.TestItemID = cl._fk_Item);

	INSERT INTO dbo.AA_ItemCL
	SELECT seg.Segments
		 , s.TestItemID
		 , s.Strands
	  FROM @Strands s
	  JOIN @Segments seg ON seg.TestItemID = s.TestItemID;

	INSERT INTO dbo.AA_ItemCL
	SELECT seg.Segments
		 , a.TestItemID
         , a.Affinity
      FROM @Affinity a
      JOIN @Segments seg ON seg.TestItemID = a.TestItemID;

	DELETE s
	  FROM @Strands s
	  JOIN @MaxLvlStrands ms ON ms.TestItemID = s.TestItemID
							AND ms.Max_Lvl <> s.Lvl;


	INSERT INTO tp.Loader_SetofItemStrands
	SELECT ti._fk_Package
		 , s.TestItemID
		 , s.Strands
		 , seg.Segments
		 , Version
	  FROM @Strands s
	  JOIN @Segments seg ON seg.TestItemID = s.TestItemID
	  JOIN tp.Loader_TestItem ti ON ti.TestItemID = s.TestItemID
	 WHERE ti._fk_Package = @TestPackageKey;

	
	-- first delete all strand links for these items
	DELETE s
	  FROM dbo.tblSetofItemStrands s 
	 WHERE EXISTS (SELECT * 
					 FROM @Segments seg 
				    WHERE seg.TestItemID = s._fk_Item 
					  AND seg.Segments = s._fk_AdminSubject);

	INSERT INTO dbo.tblSetofItemStrands
	SELECT _fk_Item
		 , _fk_Strand
		 , _fk_AdminSubject
		 , Version
	  FROM tp.Loader_SetofItemStrands
	 WHERE _fk_Package = @TestPackageKey;
	


END

GO
/****** Object:  StoredProcedure [tp].[spLoad_LinkItemsToStimuli]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_LinkItemsToStimuli] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	DECLARE @Segments TABLE (
		TestItemID	VARCHAR(150)
	  , Segments    VARCHAR(250)
	);

	DECLARE @Passages TABLE (
		TestItemID	VARCHAR(150)
	  , Passages   	VARCHAR(150)
	);

	-- load items related to segments   
	INSERT INTO @Segments
	SELECT DISTINCT TestItemID
		 , Ref
	  FROM tp.Loader_TestItemRefs
	 WHERE RefType = 'bp'
	   AND RefCategory = 'segment'
	   AND _fk_Package = @TestPackageKey;

	INSERT INTO @Passages (TestItemID, Passages)
	SELECT DISTINCT TestItemID
		 , Ref
	  FROM tp.Loader_TestItemRefs
	 WHERE RefType = 'passage'
	   AND _fk_Package = @TestPackageKey;

	-- first delete all strand links for these items
	DELETE s
	  FROM dbo.tblSetofItemStimuli s 
	 WHERE EXISTS (SELECT * 
					 FROM @Segments seg 
				    WHERE seg.TestItemID = s._fk_Item 
					  AND seg.Segments = s._fk_AdminSubject);

	INSERT INTO dbo.tblSetofItemStimuli
	SELECT p.TestItemID
		 , p.Passages
		 , seg.Segments
		 , Version
	  FROM @Passages p
	  JOIN @Segments seg ON seg.TestItemID = p.TestItemID
	  JOIN tp.Loader_TestItem ti ON ti.TestItemID = seg.TestItemID
	 WHERE _fk_Package = @TestPackageKey;
	

END
GO
/****** Object:  StoredProcedure [tp].[spLoad_ItemProperties]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_ItemProperties] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	DECLARE @Segments TABLE (
		TestItemID	VARCHAR(150)
	  , Segments    VARCHAR(250)
	);

	DECLARE @ItemProps TABLE (
		_fk_Item 		 VARCHAR(150)
	  , PropName 		 VARCHAR(50)
	  , PropValue 		 VARCHAR(128)
	  , PropDescription  VARCHAR(150)
	  , _fk_AdminSubject VARCHAR(250)
	);

	-- load items related to segments   
	INSERT INTO @Segments
	SELECT distinct TestItemID
		 , Ref
	  FROM tp.Loader_TestItemRefs
	 WHERE RefType = 'bp'
	   AND RefCategory = 'segment'
	   AND _fk_Package = @TestPackageKey;

	INSERT INTO @ItemProps
	SELECT tip.TestItemID
		 , tip.PropName
		 , tip.PropValue
		 , tip.PropLabel
		 , seg.Segments
	  FROM tp.Loader_TestItemPoolProperties tip
	  JOIN @Segments seg ON seg.TestItemID = tip.TestItemID
 	 WHERE _fk_Package = @TestPackageKey;

	-- all item types should have tdspoolfilter properties
	-- tdspoolfilter properties can exist as an attribute or as property. Here, we are retreiving the property FROM attribute
	INSERT INTO @ItemProps
	SELECT ti.TestItemID
		 , '--ITEMTYPE--'
		 , ti.ItemType
		 , ti.ItemType
		 , seg.Segments
	  FROM tp.Loader_TestItem ti
	  JOIN @Segments seg ON seg.TestItemID = ti.TestItemID
	 WHERE _fk_Package = @TestPackageKey;

	
	INSERT INTO tblItemProps(_fk_item, propname, propvalue, _fk_adminsubject, isactive)
	SELECT DISTINCT tmp._fk_item, tmp.propname, tmp.propvalue, tmp._fk_adminsubject
		 , 1 as isActive
	FROM @ItemProps tmp
	WHERE NOT EXISTS ( SELECT 1
						 FROM dbo.tblItemProps ip
						WHERE ip._fk_Item = tmp._fk_Item 
						  AND ip.PropName = tmp.PropName 
						  AND ip.PropValue = tmp.PropValue
						  AND ip._fk_AdminSubject = tmp._fk_AdminSubject
					);

	UPDATE ip
	SET propdescription = tmp.propdescription
	FROM tblitemprops ip, @ItemProps tmp 
	WHERE ip._fk_item = tmp._fk_item
		AND ip.propname = tmp.propname
		AND ip.propvalue = tmp.propvalue
		AND ip._fk_adminsubject = tmp._fk_adminsubject;

		
	-- activate/inactivate any item properties that have been removed/re-added for this item and this test
	UPDATE ip
	   SET isActive = CASE WHEN tmp._fk_Item IS NULL THEN 0 ELSE 1 END
	  FROM dbo.tblItemProps ip
	  LEFT JOIN @ItemProps tmp ON ip._fk_Item = tmp._fk_Item
							  AND ip.PropName = tmp.PropName 
							  AND ip.PropValue = tmp.propValue 
	 WHERE ip._fk_AdminSubject = tmp._fk_AdminSubject;


	-- by default, all item types have tdspoolfilter properties. ensure that this is so
	-- ?? do we need this ?? => reason: implemented "SELECT ti.TestItemID, '--ITEMTYPE--'" logic to substitute this....test if that works....
	-- 	INSERT INTO tblitemprops (_fk_item, propname, propvalue, propdescription, _fk_adminsubject)
	-- 	SELECT _fk_item, '--ITEMTYPE--', propvalue, propvalue, _fk_adminsubject
	-- 	  FROM @ItemProps tmp
	--      WHERE not exists (SELECT * 
	-- 						 FROM tblitemprops ip
	-- 						WHERE ip._fk_item = tmp._fk_item and ip.propname = '--ITEMTYPE--' and ip.propvalue = tmp.propvalue  and ip._fk_adminsubject = tmp._fk_adminsubject);	



END
GO
/****** Object:  StoredProcedure [tp].[spLoader_ExtractXML]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_ExtractXML] (
/*
Description: This is the control procedure which is EXECed to initiate the xml extraction process
			-- This procedure makes EXEC to child procedures which are responsible for extracting subSETs from the xml

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/18/2014		AIR 			--
*/
	@XMLfile		XML
  , @TestPackageKey VARCHAR(350) OUT	
)
AS
BEGIN

	-- DECLARE variables
	DECLARE @SQL					NVARCHAR(MAX);
	DECLARE @Root					VARCHAR(100);
	DECLARE @Path 					VARCHAR(100);
	DECLARE @TestKey				VARCHAR(150);
	DECLARE @Purpose				VARCHAR(100);
 	 			
	DECLARE @TestBluePrintPath 		VARCHAR(300);
	DECLARE @TestPackagePropPath 	VARCHAR(300);
	DECLARE @TestPoolPropertiesPath VARCHAR(300);
	DECLARE @TestScoringRulesPath	VARCHAR(300);
	DECLARE @TestPerfLevelsPath		VARCHAR(300);
	DECLARE @TestItemPoolPath		VARCHAR(300);
	DECLARE @TestFormPath			VARCHAR(300);
	DECLARE @segmentpath			VARCHAR(300);


	/*SET @SQL = 'SELECT CONVERT(XML, BulkColumn) AS BulkColumn
					 , GETDATE() 
				  FROM OPENROWSET(BULK '''+ @XMLfile +''', SINGLE_BLOB) AS x';*/
	
	INSERT INTO tp.Loader_XML(XMLData, LoadedDateTime) VALUES (@XMLfile,GETDATE());
	--EXEC (@SQL);


	DECLARE @XML AS XML, @hDoc AS INT;	
	SELECT TOP 1 @XML = XMLData FROM tp.Loader_XML ORDER BY LoadedDateTime DESC;
	
	EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML;

	-- SET @Root = 'testpackage/identifier';
	SET @Root = 'testspecification/identifier';
	
	SELECT @TestKey = TestKey
		 , @Purpose = Purpose
	  FROM OPENXML(@hDoc, @Root)
	  WITH ( TestKey VARCHAR(250) '@uniqueid'
	       , Purpose VARCHAR(100) '../@purpose');

	-- Check if the package being uploaded is realted to Admin or Scoring
	IF @Purpose <> 'administration' AND @Purpose <> 'scoring'
	BEGIN
		RAISERROR(N'Only administration and scoring should be processes thru this procedure call'
				 ,10
				 ,1);		 
		RETURN
	END

	-- Make sure, currently there is no package with the same key in the loader tables. 
	-- Failsafe, to make sure no 2nd instance of the same package is instantiated while the 1st is in progress.
	IF EXISTS (SELECT * FROM tp.Loader_TestPackage WHERE PackageKey = @TestPackageKey AND Purpose = @Purpose)
	BEGIN
		RAISERROR(N'A record with the same testpackage key already exists in the loader_* tables'
				 ,10
				 ,1);		 
		RETURN
	END	
	
	-- This path has been seperated from the subpaths declared below to have flexibility
	SET @TestPackageKey = @TestKey + '-' + @Purpose		 	
 	SET @Path = 'testspecification/' + @Purpose + '/';
	SET @TestPackagePropPath = 'testspecification/property';
	 
		
	-- ** extract testpackage configuration data ** --
	INSERT INTO tp.Loader_TestPackage(PackageKey, Purpose, Publisher, PublishDate, PackageVersion, TestKey, TestName, TestLabel, TestVersion)
	SELECT @TestPackageKey
		 , @Purpose
		 , Publisher
		 , PublishDate
		 , PackageVersion
		 , @TestKey
		 , TestName
		 , TestLabel
		 , TestVersion
	  FROM OPENXML(@hDoc, @Root)
	  WITH ( Publisher		VARCHAR(255) '../@publisher'
		   , PublishDate	DATETIME	 '../@publishdate'
		   , PackageVersion VARCHAR(20)	 '../@version'
--		   , TestKey		VARCHAR(250) '@uniqueid'
		   , TestName		VARCHAR(200) '@name'
		   , TestLabel		VARCHAR(200) '@label'
		   , TestVersion	INT			 '@version');

		
	-- ** extract testpackage property data ** --
	EXEC tp.spLoader_TestPackageProperties @TestPackageKey, @hDoc, @TestPackagePropPath;
	
	-- ** extract testblueprint attributes ** --
	SET @TestBluePrintPath = @Path + 'testblueprint/bpelement/identifier';
	EXEC tp.spLoader_TestBluePrint @TestPackageKey, @hDoc, @TestBluePrintPath;

	-- ** extract testpoolproperties attributes ** --
	SET @TestPoolPropertiesPath = @Path + 'poolproperty';
	EXEC tp.spLoader_TestPoolProperties @TestPackageKey, @hDoc, @TestPoolPropertiesPath;

	-- ** extract testitempool attributes ** --
	SET @TestItemPoolPath = @Path + 'itempool';
	EXEC tp.spLoader_TestItemPool @TestPackageKey, @hDoc, @TestItemPoolPath;

	-- ** extract testform attributes ** --
	-- there can be more than 1 <testform>
	SET @TestFormPath = @Path + 'testform';
	EXEC tp.spLoader_TestForms @TestPackageKey, @hDoc, @TestFormPath;

	IF @Purpose = 'administration' 
	BEGIN
		-- ** extract adminsegment attributes ** --
		-- there can be more than 1 <adminsegment>
		SET @SegmentPath = @Path + 'adminsegment';
		EXEC tp.spLoader_Segment @TestPackageKey, @hDoc, @SegmentPath;
	END
	
	IF @Purpose = 'scoring' 
	BEGIN
		-- ** extract performancelevels attributes ** --
		SET @TestPerfLevelsPath = @Path + 'performancelevels';
		EXEC tp.spLoader_TestPerformanceLevels @TestPackageKey, @hDoc, @TestPerfLevelsPath;

		-- ** extract scoring attributes ** --
		SET @TestScoringRulesPath = @Path + 'scoringrules';
		EXEC tp.spLoader_TestScoringRules @TestPackageKey, @hDoc, @TestScoringRulesPath;
	END


	EXEC sp_xml_removedocument @hDoc;

END
GO
/****** Object:  StoredProcedure [tp].[spLoad_TestAdmin]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_TestAdmin] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN
    
	-- declare variables
	DECLARE @ClientName VARCHAR(50);
	DECLARE @Year 		VARCHAR(50);
	DECLARE @Season		VARCHAR(50);
	DECLARE @AdminKey   VARCHAR(150);
	DECLARE @Version    INT;
	DECLARE @ClientKey	INT;

	SELECT @ClientName	= Publisher
		 , @ClientKey	= ClientKey
		 , @Year		= COALESCE(Year, '')
		 , @Season		= COALESCE(Season, '')
		 , @AdminKey	= TestAdmin
		 , @Version		= TestVersion
	  FROM tp.Loader_TestPackage
	 WHERE PackageKey = @TestPackageKey;


	-- check if the package info. already exists
	IF (NOT EXISTS (SELECT * FROM dbo.tblTestAdmin
					 WHERE SchoolYear = @Year and Season = @Season and _fk_Client = @ClientKey))
	BEGIN				 
		INSERT INTO dbo.tblTestAdmin (_Key, SchoolYear, Season, _fk_Client, Description, LoadConfig) VALUES 
			(@AdminKey, @Year, @Season, @ClientKey, @ClientName + ' ' + @Season + ' ' + @Year + ' Administration', @Version);
	END
	ELSE
	BEGIN
		UPDATE dbo.tblTestAdmin
		   SET UpdateConfig = @Version
		 WHERE _Key = @AdminKey;
	END

END
GO
/****** Object:  StoredProcedure [tp].[spLoad_Subject]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_Subject] (
/*
Description: Load subjects from Loader_TestPackageProperties

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/23/2014		AIR 			--
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	INSERT INTO dbo.tblSubject (Name, Grade, _Key, _fk_Client, LoadConfig)
	SELECT tp.SubjectName
		 , '' AS Grade
		 , SubjectKey
		 , ClientKey
		 , tp.TestVersion
	  FROM tp.Loader_TestPackage tp
	 WHERE NOT EXISTS ( SELECT 1
						  FROM tblSubject s
						 WHERE s._Key = tp.SubjectKey )
	   AND PackageKey = @TestPackageKey;

END
GO
/****** Object:  Table [dbo].[tblSetofAdminSubjects]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSetofAdminSubjects](
	[_Key] [varchar](250) NOT NULL,
	[_fk_TestAdmin] [varchar](150) NOT NULL,
	[_fk_Subject] [varchar](150) NOT NULL,
	[TestID] [varchar](255) NULL,
	[StartAbility] [float] NULL,
	[StartInfo] [float] NULL,
	[MinItems] [int] NULL,
	[MaxItems] [int] NULL,
	[Slope] [float] NULL,
	[Intercept] [float] NULL,
	[FTStartPos] [int] NULL,
	[FTEndPos] [int] NULL,
	[FTMinItems] [int] NULL,
	[FTMaxItems] [int] NULL,
	[sampleTarget] [float] NULL,
	[selectionAlgorithm] [varchar](50) NULL,
	[formSelection] [varchar](100) NULL,
	[blueprintWeight] [float] NOT NULL,
	[abilityWeight] [float] NOT NULL,
	[cset1size] [int] NOT NULL,
	[cset2Random] [int] NOT NULL,
	[cset2InitialRandom] [int] NOT NULL,
	[VirtualTest] [varchar](200) NULL,
	[TestPosition] [int] NULL,
	[IsSegmented] [bit] NOT NULL,
	[computeAbilityEstimates] [bit] NOT NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
	[itemWeight] [float] NULL,
	[abilityOffset] [float] NULL,
	[contract] [varchar](100) NULL,
	[ITS_ID] [varchar](200) NULL,
	[cset1Order] [varchar](50) NOT NULL,
	[refreshMinutes] [int] NULL,
	[bpMetricFunction] [varchar](25) NOT NULL,
	[rcAbilityWeight] [float] NOT NULL,
	[precisionTarget] [float] NULL,
	[precisionTargetMetWeight] [float] NOT NULL,
	[precisionTargetNotMetWeight] [float] NOT NULL,
	[adaptiveCut] [float] NULL,
	[tooCloseSEs] [float] NULL,
	[terminationOverallInfo] [bit] NOT NULL,
	[terminationRCInfo] [bit] NOT NULL,
	[terminationMinCount] [bit] NOT NULL,
	[terminationTooClose] [bit] NOT NULL,
	[terminationFlagsAnd] [bit] NOT NULL,
	[initialAbilityTestID] [varchar](100) NULL,
	[TestType] [varchar](60) NULL,
 CONSTRAINT [PK_tblSetofAdminSubjects] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Adminsubjects_TestID] ON [dbo].[tblSetofAdminSubjects] 
(
	[TestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Adminsubjects_VirtualTest] ON [dbo].[tblSetofAdminSubjects] 
(
	[VirtualTest] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStrand]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStrand](
	[_fk_Subject] [varchar](150) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[ScoreReportName] [varchar](55) NULL,
	[_fk_Parent] [varchar](150) NULL,
	[_Key] [varchar](150) NOT NULL,
	[Description] [nvarchar](512) NULL,
	[_fk_Client] [bigint] NULL,
	[TreeLevel] [int] NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
 CONSTRAINT [PK_tblStrand_1] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_tblStrand] ON [dbo].[tblStrand] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[TestkeyClient]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TestkeyClient] (@testkey varchar(250))
	RETURNS varchar(100) AS
BEGIN
    declare @clientname varchar(100);
	select @clientname = C.Name
    from tblSetofAdminSubjects S with(nolock), tblClient C with(nolock), tblTestAdmin A with(nolock)
    where  A._fk_Client = C._Key and S._Key = @testkey and S._fk_TestAdmin = A._key;



    return @clientname;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateConfigs_Scorefeatures]    Script Date: 01/28/2015 15:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 3/2011: Updated to exclude test segments
-- ASSUME: Test score features are given for Virtual Tests, not their segments
CREATE PROCEDURE [dbo].[UpdateConfigs_Scorefeatures] (@doall bit = 0, @testkey varchar(200) = null)
as
begin
    declare @tests table (client varchar(100), test varchar(150), testKey varchar(150), subject varchar(100), IsSegmented bit);
    declare @clients table (cname varchar(100));

   declare @template table (client varchar(100), test varchar(200), mof varchar(250), mlabel varchar(200), tostudent bit, toproctor bit, topart bit, useability bit, label varchar(max), ord int);

    
    -- is this a 'custom' call? (all tests in the bank, or a specific test), or is it all new tests (those in the loader tables)?
    if (@doall = 1 or @testKey is not null) begin   -- custom call
        insert into @tests (client, test, testkey, subject, IsSegmented)
        select C.Name, S.TestID, S._Key, J.Name, S.IsSegmented
        from tblClient C, tblSetofadminsubjects S, tblTestAdmin A, tblSubject J
        where (@testKey is null or S._Key = @testKey) 
            and S.VirtualTest is null       -- test segments are not individually scorable
            and S._fk_TestAdmin = A._Key and A._fk_Client = C._key and S._fk_Subject = J._Key;
    end
   
    else begin  -- do those that are in the loader tables
        insert into @tests (Client, test, testkey, subject, IsSegmented)
        select  I.ClientName, T.TestName, T.TestKey, T.Subject, S.IsSegmented
        from Loader_Itembank I, Loader_Tests T, tblSetofAdminSubjects S
        where S.virtualTest is null and T.TestKey = S._Key;
    end

    insert into @template (client, test, mof, mlabel, tostudent, toproctor, topart, useability, label, ord)
    select client, test, measureof, measurelabel, ReportToStudent, ReportToProctor, ReportToParticipation, UseForAbility, ReportLabel, ReportOrder
    from @tests, TDSCONFIGS_Client_TestScoreFeatures
    where clientname = client and testID = '*';

-- first for non-virtual tests
    insert into TDSCONFIGS_Client_TestScoreFeatures (ClientName, TestID, MeasureOf, MeasureLabel, UseForAbility)
    select distinct client, test, measureof, measureLabel
            , case measurelabel when 'thetascore' then 1 else 0 end
    from @tests T, SCORECONFIGS_TestScoreFeature F
    where F.TestID = T.Test and F.clientname = T.client and measureof = 'overall' 
    and not exists (select * from TDSCONFIGS_Client_TestScoreFeatures C 
                    where C.clientname = T.client and C.TestID = T.test and C.TestID = F.TestID
                    and C.measureof = F.measureof and C.measurelabel = F.measurelabel);


    update TDSCONFIGS_Client_TestScoreFeatures 
        set ReportToStudent = tostudent, ReportToProctor = toproctor, ReportToParticipation = topart, UseForAbility = useability
            , reportLabel = label, reportOrder = ord
    from @template
    where CLientname = client and TestID = test and MeasureOf = mof and MeasureLabel = mlabel;

end
GO
/****** Object:  Table [dbo].[TestForm]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestForm](
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[_efk_ITSBank] [bigint] NOT NULL,
	[_efk_ITSKey] [bigint] NOT NULL,
	[FormID] [varchar](150) NULL,
	[Language] [varchar](150) NULL,
	[_Key] [varchar](100) NOT NULL,
	[ITSID] [varchar](150) NULL,
	[Iteration] [int] NOT NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
	[cohort] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TestForm] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSetofAdminItems]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSetofAdminItems](
	[_fk_Item] [varchar](150) NOT NULL,
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[GroupID] [varchar](100) NULL,
	[ItemPosition] [int] NULL,
	[IsFieldTest] [bit] NULL,
	[IsActive] [bit] NULL,
	[IRT_b] [varchar](150) NULL,
	[BlockID] [varchar](10) NULL,
	[FTStartDate] [datetime] NULL,
	[FTEndDate] [datetime] NULL,
	[IsRequired] [bit] NOT NULL,
	[IsPrintable] [bit] NULL,
	[_fk_TestAdmin] [varchar](150) NULL,
	[responseMimeType] [varchar](255) NOT NULL,
	[TestCohort] [int] NOT NULL,
	[_fk_Strand] [varchar](150) NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
	[groupKey] [varchar](100) NULL,
	[strandName] [varchar](150) NULL,
	[IRT_a] [float] NULL,
	[IRT_c] [float] NULL,
	[IRT_model] [varchar](100) NULL,
	[bVector] [varchar](200) NULL,
	[notForScoring] [bit] NOT NULL,
	[clString] [varchar](max) NULL,
	[ftWeight] [float] NOT NULL,
 CONSTRAINT [PK_AdminItems] PRIMARY KEY CLUSTERED 
(
	[_fk_AdminSubject] ASC,
	[_fk_Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_AdminItem_FTItemGroup] ON [dbo].[tblSetofAdminItems] 
(
	[_fk_AdminSubject] ASC,
	[IsFieldTest] ASC,
	[groupKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AdminItemGroup2] ON [dbo].[tblSetofAdminItems] 
(
	[_fk_AdminSubject] ASC,
	[GroupID] ASC,
	[BlockID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblItemSelectionParm]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblItemSelectionParm](
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[bpElementID] [varchar](200) NULL,
	[name] [varchar](100) NOT NULL,
	[value] [varchar](200) NOT NULL,
	[label] [varchar](200) NULL,
	[_key] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tblItemSelectionParm] PRIMARY KEY CLUSTERED 
(
	[_key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAdminStrand]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdminStrand](
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[_fk_Strand] [varchar](150) NOT NULL,
	[MinItems] [int] NULL,
	[MaxItems] [int] NULL,
	[AdaptiveCut] [float] NULL,
	[StartAbility] [float] NULL,
	[StartInfo] [float] NULL,
	[Scalar] [float] NULL,
	[_fk_ProfLevels] [bigint] NULL,
	[LoaderID] [varchar](150) NULL,
	[SynthMin] [int] NULL,
	[SynthMax] [int] NULL,
	[InheritMin] [int] NULL,
	[InheritMax] [int] NULL,
	[InheritRatio] [float] NULL,
	[NumItems] [int] NULL,
	[LoadMin] [int] NULL,
	[LoadMax] [int] NULL,
	[_Key] [nvarchar](255) NOT NULL,
	[IsStrictmax] [bit] NOT NULL,
	[bpweight] [float] NOT NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
	[abilityWeight] [float] NULL,
	[precisionTarget] [float] NULL,
	[precisionTargetMetWeight] [float] NULL,
	[precisionTargetNotMetWeight] [float] NULL,
 CONSTRAINT [PK_AdminStrand] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Adminstrand_Test] ON [dbo].[tblAdminStrand] 
(
	[_fk_AdminSubject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblAdminStrand] ON [dbo].[tblAdminStrand] 
(
	[LoaderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAdminStimulus]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdminStimulus](
	[_fk_Stimulus] [varchar](100) NOT NULL,
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[NumItemsRequired] [int] NOT NULL,
	[MaxItems] [int] NOT NULL,
	[bpweight] [float] NOT NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
	[groupID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AdminStimulus] PRIMARY KEY CLUSTERED 
(
	[_fk_AdminSubject] ASC,
	[_fk_Stimulus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblItemGroup]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblItemGroup](
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[groupID] [varchar](50) NOT NULL,
	[NumItemsRequired] [int] NOT NULL,
	[MaxItems] [int] NOT NULL,
	[bpweight] [float] NOT NULL,
	[ftWeight] [float] NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
	[ftItemcount] [int] NULL,
	[opItemcount] [int] NULL,
	[ftWeightSum] [float] NULL,
 CONSTRAINT [PK_Itemgroup] PRIMARY KEY CLUSTERED 
(
	[_fk_AdminSubject] ASC,
	[groupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [qa].[Strands]    Script Date: 01/28/2015 15:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [qa].[Strands]
AS
	select 
		S1.*,
		case S1.TreeLevel
			when 1 then S1.Name
			when 2 then S2.Name
			when 3 then S3.Name
			when 4 then S4.Name
			when 5 then S5.Name
			when 6 then S6.Name
		end as Strand0,
		case S1.TreeLevel
			when 1 then null
			when 2 then S1.Name
			when 3 then S2.Name
			when 4 then S3.Name
			when 5 then S4.Name
			when 6 then S5.Name
		end as Strand1,
		case S1.TreeLevel
			when 1 then null
			when 2 then null
			when 3 then S1.Name
			when 4 then S2.Name
			when 5 then S3.Name
			when 6 then S4.Name
		end as Strand2,
		case S1.TreeLevel
			when 1 then null
			when 2 then null
			when 3 then null
			when 4 then S1.Name
			when 5 then S2.Name
			when 6 then S3.Name
		end as Strand3,
		case S1.TreeLevel
			when 1 then null
			when 2 then null
			when 3 then null
			when 4 then null
			when 5 then S1.Name
			when 6 then S2.Name
		end as Strand4,
		case S1.TreeLevel
			when 1 then null
			when 2 then null
			when 3 then null
			when 4 then null
			when 5 then null
			when 6 then S1.Name
		end as Strand5
	from 
		tblStrand S1
		left join tblStrand S2 on S1._fk_Parent = S2._Key
		left join tblStrand S3 on S2._fk_Parent = S3._Key
		left join tblStrand S4 on S3._fk_Parent = S4._Key
		left join tblStrand S5 on S4._fk_Parent = S5._Key
		left join tblStrand S6 on S5._fk_Parent = S6._Key
GO
/****** Object:  Table [dbo].[ItemScoreDimension]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemScoreDimension](
	[Dimension] [varchar](255) NOT NULL,
	[RecodeRule] [nvarchar](255) NULL,
	[ResponseBankScale] [varchar](150) NULL,
	[ScorePoints] [int] NOT NULL,
	[SurrogateItemID] [varchar](150) NULL,
	[Weight] [float] NOT NULL,
	[_Key] [uniqueidentifier] NOT NULL,
	[_efk_SurrogateITSKey] [bigint] NULL,
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[_fk_Item] [varchar](150) NOT NULL,
	[_fk_MeasurementModel] [int] NOT NULL,
 CONSTRAINT [PK_ItemScoreDim] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Scoredim_Test] ON [dbo].[ItemScoreDimension] 
(
	[_fk_AdminSubject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ScoreDimensionItem] ON [dbo].[ItemScoreDimension] 
(
	[_fk_Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetofTestGrades]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SetofTestGrades](
	[testID] [varchar](100) NOT NULL,
	[grade] [varchar](25) NOT NULL,
	[RequireEnrollment] [bit] NOT NULL,
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[EnrolledSubject] [varchar](100) NULL,
	[_Key] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SetofTestGrades] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_TestGrades_TestID] ON [dbo].[SetofTestGrades] 
(
	[testID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffinityGroup]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AffinityGroup](
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[GroupID] [varchar](100) NOT NULL,
	[description] [varchar](1000) NULL,
	[minItems] [int] NOT NULL,
	[maxItems] [int] NOT NULL,
	[IsStrictMax] [bit] NOT NULL,
	[weight] [float] NOT NULL,
	[selectionCriteria] [varchar](2000) NULL,
	[loadConfig] [bigint] NULL,
	[updateConfig] [bigint] NULL,
	[StartAbility] [float] NULL,
	[StartInfo] [float] NULL,
	[abilityWeight] [float] NULL,
	[precisionTarget] [float] NULL,
	[precisionTargetMetWeight] [float] NULL,
	[precisionTargetNotMetWeight] [float] NULL,
 CONSTRAINT [PK_AffinityGroup] PRIMARY KEY CLUSTERED 
(
	[_fk_AdminSubject] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[ClientTestKey]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ClientTestKey] (@clientname varchar(100), @testID varchar(100))
	RETURNS varchar(200) AS
BEGIN
	declare @testkey varchar(200);
    select @testKey = S._Key
    from tblSetofAdminSubjects S with(nolock), tblClient C with(nolock), tblTestAdmin A with(nolock)
    where C.Name = @clientname and A._fk_Client = C._Key and S.testID = @testID and S._fk_TestAdmin = A._key;

    return @testkey;
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_Strands]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_Strands] (
/*
Description: Load strands from loader_testblueprint

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			Original Code.
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN
	
	-- strands do not have a parentid and are always at level 1 of the content hierarchy
	-- content has parentid and parent is equivalent to strandid 
	-- 		treelevel value for content is determined by the number of seperators '|'    
	INSERT INTO tblStrand (_fk_Subject, Name, _fk_Parent, _Key, _fk_Client, TreeLevel, LoadConfig) 
	SELECT DISTINCT SubjectKey
		 , bpElementName
		 , CASE WHEN ParentID IS NULL OR ParentID = '' 
				THEN NULL 
				ELSE ParentID 
		   END
		 , bpElementID
		 , ClientKey
		 , TreeLevel
		 , Version
	  FROM tp.Loader_TestBluePrint tbp
	  JOIN tp.Loader_TestPackage tp ON tp.PackageKey = tbp._fk_Package	
	 WHERE ElementType IN ('strand', 'contentlevel')
	   AND bpElementID NOT IN (SELECT _Key FROM dbo.tblStrand)
	   AND tbp._fk_Package = @TestPackageKey;

END
GO
/****** Object:  UserDefinedFunction [dbo].[IsSelectable]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IsSelectable]  (@testkey varchar(200))
	RETURNS bit AS
BEGIN
	declare @result bit;
    set @result = 1;
    select @result = 0 
    from tblsetofadminsubjects
    where _KEy = @testkey and 
        (VirtualTest is not null
        or TestID like '%student help%'
        or TestID like '%paper%');

    return @result;
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_AdminStrands]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_AdminStrands] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN
    
	DECLARE @isSegmented BIT;

	-- create temp table to host data during data gathering and processing
	DECLARE @tblAdminStrand TABLE (
		_key						VARCHAR(255)
	  , _fk_adminsubject			VARCHAR(250)
	  , _fk_strand					VARCHAR(150)
	  , minitems					INT   
	  , maxitems					INT 
	  , bpweight					FLOAT 
	  , adaptivecut					FLOAT 
	  , startability				FLOAT
	  , startinfo					FLOAT 
	  , scalar						FLOAT
      , loadmin						INT 
      , loadmax						INT     
	  , isstrictmax					BIT 
	  , precisiontarget				FLOAT
	  , precisiontargetmetweight	FLOAT
	  , precisiontargetnotmetweight FLOAT
	  , abilityweight				FLOAT
	  , version 					BIGINT 
      , elementtype					VARCHAR(100)
	  , _fk_package 				VARCHAR(350)
	);

	-- first, figure out if the test is segmented or non-segmented
	-- if the bpelementid for test and segment are the same, then the test is non-segmented
	SET @isSegmented = (SELECT CASE WHEN cnt = 0 THEN 1 ELSE 0 END
						 FROM (
							SELECT COUNT(*) cnt
							  FROM tp.Loader_TestBluePrint tbp1
							  JOIN tp.Loader_TestBluePrint tbp2 ON tbp1.bpElementID = tbp2.bpElementID
															   AND tbp1._fk_Package = tbp2._fk_Package
							 WHERE tbp1.ElementType = 'test'
							   and tbp2.ElementType = 'segment'
							   and tbp2._fk_Package = @TestPackageKey
							) t
						);
						
	-- load "test" data for non-segmented tests
	-- the minopitem and maxopitem counts for strands/contentlevel for the test are available in the <testblueprint>
	INSERT INTO @tblAdminStrand (_Key, _fk_AdminSubject, _fk_Strand, MinItems, MaxItems, Version, ElementType, _fk_Package)
	SELECT DISTINCT test.bpElementID + '-' + strand.bpElementID
		 , test.bpElementID
	     , strand.bpElementID
		 , CASE WHEN strand.MinopItems IS NULL OR strand.MinopItems < 0 then 0 else strand.MinopItems end
		 , CASE WHEN strand.MaxopItems IS NULL OR strand.MaxopItems < 0 then 0 else strand.MaxopItems end
		 , strand.Version
		 , strand.ElementType
		 , strand._fk_Package
	  FROM tp.Loader_TestBluePrint test 	
	  JOIN tp.Loader_TestBluePrint strand ON strand._fk_package = test._fk_package 
	 WHERE test.elementtype = 'test'
	   and strand.elementtype in ('strand', 'contentlevel')
	   and test._fk_package = @TestPackageKey;


	IF @isSegmented = 1
	BEGIN 
		-- for segmented tests, load individual segments data
		-- the minopitem and maxopitem counts for strands/contentlevel for the segment are available in the <segmentblueprint>
		INSERT INTO @tblAdminStrand (_key, _fk_adminsubject, _fk_strand, minitems, maxitems, loadmin, loadmax, version, elementtype, _fk_package)
		SELECT DISTINCT segp.segmentid + '-' + bp.bpelementid
			 , segp.segmentid
			 , bp.bpelementid
			 , case when segp.minopitems is null or segp.minopitems < 0 then 0 else segp.minopitems end
			 , case when segp.maxopitems is null or segp.maxopitems < 0 then 0 else segp.maxopitems end
			 , case when segp.minopitems is null or segp.minopitems < 0 then 0 else segp.minopitems end
			 , case when segp.maxopitems is null or segp.maxopitems < 0 then 0 else segp.maxopitems end
			 , version
			 , elementtype
			 , bp._fk_package
		  FROM loader_testblueprint bp 	
		  JOIN loader_segmentblueprint segp ON segp.segmentbpelementid = bp.bpelementid		
										   AND segp._fk_package = bp._fk_package
		 WHERE elementtype in ('strand', 'contentlevel')
		   AND bp._fk_package = @TestPackageKey;
	END
	

	SELECT tmp._key
		 , MAX(CASE WHEN sisp.PropName = 'isstrictmax'	THEN (CASE sisp.propvalue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) AS isstrictmax
		 , MAX(CASE WHEN sisp.PropName = 'bpweight'		THEN sisp.PropValue ELSE NULL END) AS bpWeight
		 , MAX(CASE WHEN sisp.PropName = 'adaptivecut'	THEN sisp.PropValue ELSE NULL END) AS AdaptiveCut
		 , MAX(CASE WHEN sisp.PropName = 'startability'	THEN sisp.PropValue ELSE NULL END) AS startability
		 , MAX(CASE WHEN sisp.PropName = 'startinfo'	THEN sisp.PropValue ELSE NULL END) AS startinfo
		 , MAX(CASE WHEN sisp.PropName = 'scalar'		THEN sisp.PropValue ELSE NULL END) AS Scalar		 
		-- added on 03.20.2015
		 , MAX(CASE WHEN sisp.PropName = 'precisiontargetmetweight'		THEN sisp.PropValue ELSE NULL END) as precisiontargetmetweight
		 , MAX(CASE WHEN sisp.PropName = 'precisiontargetnotmetweight'	THEN sisp.PropValue ELSE NULL END) as precisiontargetnotmetweight
		 , MAX(CASE WHEN sisp.PropName = 'precisiontarget'				THEN sisp.PropValue ELSE NULL END) as precisiontarget
		 , MAX(CASE WHEN sisp.PropName = 'abilityweight'				THEN sisp.PropValue ELSE NULL END) as abilityweight		 
	  INTO #StrandProperties	 
	  FROM @tblAdminStrand tmp
	  JOIN tp.Loader_segmentitemselectionproperties sisp ON sisp.SegmentID = tmp._fk_adminsubject 
													    AND sisp.bpelementid = tmp._fk_strand
													    AND sisp._fk_package = tmp._fk_package		
	 WHERE tmp.elementtype = 'strand'
	   AND sisp._fk_package = @TestPackageKey
	 GROUP BY tmp._key;


	SELECT tmp._key
		 , MAX(CASE WHEN sisp.PropName = 'isstrictmax'	THEN (CASE sisp.propvalue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) AS isstrictmax
		 , MAX(CASE WHEN sisp.PropName = 'bpweight'		THEN sisp.propvalue ELSE NULL END) AS bpWeight
	  INTO #ContentProperties	 
	  FROM @tblAdminStrand tmp
	  JOIN tp.Loader_SegmentItemSelectionProperties sisp on sisp.segmentid = tmp._fk_adminsubject 
													    and sisp.bpelementid = tmp._fk_strand
													    and sisp._fk_package = tmp._fk_package	
	 WHERE tmp.ElementType = 'contentlevel'
	   AND sisp._fk_package = @TestPackageKey
	 GROUP BY tmp._key;


	UPDATE tmp
	   SET tmp.bpweight 	= p.bpweight
		 , tmp.adaptivecut 	= p.adaptivecut	
		 , tmp.startability = p.startability
		 , tmp.startinfo	= p.startinfo
		 , tmp.scalar   	= p.scalar
		 , tmp.isstrictmax	= p.isstrictmax
		 , tmp.abilityweight   = p.abilityweight
		 , tmp.precisiontarget = p.precisiontarget
		 , tmp.precisiontargetmetweight    = p.precisiontargetmetweight
		 , tmp.precisiontargetnotmetweight = p.precisiontargetnotmetweight		 
	  FROM @tblAdminStrand tmp
	  LEFT JOIN #StrandProperties p ON p._key = tmp._key;

	   
	UPDATE tmp
	   SET tmp.bpweight = p.bpweight
	     , tmp.isstrictmax = p.isstrictmax
	  FROM @tblAdminStrand tmp
	  LEFT JOIN #ContentProperties p ON p._key = tmp._key;


	-- set default values for both strand and content level
	UPDATE tmp
	   SET tmp.bpweight     = coalesce(tmp.bpweight, 1)
		 , tmp.isstrictmax	= coalesce(tmp.isstrictmax, 0)
	  FROM @tblAdminStrand tmp;

	  
	-- update test info, assuming the test/segment already exists
	UPDATE sas
	   SET sas._fk_adminsubject = tmp._fk_adminsubject
		 , sas._fk_strand 	= tmp._fk_strand
		 , sas.minitems 	= tmp.minitems
		 , sas.maxitems 	= tmp.maxitems
		 , sas.bpweight 	= tmp.bpweight
		 , sas.adaptivecut 	= tmp.adaptivecut
		 , sas.startability = tmp.startability
		 , sas.startinfo 	= tmp.startinfo
		 , sas.scalar 		= tmp.scalar 
		 , sas.isstrictmax  = tmp.isstrictmax
		 , sas.updateconfig = tmp.version
		 , sas.loadmin		= tmp.loadmin
		 , sas.loadmax		= tmp.loadmax
		 , sas.precisiontarget 				= tmp.precisiontarget
		 , sas.precisiontargetmetweight 	= tmp.precisiontargetmetweight
		 , sas.precisiontargetnotmetweight  = tmp.precisiontargetnotmetweight
		 , sas.abilityweight 				= tmp.abilityweight		 
	  FROM tbladminstrand sas
	  JOIN @tblAdminStrand tmp ON tmp._key = sas._key;


	-- check if test or segment already exists
	INSERT INTO dbo.tbladminstrand (_key, _fk_adminsubject, _fk_strand, minitems, maxitems, isstrictmax, bpweight, adaptivecut, startability, startinfo, scalar, loadconfig, loadmin, loadmax, precisiontarget, precisiontargetmetweight, precisiontargetnotmetweight, abilityweight)
	SELECT _key, _fk_adminsubject, _fk_strand, minitems, maxitems, isstrictmax, bpweight, adaptivecut, startability, startinfo, scalar, version, loadmin, loadmax, precisiontarget, precisiontargetmetweight, precisiontargetnotmetweight, abilityweight
	  FROM @tblAdminStrand tmp
	 WHERE NOT EXISTS ( SELECT 1 
						  FROM tbladminstrand sas
						 WHERE sas._fk_adminsubject = tmp._fk_adminsubject
						   AND sas._fk_strand = tmp._fk_strand);


	DROP TABLE #ContentProperties;
	DROP TABLE #StrandProperties;

END

GO

/****** Object:  StoredProcedure [tp].[spLoad_AdminStimuli]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_AdminStimuli] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	-- if passages do not exists we need not load admin stimuli data 
	IF NOT EXISTS (SELECT * FROM tp.Loader_TestPassages WHERE _fk_package = @TestPackageKey) 
		RETURN;


	DECLARE @tblStimulus TABLE (
		_fk_stimulus 	 varchar(100)
	  , _fk_adminsubject varchar(250)
	  , numitemsrequired int
	  , maxitems 		 int
-- 	  , bpweight 		 float 
	  , version 		 bigint
	  , groupid 		 varchar(50)
	);

	-- ?? have to write logic load passages when fixedform test
	INSERT INTO @tblStimulus (_fk_stimulus, _fk_adminsubject, numitemsrequired, maxitems, version, groupid)
	SELECT PassageID
		 , SegmentID
		 , CASE WHEN MaxResponses = 'ALL' THEN -1 ELSE MaxResponses END
		 , CASE WHEN MaxItems = 'ALL' THEN -1 ELSE MaxItems END
		 , Version
		 , SUBSTRING(formitemgroupid, CHARINDEX(':', formitemgroupid, 1)+1, LEN(formitemgroupid))
	  FROM tp.Loader_TestFormItemGroup tfig
	  JOIN tp.Loader_SegmentForm sf on sf.FormPartitionID = tfig.FormPartitionID
								and sf._fk_Package = tfig._fk_Package	  
	 WHERE PassageID IS NOT NULL 
	   AND PassageID <> ''
	   AND sf._fk_Package = @TestPackageKey;

	INSERT INTO @tblStimulus (_fk_stimulus, _fk_adminsubject, numitemsrequired, maxitems, version, groupid) 
	SELECT spref.passageid
		 , sp.SegmentID
		 , CASE WHEN sp.maxresponses = 'ALL' then -1 else sp.maxresponses end
		 , CASE WHEN sp.maxitems = 'ALL' then -1 else sp.maxitems end
		 , sp.version
		 , sp.itemgroupid 
	  FROM tp.Loader_SegmentPool sp
	  JOIN tp.Loader_SegmentPoolPassageRef spref ON spref.segmentid = sp.segmentid
												and spref.itemgroupid = sp.itemgroupid
												and spref._fk_package = sp._fk_package	
	 WHERE spref.passageid is not null 
	   and spref.passageid <> ''
	   and sp._fk_package = @TestPackageKey;


	insert into tbladminstimulus (_fk_stimulus, _fk_adminsubject, numitemsrequired, maxitems, loadconfig, groupid) 
	select DISTINCT *
	  from @tblStimulus tmp
	 where not exists (select 1
						from dbo.tblAdminStimulus st
					   where st._fk_stimulus = tmp._fk_stimulus
						 and st._fk_adminsubject = tmp._fk_adminsubject);

	update st
	   set st.numitemsrequired = tmp.numitemsrequired
		 , st.maxitems = tmp.maxitems
		 , st.updateconfig = tmp.version
	  from dbo.tblAdminStimulus st
	  join @tblStimulus tmp on st._fk_stimulus = tmp._fk_stimulus
						   and st._fk_adminsubject = tmp._fk_adminsubject;


END
GO
/****** Object:  StoredProcedure [tp].[spLoad_AdminItems]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_AdminItems] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN
	
	DECLARE @AdminItems TABLE (
		_fk_Item			VARCHAR(150)
	  , _fk_AdminSubject	VARCHAR(250)
	  , GroupID				VARCHAR(100)
	  , ItemPosition		INT
	  , isFieldTest			BIT
	  , isActive			BIT
	  , BlockID				VARCHAR(10)
	  , isRequired			BIT
	  , _fk_TestAdmin		VARCHAR(150)
	  , _fk_Strand			VARCHAR(150)
	  , GroupKey			VARCHAR(100)
	  , StrandName			VARCHAR(150)
	  , IRT_a				FLOAT
	  , IRT_b				VARCHAR(150)
	  , IRT_c				FLOAT
	  , IRT_Model			VARCHAR(100)
	  , clString			VARCHAR(MAX)
	  , Version				BIGINT
	);

	DECLARE @IRT TABLE (
		TestItemID		VARCHAR(150)
	  , MeasureModel	VARCHAR(100)
	  , IRT_a			FLOAT
	  , IRT_b			VARCHAR(150)
	  , IRT_c			FLOAT
	);


	-- first gather the linked item and adminsubject information	
	INSERT INTO @AdminItems (_fk_Item, _fk_AdminSubject, _fk_TestAdmin, _fk_Strand, StrandName, Version)
	SELECT _fk_Item
		 , _fk_AdminSubject
		 , tp.TestAdmin
		 , _fk_Strand
		 , tir.Ref
		 , s.Version
	  FROM tp.Loader_SetOfItemStrands s
	  JOIN tp.Loader_TestItemRefs tir ON tir.TestItemID = s._fk_Item 
									 AND tir._fk_package = s._fk_Package
	  JOIN tp.Loader_TestPackage tp ON tp.PackageKey = s._fk_Package
	 WHERE tir.RefCategory = 'strand' 
	   AND s._fk_Package = @TestPackageKey;

	-- now gather IRT information from itemscoredimension
	INSERT INTO @IRT
	SELECT TestItemID
		 , MeasureModel
		 , MAX(CASE WHEN Measurementparam = 'a' THEN MeasurementValue ELSE NULL END) 
		 , AVG(CASE WHEN Measurementparam like 'b%' THEN MeasurementValue ELSE NULL END) 
		 , MAX(CASE WHEN Measurementparam = 'c' THEN MeasurementValue ELSE NULL END) 
	  FROM tp.Loader_ItemScoreDimension
	 WHERE _fk_package = @TestPackageKey
	 GROUP BY TestItemID, MeasureModel;


	-- update @AdminItems with irt data
	UPDATE ai
	   SET ai.irt_model = irt.measuremodel
		 , ai.irt_a = COALESCE(irt.irt_a, 1)
		 , ai.irt_b = irt.irt_b
		 , ai.irt_c = COALESCE(irt.irt_c, 0)
	  FROM @AdminItems ai
	  JOIN @IRT irt ON irt.testitemid = ai._fk_item;
  
	-- gather and update remaining data columns
	UPDATE ai
	   SET ai.GroupID 		= SUBSTRING(FormItemGroupID, CHARINDEX(':', FormItemGroupID, 1)+1, LEN(FormItemGroupID))
		 , ai.ItemPosition 	= l.GroupPosition
		 , ai.isFieldTest 	= l.isFieldTest
		 , ai.isActive 		= l.isActive
		 , ai.BlockID 		= l.BlockID
		 , ai.isRequired    = l.ResponseRequired
		 , ai.GroupKey		= SUBSTRING(FormItemGroupID, CHARINDEX(':', FormItemGroupID, 1)+1, LEN(FormItemGroupID)) + '_' + l.BlockID
	  FROM @AdminItems ai
	  JOIN tp.Loader_TestFormGroupItems l on l.itemid = ai._fk_item	 
	 WHERE _fk_Package = @TestPackageKey;


	UPDATE ai
	   SET ai.GroupID		= sp.ItemGroupID
		 , ai.ItemPosition 	= sp.GroupPosition
		 , ai.isFieldTest 	= sp.isFieldTest
		 , ai.isActive 		= sp.isActive
		 , ai.BlockID 		= sp.BlockID
		 , ai.isRequired    = sp.ResponseRequired
		 , ai.GroupKey		= sp.ItemGroupID + '_' + sp.BlockID
	  FROM @AdminItems ai
	  JOIN tp.Loader_SegmentPoolGroupItem sp on sp.GroupItemID  = ai._fk_Item	 
	 WHERE _fk_Package = @TestPackageKey;


	-- Make string of all content levels, strands, and affinity group membership for each item for fast loading by adaptive algorithm
	UPDATE ai
	   SET clstring = dbo._makeCLString(ai._fk_AdminSubject, ai._fk_Item)
	  FROM @AdminItems ai
	  JOIN tp.Loader_Segment s on s.SegmentID = ai._fk_AdminSubject 
						      and ItemSelection like 'adaptive%' 
	 WHERE _fk_Package = @TestPackageKey;
	
	-- select * from @AdminItems	

	-- insert items that do not already exists
	INSERT INTO dbo.tblsetofadminitems (_fk_item, _fk_adminsubject, loadconfig, _fk_strand, _fk_testadmin)
	SELECT _fk_item, _fk_adminsubject, version, _fk_strand, _fk_testadmin
      FROM @AdminItems tmp 
	 WHERE NOT EXISTS (SELECT 1 
						 FROM tblsetofadminitems i 
						WHERE i._fk_adminsubject = tmp._fk_adminsubject 
						  AND i._fk_item = tmp._fk_item
					);

	-- update item values/property fields
	UPDATE i
	   SET i.groupid 	  = tmp.groupid 
		 , i.itemposition = tmp.itemposition
		 , i.isfieldtest  = COALESCE(tmp.isfieldtest, 0)
		 , i.isactive 	  = COALESCE(tmp.isactive, 1)
		 , i.blockid 	  = tmp.blockid
		 , i.isrequired	  = COALESCE(tmp.isrequired, 1)
		 , i.groupkey	  = tmp.groupkey 
		 , i.strandname   = tmp.strandname
		 , i.irt_a 		  = tmp.irt_a
		 , i.irt_b 		  = tmp.irt_b
		 , i.irt_c 		  = tmp.irt_c
		 , i.irt_model	  = tmp.irt_model
		 , i.clstring 	  = tmp.clstring
		 , i.updateconfig = tmp.version
	  FROM dbo.tblsetofadminitems i
	  JOIN @AdminItems tmp ON tmp._fk_adminsubject = i._fk_adminsubject 
						  AND tmp._fk_item = i._fk_item;
		 


END

GO
/****** Object:  StoredProcedure [tp].[spLoad_AffinityGroups]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_AffinityGroups] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	DECLARE @isSegmented BIT;
	DECLARE @TestKey VARCHAR(250);

	DECLARE @AffinityGroup TABLE (
	  	_fk_AdminSubject VARCHAR(250)
	  , GroupID 		 VARCHAR(100)
	  , MinItems 		 INT
	  , MaxItems 		 INT
	  , bpweight 		 FLOAT
	  , isstrictmax		 BIT 
	  , precisiontarget	 FLOAT 
	  , abilityweight	 FLOAT 
	  , loadconfig 		 BIGINT 
	  , updateconfig 	 BIGINT 
	  , startability 		FLOAT 
	  , startinfo 			FLOAT  
	  , precisiontargetmetweight	FLOAT 
	  , precisiontargetnotmetweight FLOAT 
	  , _fk_package 	 VARCHAR(350)
	);

	DECLARE @AffinityGroupItem TABLE (
		_fk_AdminSubject VARCHAR(250)
	  , GroupID 		 VARCHAR(100)
	  , _fk_Item 		 VARCHAR(100)
	);

	-- first, figure out if the test is segmented or non-segmented
	-- if the bpelementid for test and segment are the same, then the test is non-segmented
	SET @isSegmented = (SELECT CASE WHEN cnt = 0 THEN 1 ELSE 0 END
						  FROM (
							SELECT COUNT(*) cnt
							  FROM tp.Loader_TestBluePrint tbp1
							  JOIN tp.Loader_TestBluePrint tbp2 ON tbp1.bpElementID = tbp2.bpElementID
															   AND tbp1._fk_Package = tbp2._fk_Package
							 WHERE tbp1.ElementType = 'test'
							   AND tbp2.ElementType = 'segment'
							   AND tbp2._fk_Package = @TestPackageKey
							) t
						);
		
	-- load "test" affinity groups for non-segmented tests
	INSERT INTO @AffinityGroup (_fk_AdminSubject, GroupID, MinItems, MaxItems, LoadConfig, UpdateConfig, _fk_Package)
	SELECT test.bpElementID
		 , ag.bpElementID
		 , CASE WHEN ag.MinOPItems IS NULL OR ag.MinOPItems < 0 THEN 0 ELSE ag.MinOPItems END
		 , CASE WHEN ag.MaxOPItems IS NULL OR ag.MaxOPItems < 0 THEN 0 ELSE ag.MaxOPItems END
		 , ag.Version
		 , ag.Version
		 , ag._fk_Package
	  FROM tp.Loader_TestBluePrint test 	
	  JOIN tp.Loader_TestBluePrint ag ON ag._fk_Package = test._fk_Package 
	 WHERE test.ElementType = 'test'
	   AND ag.ElementType = 'affinitygroup'
	   AND test._fk_Package = @TestPackageKey;

	SET @TestKey = (SELECT bpElementID FROM tp.Loader_TestBluePrint WHERE ElementType = 'test' AND _fk_Package = @TestPackageKey);

	INSERT INTO @AffinityGroupItem (_fk_adminsubject, groupid, _fk_item)
	SELECT @TestKey, ref, testitemid
	  FROM tp.Loader_TestItemRefs 
	 WHERE refcategory = 'affinitygroup'
	   AND _fk_package = @TestPackageKey;

	IF @isSegmented = 1
	BEGIN
		-- second, load only available affinitygroup records for each of the segment(s) 
		INSERT INTO @AffinityGroup (_fk_adminsubject, groupid, minitems, maxitems, loadconfig, updateconfig, _fk_package)
		SELECT segp.segmentid
			 , bp.bpelementid
			 , case when segp.minopitems is null or segp.minopitems < 0 then 0 else segp.minopitems end
			 , case when segp.maxopitems is null or segp.maxopitems < 0 then 0 else segp.maxopitems end
			 , version
			 , version
			 , bp._fk_package
		  FROM tp.Loader_TestBluePrint bp 	
		  JOIN tp.Loader_SegmentBluePrint segp ON segp.segmentbpelementid = bp.bpelementid		
										   AND segp._fk_package = bp._fk_package
		 WHERE elementtype = 'affinitygroup'
		   AND bp._fk_package = @TestPackageKey;

		INSERT INTO @AffinityGroupItem (_fk_adminsubject, groupid, _fk_item)
		SELECT ref1.ref, ref2.ref, ref2.testitemid
		  FROM tp.Loader_TestItemRefs ref1
		  JOIN tp.Loader_TestItemRefs ref2 ON ref2._fk_package = ref1._fk_package AND ref1.testitemid = ref2.testitemid
		 WHERE ref1.refcategory = 'segment'
		   AND ref2.refcategory = 'affinitygroup'
		   AND ref1._fk_package = @TestPackageKey;
	END


	SELECT tmp._fk_adminsubject 
		 , tmp.groupid
		 , MAX(CASE WHEN sisp.PropName = 'isstrictmax'	THEN (CASE sisp.propvalue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) as isstrictmax		 
		 , MAX(CASE WHEN sisp.PropName = 'bpweight'		THEN sisp.PropValue ELSE NULL END) AS bpWeight
		 , MAX(CASE WHEN sisp.PropName = 'startability'	THEN sisp.PropValue ELSE NULL END) AS startability
		 , MAX(CASE WHEN sisp.PropName = 'startinfo'	THEN sisp.PropValue ELSE NULL END) AS startinfo
		 , MAX(CASE WHEN sisp.PropName = 'abilityweight'				THEN sisp.PropValue ELSE NULL END) as abilityweight
		 , MAX(CASE WHEN sisp.PropName = 'precisiontarget'				THEN sisp.PropValue ELSE NULL END) as precisiontarget
		 , MAX(CASE WHEN sisp.PropName = 'precisiontargetmetweight'		THEN sisp.PropValue ELSE NULL END) as precisiontargetmetweight
		 , MAX(CASE WHEN sisp.PropName = 'precisiontargetnotmetweight'	THEN sisp.PropValue ELSE NULL END) as precisiontargetnotmetweight
	  INTO #tblAffinityProperties		 
	  FROM @AffinityGroup tmp
	  JOIN tp.Loader_SegmentItemSelectionProperties sisp ON sisp.segmentid = tmp._fk_adminsubject 
													    AND sisp.bpelementid = tmp.groupid
													    AND sisp._fk_package = tmp._fk_package	
	 WHERE sisp._fk_package = @TestPackageKey
	 GROUP BY tmp._fk_adminsubject, tmp.groupid


	UPDATE tmp
	   SET tmp.bpweight    		= p.bpweight
		 , tmp.isstrictmax 		= p.isstrictmax
		 , tmp.startability     = p.startability
		 , tmp.startinfo	    = p.startinfo
		 , tmp.abilityweight    = p.abilityweight
		 , tmp.precisiontarget  = p.precisiontarget
		 , tmp.precisiontargetmetweight    = p.precisiontargetmetweight
		 , tmp.precisiontargetnotmetweight = p.precisiontargetnotmetweight
	  FROM @AffinityGroup tmp
	  JOIN #tblAffinityProperties p ON p._fk_adminsubject = tmp._fk_adminsubject
								   AND p.groupid = tmp.groupid;


	-- set default values
	UPDATE tmp
	   SET tmp.bpweight     = coalesce(tmp.bpweight, 1)
		 , tmp.isstrictmax	= coalesce(tmp.isstrictmax, 0)
	  FROM @AffinityGroup tmp;	


	-- delete and re-load all affinitygroup records for the given adminsubjectkey
	DELETE ag
	  FROM dbo.AffinityGroup ag
	  join @AffinityGroup tmp ON tmp._fk_adminsubject = ag._fk_adminsubject;

	DELETE ag
	  FROM dbo.AffinityGroupItem ag
	  JOIN @AffinityGroupItem tmp ON tmp._fk_adminsubject = ag._fk_adminsubject;  


	INSERT INTO dbo.AffinityGroup (_fk_adminsubject, groupid, minitems, maxitems, weight, isstrictmax, loadconfig, updateconfig, abilityweight, precisiontarget, startability, startinfo, precisiontargetmetweight, precisiontargetnotmetweight)
	SELECT _fk_adminsubject, groupid, minitems, maxitems, bpweight, isstrictmax, loadconfig, updateconfig, abilityweight, precisiontarget, startability, startinfo, precisiontargetmetweight, precisiontargetnotmetweight
	  FROM @AffinityGroup;

	INSERT INTO dbo.AffinityGroupItem (_fk_adminsubject, groupid, _fk_item)
	SELECT _fk_adminsubject, groupid, _fk_item
	  FROM @AffinityGroupItem;


	-- clean-up
	DROP TABLE #tblAffinityProperties;

END

GO
/****** Object:  StoredProcedure [tp].[spLoad_TestGrades]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_TestGrades] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	DECLARE @TestID VARCHAR(150);

	DECLARE @GradeList TABLE (
		GradeName  VARCHAR(100)
	  , GradeLabel VARCHAR(200)
	);

	DECLARE @TestKeys TABLE (
		TestKey VARCHAR(250)
	  , TestID  VARCHAR(255)
	);
		
	-- load grades for the corresponding testpackage into temp table
	INSERT INTO @GradeList
	SELECT PropValue, PropLabel
	  FROM tp.Loader_TestPackageProperties
	 WHERE PropName = 'grade'
	   AND _fk_Package = @TestPackageKey;

	INSERT INTO @TestKeys
	SELECT DISTINCT bpElementID
		 , bpElementName
	  FROM tp.Loader_TestBluePrint
	 WHERE ElementType IN ('test', 'segment')
	   AND _fk_Package = @TestPackageKey;

	SET @TestID = (SELECT bpElementName FROM tp.Loader_TestBluePrint
					WHERE ElementType = 'test'
					  AND _fk_Package = @TestPackageKey);
	
	-- delete existing set of grades for that test
    DELETE 
	  FROM dbo.SetofTestGrades 
	 WHERE _fk_AdminSubject IN (SELECT TestKey FROM @TestKeys);


	INSERT INTO dbo.SetofTestGrades
	SELECT @TestID
		 , gl.GradeName
		 , 0
		 , tk.TestKey
		 , NULL
		 , NEWID()
	  FROM @TestKeys tk
	  JOIN @GradeList gl ON 1 = 1;


END
GO
/****** Object:  StoredProcedure [tp].[spLoad_AdminForms]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_AdminForms] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	-- testformid is a combination of Testkey : Testform.cohort - Testform.language
	-- tfp.formpartitionid is a combination of itsbankkey - itskey
	SELECT sf.SegmentID			AS AdminSubject 
		 , 'Default'			AS Cohort
		 , prop.PropValue		AS Lang
		 , tfp.FormPartitionID
		 , tfp.FormPartitionName
		 , COALESCE(tfp._efk_ITSBank, pkg._efk_ItemBank)	AS ITSBankKey 
		 , COALESCE(tfp._efk_ITSKey, 0)						AS ITSKey 
		 , tfp.Version
	  INTO #TestForm	 
	  FROM tp.Loader_TestPackage pkg 
	  JOIN tp.Loader_TestFormPartition tfp ON tfp._fk_Package = pkg.PackageKey
	  JOIN tp.Loader_SegmentForm sf ON sf.FormPartitionID = tfp.FormPartitionID
								   AND sf._fk_Package = tfp._fk_Package
	  LEFT JOIN tp.Loader_TestFormProperties prop ON prop.TestFormID = tfp.TestFormID
												 AND prop._fk_Package = tfp._fk_Package
	 WHERE prop.PropName = 'language'
	   AND prop.isPool = 0
	   AND tfp._fk_Package = @TestPackageKey;
	  
 
	-- insert any missing forms	
	INSERT INTO dbo.TestForm (_fk_AdminSubject, Cohort, Language, _Key, FormID, _efk_ITSBank, _efk_ITSKey, LoadConfig)
	SELECT *
	  FROM #TestForm tmp
	 WHERE NOT EXISTS (SELECT 1 
						 FROM dbo.TestForm tf
						WHERE tf._fk_adminsubject = tmp.adminsubject 
						  AND tf._key = tmp.formpartitionid);
		
	-- the item language loader does not have test key to go on, and may load item languages falsely for a fixed form test 
-- ??  this is t-code code copy....do we need to do this??
--     delete ip
-- 	  from tblitemprops ip
--      where propname = 'language' 
-- 	   and exists (select 1 from loader_forms where testkey = _fk_adminsubject)
-- 	   and not exists (select 1 from loader_forms where testkey = _fk_adminsubject and language = propvalue);

	-- clean-up
	DROP TABLE #TestForm;

END
GO
/****** Object:  StoredProcedure [qa].[ComputationRulesByTest]    Script Date: 01/28/2015 15:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[ComputationRulesByTest]
    @ComputationLocation varchar(32),
	@TestName varchar(255)
AS
BEGIN
    declare @client varchar(100);
    set @client = dbo.TestkeyClient(@testName);

    select distinct A._Key as TestID, L.Location as ComputationLocation,
        tsf.ComputationOrder, tsf.MeasureLabel, (tsf.MeasureOf) as MeasureOf, tsf.ComputationRule, P.ParameterPosition, P.IndexType, V.[Index], P.Type, V.Value,
        tsf.ReportingInstrument, tsf.ReportingGrade, tsf.ReportingSubject, tsf.ReportingScale, tsf.ReportingMeasureType, tsf.ReportingTransform
    from
        SCORECONFIGS_TestScoreFeature tsf
        left join SCORECONFIGS_ComputationRuleParameterValue V on V._fk_TestScoreFeature = tsf._Key
        left join SCORECONFIGS_ComputationRuleParameters P on V._fk_Parameter = P._Key
        inner join tblSetofAdminSubjects A on A.TestID = tsf.TestID
        inner join SCORECONFIGS_Feature_ComputationLocation L on L._fk_TestScoreFeature = tsf._Key
    where  L.Location = @ComputationLocation 
         and A._Key = @TestName
        and tsf.Clientname = @client
    order by tsf.ComputationOrder, P.ParameterPosition;
END
GO
/****** Object:  Table [dbo].[AffinityGroupItem]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AffinityGroupItem](
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[GroupID] [varchar](100) NOT NULL,
	[_fk_Item] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AffinityItem] PRIMARY KEY CLUSTERED 
(
	[_fk_AdminSubject] ASC,
	[GroupID] ASC,
	[_fk_Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[_MakeTestGradeSpan]    Script Date: 01/28/2015 15:21:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[_MakeTestGradeSpan] (@client varchar(100), @test_ID varchar(100))
	RETURNS varchar(100) AS
BEGIN
    declare @result varchar(100);
    
    declare @grade varchar(25);
    declare @grades table (grade varchar(25), g int);
    declare @numgrades int;
    declare @numintgrades int;
    declare @intgrade int;

    insert into @grades (grade, g)
    select grade, case when IsNumeric(grade) = 1 then cast(grade as int) else null end
    from SetofTestGrades where _fk_AdminSubject = dbo.ClientTestKey(@client, @test_ID);

    
    select @numgrades = count(*) from @grades;
    select @numintgrades = count(*) from @grades where g is not null;

    if (@numgrades = 0) return '';

    if (@numgrades = 1) begin
        select @grade = grade, @intgrade = g from @grades;
        if (@intgrade is null) return @grade ;
        else return  @grade ;
    end
        
    if (@numintgrades = @numgrades) begin
        declare @mingrade int;
        declare @maxgrade int;
        select @mingrade = min(g), @maxgrade = max(g) from @grades;
        if (@mingrade = 9 and @maxgrade = 12 and @numgrades = 4) return 'HS' ;
        if (@maxgrade - @mingrade + 1 = @numintgrades) 
            return  cast(@mingrade as varchar(10)) + '-' + cast(@maxgrade as varchar(10)) ;
        set @result = cast(@mingrade as varchar(10));
        delete from @grades where g = @mingrade;
        while (exists (select * from @grades)) begin
            select @mingrade = min(g) from @grades;
            delete from @grades where g = @mingrade;
            set @result = @result + ', ' + cast (@mingrade as varchar(10));
        end
        return @result ;
     end

     select @grade = min(grade) from @grades;
     set @result = @grade;
     delete from @grades where grade = @grade;
     while (exists (select * from @grades)) begin
        select @grade = min(grade) from @grades;
        delete from @grades where grade = @grade;
        set @result = @result + ', ' + @grade;
     end
     return @result ;
END
GO
/****** Object:  UserDefinedFunction [dbo].[_MakeTestGradeLabel]    Script Date: 01/28/2015 15:21:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[_MakeTestGradeLabel] (@clientname varchar(100), @test_ID varchar(100))
	RETURNS varchar(100) AS
BEGIN
    declare @result varchar(100);
    
    declare @grade varchar(25);
    declare @grades table (grade varchar(25), g int);
    declare @numgrades int;
    declare @numintgrades int;
    declare @intgrade int;

    insert into @grades (grade, g)
    select grade, case when IsNumeric(grade) = 1 then cast(grade as int) else null end
    from SetofTestGrades where _fk_AdminSubject = dbo.ClientTestKey(@clientname, @test_ID);

    
    select @numgrades = count(*) from @grades;
    select @numintgrades = count(*) from @grades where g is not null;

    if (@numgrades = 0) return '';

    if (@numgrades = 1) begin
        select @grade = grade, @intgrade = g from @grades;
        if (@intgrade is null) return @grade ;
        else return 'Grade ' + @grade ;
    end
        
    if (@numintgrades = @numgrades) begin
        declare @mingrade int;
        declare @maxgrade int;
        select @mingrade = min(g), @maxgrade = max(g) from @grades;
        if (@mingrade = 9 and @maxgrade = 12 and @numgrades = 4) return 'High School' ;
        if (@maxgrade - @mingrade + 1 = @numintgrades) 
            return 'Grades ' + cast(@mingrade as varchar(10)) + ' - ' + cast(@maxgrade as varchar(10)) ;
        set @result = 'Grades ' + cast(@mingrade as varchar(10));
        delete from @grades where g = @mingrade;
        while (exists (select * from @grades)) begin
            select @mingrade = min(g) from @grades;
            delete from @grades where g = @mingrade;
            set @result = @result + ', ' + cast (@mingrade as varchar(10));
        end
        return @result ;
     end

     select @grade = min(grade) from @grades;
     set @result = @grade;
     delete from @grades where grade = @grade;
     while (exists (select * from @grades)) begin
        select @grade = min(grade) from @grades;
        delete from @grades where grade = @grade;
        set @result = @result + ', ' + @grade;
     end
     return @result ;
END
GO
/****** Object:  StoredProcedure [qa].[GetItemByTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[GetItemByTest]
	@TestName varchar(255),
	@ItemKey varchar(150)
AS
BEGIN

	select 
		I.[_efk_Item], I.[_efk_ItemBank],
		S._Key as TestSegment,
		AI.IsActive AS active, AI.IsRequired as Required, (tS.Name) as Strand,
		case when
			left(AI.GroupID, 1) = 'G' then AI.GroupID
		else
			''
		end as StimulusID,
        I.ScorePoint AS scored, I.Answer, AI.IsFieldTest AS fieldtest
	from
		tblItem AS I
		inner join tblSetofAdminItems AS AI ON I._Key = AI._fk_Item 
		inner join tblSetofAdminSubjects AS S ON AI._fk_AdminSubject = S._Key
		left join tblStrand tS on AI._fk_Strand = tS._Key
	where 
        ((S._Key = @TestName and S.IsSegmented = 0)
        or (S.VirtualTest = @Testname))
        and I._Key = @ItemKey
END
GO
/****** Object:  StoredProcedure [qa].[ComputationLocationsByTest]    Script Date: 01/28/2015 15:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[ComputationLocationsByTest]
	@TestName varchar(255)
AS
BEGIN
    declare @client varchar(100);
    set @client = dbo.TestkeyClient(@testName);
	select A._Key as TestKey, L.Location as ComputationLocation,
        tsf.MeasureLabel, (tsf.MeasureOf) as MeasureOf
	from
		SCORECONFIGS_TestScoreFeature tsf
		inner join tblSetofAdminSubjects A on A.TestID = tsf.TestID
        inner join SCORECONFIGS_Feature_ComputationLocation L on L._fk_TestScoreFeature = tsf._Key
    where
		A._Key = @TestName
        and tsf.Clientname = @client
END
GO
/****** Object:  Table [dbo].[ItemMeasurementParameter]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMeasurementParameter](
	[_fk_ItemScoreDimension] [uniqueidentifier] NOT NULL,
	[_fk_MeasurementParameter] [int] NOT NULL,
	[parmvalue] [float] NULL,
 CONSTRAINT [PK_ItemMeasureParm] PRIMARY KEY CLUSTERED 
(
	[_fk_ItemScoreDimension] ASC,
	[_fk_MeasurementParameter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [qa].[SegmentsByTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[SegmentsByTest]
        @TestName varchar(255)
AS
BEGIN
        declare @client varchar(100);
        set @client = dbo.TestkeyClient(@testName);

        select sas.[_Key] as SegmentName, sas.TestID as SegmentID, sas.MaxItems, sas.MinItems, sas.FTMaxItems, sas.FTMinItems, sas.FTStartPos, sas.FTEndPos, 
                coalesce(sas.TestPosition, 1) as TestPosition, sas.selectionAlgorithm, FORM._Key as FormKey, FORM.FormID as FormId, FORM.startDate, FORM.endDate
        from tblSetofAdminSubjects sas
        with (nolock)
        left outer join 
        (select f._fk_AdminSubject, f._Key, f.FormID, fp.startdate, fp.endDate
                from TestForm f
                with (nolock)
                inner join dbo.TDSCONFIGS_Client_TestformProperties fp 
                with (nolock)
                        on f.FormID = fp.FormID and f.[_fk_AdminSubject] = fp.testkey and f.[_Key] = fp._efk_TestForm and fp.clientName = @client) as FORM
                on FORM._fk_AdminSubject = sas._Key
        where isnull(sas.VirtualTest, sas._Key) = @testName
                and selectionAlgorithm <> 'virtual'
        order by TestPosition   
END
GO
/****** Object:  StoredProcedure [qa].[Load_ItemsByTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[Load_ItemsByTest]
	@TestName varchar(255)
AS
BEGIN

	select @Testname AS _fk_TestName, S._Key as TestSegment, I._efk_ItemBank AS _fk_AIRBank, I._efk_Item AS _fk_ItemName,
		AI.IsActive AS active, AI.IsRequired as Required, AI.notForScoring, (tS.Name) as Strand,
		case when
			left(AI.GroupID, 1) = 'G' then AI.GroupID
		else
			''
		end as StimulusID,
        I.ScorePoint AS scored, I.Answer, AI.IsFieldTest AS fieldtest,
		0 AS ParametersOnTestScale
	from
		tblItem AS I
		inner join tblSetofAdminItems AS AI ON I._Key = AI._fk_Item 
		inner join tblSetofAdminSubjects AS S ON AI._fk_AdminSubject = S._Key
		left join tblStrand tS on AI._fk_Strand = tS._Key
	where 
        (S._Key = @TestName and S.IsSegmented = 0)
        or (S.VirtualTest = @Testname)
    order by S._Key;

END
GO
/****** Object:  StoredProcedure [qa].[StimulusInfo]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[StimulusInfo]
	@TestKey varchar(255),
	@StimulusKey varchar(100)
AS
BEGIN
	select 
		NumItemsRequired
	from
		tblAdminStimulus S
	where
		S.[_fk_Stimulus] = @StimulusKey
		and S.[_fk_AdminSubject] = @TestKey
END
GO
/****** Object:  StoredProcedure [qa].[StimuliByTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[StimuliByTest]
	@TestName varchar(255)
AS
BEGIN
	select @TestName as TestID, sas._Key as TestSegment, S.groupID as StimulusID, NumItemsRequired
	from
		tblAdminStimulus S
		join tblSetofAdminSubjects sas on sas._Key = S._fk_AdminSubject 
	where (sas._Key = @TestName and sas.IsSegmented = 0) or (sas.VirtualTest = @TestName)
    order by sas._Key;
END
GO
/****** Object:  StoredProcedure [qa].[TestFeature_Constraints]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[TestFeature_Constraints](
       @TestName varchar(255)
)
AS
BEGIN
	SELECT  IsNull(J.VirtualTest, J._Key) as _fk_TestName, J._Key as TestSegment, 'Strand' as _fk_Feature, (tS.Name) as _fk_FeatureValue, 
		S.MinItems as MinNum, S.MaxItems as maxNum, S.StartAbility, S.StartInfo as StartInformation,
		S.AdaptiveCut as CutAbility, S.AdaptiveCut * J.Slope + J.Intercept as ScaledCutscore,
		S.Scalar as LambdaMultiplier, null as Comment
	from tblAdminStrand S, tblSetofAdminSubjects J, tblStrand tS
	where S._fk_AdminSubject = J._key and S._fk_Strand = tS._Key
		and ((J._Key = @TestName and J.IsSegmented = 0) or (J.VirtualTest = @Testname))
END
GO
/****** Object:  Table [dbo].[TestFormItem]    Script Date: 01/28/2015 15:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestFormItem](
	[_fk_Item] [varchar](150) NOT NULL,
	[_efk_ITSFormKey] [bigint] NOT NULL,
	[FormPosition] [int] NOT NULL,
	[_fk_AdminSubject] [varchar](250) NOT NULL,
	[_fk_Testform] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TestFormItem] PRIMARY KEY CLUSTERED 
(
	[_fk_Item] ASC,
	[_efk_ITSFormKey] ASC,
	[FormPosition] ASC,
	[_fk_AdminSubject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_FormItem_Test] ON [dbo].[TestFormItem] 
(
	[_fk_AdminSubject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FormItemPosition] ON [dbo].[TestFormItem] 
(
	[_fk_Testform] ASC,
	[FormPosition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FormItemUnique] ON [dbo].[TestFormItem] 
(
	[_fk_Testform] ASC,
	[_fk_Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[TestLanguages]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TestLanguages] (@testkey varchar(200))
	RETURNS  @result table(code varchar(100), label varchar(200)) AS
BEGIN
    declare @segmented bit, @algorithm varchar(50);
    select @segmented = IsSegmented, @algorithm = selectionalgorithm from tblSetofAdminSubjects
    where _KEy = @testkey;

    if (@segmented = 0) begin
        if (@algorithm = 'fixedform') begin
            insert into @result (code, label)
            select distinct  propvalue, propdescription
            from  tblItemProps P, TestForm F
            where P._fk_AdminSubject = @testKey and propname = 'language' and F._fk_AdminSubject = @testkey and F.Language = P.propvalue
                and P.isactive = 1
        end
        else begin
            insert into @result (code, label)
            select distinct  propvalue, propdescription
            from  tblItemProps P
            where P._fk_AdminSubject = @testKey and propname = 'language' and isactive = 1
        end
    end
    else begin
        insert into @result (code, label)
        select distinct propvalue, propdescription
        from tblSetofAdminItems A, tblItemProps P, tblSetofAdminSubjects S
        where S.VirtualTest = @testkey and A._fk_AdminSubject = S._Key and A._fk_AdminSubject = P._fk_AdminSubject 
            and A._fk_Item = P._fk_Item and propname = 'language' and P.isactive = 1
    end

    return;
END
GO
/****** Object:  View [dbo].[TestItembanks]    Script Date: 01/28/2015 15:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TestItembanks]
as
select distinct C.Name as ClientName, S._Key as TestKey, S.TestID, I._efk_ItemBank as Itembank
from tblClient C, tblTestAdmin T, tblSetofAdminSubjects S, tblSetofAdminItems A, tblItem I
where S._fk_TestAdmin = T._Key and T._fk_Client = C._key and A._fk_AdminSubject = S._Key and A._fk_Item = I._key
GO
/****** Object:  StoredProcedure [qa].[TestFormItemsByTest]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[TestFormItemsByTest]
	@TestName varchar(255)
AS
BEGIN
	select @testName AS TestName, A._Key as SegmentName,
		I._efk_ItemBank AS _fk_AIRBank, I._efk_Item AS _fk_ItemName,
			_efk_ITSFormKey, FormPosition, F.FormID, FP.startDate, FP.endDate
	from TestFormItem FI 
		inner join tblItem I on FI._fk_Item = I._Key 
		inner join tblSetofAdminSubjects A on FI._fk_AdminSubject = A._key
		inner join TestForm F on FI._efk_ITSFormKey = F._efk_ITSKey and I.[_efk_ItemBank] = F.[_efk_ITSBank] and F.[_fk_AdminSubject] = A.[_Key]
		inner join dbo.TDSCONFIGS_Client_TestformProperties FP on F.FormID = FP.FormID and F.[_fk_AdminSubject] = FP.testkey and F.[_Key] = FP._efk_TestForm
	where A._key = @TestName or A.VirtualTest = @TestName
END
GO
/****** Object:  View [qa].[ItemsPassages]    Script Date: 01/28/2015 15:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [qa].[ItemsPassages]
AS
	select
		I._efk_ItemBank, I._efk_Item, ts._efk_ITSKey as Passage, I.ItemID as ClientID, I.ItemType, AI.IsFieldTest, AI.IsActive, I.ScorePoint,
		D.ScorePoints as Dimension_Score_Point, I.Answer,
		isnull(A.VirtualTest, A._Key) as TestID,
		S.Name as Strand,
		D.Dimension, D.Weight, D.RecodeRule, M.ModelName, D.ResponseBankScale, D.ScorePoints,
		P0.parmvalue as P0, P1.parmvalue as P1, P2.parmvalue as P2, P3.parmvalue as P3, P4.parmvalue as P4,
		P5.parmvalue as P5, P6.parmvalue as P6, P7.parmvalue as P7, P8.parmvalue as P8, P9.parmvalue as P9
	from
		ItemScoreDimension D
		left join tblItem I on I._Key = D._fk_Item
		left join tblSetofAdminItems AI on AI._fk_Item = I._Key and D._fk_AdminSubject = AI._fk_AdminSubject
		left join tblSetofItemStimuli ss on ss._fk_Item = AI._fk_Item
		left join tblStimulus tS on tS._Key = ss._fk_Stimulus
		left join tblStrand S on AI._fk_Strand = S._Key
		left join tblSetofAdminSubjects A on AI._fk_AdminSubject = A._Key
		left join MeasurementModel M on M.ModelNumber = D._fk_MeasurementModel
		left join ItemMeasurementParameter P0 on P0._fk_ItemScoreDimension = D._Key and P0._fk_MeasurementParameter = 0
		left join ItemMeasurementParameter P1 on P1._fk_ItemScoreDimension = D._Key and P1._fk_MeasurementParameter = 1
		left join ItemMeasurementParameter P2 on P2._fk_ItemScoreDimension = D._Key and P2._fk_MeasurementParameter = 2
		left join ItemMeasurementParameter P3 on P3._fk_ItemScoreDimension = D._Key and P3._fk_MeasurementParameter = 3
		left join ItemMeasurementParameter P4 on P4._fk_ItemScoreDimension = D._Key and P4._fk_MeasurementParameter = 4
		left join ItemMeasurementParameter P5 on P5._fk_ItemScoreDimension = D._Key and P5._fk_MeasurementParameter = 5
		left join ItemMeasurementParameter P6 on P6._fk_ItemScoreDimension = D._Key and P6._fk_MeasurementParameter = 6
		left join ItemMeasurementParameter P7 on P7._fk_ItemScoreDimension = D._Key and P7._fk_MeasurementParameter = 7
		left join ItemMeasurementParameter P8 on P8._fk_ItemScoreDimension = D._Key and P8._fk_MeasurementParameter = 8
		left join ItemMeasurementParameter P9 on P9._fk_ItemScoreDimension = D._Key and P9._fk_MeasurementParameter = 9
GO
/****** Object:  StoredProcedure [qa].[ScoringItems]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[ScoringItems](
       @TestID varchar(255)
)
AS
BEGIN
       SELECT DISTINCT I._efk_ItemBank, I._efk_Item, D.Dimension, D.Weight, D.RecodeRule, M.ModelName, D.ResponseBankScale, D.ScorePoints,
              AI.IsFieldTest, AI.IsActive,
              P0.parmvalue as P0, P1.parmvalue as P1, P2.parmvalue as P2, P3.parmvalue as P3, P4.parmvalue as P4,
              P5.parmvalue as P5, P6.parmvalue as P6, P7.parmvalue as P7, P8.parmvalue as P8, P9.parmvalue as P9
       FROM ItemScoreDimension D
              left join tblItem I on I._Key = D._fk_Item
              left join tblSetofAdminItems AI on AI._fk_Item = I._Key and D._fk_AdminSubject = AI._fk_AdminSubject
              left join tblSetofAdminSubjects A on AI._fk_AdminSubject = A._Key
              left join MeasurementModel M on M.ModelNumber = D._fk_MeasurementModel
              left join ItemMeasurementParameter P0 on P0._fk_ItemScoreDimension = D._Key and P0._fk_MeasurementParameter = 0
              left join ItemMeasurementParameter P1 on P1._fk_ItemScoreDimension = D._Key and P1._fk_MeasurementParameter = 1
              left join ItemMeasurementParameter P2 on P2._fk_ItemScoreDimension = D._Key and P2._fk_MeasurementParameter = 2
              left join ItemMeasurementParameter P3 on P3._fk_ItemScoreDimension = D._Key and P3._fk_MeasurementParameter = 3
              left join ItemMeasurementParameter P4 on P4._fk_ItemScoreDimension = D._Key and P4._fk_MeasurementParameter = 4
              left join ItemMeasurementParameter P5 on P5._fk_ItemScoreDimension = D._Key and P5._fk_MeasurementParameter = 5
              left join ItemMeasurementParameter P6 on P6._fk_ItemScoreDimension = D._Key and P6._fk_MeasurementParameter = 6
              left join ItemMeasurementParameter P7 on P7._fk_ItemScoreDimension = D._Key and P7._fk_MeasurementParameter = 7
              left join ItemMeasurementParameter P8 on P8._fk_ItemScoreDimension = D._Key and P8._fk_MeasurementParameter = 8
              left join ItemMeasurementParameter P9 on P9._fk_ItemScoreDimension = D._Key and P9._fk_MeasurementParameter = 9
       where (A._Key = @TestID and A.IsSegmented = 0) or (A.VirtualTest = @testID);
END
GO
/****** Object:  View [qa].[Items]    Script Date: 01/28/2015 15:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [qa].[Items]
AS
	select
		I._efk_ItemBank, I._efk_Item, I.ItemID as ClientID, I.ItemType, AI.IsFieldTest, AI.IsActive, I.ScorePoint,
		D.ScorePoints as Dimension_Score_Point, I.Answer,
		isnull(A.VirtualTest, A._Key) as TestKey,
		case
			when A.VirtualTest is null then A.TestID
			else A2.TestID
		end as testID,
		S.Name as Strand,
		D.Dimension, D.Weight, D.RecodeRule, M.ModelName, D.ResponseBankScale, D.ScorePoints,
		P0.parmvalue as P0, P1.parmvalue as P1, P2.parmvalue as P2, P3.parmvalue as P3, P4.parmvalue as P4,
		P5.parmvalue as P5, P6.parmvalue as P6, P7.parmvalue as P7, P8.parmvalue as P8, P9.parmvalue as P9
	from
		tblItem I
		join tblSetofAdminItems AI on AI._fk_Item = I._Key
		left join ItemScoreDimension D on I._Key = D._fk_Item and D._fk_AdminSubject = AI._fk_AdminSubject
		left join tblStrand S on AI._fk_Strand = S._Key
		left join tblSetofAdminSubjects A on AI._fk_AdminSubject = A._Key
		left join tblSetofAdminSubjects A2 on A.VirtualTest = A2._Key
		left join MeasurementModel M on M.ModelNumber = D._fk_MeasurementModel
		left join ItemMeasurementParameter P0 on P0._fk_ItemScoreDimension = D._Key and P0._fk_MeasurementParameter = 0
		left join ItemMeasurementParameter P1 on P1._fk_ItemScoreDimension = D._Key and P1._fk_MeasurementParameter = 1
		left join ItemMeasurementParameter P2 on P2._fk_ItemScoreDimension = D._Key and P2._fk_MeasurementParameter = 2
		left join ItemMeasurementParameter P3 on P3._fk_ItemScoreDimension = D._Key and P3._fk_MeasurementParameter = 3
		left join ItemMeasurementParameter P4 on P4._fk_ItemScoreDimension = D._Key and P4._fk_MeasurementParameter = 4
		left join ItemMeasurementParameter P5 on P5._fk_ItemScoreDimension = D._Key and P5._fk_MeasurementParameter = 5
		left join ItemMeasurementParameter P6 on P6._fk_ItemScoreDimension = D._Key and P6._fk_MeasurementParameter = 6
		left join ItemMeasurementParameter P7 on P7._fk_ItemScoreDimension = D._Key and P7._fk_MeasurementParameter = 7
		left join ItemMeasurementParameter P8 on P8._fk_ItemScoreDimension = D._Key and P8._fk_MeasurementParameter = 8
		left join ItemMeasurementParameter P9 on P9._fk_ItemScoreDimension = D._Key and P9._fk_MeasurementParameter = 9
GO
/****** Object:  StoredProcedure [qa].[ItemMeasurementParametersByTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[ItemMeasurementParametersByTest]
	@TestName varchar(255)
AS
BEGIN

	SELECT distinct @TestName as _fk_TestName, 
		I._efk_ItemBank as _fk_AIRBank, I._efk_Item as _fk_Itemname, 
		D.Dimension as Dimension, D._fk_MeasurementModel, P._fk_MeasurementParameter,
		P.parmvalue ParameterValue
	FROM tblItem I
		left join tblSetofAdminItems S on S._fk_Item = I._key
		left join tblSetofAdminSubjects J on S._fk_AdminSubject = J._Key
		left join ItemScoreDimension D on D._fk_Item = I._Key and D._fk_AdminSubject = S._fk_AdminSubject
		inner join ItemMeasurementParameter P on P._fk_ItemScoreDimension = D._Key
	where (J._Key = @TestName and J.IsSegmented = 0) or (J.VirtualTest = @testName)
END
GO
/****** Object:  StoredProcedure [qa].[ItemMeasurementParametersByItemAndTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[ItemMeasurementParametersByItemAndTest]
	@TestKey varchar(255),  -- testname or segmentname if virtual test
	@ItemKey varchar(150)
AS
BEGIN

	SELECT 
		D.Dimension as Dimension, D._fk_MeasurementModel, P._fk_MeasurementParameter,
		P.parmvalue ParameterValue
	FROM 
		ItemScoreDimension D
		inner join ItemMeasurementParameter P on P._fk_ItemScoreDimension = D._Key
	WHERE
		D._fk_Item = @ItemKey
		and D._fk_AdminSubject = @TestKey

END
GO
/****** Object:  StoredProcedure [qa].[ItemFeatureValuesByTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[ItemFeatureValuesByTest]
	@TestName varchar(255)
AS
BEGIN

	SELECT @TestName as _fk_TestName,  J._Key as TestSegment, 'Strand' as FeatureName, (tS.Name) as FeatureValue,
		I._efk_Item as _fk_Itemname, I._efk_ItemBank as _fk_AIRBank, D.Dimension, D._fk_MeasurementModel
	FROM tblItem I
		left join tblSetofAdminItems S on S._fk_Item = I._key
		left join tblSetofAdminSubjects J on S._fk_AdminSubject = J._Key
		left join tblStrand tS on S._fk_Strand = tS._Key
		left join ItemScoreDimension D on D._fk_Item = I._Key and D._fk_AdminSubject = S._fk_AdminSubject
	where (J._Key = @TestName and J.IsSegmented = 0) or (J.VirtualTest = @Testname)

	UNION

	SELECT @TestName as _fk_TestName,  J._Key as TestSegment, tIP.Propname as FeatureName, (tIP.Propvalue) as FeatureValue,
		I._efk_Item as _fk_Itemname, I._efk_ItemBank as _fk_AIRBank, D.Dimension, D._fk_MeasurementModel
	FROM tblItem I
		join tblSetofAdminItems S on S._fk_Item = I._key
		join tblSetofAdminSubjects J on S._fk_AdminSubject = J._Key
		join tblItemProps tIP on tIP._fk_Item = I._key
		left join ItemScoreDimension D on D._fk_Item = I._Key and D._fk_AdminSubject = S._fk_AdminSubject
	WHERE 
		tIP.Propname != 'Language'
		and ((J._Key = @TestName and J.IsSegmented = 0) or (J.VirtualTest = @Testname))

    UNION
    
    SELECT @TestName as _fk_TestName,  J._Key as TestSegment, 'AffinityGroup' as FeatureName, agi.GroupID as FeatureValue,
		I._efk_Item as _fk_Itemname, I._efk_ItemBank as _fk_AIRBank, D.Dimension, D._fk_MeasurementModel
	FROM tblItem I
		join tblSetofAdminItems S on S._fk_Item = I._key
		join tblSetofAdminSubjects J on S._fk_AdminSubject = J._Key
		join AffinityGroupItem as agi on S.[_fk_Item] = agi.[_fk_Item]
		left join ItemScoreDimension D on D._fk_Item = I._Key and D._fk_AdminSubject = S._fk_AdminSubject
	WHERE 
		(J._Key = @TestName and J.IsSegmented = 0) or (J.VirtualTest = @Testname)
END
GO
/****** Object:  StoredProcedure [qa].[ItemFeaturesByItemAndTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[ItemFeaturesByItemAndTest]
	@TestName varchar(255),
	@ItemKey varchar(150)
AS
BEGIN

	SELECT 
		distinct P.Propname as FeatureName, P.Propvalue as FeatureValue
	FROM 
		tblItemProps as P
		join dbo.tblSetofAdminSubjects A on P.[_fk_AdminSubject] = A.[_Key]
	WHERE 
		P.Propname != 'Language'
        and P._fk_Item = @ItemKey
        and (
				(A._Key = @TestName and A.IsSegmented = 0)
				or (A.VirtualTest = @Testname)
			)
      
    UNION ALL
    
    SELECT
		distinct 'AffinityGroup' as FeatureName, AG.GroupID as FeatureValue
	FROM
		AffinityGroupItem as AG
		join dbo.tblSetofAdminSubjects A on AG.[_fk_AdminSubject] = A.[_Key]
	WHERE 
		AG.[_fk_Item] = @ItemKey
        and (
				(A._Key = @TestName and A.IsSegmented = 0)
				or (A.VirtualTest = @Testname)
			)
END
GO
/****** Object:  UserDefinedFunction [dbo].[ItemBVector]    Script Date: 01/28/2015 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ItemBVector] (@testkey varchar(200), @itemkey varchar(20))
returns varchar(max)
as
begin
    declare @b_s table (b float, parmnum int, _key int primary key identity);
    declare @result varchar(max);
    declare @b float;
    declare @p int;

    
    insert into @b_s (b, parmnum)
    select parmvalue, parmnum
    from ItemMeasurementParameter P, ItemScoreDimension D, MeasurementParameter M
    where D._fk_AdminSubject = @testkey and D._fk_Item = @itemkey
        and D._fk_MeasurementModel = M._fk_MeasurementModel and M.parmname like 'b%' 
        and P._fk_ItemScoreDimension = D._Key and P._fk_MeasurementParameter = M.parmnum;

    while (exists (select * from @b_s)) begin
        select top 1 @b = b, @p = _key from @b_s;
        delete from @b_s where _key = @p;
        if (@result is null)
            set @result = cast(@b as varchar(50));
        else 
            set @result = @result + ';' +  cast(@b as varchar(50));
    end
    return @result;
end
GO
/****** Object:  StoredProcedure [qa].[Item_DimensionsByTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[Item_DimensionsByTest]
	@TestName varchar(255)
AS
BEGIN

	SELECT distinct @Testname AS _fk_TestName, I._efk_ItemBank AS _fk_AIRBank, I._efk_Item AS _fk_ItemName,
		AI._fk_Item as itemkey,
		D.Dimension,
		D._fk_MeasurementModel,
		D.RecodeRule,
		isnull(D.Weight,1) as Weight,
		isnull(D.ScorePoints, I.ScorePoint) as ScorePoints,
		isnull(Cnt.parameterCount,0) as parameterCount
	FROM tblItem AS I
	INNER JOIN tblSetofAdminItems AS AI ON I._Key = AI._fk_Item 
	INNER JOIN tblSetofAdminSubjects AS S ON AI._fk_AdminSubject = S._Key
	LEFT JOIN ItemScoreDimension AS D ON D._fk_Item = I._Key and D._fk_AdminSubject = AI._fk_AdminSubject
	LEFT JOIN (
		select _fk_ItemScoreDimension, count(*) as parameterCount
		from ItemMeasurementParameter
		group by _fk_ItemScoreDimension) AS Cnt on Cnt._fk_ItemScoreDimension = D._Key
	where (S._Key = @TestName and S.IsSegmented = 0) or (S.VirtualTest = @testName)

END
GO
/****** Object:  StoredProcedure [qa].[GetItemDimensionsByItemAndTest]    Script Date: 01/28/2015 15:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [qa].[GetItemDimensionsByItemAndTest]
	@TestKey varchar(255),  -- testname or segmentname if virtual test
	@ItemKey varchar(150)
AS
BEGIN

	SELECT
		D.Dimension,
		D._fk_MeasurementModel,
		D.RecodeRule,
		isnull(D.Weight,1) as Weight,
		D.ScorePoints as ScorePoints,
		isnull(Cnt.parameterCount,0) as parameterCount
	FROM 
		ItemScoreDimension AS D
		left join 
			(
				select _fk_ItemScoreDimension, count(*) as parameterCount
				from ItemMeasurementParameter
				group by _fk_ItemScoreDimension
			) AS Cnt on Cnt._fk_ItemScoreDimension = D._Key
	where
		D._fk_Item = @ItemKey
		and D._fk_AdminSubject = @TestKey

END
GO
/****** Object:  UserDefinedFunction [dbo].[_MakeTestLabel]    Script Date: 01/28/2015 15:21:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[_MakeTestLabel] (@client varchar(100), @testID varchar(100))
	RETURNS varchar(100) AS
BEGIN

    declare @subject varchar(100);
    select @subject = Name 
    from tblSetofAdminSubjects A, tblSubject S
    where A._key = dbo.ClientTestKey(@client, @testID) and A._fk_Subject = S._Key;

    return dbo._MakeTestGradeLabel(@client, @testID) + ' ' + @subject;
END
GO
/****** Object:  StoredProcedure [tp].[spLoad_AdminFormItems]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_AdminFormItems] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	SELECT fgi.ItemID
		 , COALESCE(tfp._efk_ITSKey, 0)		AS ITSFormKey	
		 , fgi.FormPosition
		 , sf.SegmentID						AS AdminSubject
		 , tfp.FormPartitionID
		 , fgi.isActive
	  INTO #FormItem	 
	  FROM tp.Loader_TestForms tf 
	  JOIN tp.Loader_TestFormPartition tfp ON tfp.TestFormID = tf.TestFormID
										  AND tfp._fk_Package = tf._fk_Package	 	
	  JOIN tp.Loader_TestFormItemGroup tfig ON tfig.TestFormID = tfp.TestFormID
										   AND tfig.FormPartitionID = tfp.FormPartitionID
										   AND tfig._fk_Package = tfp._fk_Package	 	
	  JOIN tp.Loader_TestFormGroupItems fgi ON fgi.TestFormID = tfig.TestFormID
										   and fgi.FormItemGroupID = tfig.FormItemGroupID
										   AND tfig._fk_Package = tfp._fk_Package
	  JOIN tp.Loader_SegmentForm sf ON sf.FormPartitionID = tfp.FormPartitionID
								   AND tfig._fk_Package = tfp._fk_Package
	 WHERE tf._fk_Package = @TestPackageKey;


	INSERT INTO dbo.TestFormItem(_fk_Item, _efk_ITSFormKey, FormPosition, _fk_AdminSubject, _fk_TestForm, isActive)
	SELECT DISTINCT *
	  FROM #FormItem tmp
	 WHERE NOT EXISTS (SELECT 1
						 FROM dbo.TestFormItem tfi
						WHERE tmp.ItemID = tfi._fk_Item AND tmp.FormPosition = tfi.FormPosition AND tmp.FormPartitionID = tfi._fk_TestForm AND tmp.AdminSubject = tfi._fk_AdminSubject);


	UPDATE tfi
	   SET tfi.isActive = tmp.isActive
	  FROM dbo.TestFormItem tfi
	  JOIN #FormItem tmp ON tmp.ItemID = tfi._fk_Item AND tmp.FormPosition = tfi.FormPosition AND tmp.FormPartitionID = tfi._fk_TestForm AND tmp.AdminSubject = tfi._fk_AdminSubject;

	-- clean-up
	DROP TABLE #FormItem;

END
GO
/****** Object:  StoredProcedure [tp].[spLoad_AdminSubjects]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_AdminSubjects] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN
    
	DECLARE @isSegmented BIT;

	DECLARE @tblAlgProp TABLE (
		PropName	VARCHAR(1000)
	);

	INSERT INTO @tblAlgProp VALUES ('ftstartpos');
	INSERT INTO @tblAlgProp VALUES ('ftendpos');
	INSERT INTO @tblAlgProp VALUES ('bpweight');
	INSERT INTO @tblAlgProp VALUES ('startability');
	INSERT INTO @tblAlgProp VALUES ('startinfo');
	INSERT INTO @tblAlgProp VALUES ('cset1size');
	INSERT INTO @tblAlgProp VALUES ('cset1order');
	INSERT INTO @tblAlgProp VALUES ('cset2random');
	INSERT INTO @tblAlgProp VALUES ('cset2initialrandom');
	INSERT INTO @tblAlgProp VALUES ('abilityoffset');
	INSERT INTO @tblAlgProp VALUES ('itemweight');
	INSERT INTO @tblAlgProp VALUES ('precisiontarget');
	INSERT INTO @tblAlgProp VALUES ('adaptivecut');
	INSERT INTO @tblAlgProp VALUES ('toocloseses');
	INSERT INTO @tblAlgProp VALUES ('slope');
	INSERT INTO @tblAlgProp VALUES ('intercept');
	INSERT INTO @tblAlgProp VALUES ('abilityweight');
	INSERT INTO @tblAlgProp VALUES ('computeabilityestimates');
	INSERT INTO @tblAlgProp VALUES ('rcabilityweight');
	INSERT INTO @tblAlgProp VALUES ('precisiontargetmetweight');
	INSERT INTO @tblAlgProp VALUES ('precisiontargetnotmetweight');
	INSERT INTO @tblAlgProp VALUES ('terminationoverallinfo');
	INSERT INTO @tblAlgProp VALUES ('terminationrcinfo');
	INSERT INTO @tblAlgProp VALUES ('terminationmincount');
	INSERT INTO @tblAlgProp VALUES ('terminationtooclose');
	INSERT INTO @tblAlgProp VALUES ('terminationflagsand');
	
	
	-- create temp table to host data during data gathering and processing
	DECLARE @tblSetofAdminSubjects TABLE (
		_Key				VARCHAR(250)
	  , _fk_TestAdmin		VARCHAR(150)
	  , _fk_Subject			VARCHAR(150)
	  , TestID				VARCHAR(255)
	  , StartAbility		FLOAT
	  , StartInfo			FLOAT 
	  , MinItems			INT 
	  , MaxItems			INT
	  , Slope				FLOAT
	  , Intercept			FLOAT
	  , FTStartPos			INT
	  , FTEndPos			INT
	  , FTMinItems			INT
	  , FTMaxItems			INT
	  , SelectionAlgorithm  VARCHAR(50)
	  , BluePrintWeight		FLOAT
	  , cset1Size			INT
	  , cset2Random			INT
	  , cset2InitialRandom  INT
	  , VirtualTest			VARCHAR(200)
	  , TestPosition		INT
	  , isSegmented			BIT
	  , ItemWeight			FLOAT
	  , AbilityOffSet		FLOAT
	  , cset1Order			VARCHAR(50)
	  , Version				BIGINT
	  , Contract			VARCHAR(100)
	  , TestType			VARCHAR(60)
	  , PrecisionTarget		FLOAT
	  , AdaptiveCut			FLOAT
	  , tooCloseSEs			FLOAT
	  , AbilityWeight				FLOAT
	  , ComputeAbilityEstimates		BIT
	  , rcAbilityWeight				FLOAT
	  , PrecisionTargetMetWeight	FLOAT
	  , PrecisionTargetNotMetWeight FLOAT
	  , TerminationOverallInfo		BIT
	  , TerminationRCInfo			BIT
	  , TerminationMinCount			BIT
	  , TerminationTooClose			BIT
	  , TerminationFlagsAnd			BIT
	  , bpMetricFunction 			VARCHAR(10)
	  
	);

	-- first, figure out if the test is segmented or non-segmented
	-- if the bpelementid for test and segment are the same, then the test is non-segmented
	SET @isSegmented = (SELECT CASE WHEN cnt = 0 THEN 1 ELSE 0 END
						 FROM (
							SELECT COUNT(*) cnt
							  FROM tp.Loader_TestBluePrint tbp1
							  JOIN tp.Loader_TestBluePrint tbp2 ON tbp1.bpElementID = tbp2.bpElementID
															   AND tbp1._fk_Package = tbp2._fk_Package
							 WHERE tbp1.ElementType = 'test'
							   and tbp2.ElementType = 'segment'
							   and tbp2._fk_Package = @TestPackageKey
							) t
						);
	
	-- load test data for both segmented and non-segmented (excluding the test segments)
	-- elementtype = test
	INSERT INTO @tblSetofAdminSubjects (_Key, _fk_TestAdmin, _fk_Subject, TestID, MinItems, MaxItems, FTMinItems, FTMaxItems, SelectionAlgorithm, isSegmented, Version, Contract, TestType)
	SELECT bpElementID
		 , TestAdmin
	     , SubjectKey
		 , bpElementName
		 , MinOPItems
		 , MaxOPItems
		 , MinFTItems
		 , MaxFTItems
		 , 'virtual'
		 , @isSegmented
		 , Version
		 , tp.Publisher
		 , (SELECT PropValue FROM tp.Loader_TestPackageProperties tpp WHERE tpp.PropName = 'type' AND tpp._fk_Package = tp.PackageKey)
	  FROM tp.Loader_TestBlueprint bp
	  JOIN tp.Loader_TestPackage tp ON tp.PackageKey = bp._fk_Package
	 WHERE ElementType = 'test'
	   AND tp.PackageKey = @TestPackageKey;

	-- need to load all test segments only when the test is segmented
	IF @isSegmented = 1
		INSERT INTO @tblSetofAdminSubjects (_Key, _fk_TestAdmin, _fk_Subject, TestID, MinItems, MaxItems, FTMinItems, FTMaxItems, TestPosition, SelectionAlgorithm, VirtualTest, isSegmented, Version, Contract)
		SELECT bpElementID
			 , TestAdmin
			 , SubjectKey
			 , bpElementName
			 , MinOPItems
			 , MaxOPItems
			 , MinFTItems
			 , MaxFTItems
			 , Position
			 , ItemSelection 
			 , (SELECT bpElementID FROM tp.Loader_TestBluePrint WHERE ElementType = 'test' and _fk_Package = tp.PackageKey) AS VirtualTest
			 , 0
			 , tbp.Version
			 , tp.Publisher
		  FROM tp.Loader_TestBlueprint tbp
		  JOIN tp.Loader_Segment s ON s._fk_Package = tbp._fk_Package
							      AND s.SegmentID = tbp.bpElementID
		  JOIN tp.Loader_TestPackage tp on tp.PackageKey = tbp._fk_Package
		 WHERE ElementType = 'segment'
	       AND tp.PackageKey = @TestPackageKey;


	-- extract test/segment properties from loader_segmentitemselectionproperties
	SELECT sisp.bpelementid
		 , MAX(CASE WHEN sisp.PropName = 'ftstartpos'	THEN sisp.propvalue ELSE NULL END) AS ftstartpos
		 , MAX(CASE WHEN sisp.PropName = 'ftendpos'		THEN sisp.propvalue ELSE NULL END) as ftendpos
		 , MAX(CASE WHEN sisp.PropName = 'bpweight'		THEN sisp.propvalue ELSE NULL END) as bpweight
		 , MAX(CASE WHEN sisp.PropName = 'startability'	THEN sisp.PropValue ELSE NULL END) AS startability
		 , MAX(CASE WHEN sisp.PropName = 'startinfo'	THEN sisp.PropValue ELSE NULL END) AS startinfo
		 , MAX(CASE WHEN sisp.PropName = 'cset1size'	THEN sisp.PropValue ELSE NULL END) AS cset1size
		 , MAX(CASE WHEN sisp.PropName = 'cset1order'	THEN sisp.PropValue ELSE NULL END) AS cset1order
		 , MAX(CASE WHEN sisp.PropName = 'cset2random'	THEN sisp.PropValue ELSE NULL END) AS cset2random
		 , MAX(CASE WHEN sisp.PropName = 'cset2initialrandom' THEN sisp.PropValue ELSE NULL END) AS cset2initialrandom
		 , MAX(CASE WHEN sisp.PropName = 'abilityoffset'	  THEN sisp.PropValue ELSE NULL END) AS abilityoffset
		 , MAX(CASE WHEN sisp.PropName = 'itemweight'		  THEN sisp.PropValue ELSE NULL END) AS ItemWeight
		 , MAX(CASE WHEN sisp.PropName = 'slope'			  THEN sisp.PropValue ELSE NULL END) AS Slope
		 , MAX(CASE WHEN sisp.PropName = 'intercept'		  THEN sisp.PropValue ELSE NULL END) AS Intercept
		 , MAX(CASE WHEN sisp.PropName = 'precisiontarget'	  THEN sisp.PropValue ELSE NULL END) AS PrecisionTarget
		 , MAX(CASE WHEN sisp.PropName = 'adaptivecut'		  THEN sisp.PropValue ELSE NULL END) AS AdaptiveCut
		 , MAX(CASE WHEN sisp.PropName = 'toocloseses'		  THEN sisp.PropValue ELSE NULL END) AS tooCloseSEs
		-- added on 03.20.2015
		 , MAX(CASE WHEN sisp.PropName = 'abilityweight'				THEN sisp.PropValue ELSE NULL END) as abilityweight
		 , MAX(CASE WHEN sisp.PropName = 'computeabilityestimates'		THEN (CASE sisp.PropValue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) as computeabilityestimates
		 , MAX(CASE WHEN sisp.PropName = 'rcabilityweight'				THEN sisp.PropValue ELSE NULL END) as rcabilityweight
		 , MAX(CASE WHEN sisp.PropName = 'precisiontargetmetweight'		THEN sisp.PropValue ELSE NULL END) as precisiontargetmetweight
		 , MAX(CASE WHEN sisp.PropName = 'precisiontargetnotmetweight'	THEN sisp.PropValue ELSE NULL END) as precisiontargetnotmetweight
		 , MAX(CASE WHEN sisp.PropName = 'terminationoverallinfo'		THEN (CASE sisp.PropValue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) as terminationoverallinfo
		 , MAX(CASE WHEN sisp.PropName = 'terminationrcinfo'			THEN (CASE sisp.PropValue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) as terminationrcinfo
		 , MAX(CASE WHEN sisp.PropName = 'terminationmincount'			THEN (CASE sisp.PropValue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) as terminationmincount
		 , MAX(CASE WHEN sisp.PropName = 'terminationtooclose'			THEN (CASE sisp.PropValue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) as terminationtooclose
		 , MAX(CASE WHEN sisp.PropName = 'terminationflagsand'			THEN (CASE sisp.PropValue WHEN 'true' THEN 1 ELSE 0 END) ELSE NULL END) as terminationflagsand			 		 
	  INTO #TestProperties	 
	  FROM @tblSetofAdminSubjects tmp
	  JOIN tp.Loader_SegmentItemSelectionProperties sisp ON sisp.SegmentID = tmp._Key AND tmp._Key = sisp.bpElementID
	 WHERE sisp._fk_package = @testpackagekey
	 GROUP BY sisp.bpElementID;


	UPDATE tmp
	   SET tmp.FTStartPos 		= tp.FTStartPos 
		 , tmp.FTEndPos 		= tp.FTEndPos
		 , tmp.BluePrintWeight	= tp.bpWeight
		 , tmp.StartAbility		= tp.StartAbility
		 , tmp.StartInfo		= tp.StartInfo
		 , tmp.cset1Size		= tp.cset1Size
		 , tmp.cset1Order		= tp.cset1Order
		 , tmp.cset2Random		= tp.cset2Random
		 , tmp.cset2InitialRandom = tp.cset2InitialRandom
		 , tmp.AbilityOffSet	= tp.AbilityOffSet
		 , tmp.itemweight		= tp.itemweight
		 , tmp.Slope			= tp.Slope
		 , tmp.Intercept		= tp.Intercept
		 , tmp.PrecisionTarget  = tp.PrecisionTarget
		 , tmp.AdaptiveCut		= tp.AdaptiveCut
		 , tmp.tooCloseSEs		= tp.tooCloseSEs
		 , tmp.abilityweight				= tp.abilityweight
		 , tmp.computeabilityestimates 		= tp.computeabilityestimates
		 , tmp.rcabilityweight 				= tp.rcabilityweight				
		 , tmp.precisiontargetmetweight 	= tp.precisiontargetmetweight
		 , tmp.precisiontargetnotmetweight 	= tp.precisiontargetnotmetweight
		 , tmp.terminationoverallinfo 		= tp.terminationoverallinfo
		 , tmp.terminationrcinfo 			= tp.terminationrcinfo			
		 , tmp.terminationmincount 			= tp.terminationmincount
		 , tmp.terminationtooclose 			= tp.terminationtooclose
		 , tmp.terminationflagsand 			= tp.terminationflagsand					 
	  FROM @tblSetofAdminSubjects tmp
	  JOIN #TestProperties tp ON tp.bpElementID = tmp._Key;

	UPDATE tmp
	   SET tmp.SelectionAlgorithm = s.ItemSelection
	  FROM @tblSetofAdminSubjects tmp
	  JOIN tp.Loader_Segment s ON s.SegmentID = tmp._Key  
	 WHERE s._fk_Package = @TestPackageKey;

	-- if segmented test grab default values from startability, startinfo...etc from segment position 1 test
	IF @isSegmented = 1
	BEGIN
		SELECT startability, startinfo, slope, intercept, toocloseses, rcabilityweight, precisiontarget, adaptivecut
		  INTO #TestDefaults
		  FROM @tblSetofAdminSubjects
		 WHERE TestPosition = 1;

		UPDATE s
		   SET s.startability = d.startability
			 , s.startinfo = d.startinfo
			 , s.slope = d.slope
			 , s.intercept = d.intercept
			 , s.toocloseses = d.toocloseses
			 , s.rcabilityweight = d.rcabilityweight
			 , s.precisiontarget = d.precisiontarget
			 , s.adaptivecut = d.adaptivecut
		  FROM @tblSetofAdminSubjects s, #TestDefaults d	 
		 WHERE s.testposition IS NULL;		
	END


	-- Set default values for columns where data is not present
	-- this needs to be done especially for fixed form tests, where this data is not mandatory to be part of testpackage
	update @tblSetofAdminSubjects
	   set startability 	  = coalesce(startability, 0) 
		 , startinfo 		  = coalesce(startinfo, 1)
		 , slope	 		  = coalesce(slope, 1)
		 , intercept 		  = coalesce(intercept, 1)
		 , bpmetricfunction   = 'bp1'
		 , blueprintweight    = coalesce(blueprintweight, 5.0)
		 , itemweight	      = coalesce(itemweight, 5.0)
		 , cset1order	      = coalesce(cset1order, 'ABILITY')
		 , abilityoffset   	  = coalesce(abilityoffset, 0.0)
		 , cset2initialrandom = coalesce(cset2initialrandom, 5)
		 , cset1size	   	  = coalesce(cset1size, 20)
		 , cset2random	      = coalesce(cset2random, 1)
		 , abilityweight				= coalesce(abilityweight, 1)
		 , computeabilityestimates 		= coalesce(computeabilityestimates, 1)
		 , rcabilityweight 				= coalesce(rcabilityweight, 1)				
		 , precisiontargetmetweight 	= coalesce(precisiontargetmetweight, 1)	
		 , precisiontargetnotmetweight 	= coalesce(precisiontargetnotmetweight, 1)
		 , terminationoverallinfo 		= coalesce(terminationoverallinfo, 0)		
		 , terminationrcinfo 			= coalesce(terminationrcinfo, 0)			
		 , terminationmincount 			= coalesce(terminationmincount, 0)			
		 , terminationtooclose 			= coalesce(terminationtooclose, 0)		
		 , terminationflagsand 			= coalesce(terminationflagsand, 0);

		
	-- update test info, assuming the test/segment already exists
	UPDATE sas
	   SET sas._fk_testadmin = tmp._fk_testadmin
		 , sas._fk_subject = tmp._fk_subject
		 , sas.testid = tmp.testid
		 , sas.startability = tmp.startability
		 , sas.startinfo = tmp.startinfo
		 , sas.minitems = tmp.minitems
		 , sas.maxitems = tmp.maxitems
		 , sas.slope = tmp.slope
		 , sas.intercept = tmp.intercept
		 , sas.ftstartpos = tmp.ftstartpos
		 , sas.ftendpos = tmp.ftendpos
		 , sas.ftminitems = tmp.ftminitems
		 , sas.ftmaxitems = tmp.ftmaxitems
		 , sas.selectionalgorithm = tmp.selectionalgorithm
		 , sas.blueprintweight = tmp.blueprintweight
		 , sas.cset1size = tmp.cset1size
		 , sas.cset2random = tmp.cset2random
		 , sas.cset2initialrandom = tmp.cset2initialrandom
		 , sas.virtualtest = tmp.virtualtest
		 , sas.testposition = tmp.testposition
		 , sas.issegmented = tmp.issegmented
		 , sas.itemweight = tmp.itemweight
		 , sas.abilityoffset = tmp.abilityoffset
		 , sas.cset1order = tmp.cset1order
		 , sas.updateconfig = tmp.version 
		 , sas.contract = tmp.contract
		 , sas.testtype = tmp.testtype
		 , sas.precisiontarget = tmp.precisiontarget
		 , sas.adaptivecut = tmp.adaptivecut
		 , sas.toocloseses = tmp.toocloseses
		 , sas.abilityweight	= tmp.abilityweight
		 , sas.computeabilityestimates = tmp.computeabilityestimates
		 , sas.rcabilityweight = tmp.rcabilityweight				
		 , sas.precisiontargetmetweight = tmp.precisiontargetmetweight
		 , sas.precisiontargetnotmetweight = tmp.precisiontargetnotmetweight
		 , sas.terminationoverallinfo = tmp.terminationoverallinfo		
		 , sas.terminationrcinfo = tmp.terminationrcinfo	
		 , sas.terminationmincount = tmp.terminationmincount
		 , sas.terminationtooclose = tmp.terminationtooclose
		 , sas.terminationflagsand = tmp.terminationflagsand
		 , sas.bpmetricfunction = tmp.bpmetricfunction
	  FROM dbo.tblSetofAdminSubjects sas
	  JOIN @tblSetofAdminSubjects tmp ON tmp._Key = sas._Key


	-- check if test or segment already exists
	INSERT INTO dbo.tblSetofAdminSubjects (_key, _fk_testadmin, _fk_subject, testid, startability, startinfo, minitems, maxitems, slope, intercept, ftstartpos, ftendpos, ftminitems, ftmaxitems, selectionalgorithm, blueprintweight, cset1size, cset2random, cset2initialrandom, virtualtest, testposition, issegmented, itemweight, abilityoffset, cset1order, loadconfig, contract, testtype, precisiontarget, adaptivecut, toocloseses, abilityweight, computeabilityestimates, rcabilityweight, precisiontargetmetweight, precisiontargetnotmetweight, terminationoverallinfo, terminationrcinfo, terminationmincount, terminationtooclose, terminationflagsand, bpmetricfunction)
	SELECT _key, _fk_testadmin, _fk_subject, testid, startability, startinfo, minitems, maxitems, slope, intercept, ftstartpos, ftendpos, ftminitems, ftmaxitems, selectionalgorithm, blueprintweight, cset1size, cset2random, cset2initialrandom, virtualtest, testposition, issegmented, itemweight, abilityoffset, cset1order, version, contract, testtype, precisiontarget, adaptivecut, toocloseses, abilityweight, computeabilityestimates, rcabilityweight, precisiontargetmetweight, precisiontargetnotmetweight, terminationoverallinfo, terminationrcinfo, terminationmincount, terminationtooclose, terminationflagsand, bpmetricfunction
	  FROM @tblSetofAdminSubjects tmp
	 WHERE NOT EXISTS ( SELECT 1 
						  FROM dbo.tblSetofAdminSubjects sas
						 WHERE sas._Key = tmp._Key);


	---- ?? this is being done in ms sql version....so doing it here....check later if we need this ??
	INSERT INTO dbo._TestUpdate (_fk_AdminSubject, ConfigID, _Date)
    SELECT _Key, Version, GETDATE()
      FROM @tblSetofAdminSubjects;


 	EXEC tp.spLoad_TestGrades @TestPackageKey;


    INSERT INTO dbo.TestCohort (_fk_AdminSubject, Cohort, ItemRatio)
    SELECT _Key, 1, 1.0
      FROM @tblSetofAdminSubjects 
     WHERE SelectionAlgorithm LIKE 'adaptive%' 
	   AND NOT EXISTS ( SELECT * 
						  FROM dbo.TestCohort 
						 WHERE _fk_AdminSubject = _Key);


	-- clear old data and re-load again
	DELETE isp
	  FROM tblitemselectionparm isp
	  JOIN @tblSetofAdminSubjects tmp on tmp._key = isp._fk_adminsubject;


	-- for all properties that do not have a column defined/created in tblsetofadminsubjects tables
	-- insert them into tblitemselectionparm
	INSERT INTO tblitemselectionparm
	SELECT tmp._key
		 , tmp.testid
		 , sisp.propname
		 , sisp.propvalue
		 , sisp.proplabel
		 , NEWID()
	  FROM @tblSetofAdminSubjects tmp
	  JOIN tp.Loader_SegmentItemSelectionProperties sisp ON sisp.segmentid = tmp._key and tmp._key = sisp.bpelementid
	 WHERE propname NOT IN (SELECT propname FROM @tblAlgProp)
	   AND selectionalgorithm LIKE 'adaptive%';

	   
	-- clean-up
	DROP TABLE #TestProperties;

END

GO
/****** Object:  StoredProcedure [tp].[spLoad_AdminItemMeasurementParms]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_AdminItemMeasurementParms] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	DECLARE @ItemDimension TABLE (
		  _Key 					UNIQUEIDENTIFIER
		, _fk_AdminSubject 		VARCHAR(250) 
		, _fk_Item 				VARCHAR(150)
		, _fk_MeasurementModel  INT 
		, Dimension				VARCHAR(255)
		, RecodeRule			VARCHAR(255)
		, ScorePoints 			INT
		, Weight 				FLOAT
	);

	INSERT INTO @ItemDimension (_fk_AdminSubject, _fk_Item, _fk_MeasurementModel, ScorePoints, Weight, Dimension, RecodeRule)
	SELECT DISTINCT ais._fk_AdminSubject
		 , ais._fk_Item
		 , MeasuremodelKey
		 , isd.ScorePoints
		 , isd.Weight
		 , CASE WHEN isd.DimensionName IS NULL THEN '' ELSE isd.DimensionName END
		 , CASE WHEN prop.PropValue IS NULL THEN '' ELSE prop.PropValue END 
	  FROM tp.Loader_SetOfItemStrands ais
	  JOIN tp.Loader_ItemScoreDimension isd ON isd._fk_Package = ais._fk_Package 
										   AND isd.TestItemID = ais._fk_Item
	  LEFT JOIN tp.Loader_ItemScoreDimensionProperties prop ON prop._fk_Package = isd._fk_Package
														   AND prop.TestItemID = isd.TestItemID 
														   AND prop.DimensionName = isd.DimensionName
														   AND PropName = 'recoderule'
     WHERE isd._fk_Package = @TestPackageKey;

	-- create unique identifier for rows present in the temporary tables
	UPDATE @ItemDimension
	   SET _Key = NEWID() 
	
	-- select * from @ItemDimension

	-- prior to loading data into itemscoredimension, clear out rows that match test and item
	-- cascading foreign key to itemmeasurementparameter ensures that they will also be deleted
	DELETE isd
	  FROM dbo.ItemScoreDimension isd
	 WHERE EXISTS (SELECT * 
				     FROM @ItemDimension id
					WHERE id._fk_Item = isd._fk_Item AND id._fk_AdminSubject = isd._fk_AdminSubject);

	-- write data to the disk
    INSERT INTO dbo.ItemScoreDimension (_Key, _fk_Item, _fk_AdminSubject, Dimension, ScorePoints, Weight, _fk_MeasurementModel, RecodeRule)
    SELECT _Key
		 , _fk_Item
		 , _fk_AdminSubject
		 , Dimension
		 , ScorePoints
		 , Weight
		 , _fk_MeasurementModel
		 , RecodeRule
      FROM @ItemDimension
     WHERE _fk_MeasurementModel IS NOT NULL; -- 03.30: Adding filter here because, we would want to correct/delete garbage records that have been loaded prior to this fix was released. 

	INSERT INTO dbo.ItemMeasurementParameter
	SELECT DISTINCT _Key
		 , MeasurementParamNum
		 , MeasurementValue
	  FROM tp.Loader_SetOfItemStrands ais
	  JOIN tp.Loader_ItemScoreDimension isd ON isd._fk_Package = ais._fk_Package 
										   AND isd.TestItemID = ais._fk_Item
	  JOIN @ItemDimension id ON id._fk_Item = isd.TestItemID
							AND id._fk_AdminSubject = ais._fk_AdminSubject
							AND id.Dimension = isd.DimensionName
	 WHERE isd._fk_Package = @TestPackageKey
		AND (MeasurementParamNum IS NOT NULL OR MeasurementValue IS NOT NULL OR _fk_MeasurementModel IS NOT NULL);


    UPDATE dbo.tblSetOfAdminItems 
	   SET bVector = COALESCE(dbo.ItemBVector(_fk_AdminSubject, _fk_Item), IRT_b)
     WHERE _fk_AdminSubject IN (SELECT DISTINCT _fk_AdminSubject FROM @ItemDimension);

-- ?? do we need to update tblsetofadminitems columns irt_b, irt_a, irt_c here....being done on sql server in this proc ???
--     update tblsetofadminitems 
-- 	   set irt_b = coalesce((select avg(parmvalue)
-- 							 from @ItemDimension l, itemmeasurementparameter p, itemscoredimension d, measurementparameter m
-- 							where d._fk_adminsubject = l._fk_adminsubject and d._fk_item = l._fk_item
-- 								and d._fk_adminsubject = tblsetofadminitems._fk_adminsubject and d._fk_item = tblsetofadminitems._fk_item
-- 								and d._fk_measurementmodel = m._fk_measurementmodel and m.parmname like 'b%' 
-- 								and p._fk_itemscoredimension = d._key and p._fk_measurementparameter = m.parmnum), irt_b)
--      where isfieldtest = 0;
-- 
--     update tblsetofadminitems 
-- 	   set irt_a = coalesce((select parmvalue
-- 							from @ItemDimension l, itemscoredimension d, itemmeasurementparameter p, measurementparameter m
-- 							where d._fk_adminsubject = l._fk_adminsubject and d._fk_item = l._fk_item
-- 								and d._fk_adminsubject = tblsetofadminitems._fk_adminsubject
-- 								and tblsetofadminitems._fk_item = d._fk_item and p._fk_itemscoredimension = d._key
-- 								and d._fk_measurementmodel = m._fk_measurementmodel and m.parmname = 'a' and p._fk_measurementparameter = m.parmnum), 1.0)
-- 	 where isfieldtest = 0;
-- 
--     update tblsetofadminitems 
-- 	   set irt_c = coalesce((select parmvalue
-- 							from @ItemDimension l, itemscoredimension d, itemmeasurementparameter p, measurementparameter m
-- 							where d._fk_adminsubject = l._fk_adminsubject and d._fk_item = l._fk_item
-- 								and d._fk_adminsubject = tblsetofadminitems._fk_adminsubject
-- 								and tblsetofadminitems._fk_item = d._fk_item and p._fk_itemscoredimension = d._key
-- 								and d._fk_measurementmodel = m._fk_measurementmodel and m.parmname = 'c' and p._fk_measurementparameter = m.parmnum), 0)
-- 	 where isfieldtest = 0;
--
--     update tblsetofadminitems set irt_model = coalesce(m.modelname, 'irt3pl')
--     from loader_itemscoredimension l, itemscoredimension d, measurementmodel m
--     where d._fk_adminsubject = l._testkey and d._fk_item = l._itemkey
--         and isfieldtest = 0
--         and d._fk_adminsubject = tblsetofadminitems._fk_adminsubject and tblsetofadminitems._fk_item = d._fk_item 
--         and d._fk_measurementmodel = m.modelnumber;


END

GO
/****** Object:  StoredProcedure [dbo].[UpdateTDSConfigs]    Script Date: 01/28/2015 15:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 3/2011: Updated to include virtual tests
CREATE PROCEDURE [dbo].[UpdateTDSConfigs] (@doall bit = 0, @testKey varchar(200) = null)
as
begin
-- this procedure 'seeds' TDS_Configs with test-specific data from this itembank without impacting any pre-existing data there
-- The data that must be inserted includes
-- 0. Client names
-- 1. TestID's for each client
-- 2. ItemTypes for each test
-- 3. Language accommodations for each test
-- 4. Grades for each client (not test)
-- 5. Subject for each client (not test)
-- 6. Default test tools for each required tool (TDS_TestTooType.IsREquired) for the default test (TestID = '*') for each client.
-- 7. Default test tool for language for each client

-- Change to TDS_Configs: Factored the tool type out from Client_TestTool and TDS_TestTool into Client_TestToolType and TDS_TestToolType, respectively.
-- Previously these tables were not normalized (in a bad way).

    set nocount on;
    declare @tests table (client varchar(100), test varchar(150), testKey varchar(250), subject varchar(100), IsSegmented bit, instrument varchar(100), done bit default(0));
    declare @clients table (cname varchar(100));
    declare @segments table (client varchar(100), segment varchar(150), segKey varchar(250),  pos int, virtualTest varchar(200), vtestkey varchar(250));


begin try
  begin transaction
    -- is this a 'custom' call? (all tests in the bank, or a specific test), or is it all new tests (those in the loader tables)?
    if (@doall = 1 or @testKey is not null) begin   -- custom call
        insert into @tests (client, test, testkey, subject, IsSegmented)        -- all tests except segments
        select dbo.TestkeyClient(S._Key), S.TestID, S._Key, J.Name, IsSegmented
        from tblSetofadminsubjects S, tblSubject J
        where (@testKey is null or S._Key = @testKey) and VirtualTest is null and S._fk_Subject = J._Key;

        insert into @segments (client, segment, segKey, pos, virtualTest, vtestKey)       -- all segments (masquerading as tests)
        select dbo.TestkeyClient(S._Key), S.TestID, S._Key, S.TestPosition, V.TestID, V._Key
        from tblSetofadminsubjects S, tblSetofAdminSubjects V
        where (@testKey is null or V._Key = @testKey) and S.VirtualTest is not null and S.VirtualTest = V._Key;
        
    end
   
    else begin  -- do those that are in the loader tables
         insert into @tests (Client, test, testkey, subject, IsSegmented)
        select distinct I.ClientName, S.TestID, T.TestKey, T.Subject, S.IsSegmented      -- neither a virtual test nor a segment
        from Loader_Itembank I, Loader_Tests T, tblSetofAdminSubjects S
        where T.testkey = S._Key and T.VirtualTest is null 

        union
        select distinct I.ClientName, S.TestID, T.VirtualTestKey, T.Subject, 1 -- derive the virtual tests
        from Loader_Itembank I, Loader_Tests T, tblSetofAdminSubjects S
        where T.VirtualTest is not null and S._Key = T.VirtualTestKey;

        insert into @segments (client, segment, segKey, pos, virtualTest, vtestkey)       -- get the segments
        select distinct I.ClientName, S.TestID, T.TestKey, T.SegmentPosition, LO.LogicalID, T.VirtualTestKey
        from Loader_Itembank I, Loader_Tests T, tblsetofadminSubjects S, Loader_LogicalTests LO
        where T.VirtualTest is not null and T.testkey = S._Key and T.VirtualTestkey = LO.testkey;

    end

-- select * from @tests; select * from @segments; return;

    update @tests set instrument = ReportingInstrument 
    from SCORECONFIGS_Test  where test = TestID;



    insert into @clients (cname) 
    select distinct client from @tests T;

--  Collect all language accommodations

    declare @langs table (client varchar(100), testkey varchar(200), testname varchar(200), lang varchar(50), descrip varchar(200));
    declare @client varchar(100);
--    declare @testkey varchar(200);
    declare @testname varchar(200);

-- 3/2011: Do not add test segments to language test tool

    while (exists (select * from @tests where done = 0)) begin
        select top 1 @client = client, @testkey = testkey, @testname = test
        from @tests where  done = 0;

        insert into @langs (client, testkey, testname, lang, descrip)
        select distinct @client, @testkey, @testname, code, label
        from  dbo.TestLanguages(@testkey);

        update @tests set done = 1 where testkey = @testkey;
    end

    

    insert into TDSCONFIGS_Client_TesteeAttribute (clientname, TDS_ID, RTSName, type, Label, reportName, atLogin, SortOrder)
    select cname, TDS_ID, RTSName, type, label, reportName, atLogin, SortOrder
    from TDSCONFIGS_TDS_TesteeAttribute, @clients
    where not exists (select * from TDSCONFIGS_Client_TesteeAttribute where clientname = cname);

    insert into TDSCONFIGS_Client_TesteeRelationshipAttribute (clientname, TDS_ID, RTSName, Label, reportName, atLogin, SortOrder, relationshipType)
    select cname, TDS_ID, RTSName, label, reportName, atLogin, SortOrder, relationshipType
    from TDSCONFIGS_TDS_TesteeRelationshipAttribute, @clients
    where not exists (select * from TDSCONFIGS_Client_TesteeRelationshipAttribute where clientname = cname);
    

    insert into TDSCONFIGS_Client (Name)
    select cname from @clients 
    where not exists (select * from TDSCONFIGS_Client where name = cname);

    insert into TDSCONFIGS_Client_TimeWindow (clientname, windowID, startDate, endDate)
    select cname, 'ANNUAL', getdate(), dateadd(year, 1, getdate())
    from @clients
    where not exists (select * from TDSCONFIGS_Client_TimeWindow where clientname = cname and windowID = 'ANNUAL');
    


    insert into TDSCONFIGS_Client_FieldtestPriority (clientname, TDS_ID, priority, TestID)
    select cname, P.TDS_ID, priority, '*'
    from @clients, TDSCONFIGS_TDS_FieldtestPriority P, TDSCONFIGS_Client_TesteeAttribute A
    where A.clientname = cname and A.TDS_ID = P.TDS_ID
    and cname not in 
    (select clientname from TDSCONFIGS_Client_FieldtestPriority);

    insert into TDSCONFIGS_Client_Grade (clientname, gradecode, grade)
    select distinct client, grade, 'Grade ' + cast(grade as varchar(4)) GradeLabel
    from @tests T, SetofTestGrades S
    where T.testkey = S._fk_AdminSubject and T.testkey not like '%student help%'
    and not exists (select * from TDSCONFIGS_Client_Grade C where c.clientname = T.client and C.Gradecode = S.Grade);

    insert into TDSCONFIGS_Client_Subject(clientname, Subject, SubjectCode)
    select distinct T.client, S.Name
        , (select SubjectCode from SubjectCodes C where C.subject = S.Name)
    from @tests T, tblSubject S, tblsetofadminsubjects A
    where T.testkey = A._Key and A._fk_Subject = S._Key and T.testkey not like '%student help%'
    and not exists (select * from TDSCONFIGS_Client_Subject C where c.clientname = T.client and C.Subject = S.Name);

    insert into TDSCONFIGS_Client_AccommodationFamily (clientname, family, label)
    select distinct T.client, SubjectCode, T.Subject
    from @tests T, SubjectCodes S
    where T.Subject = S.Subject 
        and not exists (select * from TDSCONFIGS_Client_AccommodationFamily F where F.clientname = T.client and F.family = S.SubjectCode);

    
--  Add any missing tests to Client_TestProperties

    insert into TDSCONFIGS_Client_TestProperties 
        (ClientName, TestID, IsSelectable, Label, SubjectName, MaxOpportunities, ScoreByTDS, AccommodationFamily,  ReportingInstrument, TIDE_ID, gradeText)
    select distinct client, test, dbo.IsSelectable(testKey), dbo._MakeTestLabel(client, test) as Label, T.subject, 3, dbo.IsSelectable(testKey), 
        (select Family from TDSCONFIGS_Client_AccommodationFamily F where T.client = F.clientname and T.subject = F.Label)
        , instrument, case when instrument is not null then instrument + '-' + subject else null end
        , dbo._MakeTestGradeLabel(client, test)
    from @tests T
    where not exists (select * from TDSCONFIGS_Client_TestProperties where ClientName = client and TestID = test);

-- add physical tests where none exist for the logical test (-FX- tests are BOTH online AND paper)
    insert into TDSCONFIGS_Client_TestMode (clientname, testID, testkey, mode, sessionType)
    select client, test, testkey, 'online', 0
    from @tests T where testkey not like '%paper%' and testkey not like '%-fx-%' -- TODO: add FX tests as both online and paper
    and not exists (select * from TDSCONFIGS_Client_TestMode where clientname = client and testID = test and mode = 'online');

    insert into TDSCONFIGS_Client_TestMode (clientname, testID, testkey, mode, sessionType)
    select client, test, testkey, 'paper', 1
    from @tests T where (testkey like '%paper%' or testkey like '%-FX-%')
    and not exists (select * from TDSCONFIGS_Client_TestMode where clientname = client and testID = test and mode = 'paper');

-- insert the physical tests in a 'dormant' state (sessionType = 99) if they are not in the Test Mode table
    insert into TDSCONFIGS_Client_TestMode (clientname, testID, testkey, mode, sessionType)
    select client, test, testkey, 'online', 99
    from @tests T where testkey not like '%paper%' 
    and not exists
    (select * from TDSCONFIGS_Client_testMode where testkey = T.testKey);

    insert into TDSCONFIGS_Client_TestMode (clientname, testID, testkey, mode, sessionType)
    select client, test, testkey, 'paper', 99
    from @tests T where (testkey like '%paper%' or testkey like '%-FX-%')
    and not exists
    (select * from TDSCONFIGS_Client_testMode where testkey = T.testKey);
--  

    update TDSCONFIGS_Client_TestMode set isSegmented = T.IsSegmented
    from @tests T where TDSCONFIGS_Client_TestMode.testkey = T.testkey;

    update TDSCONFIGS_Client_testMode set algorithm = selectionAlgorithm
    from tblSetofAdminSubjects S, @tests T
    where S._Key = T.testkey and S._Key = TDSCONFIGS_Client_TestMode.testkey;


-- remove any segments that no longer are on the test (and hope for the best)
    delete from TDSCONFIGS_Client_SegmentProperties 
    where exists (select * from @tests where clientname = client and parentTest = test)
    and not exists
    (select * from @segments where client = clientname and segment = segmentID and VirtualTest = parentTest );

    insert into TDSCONFIGS_Client_SegmentProperties (clientname, segmentID, segmentPosition, parentTest, IsPermeable, EntryApproval, ExitApproval, itemReview, label, modekey)
    select client, segment, pos, VirtualTest, 1, 0, 0, 0, dbo._MakeTestlabel(client, segment) + ' Segment', vtestkey
    from @segments T
    where not exists 
        (select * from TDSCONFIGS_Client_SegmentProperties S where S.clientname = T.client and S.SegmentID = T.segment  and S.ParentTest = T.VirtualTest);

    update TDSCONFIGS_Client_SegmentProperties set  segmentPosition = pos, modekey = vtestKey
    from @segments where clientname = client and segmentID = segment;

--  Test form properties: 
-- 12/27/2011 altered to allow test forms to be assigned to more than one test. Side effects have NOT BEEN EXPLORED!!!
    insert into TDSCONFIGS_Client_TestformProperties (clientname, _efk_TestForm, FormID, TestID, Language, startDate, endDate, testkey)
    select client, _Key, FormID, test, language, null, null, T.testkey
    from @tests T, TestForm F
    where F._fk_AdminSubject = T.testKey
    and not exists (select * from TDSCONFIGS_Client_TestformProperties P where P.clientname = client and P._efk_TestForm = F._Key and P.testkey = T.testkey);

--  Test form properties
    insert into TDSCONFIGS_Client_TestformProperties (clientname, _efk_TestForm, FormID, TestID, Language, startDate, endDate, testkey)
    select client, _Key, FormID, segment, language, null, null, T.segkey
    from @segments T, TestForm F
    where F._fk_AdminSubject = T.segKey
    and not exists (select * from TDSCONFIGS_Client_TestformProperties P where P.clientname = client and P._efk_TestForm = F._Key and P.testkey = T.segKey);


    insert into TDSCONFIGS_Client_TestWindow (clientname, testID, windowID, numopps, startDate, endDate)
    select client, test, 'ANNUAL', 3, getdate(), dateadd(year, 1, getdate())
    from @tests where not exists (select * from TDSCONFIGS_Client_TestWindow where Clientname = client and testID = test );

    delete from TDSCONFIGS_Client_TestGrades
    where exists (select * from @tests where clientname = client and TestID = test);

    insert into TDSCONFIGS_Client_TestGrades (clientname, TestID, grade)
    select distinct client, S.testID, G.grade
    from SetofTestGrades G, @tests T, tblSetofAdminSubjects S
    where G._fk_AdminSubject = T.testKey and S._Key = T.testKey and S.VirtualTest is null;

-- Seed test eligibility table
    insert into TDSCONFIGS_Client_TestEligibility (Clientname, TestID, RTSName, enables, disables, RTSValue, _efk_EntityType, eligibilityType, matchType)
    select distinct T.client, T.test, 'EnrlGrdCd', 1, 0, 
        -- RTS grade values < 10 are prepended with a '0'. Make this adjustment
        case when isNumeric(G.grade) = 1 and len(G.grade) = 1 then '0' + G.grade else G.grade end, 
        6, 'ATTRIBUTE', 0
    from @tests T, TDSCONFIGS_Client_TestGrades G
    where T.client = G.clientname and T.TEst = G.TestID
        and not exists (select * from TDSCONFIGS_Client_testEligibility E where E.clientname = G.clientname and E.testID = G.testID);


--  Update the itemtypes (used to configure what itemtypes may be printed by student on a test)

    delete from TDSCONFIGS_Client_Test_Itemtypes
    where exists (select * from @tests where ClientName = Client and TestID = Test);

--  First do all the unsegmented tests excluding student help
    insert into TDSCONFIGS_Client_Test_Itemtypes (ClientName, TestID, ItemType)
    select distinct client, test, itemtype
    from @tests T, tblItem I, tblSetofAdminItems A
    where A._fk_AdminSubject = T.testKey and A._fk_Item = I._Key  and test not like '%student help%' and T.IsSegmented = 0;

-- now do all the segmented tests, getting their itemtypes from their segments' items
    insert into TDSCONFIGS_Client_Test_Itemtypes (ClientName, TestID, ItemType)
    select distinct V.client, V.test, itemtype
    from @tests V, @segments S, tblItem I, tblSetofAdminItems A, @tests T
    where V.IsSegmented = 1 and S.VirtualTest = V.test
        and A._fk_AdminSubject = S.segKey and A._fk_Item = I._Key
        and not exists 
        (select * from TDSCONFIGS_Client_Test_Itemtypes X where clientname = V.client and TestID = V.test and X.itemtype = I.itemtype);


-- 5/2012: Place all item properties into TDSConfigs for individualized itempool selection

    -- Seed the Test_ItemConstraint table with language property

    delete from TDSCONFIGS_Client_Test_ItemConstraint
    where exists (select * from @tests T where clientname = T.client and testID = T.test and T.isSEgmented = 0)
    and not exists (select * from tblItemProps P, @tests T 
                    where P._fk_AdminSubject = T.testkey and T.client = clientname and T.test = testID
                        and P.propname = TDSCONFIGS_Client_Test_ItemConstraint.propname
                        and P.propvalue = TDSCONFIGS_Client_Test_ItemConstraint.propvalue);

    delete from TDSCONFIGS_Client_Test_ItemConstraint
    where exists (select * from @segments S where clientname = S.client and testID = S.virtualTest )
    and not exists (select * from tblItemProps P, @segments S 
                    where P._fk_AdminSubject = S.segkey and S.client = clientname and S.virtualTest = testID
                        and P.propname = TDSCONFIGS_Client_Test_ItemConstraint.propname
                        and P.propvalue = TDSCONFIGS_Client_Test_ItemConstraint.propvalue);

-- Language is only 'in', ITEMTYPE is only 'out', TDSPoolFilter is unknown therefore we set for in or out with an appended code
    insert into TDSCONFIGS_Client_Test_ItemConstraint (clientname, testID, propname, propvalue, tooltype, toolvalue, item_in)
    select distinct T.client, T.test, P.propname, propvalue, P.propname
            , propvalue + case P.Propname when 'TDSPoolFilter' then ' IN' else '' end, 1
    from tblItemProps P, @tests T
    where T.IsSegmented = 0 and T.test not like '%student help%' and T.testkey = P._fk_AdminSubject 
            and P.propname in ('Language', 'TDSPoolFilter')
    and not exists 
        (select * from TDSCONFIGS_Client_Test_itemConstraint C where C.clientname = T.client and C.testID = T.Test 
            and C.propname = P.propname and C.propvalue = P.propvalue and C.item_in = 1);

    -- put in the item_out constraints
    insert into TDSCONFIGS_Client_Test_ItemConstraint (clientname, testID, propname, propvalue, tooltype, toolvalue, item_in)
    select distinct T.client, T.test, P.propname, P.propvalue
        ,case P.Propname when '--ITEMTYPE--' then 'Item Types Exclusion' else P.Propname end 
        ,case P.Propname when '--ITEMTYPE--' then 'TDS_ItemTypeExcl_' + propvalue 
            else propvalue + ' OUT' end, 
        0
    from tblItemProps P, @tests T
    where T.IsSegmented = 0 and T.test not like '%student help%' and T.testkey = P._fk_AdminSubject 
        and P.propname in ('TDSPoolFilter', '--ITEMTYPE--')
    and not exists 
        (select * from TDSCONFIGS_Client_Test_itemConstraint C where C.clientname = T.client and C.testID = T.Test 
            and C.propname = P.propname and C.propvalue = P.propvalue and C.item_in = 0);

-- ********* SEGMENTS OF TESTS *************
    insert into TDSCONFIGS_Client_Test_ItemConstraint (clientname, testID, propname, propvalue, tooltype, toolvalue, item_in)
    select distinct S.client, S.VirtualTest, P.propname, propvalue, P.propname
        , propvalue + case P.Propname when 'TDSPoolFilter' then ' IN' else '' end, 1
    from tblItemProps P, @segments S
    where  S.Segkey = P._fk_AdminSubject and P.propname in ('Language', 'TDSPoolFilter')
    and not exists 
        (select * from TDSCONFIGS_Client_Test_itemConstraint C where C.clientname = S.client and C.testID = S.VirtualTest
            and C.propname = P.propname and C.propvalue = P.propvalue and C.item_in = 1);
    
    insert into TDSCONFIGS_Client_Test_ItemConstraint (clientname, testID, propname, propvalue, item_in, tooltype, toolvalue)
    select distinct S.client, S.VirtualTest, P.propname, propvalue, 0
        ,case P.Propname when '--ITEMTYPE--' then 'Item Types Exclusion' else P.Propname end 
        ,case P.Propname when '--ITEMTYPE--' then 'TDS_ItemTypeExcl_' + propvalue 
            else propvalue + ' OUT' end
    from tblItemProps P, @segments S
    where  S.Segkey = P._fk_AdminSubject and P.propname in ('TDSPoolFilter', '--ITEMTYPE--')
    and not exists 
        (select * from TDSCONFIGS_Client_Test_itemConstraint C where C.clientname = S.client and C.testID = S.VirtualTest
            and C.propname = P.propname and C.propvalue = P.propvalue and C.item_in = 0);

  

-- link up the non-language itempool constraints with an accommodation whose configuration must be finished manually
    insert into TDSCONFIGS_Client_TestToolType (ClientName, Context, ContextType, ToolName, AllowChange, IsSelectable, IsVisible
            , StudentControl, IsFunctional, RTSFieldName, IsRequired, TIDESelectable, TIDESelectableBySubject)
    select distinct P.clientname, P.testID, 'TEST', P.tooltype, AllowChange, 0, 0
            , 0, 0, RTSFieldName, 0, TideSelectable, TIDESelectableBySubject
    from @tests S, TDSCONFIGS_TDS_TestToolType L, TDSCONFIGS_Client_test_ItemConstraint P
    where P.testID = S.test and P.clientname = S.client and P.propname = 'TDSPoolFilter' and L.Toolname = P.toolType
    and not exists (select * from TDSCONFIGS_Client_TestToolType C
                     where C.ClientName = S.client and C.ContextType = 'TEST' and C.Context = testID and C.Toolname = P.toolType);


    insert into TDSCONFIGS_Client_TestTool (ClientName, Type, Code, Value, IsDefault, AllowCombine, ValueDescription, Context, ContextType)
    select distinct C.Clientname, C.ToolType, C.ToolValue, C.ToolValue, 0, 1, 'Item Pool Filter', C.TestID, 'TEST'
    from @tests T, TDSCONFIGS_Client_Test_ItemConstraint C
    where T.client = C.clientname and T.test = C.TestID and C.propname = 'TDSPoolFilter'    -- handle language and itemtype exclusions separately
    and not exists 
    (select * from TDSCONFIGS_Client_TestTool TT
     where TT.ClientName = C.clientname and TT.ContextType = 'TEST' and TT.Context = C.TestID and TT.TYpe = C.ToolType and TT.Code = C.ToolValue);



--  Insert the default test (testID = '*') for every required TestToolType for every new client and add all values for every required tool except language  
    insert into TDSCONFIGS_Client_TestToolType (ClientName, Context, ContextType, ToolName, AllowChange, RTSFieldName, IsRequired, TIDESelectable, TIDESelectableBySubject)
    select cname, '*' , 'TEST', ToolName, AllowChange, RTSFieldName, IsRequired, TIDESelectable, TIDESelectableBySubject
    from @clients, TDSCONFIGS_TDS_TestToolType T
    where T.IsRequired = 1 and T.ToolName not in  ('Language', 'TDSPoolFilter')
    and not exists (select * from TDSCONFIGS_Client_TestToolType C
                     where C.ClientName = cname and C.ContextType = 'TEST' and C.Context = '*' and C.Toolname = T.Toolname);

    insert into TDSCONFIGS_Client_TestTool (ClientName, Type, Code, Value, IsDefault, AllowCombine, ValueDescription, Context, ContextType)
    select cname, Type, Code, Value, IsDefault, AllowCombine, ValueDescription, '*', 'TEST'
    from @clients, TDSCONFIGS_TDS_TestTool, TDSCONFIGS_TDS_TestToolType T
    where IsRequired = 1 and Type = ToolName and ToolName not in  ('Language', 'TDSPoolFilter')
    and not exists (select * from TDSCONFIGS_Client_TestTool C 
                    where C.ClientName = cname and C.ContextType = 'TEST' and C.Context = '*' and C.TYpe = T.ToolName);

    

    -- remove any languages no longer on this test. DO NOT DELETE AND START OVER so as not to disturb special flags set by configurers e.g. Jeremy
    delete from TDSCONFIGS_Client_testTool
    where type = 'language'
        and exists (select * from @langs where client = clientname and testname = Context and ContextType = 'TEST')
        and not exists (select * from @langs where client = clientname and testname = Context and ContextType = 'TEST' and Code = lang);


    insert into TDSCONFIGS_Client_testToolType (ClientName, Context, ContextType, ToolName, AllowChange, IsRequired, RTSFieldName
        ,IsSelectable, IsVisible, TIDESelectable, TIDESelectableBySubject
        ,studentControl)
    select distinct client, testname, 'TEST', ToolName, AllowChange, IsRequired, RTSFieldName
        , dbo.IsSelectable(testkey)  IsSelectable
        , dbo.IsSelectable(testkey)  IsVisible
        , dbo.IsSelectable(testkey)  TIDESelectable     
        , dbo.IsSelectable(testkey)  TIDESelectableBySubject  
        , case when dbo.IsSelectable(testname) = 1 and L.client like '%_PT' then 1 else 0 end as studentControl
    from @langs L, TDSCONFIGS_TDS_TestToolType T
    where T.ToolName = 'Language' 
    and not exists (select * from TDSCONFIGS_Client_TestToolType C where ClientName = L.Client and ContextType = 'TEST' and Context = L.testname and C.ToolName = 'Language');

    -- add any language accommodation that did not already exist



    insert into TDSCONFIGS_Client_TestTool (ClientName, Context, ContextType, Type, Code, value, ValueDescription, IsDefault, AllowCombine)
    select distinct client, testname, 'TEST', 'Language' , lang, descrip, descrip + ' language test' ValueDescription
        , case lang when 'ENU' then 1 else 0 end as IsDefault, 0 as AllowCombine
    from @langs T
    where not exists (select * from TDSCONFIGS_Client_TestTool 
                        where ClientName = T.client and ContextType = 'TEST' and Context = T.testname and Code = lang and type = 'language');


    -- finally, update general language, grade, and subject for TDS_Configs. This is used to set user message translations specific to these parameters

    insert into TDSCONFIGS_Client_Language (clientname, Language, LanguageCode)
    select distinct client, descrip, lang from @langs L
    where not exists (select * from TDSCONFIGS_Client_Language C where C.clientname = L.Client and C.languageCode = L.lang);



    exec UpdateConfigs_ScoreFeatures @doall, @testkey;

    if (@doall = 0) begin
        update ConfigsLoaded set TDSConfigs_Updated = getdate()
        from Loader_Itembank B
        where ConfigsLoaded.configID = B.configID and _error is null;
    end
    else begin
        update COnfigsLoaded set TDSConfigs_Updated = getdate ()
        where ClientName in
        (select cname from @clients) and _error is null;
    end
    commit
end try
begin catch
    
    rollback;
    declare @msg varchar(max);
    set @msg = Error_Procedure() + ': ' + Error_Message();
    select @msg as [Result];

end catch



end
GO
/****** Object:  View [dbo].[TDSGradeSubjects]    Script Date: 01/28/2015 15:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TDSGradeSubjects]
AS
SELECT    (A._Key) as _Key, (S.Name) AS [Subject], T.SchoolYear, T.Season, G.Isselectable, null as TestStartDate, null as TestEndDate
        , AccommodationFamily, A.IsSegmented
        , FTStartDate, FTEndDate, FTStartPos, FTEndPos, FTMinItems, FTMaxItems
		, dbo._MakeTestGradeLabel(C.name, A.TestID) AS [GradeText]
        , case when coalesce(S.grade, '') = '' then dbo._MakeTestGradeSpan(C.name, A.TestID) else S.grade end as GradeCode
        , dbo._MakeTestGradeSpan(C.name, A.TestID) as GradeSpan
		, (A.TestID) AS TestID, G.MaxOpportunities, A.MinItems, A.MaxItems, G.Prefetch
        , case when G.Label is not null and len(G.Label) > 0 then G.Label else dbo._MakeTestLabel(C.name, G.TestID) end as DisplayName
        , C.Name as ClientName
        , case when G.ScoreByTDS is null or G.ScoreByTDS = 1 then cast (1 as bit) else cast (0 as bit) end as ScoreByTDS
        , (select min(cast(G.grade as int)) from SetofTestGrades G where G._fk_AdminSubject = A._Key and IsNumeric(G.Grade) = 1) as SortOrder
		, G.SortOrder as TestSortOrder
FROM         dbo.tblSubject AS S,  dbo.tblSetofAdminSubjects AS A, dbo.tblTestAdmin as T, dbo.tblClient as C, TDSCONFIGS_Client_TestProperties G
where -- getdate() between G.StartDate and G.EndDate and 
    S._Key = A._fk_Subject and A._fk_TestAdmin = T._Key and T._fk_Client = C._Key and c.name = g.clientname
    and A.TestID = G.TestID and A.VirtualTest is null
GO
/****** Object:  View [qa].[Test]    Script Date: 01/28/2015 15:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [qa].[Test]
AS
      select
            J._Key AS TestName, J.TestID as TestID, gs.Subject as Subject, gs.ClientName, gs.GradeCode, gs.GradeSpan, J.MinItems, J.MaxItems, MaxOpportunities,
            StartAbility AS StartDifficultyMin, StartAbility AS StartDifficultyMax, 
            StartAbility, StartInfo AS StartInformation, FTStartDate, FTEndDate, J.FTMinItems AS FieldTestMinNum,
            J.FTMaxItems AS FieldTestMaxNum, J.FTStartPos AS FieldTestStartsAfter, J.FTEndPos AS FieldTestEndsBefore, 
            Slope, Intercept, selectionAlgorithm
      from   
            tblSetofAdminSubjects J 
            join TDSGradeSubjects gs on J._Key = gs._Key
GO
/****** Object:  StoredProcedure [tp].[spLoad_Admin]    Script Date: 01/28/2015 15:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoad_Admin] (
/*
Description: 

VERSION 	DATE 			AUTHOR 			COMMENTS
001			4/3/2014		AIR 			
*/
	@TestPackageKey VARCHAR(350)
)
AS
BEGIN

	DECLARE @TestKey VARCHAR(250);
	SET @TestKey = (SELECT TestKey FROM tp.Loader_TestPackage WHERE PackageKey = @TestPackageKey);
	
	/*** STEP 1: Process and load data into itembank tables ***/	
	EXEC tp.spLoad_Subject @TestPackageKey;
	EXEC tp.spLoad_Strands @TestPackageKey;
	
	EXEC tp.spLoad_Stimuli @TestPackageKey;
	EXEC tp.spLoad_Items @TestPackageKey;

	EXEC tp.spLoad_LinkItemsToStrands @TestPackageKey;
	EXEC tp.spLoad_LinkItemsToStimuli @TestPackageKey;
	EXEC tp.spLoad_ItemProperties @TestPackageKey;

	-- start loading test administration
	EXEC tp.spLoad_TestAdmin @TestPackageKey;
	EXEC tp.spLoad_AdminSubjects @TestPackageKey;
	EXEC tp.spLoad_AdminStrands @TestPackageKey;
	EXEC tp.spLoad_AdminItems @TestPackageKey;

	EXEC tp.spLoad_AdminItemMeasurementParms @TestPackageKey;
	EXEC tp.spLoad_AdminStimuli @TestPackageKey;
	EXEC tp.spLoad_AdminForms @TestPackageKey;
	EXEC tp.spLoad_AdminFormItems @TestPackageKey;
	EXEC tp.spLoad_AffinityGroups @TestPackageKey;

	
	/*** STEP 2: Populate client_* tables in configs db ***/
 	EXEC dbo.UpdateTDSConfigs 0, @TestKey;

END
GO
/****** Object:  StoredProcedure [tp].[spLoader_Main]    Script Date: 01/28/2015 15:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [tp].[spLoader_Main] (
/*
Description: Entry point for loading itembank tables FROM the testpackage file in xml format.

VERSION 	DATE 			AUTHOR 			COMMENTS
001			3/23/2014		AIR 			--
*/
	@XMLfile  XML
)
AS
BEGIN

	-- declare variables
	DECLARE @TestPackageKey VARCHAR(350);
	DECLARE @ClientName		VARCHAR(50);
	DECLARE @TestAdmin		VARCHAR(250);
	DECLARE @Year 			VARCHAR(50);
	DECLARE @Season			VARCHAR(50);
 	DECLARE @Subject		VARCHAR(100);
	DECLARE @ClientKey		BIGINT;
	DECLARE @Version		INT;

	/*** STEP 1: extract data FROM xml and load it into loader_* tables ***/
	EXEC tp.spLoader_ExtractXML @XMLfile, @TestPackageKey = @TestPackageKey OUT;


	/*** STEP 2: Prep the loader_* tables with missing/computed column data ***/	
	EXEC dbo.Load_MeasurementParameters

	UPDATE tp.Loader_TestPackage
	   SET ClientKey = (SELECT _Key FROM dbo.tblClient WHERE Name = Publisher)
	 WHERE PackageKey = @TestPackageKey;

	UPDATE tp
	   SET tp._efk_Itembank = ib._efk_Itembank
	  FROM tp.Loader_TestPackage tp 
	  JOIN dbo.tblItembank ib ON ib._fk_Client = tp.ClientKey
	 WHERE tp.PackageKey = @TestPackageKey;
	   	   	 
	UPDATE tp.Loader_TestPackage 
	   SET TestAdmin  = Publisher
	 WHERE PackageKey = @TestPackageKey;

	UPDATE tp
	   SET tp.SubjectKey  = tp.Publisher + '-' + tpp.PropValue
		 , tp.SubjectName = tpp.PropValue
	  FROM tp.Loader_TestPackage tp
	  JOIN tp.Loader_TestPackageProperties tpp ON tp.PackageKey = tpp._fk_Package AND tpp.PropName = 'subject'	 
	 WHERE PackageKey = @TestPackageKey;

	UPDATE tp.Loader_TestBluePrint
	   SET TreeLevel = CASE WHEN ElementType in ('strand', 'contentlevel') 
								THEN LEN(bpElementID) - LEN(REPLACE(bpElementID, '|', '')) + 1
							ELSE -1 
						END
	 WHERE _fk_Package = @TestPackageKey;

	-- SELECT * FROM loader_testblueprint
	
	UPDATE tp.Loader_TestPassages
	   SET FilePath = SUBSTRING([FileName], 1, charindex('.xml', [FileName], 1) - 1) + '\'
	 WHERE _fk_package = @TestPackageKey;

	UPDATE tp.Loader_TestItem
	   SET FilePath = SUBSTRING([FileName], 1, charindex('.xml', [FileName], 1) - 1) + '\'
	 WHERE _fk_Package = @TestPackageKey;
	 	   
	UPDATE tir
	   SET tir.RefCategory = tbp.ElementType
		 , tir.TreeLevel = tbp.TreeLevel
	  FROM tp.Loader_TestItemRefs tir
	  JOIN tp.Loader_TestBluePrint tbp ON tbp._fk_Package = tir._fk_Package AND tbp.bpelementid = tir.ref AND tbp.elementtype <> 'test'
	 WHERE tir._fk_Package = @TestPackageKey;
	 
	-- SELECT * FROM loader_testitemrefs;

	UPDATE dim
	   SET dim.MeasureModelKey = m.ModelNumber
	  FROM tp.Loader_ItemScoreDimension dim
	  JOIN dbo.MeasurementModel m ON m.ModelName = dim.measuremodel
	 WHERE dim._fk_Package = @TestPackageKey; 
	  
	UPDATE dim
	   SET dim.MeasurementParamNum = mp.parmnum
	  FROM tp.Loader_ItemScoreDimension dim
	  JOIN dbo.MeasurementParameter mp ON mp._fk_MeasurementModel = dim.MeasuremodelKey AND mp.parmname = dim.MeasurementParam
	 WHERE dim._fk_Package = @TestPackageKey; 

	
	/*** STEP 2.a: Derive ItemBankKey and ITSItemKey values from ItemID. Do the same for passage, forms etc. 
		-- In future, if the splitting key values to derive ItemBank and ITSKeys are discontinued, all one needs to do is comment out
		-- all the UPDATES under this step. As a result of that the code will not break.
	***/
	UPDATE tp.Loader_TestPassages
	SET _efk_ItemBank = SUBSTRING(PassageID, 1, CHARINDEX('-', PassageID, 1)-1)
	  , _efk_ITSKey   = SUBSTRING(PassageID, CHARINDEX('-', PassageID, 1)+1, LEN(PassageID))
	
	UPDATE tp.Loader_TestItem
	SET _efk_ItemBank = SUBSTRING(TestItemID, 1, CHARINDEX('-', TestItemID, 1)-1)
	  , _efk_Item     = SUBSTRING(TestItemID, CHARINDEX('-', TestItemID, 1)+1, LEN(TestItemID))

	UPDATE tp.Loader_TestFormPartition
	SET _efk_ITSBank = SUBSTRING(FormPartitionID, 1, CHARINDEX('-', FormPartitionID, 1)-1)
	  , _efk_ITSKey     = SUBSTRING(FormPartitionID, CHARINDEX('-', FormPartitionID)+1, LEN(FormPartitionID)) 
	  
	  
	/*** STEP 3: Validate data in loader_* tables ***/	
	-- 	EXEC loader_validate(@TestPackageKey);


	/*** STEP 4: Process and load data INTo actual itembank tables ***/	

	/* ?? do we need this logic
		SELECT @clientkey = _key, @oldpath = homepath FROM tblclient 
		WHERE [name] = (SELECT ClientName FROM Loader_Itembank);

		if (@filepath is null and @oldpath is null) begin
			SELECT 'Missing filepath for itembank content';
			return 0;
		end

		if (@filepath is null) SET @filepath = @oldpath;
		if (charindex('\', @filepath) > 0) SET @pathdelim = '\';
		else SET @pathdelim = '/';
		
		SET @lastchar = substring(@filepath, len(@filepath), 1);
		if (@lastchar <> @pathdelim)
			SET @filepath = @filepath + @pathdelim;
	*/

	-- ?? Do we need to create itembank ??
	-- tblItembank
	DECLARE @Purpose VARCHAR(100);
	SET @Purpose = (SELECT Purpose FROM tp.Loader_TestPackage WHERE PackageKey = @TestPackageKey);
	
	IF @Purpose = 'administration'
	  EXEC [tp].[spLoad_Admin] @TestPackageKey;
	ELSE IF @Purpose = 'scoring'
	  EXEC [tp].[spLoad_Scoring] @TestPackageKey;  

	/** 
		Tests need to be in the TestNameLookUp or else they won't be handled by TIS
		So we are going to add them when packages are loaded
	**/
	insert into OSS_TIS.dbo.TestNameLookUp (InstanceName, TestName)
	select 'OSS_TISService', p.TestKey
	from
		tp.Loader_TestPackage p
		left join OSS_TIS.dbo.TestNameLookUp l on p.TestKey = l.TestName
	where
		l.TestName is null


	/*** STEP 6: Clear loader_* tables ***/
	EXEC tp.spLoader_Clear @TestPackageKey;

END
GO
/****** Object:  Default [DF___TestUpda___date__011F1899]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[_TestUpdate] ADD  CONSTRAINT [DF___TestUpda___date__011F1899]  DEFAULT (getdate()) FOR [_date]
GO
/****** Object:  Default [DF__AffinityG__IsStr__6A1BB7B0]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[AffinityGroup] ADD  CONSTRAINT [DF__AffinityG__IsStr__6A1BB7B0]  DEFAULT ((0)) FOR [IsStrictMax]
GO
/****** Object:  Default [DF__AffinityG__weigh__6B0FDBE9]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[AffinityGroup] ADD  CONSTRAINT [DF__AffinityG__weigh__6B0FDBE9]  DEFAULT ((1.0)) FOR [weight]
GO
/****** Object:  Default [DF__ConfigsLo___date__214BF109]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[ConfigsLoaded] ADD  CONSTRAINT [DF__ConfigsLo___date__214BF109]  DEFAULT (getdate()) FOR [_date]
GO
/****** Object:  Default [DF__ConfigsLoa___Key__302F0D3D]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[ConfigsLoaded] ADD  CONSTRAINT [DF__ConfigsLoa___Key__302F0D3D]  DEFAULT (newid()) FOR [_Key]
GO
/****** Object:  Default [DF_dbo_ItemScoreDimension_Dimension]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[ItemScoreDimension] ADD  CONSTRAINT [DF_dbo_ItemScoreDimension_Dimension]  DEFAULT ('') FOR [Dimension]
GO
/****** Object:  Default [DF__SetofTest__Requi__4AA30C57]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[SetofTestGrades] ADD  CONSTRAINT [DF__SetofTest__Requi__4AA30C57]  DEFAULT ((0)) FOR [RequireEnrollment]
GO
/****** Object:  Default [DF__SetofTestG___Key__2A7633E7]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[SetofTestGrades] ADD  CONSTRAINT [DF__SetofTestG___Key__2A7633E7]  DEFAULT (newid()) FOR [_Key]
GO
/****** Object:  Default [DF__tblAdminS__NumIt__5CC1BC92]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblAdminStimulus] ADD  CONSTRAINT [DF__tblAdminS__NumIt__5CC1BC92]  DEFAULT ((-1)) FOR [NumItemsRequired]
GO
/****** Object:  Default [DF__tblAdminS__MaxIt__5DB5E0CB]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblAdminStimulus] ADD  CONSTRAINT [DF__tblAdminS__MaxIt__5DB5E0CB]  DEFAULT ((-1)) FOR [MaxItems]
GO
/****** Object:  Default [DF__tblAdminS__bpwei__15FA39EE]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblAdminStimulus] ADD  CONSTRAINT [DF__tblAdminS__bpwei__15FA39EE]  DEFAULT ((1.0)) FOR [bpweight]
GO
/****** Object:  Default [DF_dbo_tblAdminStrand_InheritRatio]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblAdminStrand] ADD  CONSTRAINT [DF_dbo_tblAdminStrand_InheritRatio]  DEFAULT ((-1)) FOR [InheritRatio]
GO
/****** Object:  Default [DF__tblAdminS__IsStr__795DFB40]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblAdminStrand] ADD  CONSTRAINT [DF__tblAdminS__IsStr__795DFB40]  DEFAULT ((0)) FOR [IsStrictmax]
GO
/****** Object:  Default [DF__tblAdminS__bpwei__7A521F79]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblAdminStrand] ADD  CONSTRAINT [DF__tblAdminS__bpwei__7A521F79]  DEFAULT ((1)) FOR [bpweight]
GO
/****** Object:  Default [DF__tblItemGr__NumIt__5F691F13]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemGroup] ADD  CONSTRAINT [DF__tblItemGr__NumIt__5F691F13]  DEFAULT ((-1)) FOR [NumItemsRequired]
GO
/****** Object:  Default [DF__tblItemGr__MaxIt__605D434C]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemGroup] ADD  CONSTRAINT [DF__tblItemGr__MaxIt__605D434C]  DEFAULT ((-1)) FOR [MaxItems]
GO
/****** Object:  Default [DF__tblItemGr__bpwei__61516785]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemGroup] ADD  CONSTRAINT [DF__tblItemGr__bpwei__61516785]  DEFAULT ((1.0)) FOR [bpweight]
GO
/****** Object:  Default [DF__tblItemPr__IsAct__02133CD2]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemProps] ADD  CONSTRAINT [DF__tblItemPr__IsAct__02133CD2]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_tblItemSelectionParm__key]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemSelectionParm] ADD  CONSTRAINT [DF_tblItemSelectionParm__key]  DEFAULT (newid()) FOR [_key]
GO
/****** Object:  Default [DF__tblSetofA__IsReq__63D8CE75]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminItems] ADD  CONSTRAINT [DF__tblSetofA__IsReq__63D8CE75]  DEFAULT ((0)) FOR [IsRequired]
GO
/****** Object:  Default [DF__tblSetofA__IsPri__729BEF18]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminItems] ADD  CONSTRAINT [DF__tblSetofA__IsPri__729BEF18]  DEFAULT ((0)) FOR [IsPrintable]
GO
/****** Object:  Default [DF__tblSetofA__respo__22951AFD]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminItems] ADD  CONSTRAINT [DF__tblSetofA__respo__22951AFD]  DEFAULT ('text/plain') FOR [responseMimeType]
GO
/****** Object:  Default [DF__tblSetofA__TestC__52442E1F]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminItems] ADD  CONSTRAINT [DF__tblSetofA__TestC__52442E1F]  DEFAULT ((1)) FOR [TestCohort]
GO
/****** Object:  Default [DF__tblSetofA__notFo__7F80E8EA]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminItems] ADD  CONSTRAINT [DF__tblSetofA__notFo__7F80E8EA]  DEFAULT ((0)) FOR [notForScoring]
GO
/****** Object:  Default [DF__tblSetofA__ftWei__5C8CB268]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminItems] ADD  CONSTRAINT [DF__tblSetofA__ftWei__5C8CB268]  DEFAULT ((1.0)) FOR [ftWeight]
GO
/****** Object:  Default [DF__tblSetofA__bluep__2AE0483B]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__bluep__2AE0483B]  DEFAULT ((5.0)) FOR [blueprintWeight]
GO
/****** Object:  Default [DF__tblSetofA__abili__2BD46C74]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__abili__2BD46C74]  DEFAULT ((1.0)) FOR [abilityWeight]
GO
/****** Object:  Default [DF__tblSetofA__cset1__33758E3C]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__cset1__33758E3C]  DEFAULT ((20)) FOR [cset1size]
GO
/****** Object:  Default [DF__tblSetofA__cset2__3A02903A]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__cset2__3A02903A]  DEFAULT ((1)) FOR [cset2Random]
GO
/****** Object:  Default [DF__tblSetofA__cset2__3AF6B473]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__cset2__3AF6B473]  DEFAULT ((5)) FOR [cset2InitialRandom]
GO
/****** Object:  Default [DF__tblSetofA__IsVir__5FBE24CE]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__IsVir__5FBE24CE]  DEFAULT ((0)) FOR [IsSegmented]
GO
/****** Object:  Default [DF__tblSetofA__compu__6576FE24]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__compu__6576FE24]  DEFAULT ((1)) FOR [computeAbilityEstimates]
GO
/****** Object:  Default [DF_dbo_tblSetofAdminSubjects_itemWeight]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF_dbo_tblSetofAdminSubjects_itemWeight]  DEFAULT ((5.0)) FOR [itemWeight]
GO
/****** Object:  Default [DF_dbo_tblSetofAdminSubjects_abilityOffset]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF_dbo_tblSetofAdminSubjects_abilityOffset]  DEFAULT ((0.0)) FOR [abilityOffset]
GO
/****** Object:  Default [DF__tblSetofA__cset1__35B2DC69]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__cset1__35B2DC69]  DEFAULT ('ABILITY') FOR [cset1Order]
GO
/****** Object:  Default [DF__tblSetofA__bpMet__0169315C]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__bpMet__0169315C]  DEFAULT ('bp1') FOR [bpMetricFunction]
GO
/****** Object:  Default [DF__tblSetofA__rcAbi__2F8501C7]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__rcAbi__2F8501C7]  DEFAULT ((1.0)) FOR [rcAbilityWeight]
GO
/****** Object:  Default [DF__tblSetofA__preci__32616E72]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__preci__32616E72]  DEFAULT ((1.0)) FOR [precisionTargetMetWeight]
GO
/****** Object:  Default [DF__tblSetofA__preci__3449B6E4]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__preci__3449B6E4]  DEFAULT ((1.0)) FOR [precisionTargetNotMetWeight]
GO
/****** Object:  Default [DF__tblSetofA__termi__381A47C8]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__termi__381A47C8]  DEFAULT ((0)) FOR [terminationOverallInfo]
GO
/****** Object:  Default [DF__tblSetofA__termi__3A02903A]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__termi__3A02903A]  DEFAULT ((0)) FOR [terminationRCInfo]
GO
/****** Object:  Default [DF__tblSetofA__termi__3BEAD8AC]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__termi__3BEAD8AC]  DEFAULT ((0)) FOR [terminationMinCount]
GO
/****** Object:  Default [DF__tblSetofA__termi__3DD3211E]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__termi__3DD3211E]  DEFAULT ((0)) FOR [terminationTooClose]
GO
/****** Object:  Default [DF__tblSetofA__termi__3FBB6990]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects] ADD  CONSTRAINT [DF__tblSetofA__termi__3FBB6990]  DEFAULT ((0)) FOR [terminationFlagsAnd]
GO
/****** Object:  Default [DF_dbo_TestCohort_ItemRatio]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[TestCohort] ADD  CONSTRAINT [DF_dbo_TestCohort_ItemRatio]  DEFAULT ((1)) FOR [ItemRatio]
GO
/****** Object:  Default [DF__TestForm__Iterat__32616E72]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[TestForm] ADD  CONSTRAINT [DF__TestForm__Iterat__32616E72]  DEFAULT ((0)) FOR [Iteration]
GO
/****** Object:  Default [DF__TestForm__cohort__1FF8A574]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[TestForm] ADD  CONSTRAINT [DF__TestForm__cohort__1FF8A574]  DEFAULT ('DEFAULT') FOR [cohort]
GO
/****** Object:  Default [DF__TestFormI__IsAct__7C3A67EB]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[TestFormItem] ADD  CONSTRAINT [DF__TestFormI__IsAct__7C3A67EB]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF__Loader_Pe___fk_P__6D031153]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [tp].[Loader_PerformanceLevels] ADD  CONSTRAINT [DF__Loader_Pe___fk_P__6D031153]  DEFAULT (NULL) FOR [_fk_Package]
GO
/****** Object:  Default [DF__Loader_Pe__bpEle__6DF7358C]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [tp].[Loader_PerformanceLevels] ADD  CONSTRAINT [DF__Loader_Pe__bpEle__6DF7358C]  DEFAULT (NULL) FOR [bpElementID]
GO
/****** Object:  Default [DF__Loader_Pe__pLeve__6EEB59C5]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [tp].[Loader_PerformanceLevels] ADD  CONSTRAINT [DF__Loader_Pe__pLeve__6EEB59C5]  DEFAULT (NULL) FOR [pLevel]
GO
/****** Object:  Default [DF__Loader_Pe__Scale__6FDF7DFE]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [tp].[Loader_PerformanceLevels] ADD  CONSTRAINT [DF__Loader_Pe__Scale__6FDF7DFE]  DEFAULT (NULL) FOR [Scaledlo]
GO
/****** Object:  Default [DF__Loader_Pe__Scale__70D3A237]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [tp].[Loader_PerformanceLevels] ADD  CONSTRAINT [DF__Loader_Pe__Scale__70D3A237]  DEFAULT (NULL) FOR [Scaledhi]
GO
/****** Object:  ForeignKey [FK_AffGroupTest]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[AffinityGroup]  WITH CHECK ADD  CONSTRAINT [FK_AffGroupTest] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AffinityGroup] CHECK CONSTRAINT [FK_AffGroupTest]
GO
/****** Object:  ForeignKey [FK_ItemAffinityGroup]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[AffinityGroupItem]  WITH CHECK ADD  CONSTRAINT [FK_ItemAffinityGroup] FOREIGN KEY([_fk_AdminSubject], [GroupID])
REFERENCES [dbo].[AffinityGroup] ([_fk_AdminSubject], [GroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AffinityGroupItem] CHECK CONSTRAINT [FK_ItemAffinityGroup]
GO
/****** Object:  ForeignKey [FK_ParameterScoreDimension]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[ItemMeasurementParameter]  WITH CHECK ADD  CONSTRAINT [FK_ParameterScoreDimension] FOREIGN KEY([_fk_ItemScoreDimension])
REFERENCES [dbo].[ItemScoreDimension] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemMeasurementParameter] CHECK CONSTRAINT [FK_ParameterScoreDimension]
GO
/****** Object:  ForeignKey [FK_Itemdim_Test]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[ItemScoreDimension]  WITH CHECK ADD  CONSTRAINT [FK_Itemdim_Test] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemScoreDimension] CHECK CONSTRAINT [FK_Itemdim_Test]
GO
/****** Object:  ForeignKey [FK_Testgrades_Test]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[SetofTestGrades]  WITH CHECK ADD  CONSTRAINT [FK_Testgrades_Test] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SetofTestGrades] CHECK CONSTRAINT [FK_Testgrades_Test]
GO
/****** Object:  ForeignKey [FK_AdminStimulus_AdminSubject]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblAdminStimulus]  WITH CHECK ADD  CONSTRAINT [FK_AdminStimulus_AdminSubject] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAdminStimulus] CHECK CONSTRAINT [FK_AdminStimulus_AdminSubject]
GO
/****** Object:  ForeignKey [FK_AdminStrand_AdminSubject]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblAdminStrand]  WITH CHECK ADD  CONSTRAINT [FK_AdminStrand_AdminSubject] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAdminStrand] CHECK CONSTRAINT [FK_AdminStrand_AdminSubject]
GO
/****** Object:  ForeignKey [FK_Itembank_Client]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemBank]  WITH CHECK ADD  CONSTRAINT [FK_Itembank_Client] FOREIGN KEY([_fk_Client])
REFERENCES [dbo].[tblClient] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblItemBank] CHECK CONSTRAINT [FK_Itembank_Client]
GO
/****** Object:  ForeignKey [FK_Itemgroup_AdminSubject]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemGroup]  WITH CHECK ADD  CONSTRAINT [FK_Itemgroup_AdminSubject] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblItemGroup] CHECK CONSTRAINT [FK_Itemgroup_AdminSubject]
GO
/****** Object:  ForeignKey [FK_tblItemProps_tblItem]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemProps]  WITH CHECK ADD  CONSTRAINT [FK_tblItemProps_tblItem] FOREIGN KEY([_fk_Item])
REFERENCES [dbo].[tblItem] ([_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblItemProps] CHECK CONSTRAINT [FK_tblItemProps_tblItem]
GO
/****** Object:  ForeignKey [FK_Selector_AdminSubject]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblItemSelectionParm]  WITH CHECK ADD  CONSTRAINT [FK_Selector_AdminSubject] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblItemSelectionParm] CHECK CONSTRAINT [FK_Selector_AdminSubject]
GO
/****** Object:  ForeignKey [FK_tblSetofAdminItems_tblItem]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminItems]  WITH CHECK ADD  CONSTRAINT [FK_tblSetofAdminItems_tblItem] FOREIGN KEY([_fk_Item])
REFERENCES [dbo].[tblItem] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSetofAdminItems] CHECK CONSTRAINT [FK_tblSetofAdminItems_tblItem]
GO
/****** Object:  ForeignKey [FK_tblSetofAdminItems_tblSetofAdminSubjects]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminItems]  WITH CHECK ADD  CONSTRAINT [FK_tblSetofAdminItems_tblSetofAdminSubjects] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSetofAdminItems] CHECK CONSTRAINT [FK_tblSetofAdminItems_tblSetofAdminSubjects]
GO
/****** Object:  ForeignKey [FK_tblSetofAdminSubjects_tblSetofAdminSubjects]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofAdminSubjects]  WITH CHECK ADD  CONSTRAINT [FK_tblSetofAdminSubjects_tblSetofAdminSubjects] FOREIGN KEY([_fk_TestAdmin])
REFERENCES [dbo].[tblTestAdmin] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSetofAdminSubjects] CHECK CONSTRAINT [FK_tblSetofAdminSubjects_tblSetofAdminSubjects]
GO
/****** Object:  ForeignKey [FK_tblSetofItemStimuli_tblItem]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofItemStimuli]  WITH CHECK ADD  CONSTRAINT [FK_tblSetofItemStimuli_tblItem] FOREIGN KEY([_fk_Item])
REFERENCES [dbo].[tblItem] ([_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSetofItemStimuli] CHECK CONSTRAINT [FK_tblSetofItemStimuli_tblItem]
GO
/****** Object:  ForeignKey [FK_tblSetofItemStimuli_tblStimulus]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofItemStimuli]  WITH CHECK ADD  CONSTRAINT [FK_tblSetofItemStimuli_tblStimulus] FOREIGN KEY([_fk_Stimulus])
REFERENCES [dbo].[tblStimulus] ([_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSetofItemStimuli] CHECK CONSTRAINT [FK_tblSetofItemStimuli_tblStimulus]
GO
/****** Object:  ForeignKey [FK_tblSetofItemStrands_tblItem]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSetofItemStrands]  WITH CHECK ADD  CONSTRAINT [FK_tblSetofItemStrands_tblItem] FOREIGN KEY([_fk_Item])
REFERENCES [dbo].[tblItem] ([_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSetofItemStrands] CHECK CONSTRAINT [FK_tblSetofItemStrands_tblItem]
GO
/****** Object:  ForeignKey [FK_tblStrand_tblStrand]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblStrand]  WITH CHECK ADD  CONSTRAINT [FK_tblStrand_tblStrand] FOREIGN KEY([_fk_Subject])
REFERENCES [dbo].[tblSubject] ([_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStrand] CHECK CONSTRAINT [FK_tblStrand_tblStrand]
GO
/****** Object:  ForeignKey [FK_Subject_Client]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblSubject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Client] FOREIGN KEY([_fk_Client])
REFERENCES [dbo].[tblClient] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSubject] CHECK CONSTRAINT [FK_Subject_Client]
GO
/****** Object:  ForeignKey [FK_TestAdmin_Client]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[tblTestAdmin]  WITH CHECK ADD  CONSTRAINT [FK_TestAdmin_Client] FOREIGN KEY([_fk_Client])
REFERENCES [dbo].[tblClient] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblTestAdmin] CHECK CONSTRAINT [FK_TestAdmin_Client]
GO
/****** Object:  ForeignKey [FK_TestForm_tblSetofAdminSubjects]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[TestForm]  WITH CHECK ADD  CONSTRAINT [FK_TestForm_tblSetofAdminSubjects] FOREIGN KEY([_fk_AdminSubject])
REFERENCES [dbo].[tblSetofAdminSubjects] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TestForm] CHECK CONSTRAINT [FK_TestForm_tblSetofAdminSubjects]
GO
/****** Object:  ForeignKey [FK_FormitemForm]    Script Date: 01/28/2015 15:19:38 ******/
ALTER TABLE [dbo].[TestFormItem]  WITH CHECK ADD  CONSTRAINT [FK_FormitemForm] FOREIGN KEY([_fk_Testform])
REFERENCES [dbo].[TestForm] ([_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TestFormItem] CHECK CONSTRAINT [FK_FormitemForm]
GO
