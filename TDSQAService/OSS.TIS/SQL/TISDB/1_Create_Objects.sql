----------------------------------------
-----Tables----------------
-----------------------------

/****** Object:  Table [dbo].[Projects]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[_Key] [int] NOT NULL,
	[Description] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CombinationTestOpportunity]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CombinationTestOpportunity](
	[OppId] [bigint] IDENTITY(1,1) NOT NULL,
	[OpportunityKey] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[_efk_Testee] [bigint] NOT NULL,
	[CombinationTestName] [varchar](255) NOT NULL,
	[Opportunity] [int] NOT NULL,
 CONSTRAINT [PK_CombinationTestOpportunity] PRIMARY KEY CLUSTERED 
(
	[OppId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Testee_Test_Opp] ON [dbo].[CombinationTestOpportunity] 
(
	[_efk_Testee] ASC,
	[CombinationTestName] ASC,
	[Opportunity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CombinationTestMap]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CombinationTestMap](
	[ComponentTestName] [varchar](255) NOT NULL,
	[ComponentSegmentName] [varchar](255) NOT NULL,
	[CombinationTestName] [varchar](255) NOT NULL,
	[CombinationSegmentName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_CombinationTestMap] PRIMARY KEY CLUSTERED 
(
	[ComponentSegmentName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ComboTestName] ON [dbo].[CombinationTestMap] 
(
	[CombinationTestName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QC_ProjectMetaData]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QC_ProjectMetaData](
	[_fk_ProjectID] [int] NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[VarName] [varchar](128) NOT NULL,
	[IntValue] [bigint] NULL,
	[FloatValue] [money] NULL,
	[TextValue] [varchar](250) NULL,
	[Comment] [varchar](250) NULL,
 CONSTRAINT [PK_ProjectMetaData] PRIMARY KEY CLUSTERED 
(
	[_fk_ProjectID] ASC,
	[GroupName] ASC,
	[VarName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QASystemServices]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QASystemServices](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](128) NOT NULL,
	[Path] [varchar](255) NOT NULL,
	[Description] [varchar](1024) NULL,
 CONSTRAINT [PK_QASystemServices] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestOpportunityItemScore]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TestOpportunityItemScore](
	[_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[OppID] [bigint] NOT NULL,
	[_efk_Item] [bigint] NOT NULL,
	[_efk_ItemBank] [bigint] NOT NULL,
	[reportingversion] [int] NOT NULL,
	[OppKey] [uniqueidentifier] NOT NULL,
	[_efk_ClientName] [varchar](100) NOT NULL,
	[testID] [varchar](255) NOT NULL,
	[ItemType] [varchar](50) NOT NULL,
	[position] [int] NOT NULL,
	[response] [nvarchar](max) NULL,
	[scorestatus] [varchar](50) NOT NULL,
	[scoringDate] [datetime2](7) NULL,
	[scoredDate] [datetime2](7) NULL,
	[scoreAttempts] [int] NOT NULL,
	[scoreInfo] [xml] NULL,
	[scoreRationale] [varchar](max) NULL,
	[score] [int] NULL,
 CONSTRAINT [PK_TestOpportunityItemScore] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_OppKey] ON [dbo].[TestOpportunityItemScore] 
(
	[OppKey] ASC
)
INCLUDE ( [OppID],
[scorestatus]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UQ_Client_Opp_Item] ON [dbo].[TestOpportunityItemScore] 
(
	[_efk_ClientName] ASC,
	[OppID] ASC,
	[_efk_ItemBank] ASC,
	[_efk_Item] ASC
)
INCLUDE ( [scorestatus]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestNameLookUp]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TestNameLookUp](
	[InstanceName] [varchar](50) NOT NULL,
	[TestName] [varchar](250) NOT NULL,
 CONSTRAINT [PK_TestNameLookUp_1] PRIMARY KEY CLUSTERED 
(
	[TestName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_InstanceName] ON [dbo].[TestNameLookUp] 
(
	[InstanceName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAdminPeriod]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdminPeriod](
	[_Key] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Season] [varchar](50) NULL,
	[Year] [bigint] NULL,
	[YearName] [varchar](50) NULL,
 CONSTRAINT [PK_tblAdminPeriod] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDItemScoringConfigs]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SDItemScoringConfigs](
	[_Key] [int] IDENTITY(1,1) NOT NULL,
	[_efk_ClientName] [varchar](100) NOT NULL,
	[Context] [varchar](100) NULL,
	[ItemType] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[ServerUrl] [varchar](400) NOT NULL,
 CONSTRAINT [PK_SDItemScoringConfigs_1] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDItemScorer]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SDItemScorer](
	[_Key] [int] IDENTITY(1,1) NOT NULL,
	[_efk_ClientName] [varchar](100) NOT NULL,
	[scoreHost] [varchar](256) NOT NULL,
	[rubricCallbackUrl] [varchar](400) NULL,
 CONSTRAINT [PK_SDItemScorer_1] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScoringDaemonMonitoredSites]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScoringDaemonMonitoredSites](
	[_Key] [int] IDENTITY(1,1) NOT NULL,
	[_efk_ClientName] [varchar](100) NOT NULL,
	[environment] [varchar](50) NOT NULL,
	[IP] [varchar](30) NOT NULL,
	[privateIP] [varchar](30) NULL,
	[dbname] [varchar](255) NOT NULL,
	[ScoringDaemonName] [varchar](255) NOT NULL,
	[serviceType] [varchar](50) NULL,
	[serviceRole] [varchar](50) NULL,
 CONSTRAINT [PK_ScoringDaemonMonitoredSites] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_SDName] ON [dbo].[ScoringDaemonMonitoredSites] 
(
	[ScoringDaemonName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XMLRepository]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[XMLRepository](
	[FileID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[TestName] [varchar](255) NULL,
	[OppId] [varchar](50) NOT NULL,
	[_efk_Testee] [bigint] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[DateRecorded] [datetime2](7) NOT NULL,
	[isDemo] [bit] NOT NULL,
	[Contents] [xml] NOT NULL,
	[SenderBrokerGuid] [uniqueidentifier] NULL,
	[CallbackURL] [varchar](500) NULL,
 CONSTRAINT [PK_Sandlot] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_efk_Testee] ON [dbo].[XMLRepository] 
(
	[_efk_Testee] ASC
)
INCLUDE ( [DateRecorded]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OppID] ON [dbo].[XMLRepository] 
(
	[OppId] ASC
)
INCLUDE ( [DateRecorded],
[isDemo]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestNameLocation] ON [dbo].[XMLRepository] 
(
	[TestName] ASC,
	[Location] ASC
)
INCLUDE ( [_efk_Testee],
[OppId],
[StatusDate],
[DateRecorded],
[isDemo],
[SenderBrokerGuid],
[CallbackURL]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestOpportunityStatus]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestOpportunityStatus](
	[_efk_Testee] [bigint] NOT NULL,
	[_efk_TestID] [varchar](255) NOT NULL,
	[Opportunity] [int] NOT NULL,
	[OppID] [varchar](50) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[PassedQAValidation] [bit] NOT NULL,
	[OpportunityStartDate] [datetime] NULL,
	[OpportunityStatusDate] [datetime] NOT NULL,
	[OpportunityDateCompleted] [datetime] NULL,
	[DateRecorded] [datetime2](7) NOT NULL,
	[Message] [varchar](1024) NULL,
	[TestID] [varchar](255) NOT NULL,
	[_fk_XMLRepository] [bigint] NOT NULL,
	[isDemo] [bit] NOT NULL,
	[TestWindowID] [varchar](50) NOT NULL,
	[WindowOpportunity] [int] NULL,
	[_efk_RecordID] [bigint] NULL,
	[Mode] [varchar](50) NOT NULL,
	[_fk_XMLRepository_Archive] [bigint] NULL,
	[SentToRB] [bit] NOT NULL,
 CONSTRAINT [PK_TestOpportunityStatus] PRIMARY KEY CLUSTERED 
(
	[OppID] ASC,
	[DateRecorded] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_IsDemo] ON [dbo].[TestOpportunityStatus] 
(
	[isDemo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Mode] ON [dbo].[TestOpportunityStatus] 
(
	[Mode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Testee_TestID] ON [dbo].[TestOpportunityStatus] 
(
	[_efk_Testee] ASC,
	[TestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TestOpportunityStatus_Status] ON [dbo].[TestOpportunityStatus] 
(
	[Status] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TOS_efk_Testee] ON [dbo].[TestOpportunityStatus] 
(
	[_efk_Testee] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RTSAttributes]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RTSAttributes](
	[_fk_ProjectID] [int] NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[Context] [varchar](10) NOT NULL,
	[ContextDate] [datetime] NULL,
	[Decrypt] [bit] NOT NULL,
	[XMLName] [varchar](50) NOT NULL,
	[EntityType] [varchar](50) NOT NULL,
	[Relationship] [varchar](25) NOT NULL,
	[FieldName] [varchar](35) NOT NULL,
	[FetchIfNotInXml] [bit] NOT NULL,
 CONSTRAINT [PK_RTSAttributes] PRIMARY KEY CLUSTERED 
(
	[_fk_ProjectID] ASC,
	[GroupName] ASC,
	[Context] ASC,
	[EntityType] ASC,
	[Relationship] ASC,
	[FieldName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QC_ValidationException]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QC_ValidationException](
	[_efk_Testee] [bigint] NOT NULL,
	[_efk_TestID] [varchar](100) NULL,
	[Opportunity] [int] NOT NULL,
	[ValidationType] [varchar](50) NULL,
	[XPath] [varchar](150) NULL,
	[Message] [varchar](1000) NULL,
	[_efk_ruleID] [varchar](50) NULL,
	[OpportunityID] [varchar](50) NULL,
	[DateEntered] [datetime] NOT NULL,
	[_fk_XMLRepository] [bigint] NULL,
	[Severity] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Filename_Severity] ON [dbo].[QC_ValidationException] 
(
	[_fk_XMLRepository] ASC,
	[Severity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QASystemSandlot]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QASystemSandlot](
	[FolderID] [int] IDENTITY(1,1) NOT NULL,
	[Environment] [varchar](50) NOT NULL,
	[ShortName] [varchar](32) NOT NULL,
	[Path] [varchar](255) NOT NULL,
	[_fk_QASystemServices] [int] NOT NULL,
 CONSTRAINT [PK_QASystemSandlot] PRIMARY KEY CLUSTERED 
(
	[FolderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CombinationTestFormMap]    Script Date: 01/15/2015 14:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CombinationTestFormMap](
	[ComponentSegmentName] [varchar](255) NOT NULL,
	[ComponentFormKey] [varchar](100) NOT NULL,
	[CombinationFormKey] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CombinationTestFormMap] PRIMARY KEY CLUSTERED 
(
	[ComponentSegmentName] ASC,
	[ComponentFormKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_CombinationTestOpportunity_OpportunityKey]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[CombinationTestOpportunity] ADD  CONSTRAINT [DF_CombinationTestOpportunity_OpportunityKey]  DEFAULT (newid()) FOR [OpportunityKey]
GO
/****** Object:  Default [DF_CombinationTestOpportunity_CreateDate]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[CombinationTestOpportunity] ADD  CONSTRAINT [DF_CombinationTestOpportunity_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF__RTSAttrib__Fetch__2BFE89A6]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[RTSAttributes] ADD  DEFAULT ((1)) FOR [FetchIfNotInXml]
GO
/****** Object:  Default [DF_SDItemScoringConfigs_Enabled]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[SDItemScoringConfigs] ADD  CONSTRAINT [DF_SDItemScoringConfigs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF_SDItemScoringConfigs_Priority]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[SDItemScoringConfigs] ADD  CONSTRAINT [DF_SDItemScoringConfigs_Priority]  DEFAULT ((1)) FOR [Priority]
GO
/****** Object:  Default [DF_TestOpportunityItemScore_reportingversion]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[TestOpportunityItemScore] ADD  CONSTRAINT [DF_TestOpportunityItemScore_reportingversion]  DEFAULT ((0)) FOR [reportingversion]
GO
/****** Object:  Default [DF_TestOpportunityItemScore_scoreAttempts]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[TestOpportunityItemScore] ADD  CONSTRAINT [DF_TestOpportunityItemScore_scoreAttempts]  DEFAULT ((0)) FOR [scoreAttempts]
GO
/****** Object:  Default [DF__TestOpportunityStatus__Opportunity]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[TestOpportunityStatus] ADD  CONSTRAINT [DF__TestOpportunityStatus__Opportunity]  DEFAULT ((1)) FOR [Opportunity]
GO
/****** Object:  Default [DF__TestOpportunity__PassedQAValidation]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[TestOpportunityStatus] ADD  CONSTRAINT [DF__TestOpportunity__PassedQAValidation]  DEFAULT ((0)) FOR [PassedQAValidation]
GO
/****** Object:  Default [DF__TestOpportunity__DateRecorded]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[TestOpportunityStatus] ADD  CONSTRAINT [DF__TestOpportunity__DateRecorded]  DEFAULT (sysdatetime()) FOR [DateRecorded]
GO
/****** Object:  Default [DF_XMLRepository_DateRecorded]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[XMLRepository] ADD  CONSTRAINT [DF_XMLRepository_DateRecorded]  DEFAULT (sysdatetime()) FOR [DateRecorded]
GO
/****** Object:  ForeignKey [FK_CombinationTestFormMap_CombinationTestMap]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[CombinationTestFormMap]  WITH CHECK ADD  CONSTRAINT [FK_CombinationTestFormMap_CombinationTestMap] FOREIGN KEY([ComponentSegmentName])
REFERENCES [dbo].[CombinationTestMap] ([ComponentSegmentName])
GO
ALTER TABLE [dbo].[CombinationTestFormMap] CHECK CONSTRAINT [FK_CombinationTestFormMap_CombinationTestMap]
GO
/****** Object:  ForeignKey [FK_QASystemSandlot_QASystemServices]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[QASystemSandlot]  WITH CHECK ADD  CONSTRAINT [FK_QASystemSandlot_QASystemServices] FOREIGN KEY([_fk_QASystemServices])
REFERENCES [dbo].[QASystemServices] ([ServiceID])
GO
ALTER TABLE [dbo].[QASystemSandlot] CHECK CONSTRAINT [FK_QASystemSandlot_QASystemServices]
GO
/****** Object:  ForeignKey [FK_QC_ValidationException_XMLRepository]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[QC_ValidationException]  WITH CHECK ADD  CONSTRAINT [FK_QC_ValidationException_XMLRepository] FOREIGN KEY([_fk_XMLRepository])
REFERENCES [dbo].[XMLRepository] ([FileID])
GO
ALTER TABLE [dbo].[QC_ValidationException] CHECK CONSTRAINT [FK_QC_ValidationException_XMLRepository]
GO
/****** Object:  ForeignKey [FK_RTSAttributes_Projects]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[RTSAttributes]  WITH CHECK ADD  CONSTRAINT [FK_RTSAttributes_Projects] FOREIGN KEY([_fk_ProjectID])
REFERENCES [dbo].[Projects] ([_Key])
GO
ALTER TABLE [dbo].[RTSAttributes] CHECK CONSTRAINT [FK_RTSAttributes_Projects]
GO
/****** Object:  ForeignKey [FK_TestOpportunityStatus_XMLRepository]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[TestOpportunityStatus]  WITH CHECK ADD  CONSTRAINT [FK_TestOpportunityStatus_XMLRepository] FOREIGN KEY([_fk_XMLRepository])
REFERENCES [dbo].[XMLRepository] ([FileID])
GO
ALTER TABLE [dbo].[TestOpportunityStatus] CHECK CONSTRAINT [FK_TestOpportunityStatus_XMLRepository]
GO
/****** Object:  ForeignKey [FK_TestOpportunityStatus_XMLRepository_Archive]    Script Date: 01/15/2015 14:49:34 ******/
ALTER TABLE [dbo].[TestOpportunityStatus]  WITH CHECK ADD  CONSTRAINT [FK_TestOpportunityStatus_XMLRepository_Archive] FOREIGN KEY([_fk_XMLRepository_Archive])
REFERENCES [dbo].[XMLRepository] ([FileID])
GO
ALTER TABLE [dbo].[TestOpportunityStatus] CHECK CONSTRAINT [FK_TestOpportunityStatus_XMLRepository_Archive]
GO


----------------------------------------
-----Views----------
------------------------------------
/****** Object:  View [dbo].[v_MostRecentXml]    Script Date: 08/15/2013 15:30:56 ******/
CREATE view [dbo].[v_MostRecentXml]
as
	select x.* 
	from XmlRepository x
		inner join
			(select OppId, max(DateRecorded) as DateRecorded
				from XmlRepository
				group by OppId) as LATEST
			on LATEST.OppId = x.OppId
				and LATEST.DateRecorded = x.DateRecorded


GO
/****** Object:  View [dbo].[v_MostRecentTestOpportunityStatus]    Script Date: 01/15/2015 14:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_MostRecentTestOpportunityStatus]
as
SELECT [_efk_Testee]
      ,[_efk_TestID]
      ,[Opportunity]
      ,tos.[OppID]
      ,[Status]
      ,[PassedQAValidation]
      ,[OpportunityStartDate]
      ,[OpportunityStatusDate]
      ,[OpportunityDateCompleted]
      ,tos.[DateRecorded]
      ,[Message]
      ,[TestID]
      ,_fk_XMLRepository
      ,isDemo
      ,TestWindowID
	  ,WindowOpportunity
	  ,_efk_RecordID
	  ,Mode
	  ,_fk_XMLRepository_Archive
	  ,SentToRB
  FROM [TestOpportunityStatus] tos
	inner join
		(select OppId, Max(DateRecorded) as DateRecorded
			from TestOpportunityStatus
			group by OppId) as MOST_RECENT
		on MOST_RECENT.OppId = tos.OppId
			and MOST_RECENT.DateRecorded = tos.DateRecorded
GO
/****** Object:  View [dbo].[v_RescoreAppeals]    Script Date: 05/07/2014 08:32:43 ******/
-- returns the record that was appealed along with the DateRecorded of the appeal
CREATE view [dbo].[v_RescoreAppeals]
as
SELECT PA.AppealDateRecorded
	,tos.[_efk_Testee]
      ,tos.[_efk_TestID]
      ,tos.[Opportunity]
      ,tos.[OppID]
      ,tos.[Status]
      ,tos.[PassedQAValidation]
      ,tos.[OpportunityStartDate]
      ,tos.[OpportunityStatusDate]
      ,tos.[OpportunityDateCompleted]
      ,tos.[DateRecorded]
      ,tos.[Message]
      ,tos.[TestID]
      ,tos.[_fk_XMLRepository]
      ,tos.[isDemo]
      ,tos.[TestWindowID]
      ,tos.[WindowOpportunity]
      ,tos.[_efk_RecordID]
      ,tos.[Mode]
      ,tos.[_fk_XMLRepository_Archive]
      ,tos.[SentToRB]
from TestOpportunityStatus tos
inner join
	(select PreAppeal.OppID, LatestAppeal.DateRecorded as AppealDateRecorded, max(PreAppeal.DateRecorded) as DateRecorded
		from TestOpportunityStatus PreAppeal
		inner join
			(select OppId, max(DateRecorded) as DateRecorded
				from TestOpportunityStatus
				where Status = 'appeal'
				group by OppID) as LatestAppeal
		on PreAppeal.OppId = LatestAppeal.OppId
			and PreAppeal.DateRecorded < LatestAppeal.DateRecorded
		group by  PreAppeal.OppID, LatestAppeal.DateRecorded) as PA
	on PA.OppId = tos.OppId
		and PA.DateRecorded = tos.DateRecorded

GO

------------------------------------------------
-----------Stored Procedures--------------------
-----------------------------------------------

/****** Object:  StoredProcedure [dbo].[TIS_UpdateItemToScore]    Script Date: 01/15/2015 14:46:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TIS_UpdateItemToScore]
	  @OppID bigint,
	  @status varchar(50),
      @_efk_Item bigint,
      @_efk_ItemBank bigint,
      @reportingversion int,
      @OppKey uniqueidentifier,
      @_efk_ClientName varchar(100),
      @testID varchar(255),
      @ItemType varchar(50),
      @position int,
      @response nvarchar(max),
      @scoreInvalidations bit = 1,
      @batchScoring bit = 0,
	  @updateSameReportingVersion bit = 0,
	  @handscored bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @rowsAffected int
	declare @scoreStatus varchar(50)
	
	set @scoreStatus = case @handscored when 1 then 'WaitingForHandScore' else 'WaitingForMachineScore' end
	
	declare @now datetime2
	set @now = SYSDATETIME()

    -- update existing score
    if @status <> 'reset' and (@status <> 'invalidated' or @scoreInvalidations = 1)
    begin
		-- if the response exists then it has changed
		--	start over with the new response
		update TestOpportunityItemScore 
		set response = @response
			,scorestatus = @scoreStatus
			,scoringDate = case @batchScoring when 1 then @now else null end -- if we're sending the entire file to a scoring server, no need for the daemon to pick them up
			,scoredDate = null
			,scoreAttempts = case @batchScoring when 1 then -1 else 0 end
			,scoreInfo = null
			,scoreRationale = null
			,score = null
			,reportingversion = @reportingversion
		where _efk_ClientName = @_efk_ClientName
			and OppID = @OppID
			and _efk_Item = @_efk_Item
			and _efk_ItemBank = @_efk_ItemBank
			and (@updateSameReportingVersion = 1 or reportingversion <> @reportingversion)
	end
	else
	begin
		-- if the opp is being reset, mark any responses that are waiting for scores as NotScored
		update TestOpportunityItemScore 
		set response = @response
			,scorestatus = 'NotScored'			
			,scoreRationale = 'opp status: ' + @status 
			,reportingversion = @reportingversion
			,score = -1
			,scoredDate = null -- won't be scored, so nulling out
		where _efk_ClientName = @_efk_ClientName
			and OppID = @OppID
			and _efk_Item = @_efk_Item
			and _efk_ItemBank = @_efk_ItemBank
			and scorestatus in ('WaitingForMachineScore', 'WaitingForHandScore')
	end
	
	select @rowsAffected = @@ROWCOUNT
    
    -- insert new score
    if @status <> 'reset' and (@status <> 'invalidated' or @scoreInvalidations = 1)
    begin
		INSERT INTO [TestOpportunityItemScore]
			   ([OppID]
			   ,[_efk_Item]
			   ,[_efk_ItemBank]
			   ,[reportingversion]
			   ,[OppKey]
			   ,[_efk_ClientName]
			   ,[testID]
			   ,[ItemType]
			   ,[position]
			   ,[response]
			   ,[scorestatus]
			   ,[scoringDate]
			   ,[scoreAttempts])
		 select
			   @OppID,
				  @_efk_Item,
				  @_efk_ItemBank,
				  @reportingversion,
				  @OppKey,
				  @_efk_ClientName,
				  @testID,
				  @ItemType,
				  @position,
				  @response,
				  @scoreStatus,
				  case @batchScoring when 1 then @now else null end,
				  case @batchScoring when 1 then -1 else 0 end
			where not exists
				(select 1 from TestOpportunityItemScore
					where _efk_ClientName = @_efk_ClientName
						and OppID = @OppID
						and _efk_Item = @_efk_Item
						and _efk_ItemBank = @_efk_ItemBank)
	end
	else
	begin
		INSERT INTO [TestOpportunityItemScore]
			   ([OppID]
			   ,[_efk_Item]
			   ,[_efk_ItemBank]
			   ,[reportingversion]
			   ,[OppKey]
			   ,[_efk_ClientName]
			   ,[testID]
			   ,[ItemType]
			   ,[position]
			   ,[response]
			   ,[scorestatus]
			   ,[scoringDate]
			   ,[scoredDate]
			   ,[scoreAttempts]
			   ,[scoreRationale]
			   ,[score])
		 select
			   @OppID,
				  @_efk_Item,
				  @_efk_ItemBank,
				  @reportingversion,
				  @OppKey,
				  @_efk_ClientName,
				  @testID,
				  @ItemType,
				  @position,
				  @response,
				  'NotScored',
				  @now, -- no scoring, so leaving null
				  @now,	-- no scoring, so leaving null
				  0, -- no scoring attempts
				  'opp status: ' + @status,
				  -1
			where not exists
				(select 1 from TestOpportunityItemScore
					where _efk_ClientName = @_efk_ClientName
						and OppID = @OppID
						and _efk_Item = @_efk_Item
						and _efk_ItemBank = @_efk_ItemBank)
	end

	select @rowsAffected = @rowsAffected + @@ROWCOUNT
	
	select @rowsAffected
END
GO
/****** Object:  StoredProcedure [dbo].[TIS_GetItemScores]    Script Date: 01/15/2015 14:46:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TIS_GetItemScores]
	@oppID bigint,
	@clientName varchar(100),
	@includeResponse bit
AS
BEGIN
	select OppID, ScoreInfo, ScoreStatus, Score, _efk_Item, _efk_ItemBank, scoreRationale,
	case @includeResponse when 1 then response else null end as Response
	
	from 
		TestOpportunityItemScore 
	where 
		OppID = @oppID
		and _efk_ClientName = @clientName
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAndArchiveXML]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--INSERT a new XML file(the one with scores added to) and Archive the old XML file(Actual source file)
-- =============================================
CREATE PROCEDURE [dbo].[InsertAndArchiveXML]
	@fileID AS BIGINT,	
	@OldFileLocation AS VARCHAR(50),
	@NewFileLocation AS VARCHAR(50),	
	@Contents AS XML	
	
AS
BEGIN

	set xact_abort on

	begin tran _tran

	UPDATE XMLRepository SET Location = @OldFileLocation WHERE FileID = @fileID	
	
	SET NOCOUNT ON
	INSERT INTO XMLRepository (Location,TestName,OppId,_efk_Testee,StatusDate,isDemo,Contents,SenderBrokerGuid,CallbackURL)		
	(SELECT @NewFileLocation,TestName,OppId,_efk_Testee,StatusDate,isDemo,@Contents,SenderBrokerGuid,CallbackURL FROM XMLRepository WHERE FileID = @fileID)			
	
	SELECT @@identity

	commit tran _tran

END
GO
/****** Object:  StoredProcedure [dbo].[GetXMLRepository]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetXMLRepository] 
	@InstanceName AS VARCHAR(50)
AS
BEGIN
	
	SET NOCOUNT ON;
       
    SELECT FileID,OppID,_efk_Testee,SenderBrokerGuid,CallbackURL
    FROM dbo.XMLRepository X
	with(readpast)
    INNER JOIN dbo.TestNameLookUp T
	with (nolock)
	ON X.TestName = T.TestName
    WHERE T.InstanceName = @InstanceName AND X.Location = 'source'
    ORDER BY StatusDate, DateRecorded

END
GO
/****** Object:  StoredProcedure [dbo].[GetXmlContentByFileID]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetXmlContentByFileID] 
	@FileID bigint
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Contents FROM dbo.XMLRepository
	WHERE FileID = @FileID
END
GO
/****** Object:  StoredProcedure [dbo].[ProcessXmlFile]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcessXmlFile] 
	@FileID bigint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @FileContent TABLE ( contents XML )
	
	UPDATE dbo.XMLRepository
	SET Location = 'processing'
	OUTPUT INSERTED.Contents INTO @FileContent
	WHERE FileID = @FileID
	AND Location = 'source' -- in case there are multiple processes trying to pick up the same file; should not be though
	
	SELECT contents FROM @FileContent
END
GO
/****** Object:  StoredProcedure [dbo].[InsertXmlRepository]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertXmlRepository] 
	@Location varchar(50)
	,@TestName VARCHAR(255)
   ,@OppId varchar(50)
   ,@TesteeKey bigint = NULL   
   ,@StatusDate datetime
   ,@IsDemo bit
   ,@Contents XML
   ,@CallbackURL varchar(500)=null
AS
BEGIN

	INSERT INTO XMLRepository
           ([Location]
           ,[TestName]
           ,[OppId]
           ,[_efk_Testee]           
           ,[StatusDate]
		   ,[isDemo]
           ,[Contents]
		   ,[CallbackURL])
     VALUES
           (@Location
			,@TestName
		   ,@OppId
		   ,@TesteeKey		   
		   ,@StatusDate
		   ,@IsDemo
		   ,@Contents
		   ,@CallbackURL)

     SELECT @@identity
END
GO
/****** Object:  StoredProcedure [dbo].[SD_GetScoreItems]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SD_GetScoreItems] 
	@clientname varchar(100),
	@pendingMinutes int,
	@minAttempts int = 0,
	@maxAttempts int = 10,
	@maxItemsReturned int = 500
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @before datetime;
    declare @now datetime;
    set @now = getdate();
    set @before = dateadd(minute, -@pendingMinutes, @now);
    
    declare @RetrievedResponses table (OppID bigint, _efk_ItemBank bigint, _efk_Item bigint)
    
    ;with Responses_CTE as
    (
		select top(@maxItemsReturned) OppID, _efk_ItemBank, _efk_Item, scoringDate, scoreAttempts
		from TestOpportunityItemScore
		with (rowlock, updlock, readpast)
		where _efk_ClientName = @clientname 
			and scoreAttempts >= 0 -- scoreAttempts = -1 indicates that the SD should not attempt to score; TIS was responsible for sending the request
			and 
				(
					(ScoreStatus = 'WaitingForMachineScore'
						and (scoringDate is null or scoringDate < @before)
							and scoreAttempts between @minAttempts and @maxAttempts)
					or -- no retries on hand-scored responses
					(ScoreStatus = 'WaitingForHandScore' and scoringDate is null)
				)
		order by scoringDate
	)	
    update Responses_CTE
    set scoringDate = @now, scoreAttempts = scoreAttempts + 1
    output INSERTED.[OppID], INSERTED.[_efk_ItemBank], INSERTED.[_efk_Item] INTO @RetrievedResponses
    
    select s.OppKey, s.testID, s.position, reportingversion, cast(R._efk_ItemBank as varchar(10)) + '-' + cast(R._efk_Item as varchar(10)) as itemKey, 
		s.ItemType, s.scoreAttempts as attempts, s.response, 'NA' as itemFile
    from @RetrievedResponses R
    inner join TestOpportunityItemScore s
		with (nolock) -- should be safe from page splits with ident key on table
		on s.OppID = R.OppID and s._efk_ItemBank = R._efk_ItemBank and s._efk_Item = R._efk_Item
END
GO
/****** Object:  StoredProcedure [dbo].[SD_GetMonitoredSites]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SD_GetMonitoredSites]
	@scoringDaemonName varchar(100)
AS
BEGIN
	select serviceType, serviceRole, _efk_ClientName as clientname, environment, IP, privateIP, null as serverName, dbname
	from ScoringDaemonMonitoredSites
	with (nolock)
	where ScoringDaemonName = @scoringDaemonName
END
GO
/****** Object:  StoredProcedure [dbo].[SD_GetItemScoringConfigs]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SD_GetItemScoringConfigs]
	@clientname varchar(100)
AS
BEGIN
	select ISNULL(Context, '*') as Context, ItemType, Enabled as Item_in, Priority, ServerUrl
	from SDItemScoringConfigs
	where _efk_ClientName = @clientname
	
	select scoreHost, rubricCallbackUrl as studentApp
	from SDItemScorer
	where _efk_ClientName = @clientname
END
GO
/****** Object:  StoredProcedure [dbo].[GetCombinedTestOppId]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCombinedTestOppId]
	@CombinationTestName varchar(255),
	@TesteeKey bigint,
	@OpportunityNumber int,
	@OppId bigint output,
	@OppKey uniqueidentifier output
AS
BEGIN
	--- Check, if the combined test opportunity already exists for this test
	select @OppId = OppID, @OppKey = OpportunityKey 
	from 
		CombinationTestOpportunity
	where 
		CombinationTestName = @CombinationTestName
		and _efk_Testee = @TesteeKey
		and Opportunity = @OpportunityNumber

	--- Insert a new record, if the combined test does not exist 
	if @OppId is null
	begin
		--- Temp table to gather output info.
		declare @keys table(
			OppId bigint, 
			OpportunityKey uniqueidentifier)

		--- Insert and gather info. of the inserted record
		insert into CombinationTestOpportunity(
			_efk_Testee,
			CombinationTestName,
			Opportunity)
		output INSERTED.OppId, INSERTED.OpportunityKey into @keys
		values(
			@TesteeKey,
			@CombinationTestName,
			@OpportunityNumber)		

		--- Set the output params using newly created OppID, Oppkey
		select @OppId = OppId, @OppKey = OpportunityKey from @keys
	end
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteXmlRepository]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteXmlRepository] 
	@FileID BIGINT
AS
BEGIN
	DELETE FROM dbo.XMLRepository
	WHERE FileID = @FileID

	SELECT @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateXmlRepositoryLocation]    Script Date: 01/15/2015 14:46:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateXmlRepositoryLocation]
	@FileID bigint,
	@Location VARCHAR(50)
AS
BEGIN
	UPDATE dbo.XMLRepository
	SET Location = @Location
	WHERE FileID = @FileID
	
	SELECT @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateXmlRepositoryContent]    Script Date: 01/15/2015 14:46:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateXmlRepositoryContent]
	@FileID bigint,
	@Contents XML
AS
BEGIN
	UPDATE dbo.XMLRepository
	SET Contents = @Contents
	WHERE FileID = @FileID
	
	SELECT @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTestOpportunityStatus]    Script Date: 01/15/2015 14:46:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTestOpportunityStatus]
	@TesteeEntityKey bigint,
	@TestName varchar(100),
	@Opportunity int,
	@OldStatus varchar(50),
	@NewStatus varchar(50)
AS
BEGIN
	UPDATE TestOpportunityStatus
		SET Status = @NewStatus 
	FROM TestOpportunityStatus
	WHERE DateRecorded IN
		(SELECT MAX(DateRecorded) AS MostRecentDateRecorded
			FROM TestOpportunityStatus
			WHERE _efk_Testee = @TesteeEntityKey AND _efk_TestID = @TestName AND Opportunity = @Opportunity AND Status = @OldStatus
			GROUP BY _efk_Testee, _efk_TestID, Opportunity)
		AND _efk_Testee = @TesteeEntityKey AND _efk_TestID = @TestName AND Opportunity = @Opportunity AND Status = @OldStatus
end
GO
/****** Object:  StoredProcedure [dbo].[QC_RecordException]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QC_RecordException]
	@TesteeEntityKey bigint = -1,
	@TestName varchar(100) = NULL,
	@Opportunity int = -1,
	@ValidationType varchar(50) = NULL,
	@XPath varchar(150),
	@Message varchar(1000),
	@RuleID varchar(50),
	@OpportunityID varchar(50),
	@DateEntered datetime,
	@FileID varchar(250) = null,
	@Severity int = null
AS
BEGIN
	INSERT INTO dbo.QC_ValidationException 
	VALUES (@TesteeEntityKey, @TestName, @Opportunity, @ValidationType, @XPath, @Message, @RuleID, @OpportunityID, @DateEntered, @FileID, @Severity)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTestOpportunityStatus]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTestOpportunityStatus]
	@TesteeEntityKey bigint,
	@TestName varchar(255),
	@Opportunity int,
	@OppID varchar(50),
	@Status varchar(50),
	@PassedQAValidation bit,
	@OpportunityStartDate datetime = NULL,
	@OpportunityStatusDate datetime,
	@OpportunityDateCompleted datetime = NULL,
	@DatePassedValidation datetime2(7) = NULL, -- AM: will not use this anymore; will use default instead; leaving in the sig so as not to upset the code.
	@Message varchar(1024),
	@TestID varchar(255),
	@FileID BIGINT,
	@isDemo bit,
	@TestWindowID VARCHAR(50),
	@WindowOpportunity int = null,
	@DoRRecordID bigint = null,
	@Mode varchar(50),
	@ArchiveFileID BIGINT = null,
	@SentToRB bit
AS
BEGIN
INSERT INTO TestOpportunityStatus
([_efk_Testee]
           ,[_efk_TestID]
           ,[Opportunity]
           ,[OppID]
           ,[Status]
           ,[PassedQAValidation]
           ,[OpportunityStartDate]
           ,[OpportunityStatusDate]
           ,[OpportunityDateCompleted]
           --,[DateRecorded]
           ,[Message]
           ,[TestID]
           ,[_fk_XMLRepository]
           ,[isDemo]
           ,[TestWindowID]
           ,[WindowOpportunity]
           ,[_efk_RecordID]
           ,[Mode]
           ,[_fk_XMLRepository_Archive]
           ,[SentToRB])
	VALUES (@TesteeEntityKey, @TestName, @Opportunity, @OppID, @Status, @PassedQAValidation, 
	@OpportunityStartDate, @OpportunityStatusDate, @OpportunityDateCompleted, /*@DatePassedValidation,*/ @Message, @TestID, @FileID, 
	@isDemo, @TestWindowID, @WindowOpportunity, @DoRRecordID, @Mode, @ArchiveFileID, @SentToRB)
END
GO
/****** Object:  StoredProcedure [dbo].[GetQC_ValidationExceptions]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetQC_ValidationExceptions]
	@fileID BIGINT,
	@startDateTime datetime = null,
	@minimumSeverity int = 200
AS
BEGIN
	SELECT [_efk_Testee]
      ,[_efk_TestID]
      ,[Opportunity]
      ,[ValidationType]
      ,[XPath]
      ,[Message]
      ,[_efk_ruleID]
      ,[OpportunityID]
      ,[DateEntered]
      ,[_fk_XMLRepository] AS fileID
		,[Severity]
  FROM [dbo].[QC_ValidationException]
where [_fk_XMLRepository] = @fileID
and (@startDateTime is null or DateEntered >= @startDateTime)
-- always include severity of NULL or 0 (Unknown)
and (Severity is null or Severity = 0 or Severity >= @minimumSeverity)
order by 
	case when Severity is null then 999
		when Severity = 0 then 998
		else Severity
	end desc, ValidationType, [_efk_ruleID], [DateEntered] desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetQASystemSandlotSettings]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetQASystemSandlotSettings]
	@Environment varchar(50)
AS
SELECT s.FolderID, s.Environment, s.ShortName, s.Path, q.ServiceName, q.Path AS ServicePath, q.Description
	FROM dbo.QASystemSandlot s
	JOIN dbo.QASystemServices q ON s._fk_QASystemServices = q.ServiceID
WHERE Environment = @Environment
GO
/****** Object:  StoredProcedure [dbo].[GetTestOpportunityStatus]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTestOpportunityStatus]
	@DateRecorded smalldatetime = NULL,
	@TesteeEntityKey bigint = NULL,
	@TestName varchar(255) = NULL,
	@Opportunity int = NULL,
	@OppID varchar(50) = NULL,
	@Status varchar(50) = NULL,
	@PassedQAValidation bit = NULL,
	@SentToRB BIT = null
AS
SELECT tos._efk_Testee AS TesteeEntityKey, tos._efk_TestID AS TestName, tos.Opportunity, tos.OppID, 
	tos.Status, tos.PassedQAValidation, tos.OpportunityStartDate, tos.OpportunityStatusDate, tos.OpportunityDateCompleted, 
	tos.DateRecorded, tos.Message, tos.TestID, tos._fk_XMLRepository, 
	tos.isDemo, tos.TestWindowID, tos.WindowOpportunity, tos._efk_RecordID, tos.Mode, tos.SentToRB
FROM TestOpportunityStatus tos
WHERE (CONVERT(smalldatetime, CONVERT(varchar(11), tos.DateRecorded, 101)) = @DateRecorded OR @DateRecorded IS NULL)
	AND (tos._efk_Testee = @TesteeEntityKey OR @TesteeEntityKey IS NULL)
	AND (tos._efk_TestID = @TestName OR @TestName IS NULL)
	AND (tos.Opportunity = @Opportunity OR @Opportunity IS NULL)
	AND (tos.OppID = @OppID OR @OppID IS NULL)
	AND (tos.Status = @Status OR @Status IS NULL)
	AND (tos.PassedQAValidation = @PassedQAValidation or @PassedQAValidation is null)
	AND (tos.SentToRB = @SentToRB OR @SentToRB IS NULL)
ORDER BY tos.DateRecorded DESC
GO
/****** Object:  StoredProcedure [dbo].[GetRelatedFilesForMerge]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRelatedFilesForMerge]
	@nTestee BIGINT
AS
BEGIN
	--declare @ntestee bigint ;
	--set @ntestee = 233705

	SET NOCOUNT ON;

	-- get all the relevant records for testee into a temp table
	if object_id('tempdb..#testeerecords') is not null
		drop table #testeerecords ;  
	select * into #testeerecords
	from dbo.TestOpportunityStatus
	where _efk_testee = @ntestee 

	--- temp table to gather output info.
	declare @results table(
		OppId varchar(50), -- Opportunity ID for this testee
		Opportunity int, -- Opportunity number
		TestId varchar(255), -- Test ID for this oppid 
		LatestFileId bigint, -- Latest file id for this oppis
		Status varchar(50), -- Status of this opp
		DateRecorded datetime, -- Recorded datetime
		HandScoredFileId bigint default null, -- FileId of this opp with handscore status
		PreAppealFileId bigint default null-- FileId of this opp prior to appeal status
	)

	--- Gather all the latest tests for this testee
	insert into @results(OppId, Opportunity, TestId, LatestFileId, Status, DateRecorded)
	select OppId, Opportunity, [_efk_testid] as TestId, [_fk_xmlrepository] as LatestFileId, Status, DateRecorded 
	from dbo.v_MostRecentTestOpportunityStatus
	WHERE _efk_testee = @ntestee 

	--- Update all the tests with latest file which has 'handscoring' status
	update @results
	set HandScoredFileId = X._fk_XMLRepository
	from @results R
		join (select G.OppId, G.[_fk_XMLRepository]
			  from
	 	         (select *, row_number() over (partition by OppID order by DateRecorded desc) as rn
				  from #testeerecords) G
	          where 
		          G.rn=1 and G.status='handscoring') X on X.OppID = R.OppId
	where R.status = 'scored'

	--- Update all the tests with latest file which is prior to the status of 'appeal'
	update @results
	set PreAppealFileId = A._fk_XMLRepository
	from @results R
		join dbo.v_RescoreAppeals A on A.OppId = R.OppId 
	where R.status = 'scored'

	-- Select all the gathered records as output
	select * from @results
end
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentTestOpportunityStatusByTesteeTest]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrentTestOpportunityStatusByTesteeTest]
	@TesteeEntityKey bigint,
	@TestID varchar(255),
	@Mode varchar(50) = null,
	@ExcludePaperTestDiscreps bit = 1
AS
BEGIN
	SELECT tos._efk_Testee AS TesteeEntityKey, tos._efk_TestID AS TestName, tos.Opportunity, tos.OppID, 
	tos.Status, tos.PassedQAValidation, tos.OpportunityStartDate, tos.OpportunityStatusDate, tos.OpportunityDateCompleted, tos.DateRecorded, 
	tos.Message, tos.TestID, tos._fk_XMLRepository, 
	tos.isDemo, tos.TestWindowID, tos.WindowOpportunity, tos.Mode
	FROM dbo.v_MostRecentTestOpportunityStatus tos
	where tos._efk_Testee = @TesteeEntityKey
		and tos.TestID = @TestID
		and (@Mode is null or @Mode = tos.Mode)
		and (@ExcludePaperTestDiscreps = 0 or tos.Opportunity > 0)
END
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentTestOpportunityStatusByOppId]    Script Date: 01/15/2015 14:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrentTestOpportunityStatusByOppId]
	@oppId int
AS
BEGIN
SELECT tos._efk_Testee AS TesteeEntityKey, tos._efk_TestID AS TestName, tos.Opportunity, tos.OppID,
	tos.Status, tos.PassedQAValidation, tos.OpportunityStartDate, tos.OpportunityStatusDate, tos.OpportunityDateCompleted, 
	tos.DateRecorded, tos.Message, tos.TestID, tos._fk_XMLRepository, 
	tos.isDemo, tos.TestWindowID, tos.WindowOpportunity, tos.Mode
FROM v_MostRecentTestOpportunityStatus tos
	where tos.OppID = @oppId
END
GO
/****** Object:  StoredProcedure [dbo].[SD_UpdateOppStatusForItemsScored]    Script Date: 01/15/2015 14:46:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SD_UpdateOppStatusForItemsScored]
	@oppKey uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @rowsAffected int
	declare @fileId table(fileId bigint)

	-- insert a record into TOS with status = handscored
	--	this will give us a record of the state change + it serves
	--	as a semaphore so that only 1 item-level thread can gain access to the opp
    insert into TestOpportunityStatus
		([_efk_Testee]
           ,[_efk_TestID]
           ,[Opportunity]
           ,[OppID]
           ,[Status]
           ,[PassedQAValidation]
           ,[OpportunityStartDate]
           ,[OpportunityStatusDate]
           ,[OpportunityDateCompleted]
           ,[DateRecorded]
           ,[Message]
           ,[TestID]
           ,[_fk_XMLRepository]
           ,[isDemo]
           ,[TestWindowID]
           ,[WindowOpportunity]
           ,[_efk_RecordID]
           ,[Mode]
           ,[_fk_XMLRepository_Archive]
           ,[SentToRB])
    output inserted._fk_XMLRepository into @fileID
    select tos.[_efk_Testee]
      ,tos.[_efk_TestID]
      ,tos.[Opportunity]
      ,tos.[OppID]
      ,'handscored'
      ,tos.[PassedQAValidation]
      ,tos.[OpportunityStartDate]
      ,tos.[OpportunityStatusDate]
      ,tos.[OpportunityDateCompleted]
      ,SYSDATETIME()
      ,tos.[Message]
      ,tos.[TestID]
      ,tos.[_fk_XMLRepository]
      ,tos.[isDemo]
      ,tos.[TestWindowID]
      ,tos.[WindowOpportunity]
      ,tos.[_efk_RecordID]
      ,tos.[Mode]
      ,tos.[_fk_XMLRepository_Archive]
      ,tos.[SentToRB]
    from v_MostRecentTestOpportunityStatus tos
    inner join
		(select OppId, SUM(case scorestatus when 'WaitingForMachineScore' then 0 when 'WaitingForHandScore' then 0 else 1 end) as scoredCount, COUNT(*) as [count]
			from TestOpportunityItemScore
			where OppKey = @oppKey
			group by OppID
			having SUM(case scorestatus when 'WaitingForMachineScore' then 0 when 'WaitingForHandScore' then 0 else 1 end) = COUNT(*)) as i
		on i.OppID = tos.OppID
    where tos.status in ('handscoring', 'appeal', 'invalidated') -- may be scoring invalidations
		
	select @rowsAffected = @@ROWCOUNT
	
	if(@rowsAffected = 1)
	begin
		update XmlRepository set Location = 'source'
		where fileID in (select fileID from @fileId)
	end
	
	-- When called form SD_UpdateItemScore, this introduces a new table to the result set; can't have that
	--select @rowsAffected
END
GO
/****** Object:  StoredProcedure [dbo].[SD_UpdateItemScore]    Script Date: 01/15/2015 14:46:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SD_UpdateItemScore]
	@oppkey uniqueidentifier,
	@itemBank int,
	@itemKey int,
	--@position int,
	@sequence int,
	@score int,
	@scorestatus varchar(150),
	@scoreRationale varchar(max) = null,
	--@scoremark uniqueidentifier,
	@scoreDimensions xml = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @recordsAffected int 
	
	declare @now datetime2;
	set @now = sysdatetime();
	
	update t
	set scorestatus = @scorestatus, scoredDate = @now,
		score = @score, scoreInfo = @scoreDimensions, scoreRationale = @scoreRationale
	from TestOpportunityItemScore t
		inner join v_MostRecentTestOpportunityStatus tos
			on tos.OppID = t.OppID
	where t.OppKey = @oppkey and t._efk_Item = @itemKey and t._efk_ItemBank = @itemBank 
		and t.reportingversion = case @sequence when -1 then t.reportingversion else @sequence end
		and tos.Status in ('handscoring', 'appeal', 'invalidated') -- only if the opp is waiting for scores; may be scoring invalidations
	
	select @recordsAffected = @@ROWCOUNT
	
	if @recordsAffected = 0
	begin
		select 'failure' as status, null as reason
	end
	else
	begin
		exec SD_UpdateOppStatusForItemsScored @oppkey
		select 'success' as status, null as reason
	end

END
GO
/****** Object:  StoredProcedure [dbo].[GetWarningsSummary]    Script Date: 01/26/2015 13:00:56 ******/
CREATE PROCEDURE [dbo].[GetWarningsSummary]
	@StartDate DATETIME,
	@Severity INT=100,
	@GetDetails BIT,
	@InstanceName VARCHAR(50) = null
AS
BEGIN
	SELECT _efk_TestID AS [TestID],_efk_RuleID AS [Rule],COUNT(1) AS WarningsCount
	FROM dbo.QC_ValidationException V
	JOIN dbo.TestNameLookUp T
		ON T.TestName = V.[_efk_TestID]
	WHERE DateEntered >= @StartDate
		  AND Severity = @Severity
		  AND InstanceName = isnull(@InstanceName, InstanceName)
	GROUP BY _efk_TestID,_efk_RuleID
	ORDER BY _efk_TestID,_efk_RuleID
	
	IF @GetDetails =1 
	BEGIN
		SELECT _efk_TestID,Opportunity,[Message],OpportunityID AS OppID,DateEntered AS [Date],[_efk_Testee],_efk_RuleID AS [Rule],[_fk_XMLRepository] AS [FileID]
		FROM dbo.QC_ValidationException V
		JOIN dbo.TestNameLookUp T
			ON T.TestName = V.[_efk_TestID]
		WHERE DateEntered >= @StartDate
			  AND Severity = @Severity
			  AND InstanceName = isnull(@InstanceName, InstanceName)
		ORDER BY _efk_TestID,_efk_RuleID,[Message],Severity,DateEntered,OpportunityID,Opportunity
	END
END

GO