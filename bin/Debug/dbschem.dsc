
CREATE TABLE [dbo].[Account](
	[AccountID] [nvarchar](64) NOT NULL,
	[AccountName] [nvarchar](64) NOT NULL,
	[Alias] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[IsInactive] [bit] NULL,
	[GroupID] [nvarchar](64) NOT NULL,
	[InitialBalance] [money] NULL,
	[SubType] [int] NULL,
	[BankAccountType] [nvarchar](1) NULL,
	[BankAccountNumber] [nvarchar](20) NULL,
	[BankID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[Balance] [money] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UserDefined1] [nvarchar](50) NULL,
	[UserDefined2] [nvarchar](50) NULL,
	[UserDefined3] [nvarchar](50) NULL,
	[UserDefined4] [nvarchar](50) NULL,
	[IsFavorite] [bit] NULL,
 CONSTRAINT [PK_Company Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Company Accounts_1] UNIQUE NONCLUSTERED 
(
	[AccountName] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Account_Analysis_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Analysis_Detail](
	[AccountID] [nvarchar](64) NOT NULL,
	[AnalysisGroupID] [nvarchar](15) NOT NULL,
	[Type] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Account_Analysis_Detail] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[AnalysisGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Account_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Group](
	[GroupID] [nvarchar](64) NOT NULL,
	[GroupName] [nvarchar](64) NOT NULL,
	[TypeID] [int] NOT NULL,
	[ParentID] [nvarchar](15) NULL,
	[LevelID] [int] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Account_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Account_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Type](
	[TypeID] [smallint] NOT NULL,
	[AccountTypeName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Account Segments] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Activity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ActivityName] [nvarchar](64) NOT NULL,
	[ActivityType] [tinyint] NULL,
	[RelatedType] [tinyint] NULL,
	[ReasonID] [nvarchar](15) NULL,
	[RelatedID] [nvarchar](64) NULL,
	[ContactID] [nvarchar](64) NULL,
	[ActivityDateTime] [datetime] NULL,
	[OwnerID] [nvarchar](15) NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Activity Logs]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity Logs](
	[ActivityLogID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityType] [tinyint] NULL,
	[EntityID] [nvarchar](64) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[LogDate] [datetime] NULL,
	[UserID] [nvarchar](64) NULL,
	[MachineID] [nvarchar](64) NULL,
	[Payee] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[TransactionType] [tinyint] NULL,
	[DataComboType] [tinyint] NULL,
	[ReferenceID] [int] NULL,
 CONSTRAINT [PK_Activity Logs] PRIMARY KEY CLUSTERED 
(
	[ActivityLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Adjustment_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adjustment_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NOT NULL,
	[AccountID] [nvarchar](64) NULL,
	[Inactive] [bit] NULL,
	[IsNonSale] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Inventory_Adjustment_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Agent]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentID] [nvarchar](30) NULL,
	[AgentName] [nvarchar](150) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Analysis]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analysis](
	[AnalysisID] [nvarchar](15) NOT NULL,
	[AnalysisName] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[GroupID] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Analysis] PRIMARY KEY CLUSTERED 
(
	[AnalysisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Analysis_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analysis_Group](
	[GroupID] [nvarchar](15) NOT NULL,
	[GroupName] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Analysis_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AP_Payment_Advice]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AP_Payment_Advice](
	[APJournalID] [int] NULL,
	[VendorID] [nvarchar](64) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[APDate] [datetime] NULL,
	[APDueDate] [datetime] NULL,
	[IsDraft] [bit] NULL,
	[PaymentSysDocID] [nvarchar](7) NULL,
	[PaymentVoucherID] [nvarchar](15) NULL,
	[PaymentAmount] [money] NULL,
	[PaymentAmountFC] [money] NULL,
	[DiscountAmount] [money] NULL,
	[DiscountAmountFC] [money] NULL,
	[RealizedGainLoss] [money] NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[OriginalAmount] [money] NULL,
	[AmountDue] [money] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AP_Payment_Allocation]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AP_Payment_Allocation](
	[AllocationID] [int] IDENTITY(1,1) NOT NULL,
	[APJournalID] [int] NULL,
	[PaymentAPID] [int] NULL,
	[BatchID] [int] NULL,
	[VendorID] [nvarchar](64) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[PaymentSysDocID] [nvarchar](7) NULL,
	[PaymentVoucherID] [nvarchar](15) NULL,
	[AllocationDate] [datetime] NULL,
	[PaymentAmount] [money] NULL,
	[PaymentAmountFC] [money] NULL,
	[DiscountAmount] [money] NULL,
	[DiscountAmountFC] [money] NULL,
	[RealizedGainLoss] [money] NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_AP_Payment_Allocation] PRIMARY KEY CLUSTERED 
(
	[AllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APJournal]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APJournal](
	[APID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [nvarchar](64) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[JournalID] [int] NULL,
	[APDate] [datetime] NULL,
	[APDueDate] [datetime] NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[DebitFC] [money] NULL,
	[CreditFC] [money] NULL,
	[ConDebitFC] [money] NULL,
	[ConCreditFC] [money] NULL,
	[ConRate] [decimal](10, 5) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[AttributeID1] [nvarchar](50) NULL,
	[AttributeID2] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[ChequeNumber] [nvarchar](15) NULL,
	[ChequeDate] [datetime] NULL,
	[BankID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[APAccountID] [nvarchar](64) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[Reference] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[AllocationID] [int] NULL,
	[IsPDCRow] [bit] NULL,
	[IsNonStatement] [bit] NULL,
	[ExcludeInPayment] [bit] NULL,
 CONSTRAINT [PK_APJournal] PRIMARY KEY CLUSTERED 
(
	[APID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Approval]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Approval](
	[ApprovalID] [nvarchar](15) NOT NULL,
	[ApprovalType] [tinyint] NOT NULL,
	[ApprovalName] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NULL,
	[ObjectID] [nvarchar](64) NULL,
	[ObjectSysDocID] [nvarchar](7) NULL,
	[Status] [tinyint] NULL,
	[UpdateFieldName1] [nvarchar](30) NULL,
	[UpdateFieldValue1] [nvarchar](30) NULL,
	[UpdateFieldName2] [nvarchar](3) NULL,
	[UpdateFieldValue2] [nvarchar](30) NULL,
	[ActionSetInactive] [bit] NULL,
	[IsInactive] [bit] NULL,
	[NotifyonPrint] [bit] NULL,
	[AllownextTransaction] [bit] NULL,
	[AllowtoEdit] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Approval] PRIMARY KEY CLUSTERED 
(
	[ApprovalID] ASC,
	[ApprovalType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Approval_Level]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Approval_Level](
	[ApprovalID] [nvarchar](15) NOT NULL,
	[ApprovalType] [tinyint] NOT NULL,
	[RowIndex] [int] NOT NULL,
	[ApproverType] [tinyint] NOT NULL,
	[ApproverID] [nvarchar](15) NULL,
	[IsAssignedSalesperson] [bit] NULL,
	[PreRequisiteIndex] [int] NULL,
	[Condition] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Approval_Task]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Approval_Task](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[ApprovalID] [nvarchar](15) NOT NULL,
	[ApprovalType] [tinyint] NOT NULL,
	[LevelID] [int] NULL,
	[Status] [tinyint] NULL,
	[PreRequisiteIndex] [int] NULL,
	[AssigneeType] [tinyint] NULL,
	[AssigneeID] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[ObjectType] [tinyint] NULL,
	[ObjectID] [int] NULL,
	[DocumentSysDocID] [nvarchar](7) NULL,
	[DocumentCode] [nvarchar](64) NULL,
	[ApproverID] [nvarchar](15) NULL,
	[DateApproved] [datetime] NULL,
	[IsExpired] [bit] NULL,
 CONSTRAINT [PK_Approval_Task] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AR_Payment_Allocation]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AR_Payment_Allocation](
	[AllocationID] [int] IDENTITY(1,1) NOT NULL,
	[ARJournalID] [int] NULL,
	[PaymentARID] [int] NULL,
	[BatchID] [int] NULL,
	[CustomerID] [nvarchar](64) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[PaymentSysDocID] [nvarchar](7) NULL,
	[PaymentVoucherID] [nvarchar](15) NULL,
	[AllocationDate] [datetime] NULL,
	[PaymentAmount] [money] NULL,
	[PaymentAmountFC] [money] NULL,
	[DiscountAmount] [money] NULL,
	[DiscountAmountFC] [money] NULL,
	[RealizedGainLoss] [money] NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_AR_Payment_Allocation] PRIMARY KEY CLUSTERED 
(
	[AllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Area]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaID] [nvarchar](15) NOT NULL,
	[AreaName] [nvarchar](64) NOT NULL,
	[CountryID] [nvarchar](15) NULL,
	[ParentAreaID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ARJournal]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARJournal](
	[ARID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](64) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[JournalID] [int] NULL,
	[ARDate] [datetime] NULL,
	[ARDueDate] [datetime] NULL,
	[IsPDCRow] [bit] NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[DebitFC] [money] NULL,
	[CreditFC] [money] NULL,
	[ConDebitFC] [money] NULL,
	[ConCreditFC] [money] NULL,
	[ConRate] [decimal](10, 5) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[AttributeID1] [nvarchar](50) NULL,
	[AttributeID2] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[ChequeNumber] [nvarchar](15) NULL,
	[ChequeDate] [datetime] NULL,
	[BankID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[ARAccountID] [nvarchar](64) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[Reference] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[AllocationID] [int] NULL,
 CONSTRAINT [PK_ARJournal] PRIMARY KEY CLUSTERED 
(
	[ARID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Arrival_Report]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrival_Report](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ContainerNumber] [nvarchar](20) NULL,
	[VehicleNumber] [nvarchar](20) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[TaskID] [nvarchar](15) NULL,
	[OriginID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[VesselName] [nvarchar](20) NULL,
	[VendorID] [nvarchar](64) NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[ContainerTemp] [decimal](6, 2) NULL,
	[TotalPallets] [int] NULL,
	[TotalQuantity] [decimal](10, 2) NULL,
	[DateReceived] [datetime] NULL,
	[DateInspected] [datetime] NULL,
	[InspectorID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[IsConsignment] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[Note] [ntext] NULL,
	[LocationID] [nvarchar](15) NULL,
	[TemplateID] [nvarchar](15) NULL,
	[Description] [nvarchar](1000) NULL,
	[PackingCondition] [nvarchar](15) NULL,
	[IsPalletized] [tinyint] NULL,
	[Conclusion] [tinyint] NULL,
	[ResultNote] [nvarchar](255) NULL,
	[TotalIssue1] [decimal](6, 2) NULL,
	[TotalIssue2] [decimal](6, 2) NULL,
	[TotalIssue3] [decimal](6, 2) NULL,
	[TotalIssue4] [decimal](6, 2) NULL,
	[TotalWeightLess] [decimal](6, 2) NULL,
	[Issue1Name] [nvarchar](15) NULL,
	[Issue2Name] [nvarchar](15) NULL,
	[Issue3Name] [nvarchar](15) NULL,
	[Issue4Name] [nvarchar](15) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Arrival_Report] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Arrival_Report_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrival_Report_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[LotNumber] [nvarchar](15) NULL,
	[ComodityID] [nvarchar](15) NULL,
	[VarietyID] [nvarchar](20) NULL,
	[BrandID] [nvarchar](15) NULL,
	[Grower] [nvarchar](15) NULL,
	[ItemSize] [nvarchar](15) NULL,
	[Grade] [nvarchar](15) NULL,
	[DateCode] [nvarchar](15) NULL,
	[SampleCount] [real] NULL,
	[Temperature] [real] NULL,
	[StandardWeight] [real] NULL,
	[Issue1Count] [real] NULL,
	[Issue2Count] [real] NULL,
	[Issue3Count] [real] NULL,
	[Issue4Count] [real] NULL,
	[Weight] [real] NULL,
	[Pressure] [real] NULL,
	[Brix] [real] NULL,
	[NumericAtr1] [real] NULL,
	[NumericAtr2] [real] NULL,
	[NumericAtr3] [real] NULL,
	[NumericAtr4] [real] NULL,
	[TextAtr1] [nvarchar](15) NULL,
	[TextAtr2] [nvarchar](15) NULL,
	[TextAtr3] [nvarchar](15) NULL,
	[TextAtr4] [nvarchar](15) NULL,
	[Remarks] [nvarchar](255) NULL,
 CONSTRAINT [PK_Arrival_Report_Detail] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Arrival_Report_Template]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrival_Report_Template](
	[TemplateID] [nvarchar](15) NOT NULL,
	[TemplateName] [nvarchar](30) NULL,
	[Issue1Name] [nvarchar](15) NULL,
	[Issue2Name] [nvarchar](15) NULL,
	[Issue3Name] [nvarchar](15) NULL,
	[Issue4Name] [nvarchar](15) NULL,
	[Issue1LossPercent] [decimal](5, 2) NULL,
	[Issue2LossPercent] [decimal](5, 2) NULL,
	[Issue3LossPercent] [decimal](5, 2) NULL,
	[Issue4LossPercent] [decimal](5, 2) NULL,
	[AtrNum1Name] [nvarchar](15) NULL,
	[AtrNum2Name] [nvarchar](15) NULL,
	[AtrNum3Name] [nvarchar](15) NULL,
	[AtrNum4Name] [nvarchar](15) NULL,
	[AtrText1Name] [nvarchar](15) NULL,
	[AtrText2Name] [nvarchar](15) NULL,
	[AtrText3Name] [nvarchar](15) NULL,
	[AtrText4Name] [nvarchar](15) NULL,
	[PrintTemplateName] [nvarchar](64) NULL,
	[IsBrix] [bit] NULL,
	[IsPressure] [bit] NULL,
	[IsGrower] [bit] NULL,
	[IsDateCode] [bit] NULL,
	[IsPalletID] [bit] NULL,
	[IsTemperature] [bit] NULL,
	[IsInactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Arrival_Report_Template] PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Assembly_Build]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assembly_Build](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssemblyProductID] [nvarchar](64) NULL,
	[QuantityBuild] [decimal](18, 5) NULL,
	[UnitWeight] [decimal](18, 5) NULL,
	[UnitCost] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Note] [nvarchar](255) NULL,
	[TransactionDate] [datetime] NULL,
	[WorkCompDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[LocationID] [nvarchar](15) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Assembly_Build] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Assembly_Build_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assembly_Build_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[BOMProductID] [nvarchar](64) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitCost] [decimal](18, 5) NULL,
	[LocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
 CONSTRAINT [PK_Assembly_Build_Detail] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Assembly_Build_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assembly_Build_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankID] [nvarchar](15) NOT NULL,
	[BankName] [nvarchar](64) NOT NULL,
	[ContactName] [nvarchar](64) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[RoutingCode] [nvarchar](30) NULL,
	[TaxIDNumber] [nvarchar](30) NULL,
	[Address] [nvarchar](64) NULL,
	[Address2] [nvarchar](64) NULL,
	[Address3] [nvarchar](64) NULL,
	[City] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
	[State] [nvarchar](30) NULL,
	[Phone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[IsInactive] [bit] NULL CONSTRAINT [DF_Banks_IsInactive]  DEFAULT ((0)),
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Facility]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Facility](
	[FacilityID] [nvarchar](15) NOT NULL,
	[FacilityName] [nvarchar](64) NULL,
	[FacilityType] [tinyint] NULL,
	[Alias] [nvarchar](64) NULL,
	[GroupID] [nvarchar](15) NULL,
	[LimitAmount] [money] NULL,
	[TenorDays] [int] NULL,
	[Status] [tinyint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PayableAccountID] [nvarchar](64) NULL,
	[CurrentAccountID] [nvarchar](64) NULL,
	[BankChargeAccountID] [nvarchar](64) NULL,
	[BankInterestAccountID] [nvarchar](64) NULL,
	[PrintTemplateName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Bank_Facility] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Facility_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Facility_Group](
	[GroupID] [nvarchar](15) NOT NULL,
	[GroupName] [nvarchar](64) NULL,
	[BankID] [nvarchar](15) NULL,
	[TotalLimit] [money] NULL,
	[Alias] [nvarchar](64) NULL,
	[ContactName] [nvarchar](64) NULL,
	[ContactNumber] [nvarchar](30) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RenewDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Bank_Facility_Offer] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Facility_Group_Contacts]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Facility_Group_Contacts](
	[GroupID] [nvarchar](15) NOT NULL,
	[ContactID] [nvarchar](64) NOT NULL,
	[JobTitle] [nvarchar](30) NULL,
	[Note] [nvarchar](64) NULL,
	[RowIndex] [smallint] NULL,
 CONSTRAINT [PK_Bank_Facility_Group_Contacts] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Facility_Payment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Facility_Payment](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionSysDocID] [nvarchar](7) NULL,
	[TransactionVoucherID] [nvarchar](15) NULL,
	[FacilityType] [int] NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[TransactionDate] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[GLType] [tinyint] NULL,
	[Reference] [nvarchar](15) NULL,
	[PayFromAccountID] [nvarchar](64) NULL,
	[PayToAccountID] [nvarchar](64) NULL,
	[TransactionStatus] [tinyint] NULL,
	[PaidAmount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Bank_Facility_Payment] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Facility_Payment_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Facility_Payment_Details](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AccountID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowIndex] [smallint] NULL,
	[Reference] [nvarchar](20) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[DueDate] [datetime] NULL,
	[PayeeType] [nvarchar](1) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[PaymentMethodID] [nvarchar](15) NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[BankID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Facility_Transaction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Facility_Transaction](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[FacilityType] [int] NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[RegisterID] [nvarchar](15) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TransactionDate] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[GLType] [tinyint] NULL,
	[JournalID] [int] NULL,
	[Reference] [nvarchar](15) NULL,
	[FirstAccountID] [nvarchar](64) NULL,
	[SecondAccountID] [nvarchar](64) NULL,
	[TransactionStatus] [tinyint] NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[PaidAmount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[RequestSysDocID] [nvarchar](7) NULL,
	[RequestVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Bank_Facility_Transaction] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Facility_Transaction_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Facility_Transaction_Details](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AccountID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowIndex] [smallint] NULL,
	[Reference] [nvarchar](20) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[DueDate] [datetime] NULL,
	[PayeeType] [nvarchar](1) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[PaymentMethodID] [nvarchar](15) NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[BankID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Fee_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Fee_Details](
	[GLTransactionSysDocID] [nvarchar](7) NOT NULL,
	[GLTransactionVoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[Reference] [nvarchar](30) NULL,
	[BankAccountID] [nvarchar](64) NULL,
	[ExpenseAccountID] [nvarchar](64) NULL,
	[BankFeeID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[IsWithTR] [bit] NULL,
 CONSTRAINT [PK_Bank_Fee_Detail] PRIMARY KEY CLUSTERED 
(
	[GLTransactionSysDocID] ASC,
	[GLTransactionVoucherID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bank_Reconciliation]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Reconciliation](
	[AccountID] [nvarchar](64) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[TransactionDate] [datetime] NULL,
	[ReconcileDate] [datetime] NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Bank_Reconciliation] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Benefit]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefit](
	[BenefitID] [nvarchar](15) NOT NULL,
	[BenefitName] [nvarchar](30) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[AccountID] [nvarchar](64) NOT NULL,
	[IsNonFinancial] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Benefit] PRIMARY KEY CLUSTERED 
(
	[BenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill_Discount]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Discount](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[BankAccountID] [nvarchar](64) NULL,
	[LiabilityAccountID] [nvarchar](64) NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[BankChargeAmount] [money] NULL,
	[PaidAmount] [money] NULL,
	[FacilityType] [int] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](10, 5) NULL,
	[GLType] [tinyint] NULL,
	[JournalID] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[BankCommission] [money] NULL,
	[BankChargePercent] [money] NULL,
	[IsVoid] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Bill_Discount] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill_Discount_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Discount_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ChequeID] [int] NULL,
	[PayeeID] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[InvoiceSysDocID] [nvarchar](7) NOT NULL,
	[InvoiceVoucherID] [nvarchar](15) NOT NULL,
	[Total] [decimal](18, 5) NOT NULL,
	[BankChargeAmount] [money] NULL,
	[DiscountAmount] [money] NULL,
	[Date] [datetime] NULL,
	[DueDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill_Of_Lading]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Of_Lading](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Status] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[VendorID] [nvarchar](64) NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[Reference] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[PurchaseFlow] [tinyint] NULL,
	[Port] [nvarchar](15) NULL,
	[LoadingPort] [nvarchar](15) NULL,
	[ETA] [datetime] NULL,
	[ATD] [datetime] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[PONumber] [nvarchar](20) NULL,
	[Shipper] [nvarchar](15) NULL,
	[ClearingAgent] [nvarchar](30) NULL,
	[Value] [money] NULL,
	[ShipStatus] [bit] NULL,
	[TransporterID] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[BuyerID] [nvarchar](64) NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_BillOfLading] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill_Of_Lading_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Of_Lading_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ContainerNumber] [nvarchar](15) NULL,
	[Type] [nvarchar](50) NULL,
	[Weight] [decimal](18, 5) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[ContainerSizeID] [nvarchar](30) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[RowIndex] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bin]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bin](
	[BinID] [nvarchar](30) NOT NULL,
	[BinName] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
	[Remarks] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Bin] PRIMARY KEY CLUSTERED 
(
	[BinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOM]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOM](
	[BOMID] [nvarchar](15) NOT NULL,
	[BOMName] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[PricePercent] [decimal](5, 2) NULL,
	[Note] [nvarchar](255) NULL,
	[IsInactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_BOM] PRIMARY KEY CLUSTERED 
(
	[BOMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOM_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOM_Detail](
	[BOMID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Budget]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budget](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[Reference2] [nvarchar](30) NULL,
	[BudgetType] [nchar](10) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[Amount] [decimal](18, 5) NULL,
	[AmountFC] [decimal](18, 5) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Budget] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Budget_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budget_Details](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](30) NULL,
	[AccountID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Reference] [nvarchar](30) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[AnalysisID] [nvarchar](50) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[Credit] [money] NULL,
	[CreditFC] [money] NULL,
	[Debit] [money] NULL,
	[DebitFC] [money] NULL,
	[Rowindex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Budgeting]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budgeting](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[Reference2] [nvarchar](30) NULL,
	[BudgetType] [nchar](10) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](10, 5) NULL,
	[Amount] [decimal](18, 5) NULL,
	[AmountFC] [decimal](18, 5) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Budgeting] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Budgeting_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budgeting_Details](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](30) NULL,
	[AccountID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Reference] [nvarchar](30) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[AnalysisID] [nvarchar](50) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[Credit] [money] NULL,
	[CreditFC] [money] NULL,
	[Debit] [money] NULL,
	[DebitFC] [money] NULL,
	[Rowindex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Buyer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyer](
	[BuyerID] [nvarchar](64) NOT NULL,
	[FullName] [nvarchar](64) NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NULL,
	[Website] [nvarchar](30) NULL,
	[BankName] [nvarchar](30) NULL,
	[BankBranch] [nvarchar](30) NULL,
	[BankAccountNumber] [nvarchar](30) NULL,
	[AreaID] [nvarchar](15) NULL,
	[CountryID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateUpdated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Buyer] PRIMARY KEY CLUSTERED 
(
	[BuyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[CampaignID] [nvarchar](64) NOT NULL,
	[CampaignName] [nvarchar](64) NOT NULL,
	[Type] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[NumberSent] [int] NULL,
	[ExpectedResponse] [tinyint] NULL,
	[BudgetedCost] [decimal](18, 2) NULL,
	[ActualCost] [decimal](18, 2) NULL,
	[ExpectedRevenue] [money] NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Candidate](
	[CandidateID] [nvarchar](64) NOT NULL,
	[PassportNo] [nvarchar](20) NULL,
	[GivenName] [nvarchar](64) NULL,
	[SurName] [nvarchar](64) NULL,
	[GroupID] [nvarchar](15) NULL,
	[DesignationID] [nvarchar](30) NULL,
	[VisaStatus] [nvarchar](15) NULL,
	[NationalityID] [nvarchar](15) NULL,
	[Gender] [char](1) NULL,
	[BirthDate] [smalldatetime] NULL,
	[BirthPlace] [nvarchar](30) NULL,
	[PassportPlaceOfIssue] [nvarchar](50) NULL,
	[PassportIssueDate] [smalldatetime] NULL,
	[PassportExpiryDate] [smalldatetime] NULL,
	[FatherName] [nvarchar](64) NULL,
	[MotherName] [nvarchar](64) NULL,
	[SpouseName] [nvarchar](64) NULL,
	[PassportAddress] [nvarchar](255) NULL,
	[Photo] [image] NULL,
	[ECRStatus] [tinyint] NULL,
	[ApplType] [tinyint] NULL,
	[SystemDate] [datetime] NULL,
	[SelectionStatus] [tinyint] NULL,
	[SelectedOn] [smalldatetime] NULL,
	[SelectedAt] [nvarchar](30) NULL,
	[ThroughAgent] [nvarchar](100) NULL,
	[VisaCopyToAgentOn] [smalldatetime] NULL,
	[VisaDesignation] [nvarchar](30) NULL,
	[ActualDesignation] [nvarchar](30) NULL,
	[Remarks] [nvarchar](255) NULL,
	[QualificationID] [nvarchar](30) NULL,
	[LanguageID] [nvarchar](30) NULL,
	[ExperienceLocal] [decimal](18, 0) NULL,
	[ExperienceAbroad] [decimal](18, 0) NULL,
	[CancellationDate] [datetime] NULL,
	[AOTypingDate] [datetime] NULL,
	[AORegNumber] [nvarchar](30) NULL,
	[ApplicationTypingDateMOL] [smalldatetime] NULL,
	[MBNumberMOL] [nvarchar](30) NULL,
	[SponsorID] [nvarchar](30) NULL,
	[ApprovalStatusMOL] [tinyint] NULL,
	[ApprovalDateMOL] [datetime] NULL,
	[ApprovalValidTillMOL] [smalldatetime] NULL,
	[TempWPNumber] [nvarchar](50) NULL,
	[ApprovalFeePaidOnMOL] [smalldatetime] NULL,
	[BGPaidOnMOL] [datetime] NULL,
	[BGTypeMOL] [nvarchar](50) NULL,
	[MOLRemarks] [nvarchar](500) NULL,
	[VisaAppliedThroughIMG] [nvarchar](64) NULL,
	[VisaPostedOnIMG] [datetime] NULL,
	[VisaApprovedOnIMG] [datetime] NULL,
	[ApprovalStatusIMG] [tinyint] NULL,
	[VisaIssuePlaceIMG] [nvarchar](64) NULL,
	[VisaNumber] [nvarchar](30) NULL,
	[VisaIssueDateIMG] [smalldatetime] NULL,
	[VisaExpiryDateIMG] [smalldatetime] NULL,
	[UIDNumberIMG] [nvarchar](30) NULL,
	[ExpectedArrivaldate] [datetime] NULL,
	[IMGRemarks] [nvarchar](500) NULL,
	[ArrivedOn] [datetime] NULL,
	[ArrivalPort] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[EmployeeNo] [nvarchar](15) NULL,
	[HealthCardNo] [nvarchar](50) NULL,
	[MedicalTypingOn] [datetime] NULL,
	[MedicalAttendedOn] [datetime] NULL,
	[MedicalCollectedOn] [datetime] NULL,
	[MedicalResult] [nvarchar](50) NULL,
	[MedicalNote] [nvarchar](255) NULL,
	[ApplicationTypedOnEID] [datetime] NULL,
	[AttendedForEID] [datetime] NULL,
	[CollectedOnEID] [datetime] NULL,
	[NationalID] [nvarchar](50) NULL,
	[NationalIDValidity] [datetime] NULL,
	[AGTType] [nvarchar](50) NULL,
	[MBNumberAGT] [nvarchar](30) NULL,
	[AGTTypedOn] [datetime] NULL,
	[AGTSubmittedOn] [datetime] NULL,
	[WPNumber] [nvarchar](50) NULL,
	[PersonalIDNo] [nvarchar](50) NULL,
	[WPIssuePlace] [nvarchar](50) NULL,
	[WPIssueDate] [datetime] NULL,
	[WPExpiryDate] [datetime] NULL,
	[RPProcessType] [nvarchar](30) NULL,
	[ApplicationPostedOnRP] [datetime] NULL,
	[ApplicationApprovedOnRP] [datetime] NULL,
	[SubmittedToZajil] [datetime] NULL,
	[PassportCollectedOn] [datetime] NULL,
	[RPIssuePlace] [nvarchar](50) NULL,
	[RPIssueDate] [datetime] NULL,
	[RPExpiryDate] [datetime] NULL,
	[ReligionID] [nvarchar](15) NULL,
	[BloodGroup] [nvarchar](5) NULL,
	[ContractType] [nvarchar](15) NULL,
	[Notes] [nvarchar](255) NULL,
	[MaritalStatus] [tinyint] NULL,
	[PrimaryAddressID] [nvarchar](15) NULL,
	[PDCAmount] [money] NULL,
	[IsCancelled] [bit] NULL,
	[CancellationStage] [nvarchar](50) NULL,
	[VCAppReceivedDate] [datetime] NULL,
	[AppCancellationDate] [datetime] NULL,
	[IMGCancellationDate] [datetime] NULL,
	[MOLCancellationDate] [datetime] NULL,
	[SignedAOrecvdDate] [datetime] NULL,
	[SignedAGTrecvdDate] [datetime] NULL,
	[MBNumberCancel] [nvarchar](30) NULL,
	[CancellationReason] [nvarchar](64) NULL,
	[CancellationRemarks] [nvarchar](500) NULL,
	[UserDefined1] [nvarchar](64) NULL,
	[UserDefined2] [nvarchar](64) NULL,
	[UserDefined3] [nvarchar](64) NULL,
	[UserDefined4] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[AgreementStatus] [nvarchar](15) NULL,
	[SpecialCondition] [nvarchar](15) NULL,
 CONSTRAINT [PK_Candidate] PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Candidate_Benefit_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate_Benefit_Detail](
	[CandidateID] [nvarchar](15) NOT NULL,
	[BenefitID] [nvarchar](15) NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Amount] [money] NULL,
	[LastAmount] [money] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_andidate_Benefit_Detail] PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC,
	[BenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Candidate_Salary]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate_Salary](
	[CandidateID] [nvarchar](15) NOT NULL,
	[PayrollItemID] [nvarchar](15) NOT NULL,
	[PayType] [tinyint] NULL,
	[Amount] [money] NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Card_Security]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card_Security](
	[CardID] [int] NULL,
	[ConditionalQuery] [nvarchar](max) NULL,
	[FilterControl] [nvarchar](64) NULL,
	[FilterFrom] [nvarchar](64) NULL,
	[FilterTo] [nvarchar](64) NULL,
	[UserID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Card_Setting]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card_Setting](
	[ID] [nchar](10) NULL,
	[ItemQuery] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Case_Client]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case_Client](
	[CaseClientID] [nvarchar](64) NOT NULL,
	[CaseClientName] [nvarchar](64) NOT NULL,
	[ShortName] [nvarchar](64) NULL,
	[ForeignName] [nvarchar](64) NULL,
	[CompanyName] [nvarchar](64) NULL,
	[LegalName] [nvarchar](64) NULL,
	[CustomerClassID] [nvarchar](15) NULL,
	[CollectionUserID] [nvarchar](15) NULL,
	[PartyType] [nvarchar](15) NULL,
	[PartyID] [nvarchar](50) NULL,
	[IsDefendant] [bit] NULL,
	[IsPlantiff] [bit] NULL,
	[InsRating] [tinyint] NULL,
	[RatingBy] [nvarchar](15) NULL,
	[RatingDate] [datetime] NULL,
	[RatingRemarks] [nvarchar](255) NULL,
	[StatementEmail] [nvarchar](255) NULL,
	[Flag] [tinyint] NULL,
	[POSHidden] [bit] NULL,
	[ContactName] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[AreaID] [nvarchar](15) NULL,
	[SubAreaID] [nvarchar](15) NULL,
	[Rating] [tinyint] NULL,
	[AcceptCheckPayment] [bit] NULL,
	[AcceptPDC] [bit] NULL,
	[CreditLimitType] [tinyint] NULL,
	[CreditAmount] [money] NULL,
	[ARAccountID] [nvarchar](64) NULL,
	[ParentCaseClientID] [nvarchar](64) NULL,
	[IsParentPosting] [bit] NULL,
	[CustomerGroupID] [nvarchar](15) NULL,
	[BillToAddressID] [nvarchar](15) NULL,
	[ShipToAddressID] [nvarchar](15) NULL,
	[StatementAddressID] [nvarchar](15) NULL,
	[CountryID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[IsHold] [bit] NULL,
	[Photo] [image] NULL,
	[BankName] [nvarchar](30) NULL,
	[BankBranch] [nvarchar](30) NULL,
	[BankAccountNumber] [nvarchar](30) NULL,
	[VATRegistrationNumber] [nvarchar](30) NULL,
	[InsStatus] [tinyint] NULL,
	[InsApplicationDate] [datetime] NULL,
	[InsEffectiveDate] [datetime] NULL,
	[InsExpiryDate] [datetime] NULL,
	[InsRequestedAmount] [money] NULL,
	[InsApprovedAmount] [money] NULL,
	[InsPolicyNumber] [nvarchar](30) NULL,
	[InsRemarks] [nvarchar](255) NULL,
	[InsProviderID] [nvarchar](15) NULL,
	[InsuranceID] [nvarchar](30) NULL,
	[PaymentTermID] [nvarchar](15) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CreditReviewBy] [nvarchar](15) NULL,
	[CreditReviewDate] [datetime] NULL,
	[Note] [ntext] NULL,
	[DateEstablished] [datetime] NULL,
	[PaymentMethodID] [nvarchar](15) NULL,
	[SalesPersonID] [nvarchar](64) NULL,
	[PriceLevelID] [nvarchar](1) NULL,
	[PrimaryAddressID] [nvarchar](15) NULL,
	[StatementSendingMethod] [tinyint] NULL,
	[AllowConsignment] [bit] NULL,
	[CollectionRemarks] [nvarchar](300) NULL,
	[ConsignComPercent] [bit] NULL,
	[PDCAmount] [money] NULL,
	[LicenseExpDate] [datetime] NULL,
	[ContractExpDate] [datetime] NULL,
	[Balance] [money] NULL,
	[LeadSourceID] [nvarchar](15) NULL,
	[SourceLeadID] [nvarchar](15) NULL,
	[IsWeightInvoice] [bit] NULL,
	[IsCustomerSince] [datetime] NULL,
	[ProfileDetails] [ntext] NULL,
	[UserDefined1] [nvarchar](64) NULL,
	[UserDefined2] [nvarchar](64) NULL,
	[UserDefined3] [nvarchar](64) NULL,
	[UserDefined4] [nvarchar](64) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DeliveryInstructions] [nvarchar](500) NULL,
	[AccountInstructions] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Case_Client] PRIMARY KEY CLUSTERED 
(
	[CaseClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Case_Client_Address]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case_Client_Address](
	[AddressID] [nvarchar](15) NOT NULL,
	[CaseClientID] [nvarchar](64) NOT NULL,
	[AddressName] [nvarchar](64) NULL,
	[ContactName] [nvarchar](64) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address1] [nvarchar](64) NULL,
	[Address2] [nvarchar](64) NULL,
	[Address3] [nvarchar](64) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Latitude] [nvarchar](30) NULL,
	[Longitude] [nvarchar](30) NULL,
	[Department] [nvarchar](30) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](64) NULL,
	[Website] [nvarchar](255) NULL,
	[Twitter] [nvarchar](30) NULL,
	[Facebook] [nvarchar](255) NULL,
	[Skype] [nvarchar](30) NULL,
	[Comment] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Case_Client_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[CaseClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Case_Client_Contact_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case_Client_Contact_Detail](
	[CaseClientID] [nvarchar](64) NOT NULL,
	[ContactID] [nvarchar](64) NOT NULL,
	[JobTitle] [nvarchar](30) NULL,
	[Note] [nvarchar](64) NULL,
	[RowIndex] [smallint] NULL,
 CONSTRAINT [PK_Case_Client_Contact_Detail] PRIMARY KEY CLUSTERED 
(
	[CaseClientID] ASC,
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Case_Party]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case_Party](
	[CasePartyID] [nvarchar](15) NOT NULL,
	[CasePartyName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Case_Party] PRIMARY KEY CLUSTERED 
(
	[CasePartyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chart_Series]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chart_Series](
	[CustomGadgetID] [nvarchar](30) NOT NULL,
	[SeriesID] [nvarchar](15) NOT NULL,
	[DisplayName] [nvarchar](30) NULL,
	[ChartValueColumn] [nvarchar](30) NULL,
	[ChartType] [tinyint] NULL,
	[Color] [int] NULL,
	[LabelVisible] [bit] NULL,
	[LabelPosition] [tinyint] NULL,
	[LabelTextPattern] [nvarchar](50) NULL,
 CONSTRAINT [PK_Custom_Gadget_Series] PRIMARY KEY CLUSTERED 
(
	[CustomGadgetID] ASC,
	[SeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckList]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckList](
	[CheckListID] [nvarchar](15) NOT NULL,
	[CheckListType] [tinyint] NOT NULL,
	[CheckListName] [nvarchar](64) NULL,
	[ApproverType] [tinyint] NULL,
	[ApproverID] [nvarchar](15) NULL,
	[Interval] [tinyint] NULL,
	[DeadLineDays] [tinyint] NULL,
	[StartDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[IsInactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_CheckList] PRIMARY KEY CLUSTERED 
(
	[CheckListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckList_Task]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckList_Task](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[CheckListID] [nvarchar](15) NOT NULL,
	[CheckListType] [tinyint] NOT NULL,
	[Status] [tinyint] NULL,
	[AssigneeType] [tinyint] NULL,
	[AssigneeID] [nvarchar](64) NULL,
	[DueDate] [datetime] NULL,
	[DeadlineDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CompletedBy] [nvarchar](15) NULL,
	[DateCompleted] [datetime] NULL,
	[CompletedRemarks] [nvarchar](255) NULL,
 CONSTRAINT [PK_CheckList_Task] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cheque_Discount]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque_Discount](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Reference] [nvarchar](20) NULL,
	[BankAccountID] [nvarchar](64) NULL,
	[LiabilityAccountID] [nvarchar](64) NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[BankChargeAmount] [money] NULL,
	[BankCommission] [money] NULL,
	[BankChargePercent] [money] NULL,
	[IsVoid] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Cheque_Discount] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cheque_Discount_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque_Discount_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ChequeID] [int] NOT NULL,
	[BankChargeAmount] [money] NULL,
	[DiscountAmount] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cheque_Issued]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cheque_Issued](
	[ChequeID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ChequeNumber] [nvarchar](15) NOT NULL,
	[PayeeType] [varchar](1) NOT NULL,
	[PayeeID] [nvarchar](64) NOT NULL,
	[PayeeAccountID] [nvarchar](64) NULL,
	[BankID] [nvarchar](15) NULL,
	[ChequeDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[ExchangeRate] [decimal](10, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Note] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[Status] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[PDCAccountID] [nvarchar](64) NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[ClearanceDate] [datetime] NULL,
	[BankAccountID] [nvarchar](64) NULL,
	[ClearanceSysDocID] [nvarchar](7) NULL,
	[ClearanceVoucherID] [nvarchar](15) NULL,
	[ClearanceAccountID] [nvarchar](64) NULL,
	[IsPrinted] [bit] NULL,
	[PrintDate] [datetime] NULL,
	[PrintName] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Cheque_Issued_1] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[ChequeNumber] ASC,
	[PayeeType] ASC,
	[PayeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Cheque_Received]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cheque_Received](
	[ChequeID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ChequeNumber] [nvarchar](15) NOT NULL,
	[BankID] [nvarchar](15) NOT NULL,
	[PayeeType] [varchar](1) NOT NULL,
	[PayeeID] [nvarchar](64) NOT NULL,
	[PayeeAccountID] [nvarchar](64) NULL,
	[ChequeDate] [datetime] NULL,
	[ReceiptDate] [datetime] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[ExchangeRate] [decimal](10, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ConAmountFC] [money] NULL,
	[ConRate] [decimal](18, 5) NULL,
	[Note] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL CONSTRAINT [DF_Cheque_Received_IsVoid]  DEFAULT ((0)),
	[Status] [tinyint] NULL CONSTRAINT [DF_Cheque_Received_Status]  DEFAULT ((1)),
	[Reference] [nvarchar](20) NULL,
	[PDCAccountID] [nvarchar](64) NULL,
	[DepositDate] [datetime] NULL,
	[DepositAccountID] [nvarchar](64) NULL,
	[DepositBankID] [nvarchar](15) NULL,
	[DepositSysDocID] [nvarchar](7) NULL,
	[DepositVoucherID] [nvarchar](15) NULL,
	[SendDate] [datetime] NULL,
	[SendBankAccountID] [nvarchar](64) NULL,
	[SendReference] [nvarchar](20) NULL,
	[DiscountDate] [datetime] NULL,
	[DiscountAccountID] [nvarchar](64) NULL,
	[DiscountBankAccountID] [nvarchar](64) NULL,
	[DiscountSysDocID] [nvarchar](7) NULL,
	[DiscountVoucherID] [nvarchar](15) NULL,
	[DiscountAmount] [money] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Cheque_Received] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[ChequeNumber] ASC,
	[BankID] ASC,
	[PayeeType] ASC,
	[PayeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Cheque_Register]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque_Register](
	[ChequebookID] [nvarchar](15) NOT NULL,
	[ChequeNumber] [int] NOT NULL,
	[ChequeID] [int] NULL,
	[Status] [tinyint] NULL,
	[ReasonID] [nvarchar](15) NULL,
	[IsSecurityCheque] [bit] NULL,
	[Note] [nvarchar](255) NULL,
 CONSTRAINT [PK_Cheque_Register] PRIMARY KEY CLUSTERED 
(
	[ChequebookID] ASC,
	[ChequeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cheque_Send]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque_Send](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Reference] [nvarchar](20) NULL,
	[BankAccountID] [nvarchar](64) NULL,
	[Reason] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Cheque_Send] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cheque_Send_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque_Send_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ChequeID] [int] NOT NULL,
	[Status] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chequebook]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chequebook](
	[ChequebookID] [nvarchar](15) NOT NULL,
	[ChequebookName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[BankID] [nvarchar](15) NULL,
	[AccountID] [nvarchar](64) NULL,
	[PDCIssuedAccountID] [nvarchar](64) NULL,
	[NextNumber] [int] NULL,
	[Signatory] [nvarchar](64) NULL,
	[TemplateName] [nvarchar](64) NULL,
	[Status] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Chequebook] PRIMARY KEY CLUSTERED 
(
	[ChequebookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [nvarchar](15) NOT NULL,
	[CityName] [nvarchar](30) NULL,
	[CountryID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[DateUpdated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CL_Token]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_Token](
	[TokenID] [int] IDENTITY(1,1) NOT NULL,
	[SystemKey] [nvarchar](64) NULL,
	[TokenNumber] [nvarchar](10) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[Amount] [decimal](18, 5) NULL,
	[IssuedBy] [nvarchar](15) NULL,
	[RequestedBy] [nvarchar](15) NULL,
	[IssueDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[RequestDate] [datetime] NULL,
	[CustomerID] [nvarchar](64) NULL,
	[DateUpdated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_CL_Token] PRIMARY KEY CLUSTERED 
(
	[TokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CL_Voucher]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_Voucher](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CustomerID] [nvarchar](64) NULL,
	[VoucherDate] [datetime] NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[Amount] [decimal](18, 5) NULL,
	[Reason] [nvarchar](255) NULL,
	[ApprovedBy] [nvarchar](15) NULL,
	[Reference] [nvarchar](20) NULL,
	[IsVoid] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_CL_Voucher] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientAsset]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientAsset](
	[ClientAssetID] [nvarchar](15) NOT NULL,
	[ClientAssetName] [nvarchar](64) NULL,
	[JobID] [nvarchar](50) NULL,
	[BrandID] [nvarchar](15) NULL,
	[ManufacturerID] [nvarchar](15) NULL,
	[LocationID] [nvarchar](15) NULL,
	[StartDate] [datetime] NULL,
	[SerialNo] [nvarchar](30) NULL,
	[ServiceByID] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_ClientAsset] PRIMARY KEY CLUSTERED 
(
	[ClientAssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COGS_Update_Log]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COGS_Update_Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[BatchReference] [nvarchar](15) NULL,
	[BatchDate] [datetime] NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ProductID] [nvarchar](64) NULL,
	[RowIndex] [int] NULL,
	[OldCost] [money] NULL,
	[NewCost] [money] NULL,
	[OldCOGS] [money] NULL,
	[NewCOGS] [money] NULL,
	[TotalDiff] [money] NULL,
	[COGSAccountID] [nvarchar](64) NULL,
	[AssetAccountID] [nvarchar](64) NULL,
 CONSTRAINT [PK_COGS_Update_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Collateral]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Collateral](
	[CollateralID] [nvarchar](15) NOT NULL,
	[CollateralName] [nvarchar](64) NULL,
	[PayeeType] [char](1) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[TypeID] [nvarchar](15) NULL,
	[ExpiryDate] [datetime] NULL,
	[ReceiveDate] [datetime] NULL,
	[Amount] [money] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[BankID] [nvarchar](15) NULL,
	[DocNo] [nvarchar](15) NULL,
	[IsReturned] [bit] NULL,
	[ReturnDate] [datetime] NULL,
	[ReturnNote] [nvarchar](255) NULL,
	[ReceiverName] [nvarchar](64) NULL,
	[Status] [tinyint] NULL,
	[CustodianID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Collateral] PRIMARY KEY CLUSTERED 
(
	[CollateralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[SetupID] [tinyint] IDENTITY(1,1) NOT NULL,
	[CompanyID] [tinyint] NOT NULL,
	[CompanyName] [nvarchar](64) NOT NULL,
	[CompanyUID] [int] NULL,
	[PrimaryAddressID] [nvarchar](15) NULL,
	[FiscalFirstMonth] [tinyint] NULL CONSTRAINT [DF_Company Information_FiscalFirstMonth]  DEFAULT ((1)),
	[DBVersion] [nvarchar](15) NULL,
	[DBDataVersion] [nvarchar](15) NULL,
	[LastBackupDate] [datetime] NULL,
	[Notes] [nvarchar](255) NULL,
	[Logo] [image] NULL,
	[FileSavingPath] [nvarchar](255) NULL,
	[TemplatePathLocation] [tinyint] NULL,
	[TemplatePathFolder] [nvarchar](255) NULL,
	[TemplatePathServer] [nvarchar](255) NULL,
	[BaseCurrencyID] [nvarchar](15) NULL,
	[CurDecimalPoint] [tinyint] NULL,
	[UseLogo] [bit] NULL CONSTRAINT [DF_Company Information_UseLogo]  DEFAULT ((0)),
	[ClosingDate] [datetime] NULL,
	[ClosingPassword] [nvarchar](64) NULL,
	[IsTax] [bit] NULL CONSTRAINT [DF_Company Information_IsTax]  DEFAULT ((1)),
	[TaxPercent] [decimal](15, 2) NULL,
	[IsDNInventory] [bit] NULL,
	[ItemPrice1Name] [nvarchar](15) NULL,
	[ItemPrice2Name] [nvarchar](15) NULL,
	[ItemPrice3Name] [nvarchar](15) NULL,
	[PDCReceivedAccountID] [nvarchar](64) NULL,
	[PDCIssuedAccountID] [nvarchar](64) NULL,
	[AccountUD1] [nvarchar](15) NULL,
	[AccountUD2] [nvarchar](15) NULL,
	[AccountUD3] [nvarchar](15) NULL,
	[AccountUD4] [nvarchar](15) NULL,
	[CustomerUD1] [nvarchar](15) NULL,
	[CustomerUD2] [nvarchar](15) NULL,
	[CustomerUD3] [nvarchar](15) NULL,
	[CustomerUD4] [nvarchar](15) NULL,
	[VendorUD1] [nvarchar](15) NULL,
	[VendorUD2] [nvarchar](15) NULL,
	[VendorUD3] [nvarchar](15) NULL,
	[VendorUD4] [nvarchar](15) NULL,
	[EmployeeUD1] [nvarchar](15) NULL,
	[EmployeeUD2] [nvarchar](15) NULL,
	[EmployeeUD3] [nvarchar](15) NULL,
	[EmployeeUD4] [nvarchar](15) NULL,
	[InventoryUD1] [nvarchar](15) NULL,
	[InventoryUD2] [nvarchar](15) NULL,
	[InventoryUD3] [nvarchar](15) NULL,
	[InventoryUD4] [nvarchar](15) NULL,
	[MinPriceSaleAction] [tinyint] NULL,
	[MinPriceSalePass] [nvarchar](5) NULL,
	[OverCLAction] [tinyint] NULL,
	[OverCLPass] [nvarchar](5) NULL,
	[NegativeQuantityAction] [tinyint] NULL,
	[NegativeQuantityPass] [nvarchar](5) NULL,
	[PricelessCostAction] [tinyint] NULL,
	[PricelessCostPass] [nvarchar](5) NULL,
	[IncludePDC] [bit] NULL,
	[UseMultiCurrency] [bit] NULL,
	[UseJobCosting] [bit] NULL,
	[AgingByDate] [bit] NULL,
	[DiscountWriteoffPercent] [decimal](15, 2) NULL,
	[RemoveAllocationAction] [tinyint] NULL,
	[LastLotNumber] [int] NULL,
	[LocalPurchaseFlow] [tinyint] NULL,
	[ImportPurchaseFlow] [tinyint] NULL,
	[MinQtyPackingAction] [tinyint] NULL,
	[SalesFlow] [tinyint] NULL,
	[DaysInMonth] [bit] NULL,
	[ThirtyDays] [bit] NULL,
	[Annual] [bit] NULL,
	[AutoResumptionDays] [int] NULL,
	[HRAnalysisGroup] [nvarchar](15) NULL,
	[HRAnalysisPrefix] [nvarchar](15) NULL,
	[VehicleAnalysisGroup] [nvarchar](15) NULL,
	[VehicleAnalysisPrefix] [nvarchar](15) NULL,
	[LegalAnalysisGroup] [nvarchar](15) NULL,
	[LegalAnalysisPrefix] [nvarchar](15) NULL,
	[PatientAnalysisGroup] [nvarchar](15) NULL,
	[PatientAnalysisPrefix] [nvarchar](15) NULL,
	[SMSUserName] [nvarchar](30) NULL,
	[SMSPassword] [nvarchar](30) NULL,
	[SMSMobileNo] [nvarchar](30) NULL,
	[LotNoIdentity] [nvarchar](30) NULL,
	[Reference2] [nvarchar](30) NULL,
	[StatementEmailBody] [xml] NULL,
	[IsLocationCosting] [bit] NULL,
	[TaxEntityTypes] [nvarchar](15) NULL,
	[DefaultTaxOption] [tinyint] NULL,
	[DefaultTaxGroupID] [nvarchar](30) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Company Information] PRIMARY KEY CLUSTERED 
(
	[SetupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Address]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Address](
	[AddressID] [nvarchar](15) NOT NULL,
	[ContactName] [nvarchar](64) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address1] [nvarchar](64) NULL,
	[Address2] [nvarchar](64) NULL,
	[Address3] [nvarchar](64) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Department] [nvarchar](30) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](64) NULL,
	[Website] [nvarchar](255) NULL,
	[Comment] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Company_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Division]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Division](
	[DivisionID] [nvarchar](15) NOT NULL,
	[DivisionName] [nvarchar](64) NULL,
	[CompanyID] [tinyint] NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Company_Division_IsInactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Company_Division] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Doc_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Doc_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Remind] [bit] NULL CONSTRAINT [DF_Company_Doc_Type_Remind]  DEFAULT ((0)),
	[RemindDays] [numeric](3, 0) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Company_Doc_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Document](
	[DocumentTypeID] [nvarchar](15) NOT NULL,
	[DocumentNumber] [nvarchar](30) NOT NULL,
	[SponsorID] [nvarchar](15) NULL,
	[DocumentName] [nvarchar](64) NULL,
	[EmployeeID] [nvarchar](15) NULL,
	[RegisterNumber] [nvarchar](20) NULL,
	[FileNumber] [nvarchar](20) NULL,
	[IssuePlace] [nvarchar](15) NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Remarks] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Company_Document] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeID] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Option]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Option](
	[OptionID] [nvarchar](64) NULL,
	[OptionValue] [nvarchar](64) NULL,
	[GroupID] [tinyint] NULL,
	[SysDocID] [nvarchar](7) NULL,
	[SysDocType] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Setup]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Setup](
	[CompanyID] [int] NOT NULL,
	[IsDNInventory] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Competitor]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competitor](
	[CompetitorID] [nvarchar](15) NOT NULL,
	[CompetitorName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consign_In]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consign_In](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[IsClosed] [bit] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsInvoiced] [bit] NULL,
	[TransporterID] [nvarchar](50) NULL,
	[ArrivalPort] [nvarchar](30) NULL,
	[ArrivalDate] [datetime] NULL,
	[ContainerNo] [nvarchar](30) NULL,
	[BLNo] [nvarchar](30) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[Note] [nvarchar](4000) NULL,
	[CloseDate] [datetime] NULL,
	[CloseNote] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Consign_In] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consign_In_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consign_In_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantitySettled] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[QuantitySold] [decimal](18, 5) NULL,
	[QuantityDamage] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[TargetPrice] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[InvoiceRowIndex] [int] NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[ConsignSysDocID] [nvarchar](15) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consign_Out]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consign_Out](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[IsExport] [bit] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[SourceDocType] [tinyint] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[IsClosed] [bit] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsInvoiced] [bit] NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Consign_Out] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consign_Out_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consign_Out_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantitySettled] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[MarketPrice] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[SourceDocType] [tinyint] NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[ConsignSysDocID] [nvarchar](15) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignIn_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConsignIn_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[BillableAmount] [money] NULL,
	[SourceRowIndex] [int] NULL,
	[SourceSysDocID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ConsignIn_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignIn_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsDelivered] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_ConsignIn_Return] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignIn_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignIn_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[COGS] [decimal](18, 5) NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[ConsignRowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignIn_Sale]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignIn_Sale](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[ProductID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[ConsignRowIndex] [int] NULL,
	[SoldQty] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
 CONSTRAINT [PK_ConsignIn_Sale] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignIn_Settled_Items]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignIn_Settled_Items](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[SalesRowID] [int] NULL,
	[ProductID] [nvarchar](64) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Quantity] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignIn_Settlement]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignIn_Settlement](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[IsCash] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[CommissionPercent] [money] NULL,
	[CommissionAmount] [money] NULL,
	[Total] [money] NULL,
	[TotalCOGS] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsDelivered] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[RequireUpdate] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_ConsignIn_Settlement] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignIn_Settlement_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignIn_Settlement_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ExpenseAmount] [money] NULL,
	[UnitExpense] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[LocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[ConsignRowIndex] [int] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsDNRow] [bit] NULL,
	[IsRecost] [bit] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignIn_Settlement_Price]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignIn_Settlement_Price](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ProductID] [nvarchar](64) NULL,
	[RowIndex] [int] NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Price] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignOut_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConsignOut_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[IsDeduct] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ConsignOut_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignOut_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsDelivered] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_ConsignOut_Return] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignOut_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignOut_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[ConsignRowIndex] [int] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignOut_Settlement]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignOut_Settlement](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[IsCash] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalCOGS] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsDelivered] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[RequireUpdate] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_ConsignOut_Settlement] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsignOut_Settlement_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsignOut_Settlement_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ExpenseAmount] [money] NULL,
	[UnitExpense] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [real] NULL,
	[UnitFactor] [real] NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[ConsignRowIndex] [int] NULL,
	[QuantityShipped] [real] NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsDNRow] [bit] NULL,
	[IsRecost] [bit] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [nvarchar](64) NOT NULL,
	[FirstName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[NickName] [nvarchar](64) NULL,
	[Inactive] [bit] NULL,
	[Photo] [image] NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[Country] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[JobTitle] [nvarchar](30) NULL,
	[Department] [nvarchar](30) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email1] [nvarchar](64) NULL,
	[Email2] [nvarchar](64) NULL,
	[Website] [nvarchar](64) NULL,
	[Address] [nvarchar](64) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[Note] [ntext] NULL,
	[BirthDate] [datetime] NULL,
	[SpouseName] [nvarchar](64) NULL,
	[IMAddress] [nvarchar](255) NULL,
	[Anniversary] [datetime] NULL,
	[ManagerName] [nvarchar](64) NULL,
	[AssistantName] [nvarchar](64) NULL,
	[ChildrenName] [nvarchar](255) NULL,
	[Nationality] [nvarchar](30) NULL,
	[Gender] [char](1) NULL,
	[Hobbies] [nvarchar](255) NULL,
	[Language] [nvarchar](255) NULL,
	[BankName] [nchar](30) NULL,
	[BankAccountNumber] [nchar](30) NULL,
	[LinkedIn] [nvarchar](255) NULL,
	[Twitter] [nvarchar](30) NULL,
	[Facebook] [nvarchar](30) NULL,
	[Skype] [nvarchar](30) NULL,
	[UserDefined1] [nvarchar](64) NULL,
	[UserDefined2] [nvarchar](64) NULL,
	[UserDefined3] [nvarchar](64) NULL,
	[UserDefined4] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Container_Tracking]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container_Tracking](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[PurchaseFlow] [nvarchar](15) NULL,
	[ContainerNumber] [nvarchar](15) NULL,
	[DestinationPort] [nvarchar](15) NULL,
	[LoadingPort] [nvarchar](15) NULL,
	[Weight] [decimal](18, 5) NULL,
	[IsReceived] [bit] NULL,
	[ETA] [datetime] NULL,
	[ATD] [datetime] NULL,
	[Status] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[PONumber] [nvarchar](20) NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[Shipper] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[Container_Status] [int] NULL,
	[ActivityDoneBy] [nvarchar](20) NULL,
	[DeliveryDate] [date] NULL,
	[DeliveryTime] [time](7) NULL,
	[FreeTimeTODeliver] [datetime] NULL,
	[TruckNumber] [nvarchar](50) NULL,
	[IsBL] [bit] NULL,
	[IsInvoice] [bit] NULL,
	[IsPL] [bit] NULL,
	[IsHealthCertficate] [bit] NULL,
	[IsCertificateOfOrigin] [bit] NULL,
	[Remarks] [nvarchar](50) NULL,
	[DriverID] [nvarchar](50) NULL,
	[TransportCompany] [nvarchar](50) NULL,
	[TransporterID] [nvarchar](50) NULL,
	[ContainerSizeID] [nvarchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContainerSize]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerSize](
	[ContainerSizeID] [nvarchar](30) NOT NULL,
	[ContainerSizeName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Control_Layout]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Layout](
	[ControlType] [tinyint] NOT NULL,
	[ControlName] [nvarchar](64) NOT NULL,
	[LayoutName] [nvarchar](64) NOT NULL,
	[LayoutData] [image] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Control_Layout] PRIMARY KEY CLUSTERED 
(
	[ControlType] ASC,
	[ControlName] ASC,
	[LayoutName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cost_Center]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cost_Center](
	[CostCenterID] [nvarchar](15) NOT NULL,
	[CostCenterName] [nvarchar](30) NOT NULL,
	[CashReceiptSysDocID] [nvarchar](7) NULL,
	[ChequeReceiptSysDocID] [nvarchar](7) NULL,
	[CashPaymentSysDocID] [nvarchar](7) NULL,
	[ChequePaymentSysDocID] [nvarchar](7) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Cost_Center] PRIMARY KEY CLUSTERED 
(
	[CostCenterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cost_Updation]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cost_Updation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ProductID] [nvarchar](64) NULL,
	[InvoiceLocationID] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[Amount] [money] NULL,
	[IsApplied] [bit] NULL,
	[ApplySysDocID] [nvarchar](7) NULL,
	[ApplyVoucherID] [nvarchar](15) NULL,
 CONSTRAINT [PK_Cost_Updation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [nvarchar](15) NOT NULL,
	[CountryName] [nvarchar](64) NOT NULL,
	[PhoneCode] [nvarchar](15) NULL,
	[CurrencyCode] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Credit_Limit_Review]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credit_Limit_Review](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[Rating] [tinyint] NULL,
	[RatingBy] [nvarchar](15) NULL,
	[RatingDate] [datetime] NULL,
	[RatingRemarks] [nvarchar](255) NULL,
	[AcceptCheckPayment] [bit] NULL,
	[AcceptPDC] [bit] NULL,
	[CreditLimitType] [tinyint] NULL,
	[CreditAmount] [money] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[CLValidity] [date] NULL,
	[LimitPDCUnsecured] [bit] NULL,
	[PDCUnsecuredLimitAmount] [money] NULL,
	[GraceDays] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Credit_Limit_Review] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyID] [nvarchar](5) NOT NULL,
	[CurrencyName] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[ExchangeRate] [decimal](18, 5) NULL,
	[RateUpdatedDate] [datetime] NULL,
	[RateType] [char](1) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Currency_Inactive]  DEFAULT ((0)),
	[IsBase] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Currencies] UNIQUE NONCLUSTERED 
(
	[CurrencyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Currency_Exchange_Rate]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency_Exchange_Rate](
	[CurrencyID] [nvarchar](5) NULL,
	[ExchangeRate] [decimal](10, 5) NULL,
	[RateUpdatedDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Custom_Gadget]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custom_Gadget](
	[CustomGadgetID] [nvarchar](30) NOT NULL,
	[CustomGadgetName] [nvarchar](64) NULL,
	[GadgetData] [image] NULL,
	[GadgetStyle] [tinyint] NULL,
	[ChartValueColumn] [nvarchar](30) NULL,
	[ChartArgColumn] [nvarchar](30) NULL,
	[ChartType] [tinyint] NULL,
	[ChartPallet] [tinyint] NULL,
	[ColorPaletteName] [nvarchar](20) NULL,
	[ColorEach] [bit] NULL,
	[FilterOption] [tinyint] NULL,
	[IsInactive] [bit] NULL,
	[CategoryID] [nvarchar](15) NULL,
	[DrillAction] [tinyint] NULL,
	[DrillCardTypeID] [int] NULL,
	[DrillCardIDField] [nvarchar](30) NULL,
	[DrillTransactionSysDocIDField] [nvarchar](30) NULL,
	[DrillTransactionVoucherIDField] [nvarchar](30) NULL,
	[AutoRefresh] [bit] NULL,
	[RefreshInterval] [int] NULL,
	[ShowLegend] [bit] NULL,
	[IndValueColumn] [nvarchar](30) NULL,
	[IndTextValueColumn] [nvarchar](30) NULL,
	[ShowName] [bit] NULL,
	[DisplayName] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[ShowIndicator] [bit] NULL,
	[TextColor] [int] NULL,
	[AxisYTitle] [nvarchar](30) NULL,
	[AxisXTitle] [nvarchar](30) NULL,
	[AxisYTextPattern] [nvarchar](30) NULL,
	[IsRotated] [bit] NULL,
	[AxisYVisible] [bit] NULL,
	[LegendTextPattern] [nvarchar](50) NULL,
	[GShowGaugeText] [bit] NULL,
	[GShowNeedle] [bit] NULL,
	[TopNOption] [bit] NULL,
	[TopNCount] [tinyint] NULL,
	[TopNOthersText] [nvarchar](30) NULL,
	[ShowTopNOther] [bit] NULL,
	[DrillParm1] [nvarchar](30) NULL,
	[DrillParm2] [nvarchar](30) NULL,
	[DrillParm3] [nvarchar](30) NULL,
	[DrillParm4] [nvarchar](30) NULL,
	[IsSubReport] [bit] NULL,
	[DrillSubReportID] [int] NULL,
	[IsPreview] [bit] NULL,
	[Photo] [image] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Custom_Gadget] PRIMARY KEY CLUSTERED 
(
	[CustomGadgetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Custom_List]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custom_List](
	[ListCode] [nvarchar](15) NOT NULL,
	[ListName] [nvarchar](30) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Custom_List] PRIMARY KEY CLUSTERED 
(
	[ListCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Custom_List_Items]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custom_List_Items](
	[ListCode] [nvarchar](15) NOT NULL,
	[ItemCode] [nvarchar](15) NOT NULL,
	[ItemName] [nvarchar](30) NULL,
 CONSTRAINT [PK_Custom_List_Items] PRIMARY KEY CLUSTERED 
(
	[ListCode] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Custom_Report]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custom_Report](
	[CustomReportID] [nvarchar](15) NOT NULL,
	[CustomReportName] [nvarchar](64) NULL,
	[ParentMenuName] [nvarchar](64) NULL,
	[ReportData] [image] NULL,
	[IsInactive] [bit] NULL,
	[FormWidth] [int] NULL,
	[FormHeight] [int] NULL,
	[Layout] [image] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[TemplateName] [nvarchar](64) NULL,
	[Query] [nvarchar](500) NULL,
	[Note] [nvarchar](4000) NULL,
	[DisplayNote] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Custom_Report] PRIMARY KEY CLUSTERED 
(
	[CustomReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Custom_Report_Security]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custom_Report_Security](
	[MenuID] [nvarchar](255) NULL,
	[Enable] [bit] NULL,
	[Visible] [bit] NULL,
	[UserID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](15) NULL,
	[ReportType] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [nvarchar](64) NOT NULL,
	[CustomerName] [nvarchar](64) NOT NULL,
	[ShortName] [nvarchar](64) NULL,
	[ForeignName] [nvarchar](64) NULL,
	[CompanyName] [nvarchar](64) NULL,
	[LegalName] [nvarchar](64) NULL,
	[CustomerClassID] [nvarchar](15) NULL,
	[CollectionUserID] [nvarchar](15) NULL,
	[InsRating] [tinyint] NULL,
	[RatingBy] [nvarchar](15) NULL,
	[RatingDate] [datetime] NULL,
	[RatingRemarks] [nvarchar](255) NULL,
	[StatementEmail] [nvarchar](255) NULL,
	[Flag] [tinyint] NULL,
	[POSHidden] [bit] NULL,
	[ContactName] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[AreaID] [nvarchar](15) NULL,
	[SubAreaID] [nvarchar](15) NULL,
	[Rating] [tinyint] NULL,
	[AcceptCheckPayment] [bit] NULL,
	[AcceptPDC] [bit] NULL,
	[CreditLimitType] [tinyint] NULL,
	[CreditAmount] [money] NULL,
	[CLValidity] [date] NULL,
	[LimitPDCUnsecured] [bit] NULL,
	[GraceDays] [tinyint] NULL,
	[PDCUnsecuredLimitAmount] [money] NULL,
	[BalanceConfirmationDate] [datetime] NULL,
	[ConfirmationInterval] [tinyint] NULL,
	[ARAccountID] [nvarchar](64) NULL,
	[ParentCustomerID] [nvarchar](64) NULL,
	[IsParentPosting] [bit] NULL,
	[CustomerGroupID] [nvarchar](15) NULL,
	[BillToAddressID] [nvarchar](15) NULL CONSTRAINT [DF_Customer_BillToAddressID]  DEFAULT (N'PRIMARY'),
	[ShipToAddressID] [nvarchar](15) NULL CONSTRAINT [DF_Customer_ShipToAddressID]  DEFAULT (N'PRIMARY'),
	[StatementAddressID] [nvarchar](15) NULL CONSTRAINT [DF_Customer_StatementAddressID]  DEFAULT (N'PRIMARY'),
	[CountryID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[IsHold] [bit] NULL,
	[Photo] [image] NULL,
	[BankName] [nvarchar](30) NULL,
	[BankBranch] [nvarchar](30) NULL,
	[BankAccountNumber] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxIDNumber] [nvarchar](30) NULL,
	[InsStatus] [tinyint] NULL,
	[InsApplicationDate] [datetime] NULL,
	[InsEffectiveDate] [datetime] NULL,
	[InsExpiryDate] [datetime] NULL,
	[InsRequestedAmount] [money] NULL,
	[InsApprovedAmount] [money] NULL,
	[InsPolicyNumber] [nvarchar](30) NULL,
	[InsRemarks] [nvarchar](255) NULL,
	[InsProviderID] [nvarchar](15) NULL,
	[InsuranceID] [nvarchar](30) NULL,
	[PaymentTermID] [nvarchar](15) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CreditReviewBy] [nvarchar](15) NULL,
	[CreditReviewDate] [datetime] NULL,
	[Note] [ntext] NULL,
	[DateEstablished] [datetime] NULL,
	[PaymentMethodID] [nvarchar](15) NULL,
	[SalesPersonID] [nvarchar](64) NULL,
	[PriceLevelID] [nvarchar](1) NULL,
	[PrimaryAddressID] [nvarchar](15) NULL,
	[StatementSendingMethod] [tinyint] NULL,
	[AllowConsignment] [bit] NULL,
	[CollectionRemarks] [nvarchar](300) NULL,
	[ConsignComPercent] [bit] NULL,
	[DiscountPercent] [decimal](18, 2) NULL,
	[RebatePercent] [decimal](18, 2) NULL,
	[PDCAmount] [money] NULL,
	[LicenseNumber] [nvarchar](30) NULL,
	[LicenseExpDate] [datetime] NULL,
	[ContractExpDate] [datetime] NULL,
	[Balance] [money] NULL,
	[LeadSourceID] [nvarchar](15) NULL,
	[SourceLeadID] [nvarchar](15) NULL,
	[IsWeightInvoice] [bit] NULL,
	[IsCustomerSince] [datetime] NULL,
	[ProfileDetails] [ntext] NULL,
	[UserDefined1] [nvarchar](64) NULL,
	[UserDefined2] [nvarchar](64) NULL,
	[UserDefined3] [nvarchar](64) NULL,
	[UserDefined4] [nvarchar](64) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DeliveryInstructions] [nvarchar](500) NULL,
	[AccountInstructions] [nvarchar](500) NULL,
	[CustomerSignature] [image] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Address]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Address](
	[AddressID] [nvarchar](15) NOT NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[AddressName] [nvarchar](64) NULL,
	[ContactName] [nvarchar](64) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address1] [nvarchar](64) NULL,
	[Address2] [nvarchar](64) NULL,
	[Address3] [nvarchar](64) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Latitude] [nvarchar](30) NULL,
	[Longitude] [nvarchar](30) NULL,
	[Department] [nvarchar](30) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](64) NULL,
	[Website] [nvarchar](255) NULL,
	[Twitter] [nvarchar](30) NULL,
	[Facebook] [nvarchar](255) NULL,
	[Skype] [nvarchar](30) NULL,
	[Comment] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Customer_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Category]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Category](
	[CategoryID] [nvarchar](15) NOT NULL,
	[CategoryName] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Customer_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Category_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Category_Detail](
	[CustomerID] [nvarchar](64) NOT NULL,
	[CategoryID] [nvarchar](15) NOT NULL,
	[EntityType] [tinyint] NULL,
 CONSTRAINT [PK_Customer_Category_Detail] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Class]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Class](
	[ClassID] [nvarchar](15) NOT NULL,
	[ClassName] [nvarchar](64) NOT NULL,
	[HasPOSAccess] [bit] NULL,
	[IsLPO] [bit] NULL,
	[IsPRO] [bit] NULL,
	[ARAccountID] [nvarchar](64) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Customer_Group] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Contact_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Contact_Detail](
	[CustomerID] [nvarchar](64) NOT NULL,
	[ContactID] [nvarchar](64) NOT NULL,
	[JobTitle] [nvarchar](30) NULL,
	[Note] [nvarchar](64) NULL,
	[RowIndex] [smallint] NULL,
 CONSTRAINT [PK_Customer_Contact_Detail] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Group](
	[GroupID] [nvarchar](15) NOT NULL,
	[GroupName] [nvarchar](30) NOT NULL,
	[POSAccess] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Customer_Group_1] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Insurance]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Insurance](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[InsPolicyNumber] [nvarchar](30) NULL,
	[ReviewDate] [datetime] NULL,
	[CustomerID] [nvarchar](64) NULL,
	[InsuranceID] [nvarchar](30) NULL,
	[InsStatus] [tinyint] NULL,
	[InsApplicationDate] [datetime] NULL,
	[InsRating] [tinyint] NULL,
	[InsRequestedAmount] [money] NULL,
	[InsApprovedAmount] [money] NULL,
	[InsProvider] [nvarchar](50) NULL,
	[InsRemarks] [nvarchar](255) NULL,
	[InsEffectiveDate] [datetime] NULL,
	[InsValidTo] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Customer_Insurance] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Insurance_Claim]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Insurance_Claim](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[CustomerID] [nvarchar](64) NULL,
	[InsStatus] [tinyint] NULL,
	[InsProviderID] [nvarchar](15) NULL,
	[InsApplicationDate] [datetime] NULL,
	[InsPayableAmount] [money] NULL,
	[InsEffectiveDate] [datetime] NULL,
	[InsRemarks] [nvarchar](255) NULL,
	[InsPolicyNumber] [nvarchar](30) NULL,
	[InsApprovedAmount] [money] NULL,
	[InsuranceID] [nvarchar](30) NULL,
	[InsExpiryDate] [datetime] NULL,
	[ClaimAmount] [money] NULL,
	[PaidAmount] [money] NULL,
	[Reason] [nvarchar](255) NULL,
	[CustomerInsRemarks] [nvarchar](255) NULL,
	[PaidDate] [datetime] NULL,
	[CustomerInsStatus] [nvarchar](30) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Vendor_Link]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Vendor_Link](
	[PartyID] [nvarchar](15) NOT NULL,
	[PartyName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Customer_Vendor_Link] PRIMARY KEY CLUSTERED 
(
	[PartyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Vendor_Link_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Vendor_Link_Detail](
	[PartyID] [nvarchar](15) NOT NULL,
	[AccountID] [nvarchar](15) NOT NULL,
	[EntityType] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dashboard]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dashboard](
	[DashboardID] [nvarchar](30) NOT NULL,
	[UserID] [nvarchar](15) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[Layout] [image] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Dashboards] PRIMARY KEY CLUSTERED 
(
	[DashboardID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Data_Patch]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_Patch](
	[PatchID] [nvarchar](15) NOT NULL,
	[PatchDescription] [nvarchar](255) NULL,
	[PatchQuery] [ntext] NULL,
	[Status] [tinyint] NULL,
	[DateExecuted] [datetime] NULL,
	[DataVersion] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Data_Patch] PRIMARY KEY CLUSTERED 
(
	[PatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Data_Sync]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_Sync](
	[Type] [int] NOT NULL,
	[Code] [nvarchar](15) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DatabaseName] [nvarchar](100) NULL,
	[ServerID] [nvarchar](50) NULL,
	[UserID] [nvarchar](30) NULL,
	[Password] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Data_Sync] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Data_Sync_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_Sync_Detail](
	[Code] [nvarchar](15) NOT NULL,
	[SyncType] [int] NULL,
	[RecordType] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](3000) NULL,
	[Rowindex] [int] NULL,
	[DefaultSysDocID] [nvarchar](15) NULL,
	[DefaultRegisterID] [nvarchar](50) NULL,
	[LastSyncTime] [datetime] NULL,
	[SyncInterval] [int] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Deduction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deduction](
	[DeductionID] [nvarchar](15) NOT NULL,
	[DeductionName] [nvarchar](30) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[AccountID] [nvarchar](64) NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Deduction] PRIMARY KEY CLUSTERED 
(
	[DeductionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Degree]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degree](
	[DegreeID] [nvarchar](15) NOT NULL,
	[DegreeName] [nvarchar](64) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Employee_Degree] PRIMARY KEY CLUSTERED 
(
	[DegreeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delivery_Note]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_Note](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[SourceDocType] [tinyint] NULL,
	[SalesFlow] [tinyint] NULL,
	[CLUserID] [nvarchar](15) NULL,
	[IsExport] [bit] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Port] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[PODate] [datetime] NULL,
	[IsInvoiced] [bit] NULL,
	[IsShipped] [bit] NULL,
	[ContainerNumber] [nvarchar](30) NULL,
	[ContainerSizeID] [nvarchar](20) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[DriverID] [nvarchar](15) NULL,
	[VehicleID] [nvarchar](30) NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Delivery_Note] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delivery_Note_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_Note_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[LocationID] [nvarchar](15) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[RowSource] [tinyint] NULL,
	[ListVoucherID] [nvarchar](15) NULL,
	[ListRowIndex] [int] NULL,
	[ListSysDocID] [nvarchar](7) NULL,
	[ITRowID] [int] NULL,
	[RefSlNo] [int] NULL,
	[RefText1] [nvarchar](50) NULL,
	[RefText2] [nvarchar](50) NULL,
	[RefNum1] [decimal](18, 5) NULL,
	[RefNum2] [decimal](18, 5) NULL,
	[RefDate1] [datetime] NULL,
	[RefDate2] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delivery_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[SalesFlow] [tinyint] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[ReasonID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsInvoiced] [bit] NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DriverID] [nvarchar](15) NULL,
	[VehicleID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsCompleteReturn] [bit] NULL,
	[IsExport] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Delivery_Return] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delivery_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[DNRowIndex] [int] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [nvarchar](15) NOT NULL,
	[DepartmentName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Department_IsInactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Destination]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination](
	[DestinationID] [nvarchar](15) NOT NULL,
	[DestinationName] [nvarchar](30) NULL,
	[TicketFixedAmount] [money] NULL,
	[AccountID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Destination_Inactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Destination] PRIMARY KEY CLUSTERED 
(
	[DestinationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dimension]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension](
	[DimensionID] [nvarchar](15) NOT NULL,
	[DimensionName] [nvarchar](32) NULL,
	[IsInactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Dimention] PRIMARY KEY CLUSTERED 
(
	[DimensionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dimension_Attribute]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_Attribute](
	[AttributeID] [nvarchar](15) NOT NULL,
	[DimensionID] [nvarchar](15) NOT NULL,
	[AttributeName] [nvarchar](32) NULL,
	[Code] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[RowIndex] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Dimention_Attribute] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC,
	[DimensionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discipline_Action_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline_Action_Type](
	[ActionTypeID] [nvarchar](15) NOT NULL,
	[ActionTypeName] [nvarchar](30) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Discipline_Action_Type] PRIMARY KEY CLUSTERED 
(
	[ActionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Division]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division](
	[DivisionID] [nvarchar](15) NOT NULL,
	[DivisionName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doc_Version]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc_Version](
	[VersionID] [int] IDENTITY(1,1) NOT NULL,
	[ScreenType] [tinyint] NULL,
	[ScreenID] [int] NULL,
	[SysDocID] [nvarchar](15) NULL,
	[DocNumber] [nvarchar](64) NULL,
	[DocData] [image] NULL,
	[MachineID] [nvarchar](64) NULL,
	[UserID] [nvarchar](15) NULL,
	[LogDate] [datetime] NULL,
 CONSTRAINT [PK_Doc_Version] PRIMARY KEY CLUSTERED 
(
	[VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Draft_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Draft_Document](
	[DocumentID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Driver]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverID] [nvarchar](15) NOT NULL,
	[DriverName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Equipment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Equipment](
	[EquipmentID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](30) NULL,
	[RegistrationNumber] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[LocationID] [nvarchar](15) NULL,
	[EquipmentCategoryID] [nvarchar](15) NULL,
	[EquipmentTypeID] [nvarchar](15) NULL,
	[ExpiryDate] [datetime] NULL,
	[OwnerShip] [tinyint] NULL,
	[VendorID] [nvarchar](64) NULL,
	[ParentEquipmentID] [nvarchar](15) NULL,
	[Model] [nvarchar](15) NULL,
	[Color] [nvarchar](15) NULL,
	[Year] [smallint] NULL,
	[Capacity] [nvarchar](15) NULL,
	[CapacityType] [tinyint] NULL,
	[Power] [nvarchar](15) NULL,
	[Fuel] [nvarchar](15) NULL,
	[SerialNo] [nvarchar](15) NULL,
	[PlateNo] [nvarchar](15) NULL,
	[TrackingID] [nvarchar](30) NULL,
	[EngineNumber] [nvarchar](30) NULL,
	[IsMeter] [bit] NULL,
	[IsMileage] [bit] NULL,
	[IsHours] [bit] NULL,
	[OwnedBy] [nvarchar](30) NULL,
	[MaintenanceInCharge] [nvarchar](30) NULL,
	[NotificationEmail] [nvarchar](30) NULL,
	[FixedAssetGroupID] [nvarchar](15) NULL,
	[FixedAssetID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_EA_Equipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Equipment_Category]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Equipment_Category](
	[EquipmentCategoryID] [nvarchar](15) NOT NULL,
	[EquipmentCategoryName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Equipment_Category] PRIMARY KEY CLUSTERED 
(
	[EquipmentCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Equipment_Transfer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Equipment_Transfer](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[EquipmentID] [nvarchar](15) NOT NULL,
	[CurrentMeterReading] [nvarchar](15) NULL,
	[JobFromID] [nvarchar](15) NULL,
	[JobToID] [nvarchar](15) NULL,
	[LocationFromID] [nvarchar](15) NULL,
	[LocationToID] [nvarchar](15) NULL,
	[EmployeeFromID] [nvarchar](15) NULL,
	[EmployeeToID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[ReqVoucherID] [nvarchar](15) NULL,
	[ReqSysDocID] [nvarchar](7) NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_EA_Equipment_Transfer] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Equipment_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Equipment_Type](
	[EquipmentTypeID] [nvarchar](15) NOT NULL,
	[EquipmentTypeName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Equipment_Type] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Mobilization]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Mobilization](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[RequisitionNumber] [nvarchar](2000) NULL,
	[PlannedDateFrom] [datetime] NULL,
	[PlannedDateTo] [datetime] NULL,
	[Status] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[Discount] [money] NULL,
	[TaxAmount] [money] NULL,
	[Total] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[TotalFC] [money] NULL,
	[Note] [nvarchar](2000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_EA_Mobilization] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Mobilization_Equipment__Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Mobilization_Equipment__Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RequisitionNumber] [nvarchar](64) NULL,
	[EquipmentID] [nvarchar](15) NULL,
	[LocationID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[Status] [tinyint] NULL,
	[Remarks] [nvarchar](2000) NULL,
	[RowIndex] [smallint] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[IsSourcedRow] [bit] NULL,
	[SourceDocType] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Mobilization_Manpower__Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Mobilization_Manpower__Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[PositionID] [nvarchar](15) NULL,
	[RowIndex] [smallint] NULL,
	[EmployeeID] [nvarchar](64) NOT NULL,
	[EmployeeName] [nvarchar](64) NULL,
	[NoOfMembers] [int] NULL,
	[Remarks] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Mobilization_Resources__Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Mobilization_Resources__Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[LCost] [decimal](18, 5) NULL,
	[LCostAmount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[PORVoucherID] [nvarchar](15) NULL,
	[PORSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsPORRow] [bit] NULL,
	[LotNumber] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowSource] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Requisition]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Requisition](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[LocationID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[EquipmentCategoryID] [nvarchar](15) NULL,
	[EquipmentID] [nvarchar](15) NULL,
	[RequisitionTypeID] [nvarchar](15) NULL,
	[RequiredOn] [datetime] NULL,
	[RequiredTill] [datetime] NULL,
	[Status] [tinyint] NULL,
	[Remarks] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_EA_Requsition] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Requisition_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Requisition_Type](
	[RequisitionTypeID] [nvarchar](15) NOT NULL,
	[RequisitionTypeName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_EA_Requisition] PRIMARY KEY CLUSTERED 
(
	[RequisitionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_Work_Order]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_Work_Order](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[EquipmentID] [nvarchar](15) NOT NULL,
	[CurrentMeterReading] [nvarchar](15) NULL,
	[WorkOrderTypeID] [int] NULL,
	[TransactionDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_EA_Work_Order] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_WorkOrder_Expense_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EA_WorkOrder_Expense_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[PCSysDocID] [nvarchar](7) NULL,
	[PCVoucherID] [nvarchar](15) NULL,
	[PCRowIndex] [smallint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[EA_WorkOrder_Inventory_Issue]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_WorkOrder_Inventory_Issue](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[RequireUpdate] [bit] NULL,
	[SourceSysDocType] [tinyint] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_EA_WorkOrder_Inventory_Issue] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_WorkOrder_Inventory_Issue_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EA_WorkOrder_Inventory_Issue_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[JobID] [nvarchar](50) NULL,
	[LocationID] [nvarchar](15) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[RowIndex] [int] NULL,
	[IsBillable] [bit] NULL,
	[IsBilled] [bit] NULL,
	[BilledAmount] [money] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](6) NULL,
	[SourceRowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[EA_WorkOrder_Inventory_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_WorkOrder_Inventory_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_EA_WorkOrder_Inventory_Return] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_WorkOrder_Inventory_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EA_WorkOrder_Inventory_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[JobID] [nvarchar](50) NULL,
	[LocationID] [nvarchar](15) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[Cost] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[BillType] [tinyint] NULL,
	[IsBilled] [bit] NULL,
	[BilledAmount] [money] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](6) NULL,
	[SourceRowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[EA_WorkOrder_ManPower_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_WorkOrder_ManPower_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[PositionID] [nvarchar](15) NULL,
	[RowIndex] [smallint] NULL,
	[EmployeeID] [nvarchar](64) NOT NULL,
	[EmployeeName] [nvarchar](64) NULL,
	[Hrs] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EA_WorkOrder_Resources_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EA_WorkOrder_Resources_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[LCost] [decimal](18, 5) NULL,
	[LCostAmount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[Issued] [decimal](18, 5) NULL,
	[ItemType] [tinyint] NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[PORVoucherID] [nvarchar](15) NULL,
	[PORSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[IsPORRow] [bit] NULL,
	[LotNumber] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowSource] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Email_Config]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Config](
	[CompanyID] [tinyint] NOT NULL,
	[EmailID] [tinyint] NOT NULL,
	[EmailAddress] [nvarchar](64) NULL,
	[OutgoingServer] [nvarchar](64) NULL,
	[IncommingServer] [nvarchar](64) NULL,
	[UserName] [nvarchar](64) NULL,
	[EmailPass] [nvarchar](64) NULL,
	[SenderName] [nvarchar](64) NULL,
	[EmailSMTPPort] [int] NULL,
	[EmailUseSSL] [bit] NULL,
	[CCSalesperson] [bit] NULL,
	[Body1] [ntext] NULL,
	[Body2] [ntext] NULL,
	[Body3] [ntext] NULL,
	[Body4] [ntext] NULL,
	[CC1] [nvarchar](255) NULL,
	[CC2] [nvarchar](255) NULL,
	[CC3] [nvarchar](255) NULL,
	[CC4] [nvarchar](255) NULL,
	[Subject1] [nvarchar](255) NULL,
	[Subject2] [nvarchar](255) NULL,
	[Subject3] [nvarchar](255) NULL,
	[Subject4] [nvarchar](255) NULL,
	[IsInactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Email_Config] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC,
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Email_Message]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Email_Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[PeriodFrom] [datetime] NULL,
	[PeriodTo] [datetime] NULL,
	[ConfigType] [tinyint] NULL,
	[MessageType] [tinyint] NULL,
	[UserID] [nvarchar](15) NULL,
	[SenderAddress] [nvarchar](100) NULL,
	[SenderName] [nvarchar](100) NULL,
	[RecipientAddress] [nvarchar](500) NULL,
	[EmailBody] [xml] NULL,
	[CCAddress] [nvarchar](500) NULL,
	[BCCAddress] [nvarchar](500) NULL,
	[Attachment] [varbinary](max) NULL,
	[AttachmentName] [nvarchar](100) NULL,
	[PartyType] [char](1) NULL,
	[PartyID] [nvarchar](64) NULL,
	[Amount] [decimal](18, 5) NULL,
	[Status] [tinyint] NULL,
	[StatusMessage] [nvarchar](255) NULL,
	[EmailDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Email_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [nvarchar](64) NOT NULL,
	[FirstName] [nvarchar](150) NULL,
	[MiddleName] [nvarchar](150) NULL,
	[LastName] [nvarchar](150) NULL,
	[NickName] [nvarchar](30) NULL,
	[BirthDate] [smalldatetime] NULL,
	[JoiningDate] [smalldatetime] NULL,
	[Photo] [image] NULL,
	[IsTerminated] [bit] NULL,
	[TerminationDate] [datetime] NULL,
	[TerminationID] [int] NULL,
	[IsCancelled] [bit] NULL,
	[CancellationDate] [datetime] NULL,
	[RehireDate] [datetime] NULL,
	[IsEOSSettled] [bit] NULL,
	[GradeID] [nvarchar](15) NULL,
	[DayOff] [tinyint] NULL,
	[OnVacation] [bit] NULL,
	[EOSRuleID] [nvarchar](15) NULL,
	[OvertimeID] [nvarchar](15) NULL,
	[BirthPlace] [nvarchar](30) NULL,
	[SponsorID] [nvarchar](15) NULL,
	[NationalityID] [nvarchar](15) NULL,
	[UID] [nvarchar](50) NULL,
	[VisaNumber] [nvarchar](50) NULL,
	[Probation] [numeric](5, 0) NULL,
	[ConfirmationDate] [smalldatetime] NULL,
	[ReligionID] [nvarchar](15) NULL,
	[BloodGroup] [nvarchar](5) NULL,
	[Qualification] [nvarchar](30) NULL,
	[RecruitmentChannelID] [nvarchar](100) NULL,
	[VisaDesignationID] [nvarchar](30) NULL,
	[LegalPositionID] [nvarchar](30) NULL,
	[ContractType] [nvarchar](15) NULL,
	[PaymentMethodID] [tinyint] NULL,
	[BankID] [nvarchar](15) NULL,
	[AccountNumber] [nvarchar](30) NULL,
	[AnnualLeaveDate] [smalldatetime] NULL,
	[ResumedDate] [smalldatetime] NULL,
	[Notes] [ntext] NULL,
	[LocationID] [nvarchar](15) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyDivisionID] [nvarchar](15) NULL,
	[DepartmentID] [nvarchar](15) NULL,
	[PositionID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](15) NULL,
	[ReportToID] [nvarchar](15) NULL,
	[PayPeriod] [tinyint] NULL,
	[Gender] [char](1) NULL,
	[LastPayDate] [datetime] NULL,
	[MaritalStatus] [tinyint] NULL CONSTRAINT [DF_Employees_Married]  DEFAULT ((1)),
	[SpouseName] [nvarchar](64) NULL,
	[MedicalInsuranceProviderID] [nvarchar](64) NULL,
	[MedicalInsuranceCategoryID] [nvarchar](64) NULL,
	[MedicalInsuranceNumber] [nvarchar](64) NULL,
	[MedicalInsuranceAmount] [money] NULL,
	[MedicalInsValidFrom] [datetime] NULL,
	[MedicalInsValidTo] [datetime] NULL,
	[NumberOfDependants] [int] NULL,
	[NationalID] [nvarchar](30) NULL,
	[Status] [tinyint] NULL,
	[PrimaryAddressID] [nvarchar](15) NULL,
	[DestinationID] [nvarchar](15) NULL,
	[NumberOfTickets] [tinyint] NULL,
	[TicketAmount] [money] NULL,
	[TicketPeriod] [smallint] NULL,
	[TicketRemarks] [nvarchar](255) NULL,
	[AccountID] [nvarchar](15) NULL,
	[EmpAnalysisID] [nvarchar](15) NULL,
	[LabourID] [nvarchar](20) NULL,
	[IBAN] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[SalaryRemarks] [nvarchar](255) NULL,
	[BasicSalary] [money] NULL,
	[Balance] [money] NULL,
	[LastRevisedSalaryDate] [smalldatetime] NULL,
	[PDCAmount] [money] NULL,
	[AppriasalPoints] [decimal](15, 2) NULL,
	[CalendarID] [nvarchar](50) NULL,
	[UserDefined1] [nvarchar](64) NULL,
	[UserDefined2] [nvarchar](64) NULL,
	[UserDefined3] [nvarchar](64) NULL,
	[UserDefined4] [nvarchar](64) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Employee_Absconding]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Absconding](
	[ActivityID] [int] NOT NULL,
	[AdviceReceivedOn] [datetime] NULL,
	[RealAbscondingDate] [datetime] NULL,
	[AbscondingRegDateMOL] [datetime] NULL,
	[MBReferenceNo] [nvarchar](30) NULL,
	[AbscondingRegDateIMG] [datetime] NULL,
	[AbscondingReferenceNo] [nvarchar](30) NULL,
	[PassportHeldInIMG] [nvarchar](3) NULL,
	[TicketAmountPaid] [nvarchar](3) NULL,
	[LastWorkingDate] [datetime] NULL,
	[MOLCancellationDate] [datetime] NULL,
	[IMGCancellationDate] [datetime] NULL,
 CONSTRAINT [PK_Employee_Absconding] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Activity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Activity](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[Subject] [nvarchar](30) NULL,
	[TransactionDate] [datetime] NULL,
	[ActivityType] [tinyint] NULL,
	[Reason] [nvarchar](255) NULL,
	[Reference] [nvarchar](15) NULL,
	[Note] [nvarchar](1000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Activity] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Activity_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Activity_Type](
	[ActivityTypeID] [nvarchar](15) NOT NULL,
	[ActivityTypeName] [nvarchar](30) NOT NULL,
	[ActivityNature] [int] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Activity_Type] PRIMARY KEY CLUSTERED 
(
	[ActivityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Address]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Address](
	[AddressID] [nvarchar](15) NOT NULL,
	[EmployeeID] [nvarchar](64) NOT NULL,
	[Address1] [nvarchar](500) NULL,
	[Address2] [nvarchar](500) NULL,
	[Address3] [nvarchar](500) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NULL,
	[Comment] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Appraisal]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Appraisal](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[EmployeeID] [nvarchar](15) NULL,
	[PositionID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Appraisal] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Appraisal_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Appraisal_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[KPIParameter] [ntext] NULL,
	[Scale] [ntext] NULL,
	[Target] [decimal](15, 2) NULL,
	[Weightage] [decimal](15, 2) NULL,
	[Points] [decimal](15, 2) NULL,
	[Actual] [decimal](15, 2) NULL,
	[ACH] [decimal](15, 2) NULL,
	[Rating] [decimal](15, 2) NULL,
	[Remarks] [nvarchar](500) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Benefit_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Benefit_Detail](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[BenefitID] [nvarchar](15) NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Amount] [money] NULL,
	[LastAmount] [money] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Employee_Benefit_Detail] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[BenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Benefit_History]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Benefit_History](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[BenefitID] [nvarchar](15) NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Amount] [money] NULL,
	[LastAmount] [money] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Cancellation]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Cancellation](
	[ActivityID] [int] NOT NULL,
	[CancellationType] [tinyint] NULL,
	[VCAppReceivedDate] [datetime] NULL,
	[VCAppTypedDate] [datetime] NULL,
	[VCAppSubmittedDate] [datetime] NULL,
	[MBReferenceNoCancel] [nvarchar](30) NULL,
	[RPCancelDateIMG] [datetime] NULL,
	[LastWorkingDate] [datetime] NULL,
	[DepartureDate] [datetime] NULL,
	[ExitPort] [nvarchar](30) NULL,
	[SignedCNDOCRecvdDate] [datetime] NULL,
 CONSTRAINT [PK_Employee_Cancellation] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Deduction_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Deduction_Detail](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[DeductionID] [nvarchar](15) NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Amount] [money] NULL,
	[LastAmount] [money] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Employee_Deduction_Detail] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[DeductionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Deduction_History]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Deduction_History](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[DeductionID] [nvarchar](15) NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Amount] [money] NULL,
	[LastAmount] [money] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Dependent]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee_Dependent](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[DependentName] [nvarchar](64) NOT NULL,
	[Gender] [char](1) NULL,
	[BirthDate] [smalldatetime] NULL,
	[Address] [nvarchar](255) NULL,
	[NationalID] [nvarchar](30) NULL,
	[Relation] [nvarchar](15) NULL,
	[Comment] [nvarchar](255) NULL,
	[Phone] [nvarchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Dependent] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[DependentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Employee_DisciplinaryAction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_DisciplinaryAction](
	[ActivityID] [int] NOT NULL,
	[ActionTypeID] [nvarchar](15) NULL,
	[RequestedBy] [nvarchar](30) NULL,
 CONSTRAINT [PK_Employee_DisciplinaryAction] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Doc_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Doc_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Remind] [bit] NULL CONSTRAINT [DF_Employee_Docs_Type_Remind]  DEFAULT ((0)),
	[RemindDays] [numeric](3, 0) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Docs_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Document](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[DocumentNumber] [nvarchar](30) NOT NULL,
	[DocumentTypeID] [nvarchar](15) NOT NULL,
	[IssuePlace] [nvarchar](15) NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [smallint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Docs] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Education]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Education](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[School] [nvarchar](30) NULL,
	[Major] [nvarchar](30) NOT NULL,
	[Degree] [nvarchar](15) NULL,
	[GPA] [numeric](3, 2) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Education] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_EOS]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_EOS](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[LastWorkingDate] [date] NULL,
	[EmployeeBasic] [money] NULL,
	[CalculatedLeaveAmount] [money] NULL,
	[PaidLeaveAmount] [money] NULL,
	[LeaveDescription] [nvarchar](255) NULL,
	[CalculatedGratuityAmount] [money] NULL,
	[PaidGratuityAmount] [money] NULL,
	[GratuityDescription] [nvarchar](255) NULL,
	[CalculatedSalaryAmount] [money] NULL,
	[PaidSalaryAmount] [money] NULL,
	[SalaryDescription] [nvarchar](255) NULL,
	[PaidDeductionAmount] [money] NULL,
	[PaidLoanAmount] [money] NULL,
	[PaidTicketAmount] [money] NULL,
	[Note] [nvarchar](4000) NULL,
	[NetTotal] [money] NULL,
	[IsResigned] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_EOS] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_EOS_Deduction_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_EOS_Deduction_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[DeductionID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [money] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_EOSRule]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_EOSRule](
	[EOSRuleID] [nvarchar](15) NOT NULL,
	[EOSRuleName] [nvarchar](64) NULL,
	[AccountID] [nvarchar](64) NULL,
	[EOSSystem] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Employee_EOSRule] PRIMARY KEY CLUSTERED 
(
	[EOSRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_EOSRule_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_EOSRule_Detail](
	[EOSRuleID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[ResignedType] [nvarchar](30) NOT NULL,
	[YearFrom] [int] NULL,
	[YearTo] [int] NULL,
	[EOSDay] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_EOSSettlement]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_EOSSettlement](
	[EmployeeID] [nvarchar](64) NOT NULL,
	[LastWorkingDate] [datetime] NULL,
	[EOSBenefit] [money] NULL,
	[LeaveDue] [int] NULL,
	[DueAmount] [money] NULL,
	[SalaryDue] [money] NULL,
	[OtherBenefits] [money] NULL,
	[TotalPayable] [money] NULL,
	[Loan] [money] NULL,
	[TicketAmount] [money] NULL,
	[OtherDeductionID] [nvarchar](30) NULL,
	[DeductionAmount] [money] NULL,
	[NetTotal] [money] NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_EOSSettlement] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_GeneralActivity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_GeneralActivity](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[Subject] [nvarchar](30) NULL,
	[TransactionDate] [datetime] NULL,
	[ActivityType] [tinyint] NULL,
	[Reason] [nvarchar](255) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[GeneralActivityTypeID] [nvarchar](15) NULL,
	[Rating] [tinyint] NULL,
	[Reference] [nvarchar](15) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Note] [nvarchar](1000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_GeneralActivity] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Grade]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Grade](
	[GradeID] [nvarchar](15) NOT NULL,
	[GradeName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Emp_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Group](
	[GroupID] [nvarchar](15) NOT NULL,
	[GroupName] [nvarchar](30) NOT NULL,
	[Inactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Journal]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Journal](
	[EmpJournalID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[JournalID] [int] NULL,
	[JournalDate] [datetime] NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[DebitFC] [money] NULL,
	[CreditFC] [money] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[ChequeNumber] [nvarchar](15) NULL,
	[ChequeDate] [datetime] NULL,
	[BankID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[AccountID] [nvarchar](64) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[Reference] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
 CONSTRAINT [PK_Employee_Journal] PRIMARY KEY CLUSTERED 
(
	[EmpJournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Leave_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Leave_Detail](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[LeaveTypeID] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[Days] [smallint] NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Employee_Leave_Detail] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[LeaveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Leave_Encashment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Leave_Encashment](
	[ActivityID] [int] NOT NULL,
	[EncashNo] [nvarchar](15) NULL,
	[AsOnDate] [datetime] NULL,
	[LeaveEligible] [int] NULL,
	[LeaveEncash] [int] NULL,
	[AmountEncash] [money] NULL,
	[IsApproved] [bit] NULL,
	[ApprovedBy] [nvarchar](15) NULL,
	[ApproveDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Employee_Leave_Encashment] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Leave_Payment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Leave_Payment](
	[ActivityID] [int] NOT NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[LeavePaymentID] [nvarchar](15) NULL,
	[LeaveApplicationNo] [nvarchar](15) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[EligibleDays] [int] NULL,
	[Amount] [money] NULL,
	[TicketAmount] [money] NULL,
	[SalaryAmount] [money] NULL,
	[DeductionID] [nvarchar](30) NULL,
	[DeductionAmount] [money] NULL,
	[BasedOnLeaveTaken] [bit] NULL,
	[Total] [money] NULL,
	[IsApproved] [bit] NULL,
	[ApprovedBy] [nvarchar](15) NULL,
	[ApproveDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Employee_Leave_Payment] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Leave_Process]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Leave_Process](
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Note] [nvarchar](100) NULL,
	[EmployeeID] [nvarchar](15) NULL,
	[EmployeeName] [nvarchar](64) NULL,
	[Days] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[RowIndex] [int] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Leave_Request]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Leave_Request](
	[ActivityID] [int] NOT NULL,
	[DocNumber] [nvarchar](15) NULL,
	[LeaveTypeID] [nvarchar](15) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[TravellingDate] [datetime] NULL,
	[ActualLeaveDays] [int] NULL,
	[LastWorkingDate] [datetime] NULL,
	[TicketEntitle] [bit] NULL,
	[ReplacementID] [nvarchar](64) NULL,
	[IsApproved] [bit] NULL,
	[IsClosed] [bit] NULL,
	[IsVoid] [bit] NULL,
	[IsPaid] [bit] NULL,
	[ApprovedBy] [nvarchar](15) NULL,
	[ApproveDate] [datetime] NULL,
	[ResumptionDate] [datetime] NULL,
	[ApprovalRemarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_Employee_Leave_Request] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Loan]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Loan](
	[SysDocID] [nvarchar](15) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[LoanAccountID] [nvarchar](64) NULL,
	[EmployeeAccountID] [nvarchar](64) NULL,
	[TransactionDate] [datetime] NULL,
	[LoanType] [nvarchar](15) NULL,
	[Amount] [money] NULL,
	[InstallmentAmount] [money] NULL,
	[DedStartDate] [datetime] NULL,
	[PaidAmount] [money] NULL,
	[DiscountAmount] [money] NULL,
	[DiscountDate] [datetime] NULL,
	[Reason] [nvarchar](255) NULL,
	[Reference] [nvarchar](15) NULL,
	[Note] [nvarchar](1000) NULL,
	[IsVoid] [bit] NULL,
	[IsClosed] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Loan_1] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Loan_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Loan_Detail](
	[LoanSysDocID] [nvarchar](7) NULL,
	[LoanVoucherID] [nvarchar](15) NULL,
	[PaymentSysDocID] [nvarchar](7) NULL,
	[PaymentVoucherID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Loan_Payment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Loan_Payment](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[LoanSysDocID] [nvarchar](7) NOT NULL,
	[LoanVoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [money] NOT NULL,
	[EmployeeID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Reference] [nvarchar](20) NULL,
	[Note] [nvarchar](1000) NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Loan_Payment] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Loan_Settlement]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Loan_Settlement](
	[SysDocID] [nvarchar](15) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[LoanSysDocID] [nvarchar](7) NULL,
	[LoanVoucherID] [nvarchar](15) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[LoanAccountID] [nvarchar](64) NULL,
	[EmployeeAccountID] [nvarchar](64) NULL,
	[TransactionDate] [datetime] NULL,
	[LoanType] [nvarchar](15) NULL,
	[Amount] [money] NULL,
	[SettlementAmount] [money] NULL,
	[Note] [nvarchar](1000) NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Loan_Settlement] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Loan_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Loan_Type](
	[LoanTypeID] [nvarchar](15) NOT NULL,
	[LoanTypeName] [nvarchar](64) NULL,
	[AccountID] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Employee_Loan_Type_Inactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_OverTime]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee_OverTime](
	[OverTimeID] [nvarchar](15) NOT NULL,
	[OverTimeName] [nvarchar](64) NULL,
	[IsFixed] [bit] NULL,
	[FixedAmount] [money] NULL,
	[FactorType] [char](1) NULL,
	[Factor] [decimal](18, 5) NULL,
	[AccountID] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_OverTime] PRIMARY KEY CLUSTERED 
(
	[OverTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Employee_Passport_Control]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Passport_Control](
	[ActivityID] [int] NOT NULL,
	[DocNumber] [nvarchar](15) NULL,
	[ReasonID] [nvarchar](15) NULL,
	[TransactionDate] [datetime] NULL,
	[PPReleaseDate] [datetime] NULL,
	[PPReturnDate] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[IssuedBy] [nvarchar](50) NULL,
	[AcceptedBy] [nvarchar](50) NULL,
	[Note] [nvarchar](250) NULL,
	[ReturnNote] [nvarchar](250) NULL,
 CONSTRAINT [PK_Employee_Passport_Control] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_PayrollItem_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_PayrollItem_Detail](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[PayrollItemID] [nvarchar](15) NOT NULL,
	[PayType] [tinyint] NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Amount] [money] NULL,
	[LastAmount] [money] NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Employee_Allowance_Detail] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[PayrollItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_PayrollItem_History]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_PayrollItem_History](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[PayrollItemID] [nvarchar](15) NOT NULL,
	[PayType] [tinyint] NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[LastRevisedSalaryDate] [datetime] NULL,
	[Amount] [money] NULL,
	[LastAmount] [money] NULL,
	[RowIndex] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Performance]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Performance](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[FromMonth] [datetime] NULL,
	[ToMonth] [datetime] NULL,
	[EmployeeID] [nvarchar](15) NULL,
	[PositionID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Performance] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Performance_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Performance_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[PerformanceParameter] [ntext] NULL,
	[Score] [decimal](15, 2) NULL,
	[MinusScore] [decimal](15, 2) NULL,
	[PlusScore] [decimal](15, 2) NULL,
	[Remarks] [nvarchar](500) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Promotion]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Promotion](
	[ActivityID] [int] NOT NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[FromGrade] [nvarchar](15) NULL,
	[ToGrade] [nvarchar](15) NULL,
	[FromPosition] [nvarchar](15) NULL,
	[ToPosition] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Promotion] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Provision]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Provision](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[ProvisionTypeID] [nvarchar](15) NULL,
	[Reference] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Provision] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Provision_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Provision_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[ServicePeriod] [decimal](10, 4) NULL,
	[DueAmount] [money] NULL,
	[Posted] [money] NULL,
	[CurrentAmount] [money] NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Provision_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Provision_Type](
	[ProvisionTypeID] [nvarchar](15) NOT NULL,
	[ProvisionTypeName] [nvarchar](64) NULL,
	[ExpenseAccountID] [nvarchar](64) NULL,
	[ProvisionAccountID] [nvarchar](64) NULL,
	[ProvisionFor] [int] NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employee_Provision_Type] PRIMARY KEY CLUSTERED 
(
	[ProvisionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Rehire]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Rehire](
	[ActivityID] [int] NOT NULL,
	[RequestedBy] [nvarchar](30) NULL,
 CONSTRAINT [PK_Employee_Rehire] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Resumption]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Resumption](
	[ActivityID] [int] NOT NULL,
	[LeaveID] [int] NULL,
 CONSTRAINT [PK_Employee_Resumption] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Skill_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Skill_Detail](
	[EmployeeID] [nvarchar](15) NOT NULL,
	[SkillID] [nvarchar](15) NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[SkillLevel] [nvarchar](15) NULL,
	[RowIndex] [smallint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Employee_Skill_Detail] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Termination]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee_Termination](
	[ActivityID] [int] NOT NULL,
	[TerminationType] [char](1) NULL,
	[RequestedBy] [nvarchar](30) NULL,
 CONSTRAINT [PK_Employee_Termination] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Employee_Transfer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee_Transfer](
	[ActivityID] [int] NOT NULL,
	[TransferFromLocation] [nvarchar](15) NULL,
	[TransferToLocation] [nvarchar](15) NULL,
	[TransferFromDep] [nvarchar](15) NULL,
	[TransferToDep] [nvarchar](15) NULL,
	[TransferFromDivision] [nvarchar](15) NULL,
	[TransferToDivision] [nvarchar](15) NULL,
	[FromPosition] [nvarchar](15) NULL,
	[ToPosition] [nvarchar](15) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[Period] [char](1) NULL,
 CONSTRAINT [PK_Employee_Transfer] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Employee_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NULL,
	[IsPayroll] [bit] NULL,
	[AccountID] [nvarchar](64) NULL,
	[EOSID] [nvarchar](15) NULL,
	[LeaveSelection] [char](10) NULL,
	[CalendarID] [nvarchar](50) NULL,
	[DefaultOTTypeID] [nvarchar](30) NULL,
	[Inactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Employee_Type_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Type_Detail](
	[TypeID] [nvarchar](15) NULL,
	[LeaveTypeID] [nvarchar](15) NULL,
	[OTTypeID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityID] [nvarchar](15) NULL,
	[EntityName] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[EntityType] [tinyint] NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity_Address]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Address](
	[AddressID] [nvarchar](15) NOT NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[ContactName] [nvarchar](64) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address1] [nvarchar](64) NULL,
	[Address2] [nvarchar](64) NULL,
	[Address3] [nvarchar](64) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Department] [nvarchar](30) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](64) NULL,
	[Website] [nvarchar](255) NULL,
	[Comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_Entity_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity_Category]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Category](
	[CategoryID] [nvarchar](15) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[EntityType] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[ParentCategoryID] [nvarchar](15) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Entity_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity_Category_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Category_Detail](
	[EntityID] [nvarchar](64) NOT NULL,
	[CategoryID] [nvarchar](15) NOT NULL,
	[EntityType] [tinyint] NOT NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Entity_Category_Detail_1] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC,
	[CategoryID] ASC,
	[EntityType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity_Comments]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[EntityType] [tinyint] NULL,
	[EntityID] [nvarchar](64) NULL,
	[EntitySysDocID] [nvarchar](7) NULL,
	[RowIndex] [int] NULL,
	[Note] [nvarchar](4000) NULL,
	[UserID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Entity_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity_Contacts]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Contacts](
	[EntityType] [tinyint] NOT NULL,
	[EntityID] [nvarchar](64) NOT NULL,
	[ContactID] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Entity_Contacts] PRIMARY KEY CLUSTERED 
(
	[EntityType] ASC,
	[EntityID] ASC,
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity_Flag]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Flag](
	[FlagID] [int] IDENTITY(1,1) NOT NULL,
	[FlagName] [nvarchar](100) NOT NULL,
	[EntityType] [tinyint] NULL,
	[Color] [int] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Entity_Flag] PRIMARY KEY CLUSTERED 
(
	[FlagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity_Flag_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Flag_Detail](
	[EntityID] [nvarchar](64) NOT NULL,
	[FlagID] [nvarchar](15) NOT NULL,
	[EntityType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Entity_Flag_Detail] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC,
	[FlagID] ASC,
	[EntityType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity_Notes]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Notes](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[EntityType] [tinyint] NULL,
	[EntityID] [nvarchar](64) NULL,
	[EntitySysDocID] [nvarchar](7) NULL,
	[RowIndex] [int] NULL,
	[Note] [nvarchar](4000) NULL,
	[UserID] [nvarchar](15) NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Entity_Notes] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EntityDocs]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityDocs](
	[DocID] [int] IDENTITY(1,1) NOT NULL,
	[EntityID] [nvarchar](64) NOT NULL,
	[EntityType] [tinyint] NOT NULL,
	[EntityDocName] [nvarchar](150) NOT NULL,
	[EntitySysDocID] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[EntityDocPath] [nvarchar](250) NULL,
	[EntityDocDesc] [nvarchar](255) NULL,
	[EntityDocKeyword] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_EntityDocs] PRIMARY KEY CLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EOY_Product]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EOY_Product](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[FiscalYearID] [nvarchar](15) NOT NULL,
	[FiscalYear] [int] NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NULL,
	[AvgCost] [decimal](18, 5) NULL,
	[LocationID] [nvarchar](15) NOT NULL,
	[IsConsignLocation] [bit] NULL,
	[AssetValue] [decimal](18, 5) NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_EOY_Product] PRIMARY KEY CLUSTERED 
(
	[FiscalYearID] ASC,
	[ProductID] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [nvarchar](15) NOT NULL,
	[EquipmentName] [nvarchar](64) NULL,
	[Description] [nvarchar](64) NULL,
	[AssetID] [nvarchar](15) NULL,
	[BillingRate] [money] NULL,
	[BillingUnit] [tinyint] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event_Employee]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Employee](
	[EventID] [nvarchar](15) NOT NULL,
	[EmployeeID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [nvarchar](15) NOT NULL,
	[EventName] [nvarchar](64) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Type] [nvarchar](15) NULL,
	[LeadID] [nvarchar](64) NULL,
	[IsInactive] [bit] NULL,
	[AreaID] [nvarchar](15) NULL,
	[UserID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expense_Code]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense_Code](
	[ExpenseID] [nvarchar](15) NOT NULL,
	[ExpenseName] [nvarchar](64) NULL,
	[Description] [nvarchar](64) NULL,
	[Remarks] [nvarchar](64) NULL,
	[AccountID] [nvarchar](64) NULL,
	[ExpenseType] [tinyint] NULL,
	[ExpenseRate] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Expense_Code] PRIMARY KEY CLUSTERED 
(
	[ExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Export_PackingList]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export_PackingList](
	[SysDocID] [nvarchar](6) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[ContainerNumber] [nvarchar](15) NULL,
	[Port] [nvarchar](15) NULL,
	[ETA] [datetime] NULL,
	[Status] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[PONumber] [nvarchar](20) NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[Shipper] [nvarchar](15) NULL,
	[ClearingAgent] [nvarchar](30) NULL,
	[Weight] [decimal](18, 5) NULL,
	[Note] [nvarchar](4000) NULL,
	[Value] [money] NULL,
	[PackingListTag] [nvarchar](64) NULL,
	[ShipStatus] [bit] NULL,
	[IsInvoiced] [bit] NULL,
	[IsShipment] [bit] NULL,
	[ContainerSizeID] [nvarchar](30) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[License] [nvarchar](30) NULL,
	[Balance] [nvarchar](50) NULL,
	[Terms] [nvarchar](50) NULL,
	[TotalPackages] [int] NULL,
	[CountryofOrigin] [nvarchar](75) NULL,
	[Box] [nvarchar](30) NULL,
	[NetWeight] [numeric](15, 2) NULL,
	[GrossWeight] [numeric](15, 2) NULL,
	[Length] [numeric](15, 2) NULL,
	[Width] [numeric](15, 2) NULL,
	[Height] [numeric](15, 2) NULL,
	[CubicMeasure] [numeric](15, 2) NULL,
	[DriverID] [nvarchar](15) NULL,
	[VehicleID] [nvarchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Export_Packing_List] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Export_PackingList_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export_PackingList_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[SourceDocType] [tinyint] NULL,
	[IsSourcedRow] [bit] NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[RowIndex] [tinyint] NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Export_PickList]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export_PickList](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[SourceDocType] [tinyint] NULL,
	[SalesFlow] [tinyint] NULL,
	[CLUserID] [nvarchar](15) NULL,
	[IsExport] [bit] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Port] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[IsInvoiced] [bit] NULL,
	[IsShipped] [bit] NULL,
	[ContainerNumber] [nvarchar](30) NULL,
	[ContainerSizeID] [nvarchar](20) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[DriverID] [nvarchar](15) NULL,
	[VehicleID] [nvarchar](15) NULL,
	[PriceIncludeTax] [bit] NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Export_PickList] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Export_PickList_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export_PickList_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[RowSource] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[External_Report_User_Link]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[External_Report_User_Link](
	[ExternalReportName] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[EntityType] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExternalReport]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalReport](
	[ExternalReportID] [int] IDENTITY(1,1) NOT NULL,
	[ExternalReportName] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Query] [ntext] NULL,
	[ReportData] [image] NULL,
	[CategoryID] [nvarchar](30) NULL,
	[ParentID] [nvarchar](30) NULL,
	[DrillAction] [tinyint] NULL,
	[DrillCardTypeID] [int] NULL,
	[DrillCardIDField] [nvarchar](30) NULL,
	[DrillTransactionSysDocIDField] [nvarchar](30) NULL,
	[DrillTransactionVoucherIDField] [nvarchar](30) NULL,
	[DrillParm1] [nvarchar](30) NULL,
	[DrillParm2] [nvarchar](30) NULL,
	[DrillParm3] [nvarchar](30) NULL,
	[DrillParm4] [nvarchar](30) NULL,
	[IsSubReport] [bit] NULL,
	[DrillSubReportID] [int] NULL,
	[IsPreview] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_ExternalReport] PRIMARY KEY CLUSTERED 
(
	[ExternalReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExternalReport_Category]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalReport_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](30) NULL,
	[ParentID] [nvarchar](30) NULL,
 CONSTRAINT [PK_ExternalReport_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FiscalYear]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiscalYear](
	[FiscalYearID] [nvarchar](15) NOT NULL,
	[FiscalYearName] [nvarchar](64) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PeriodsCount] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[ClosingSysDocID] [nvarchar](7) NULL,
	[ClosingVoucherID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Fiscal_Year] PRIMARY KEY CLUSTERED 
(
	[FiscalYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset](
	[AssetID] [nvarchar](15) NOT NULL,
	[AssetName] [nvarchar](64) NULL,
	[AquesitionDate] [datetime] NULL,
	[AquesitionCost] [money] NULL,
	[AssetClassID] [nvarchar](15) NULL,
	[AssetGroupID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[Life] [int] NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyDivisionID] [nvarchar](15) NULL,
	[DepartmentID] [nvarchar](15) NULL,
	[AssetLocationID] [nvarchar](15) NULL,
	[EmployeeID] [nvarchar](15) NULL,
	[BookValue] [money] NULL,
	[OriginalValue] [money] NULL,
	[SalvageValue] [money] NULL,
	[InvoiceNumber] [nvarchar](30) NULL,
	[PurchasePrice] [money] NULL,
	[PurchaseDate] [datetime] NULL,
	[SupplierName] [nvarchar](64) NULL,
	[PurchaseRemarks] [nvarchar](64) NULL,
	[DepMethod] [tinyint] NULL,
	[OpeningDepAmount] [money] NULL,
	[DepPercent] [decimal](5, 2) NULL,
	[DepFrequency] [tinyint] NULL,
	[AccumDep] [money] NULL,
	[LastDepAmount] [money] NULL,
	[LastDepDate] [datetime] NULL,
	[NextDepDate] [datetime] NULL,
	[NextDepAmount] [money] NULL,
	[DepStartDate] [datetime] NULL,
	[SerialNumber] [nvarchar](30) NULL,
	[BarcodeNumber] [nvarchar](30) NULL,
	[ModelNumber] [nvarchar](30) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Asset] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_BulkPurchase]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_BulkPurchase](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[PayeeID] [nvarchar](64) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[VendorID] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[Quantity] [decimal](15, 2) NULL,
	[LocationID] [nvarchar](15) NULL,
	[AssetClassID] [nvarchar](15) NULL,
	[ItemAmount] [money] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[IsVoid] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[BuyerID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_FixedAsset_BulkPurchase] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_BulkPurchase_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_BulkPurchase_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssetID] [nvarchar](15) NULL,
	[AssetName] [nvarchar](64) NULL,
	[SerialNumber] [nvarchar](30) NULL,
	[BarcodeNumber] [nvarchar](30) NULL,
	[Description] [nvarchar](64) NULL,
	[RowIndex] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Class]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Class](
	[AssetClassID] [nvarchar](15) NULL,
	[AssetClassName] [nvarchar](30) NULL,
	[AssetAccountID] [nvarchar](64) NULL,
	[DepAccountID] [nvarchar](64) NULL,
	[ProfitLossAccountID] [nvarchar](64) NULL,
	[AccumDepAccountID] [nvarchar](64) NULL,
	[DepFrequency] [tinyint] NULL,
	[DepMethod] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Dep]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Dep](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[Year] [int] NULL,
	[Month] [tinyint] NULL,
	[Description] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Dep_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Dep_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[FixedAssetID] [nvarchar](15) NULL,
	[YearValue] [money] NULL,
	[CurrentValue] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[DepAmount] [money] NULL,
	[RowIndex] [int] NULL,
	[AssetAccountID] [nvarchar](64) NULL,
	[DepAccountID] [nvarchar](64) NULL,
	[Month] [tinyint] NULL,
	[Year] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Dep_Schedule]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Dep_Schedule](
	[SheduleID] [int] IDENTITY(1,1) NOT NULL,
	[AssetID] [nvarchar](15) NULL,
	[ScheduleDate] [datetime] NULL,
	[DepAmount] [money] NULL,
	[IsRecorded] [bit] NULL,
	[TransactionDate] [datetime] NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherNumber] [nvarchar](15) NULL,
	[Month] [tinyint] NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_FixedAsset_Dep_Schedule] PRIMARY KEY CLUSTERED 
(
	[SheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Group](
	[AssetGroupID] [nvarchar](15) NOT NULL,
	[AssetGroupName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Asset_Group] PRIMARY KEY CLUSTERED 
(
	[AssetGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Location]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Location](
	[AssetLocationID] [nvarchar](15) NOT NULL,
	[AssetLocationName] [nvarchar](64) NULL,
	[DepAccountID] [nvarchar](64) NULL,
	[CompanyID] [nvarchar](64) NULL,
	[CountryID] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Asset_Location] PRIMARY KEY CLUSTERED 
(
	[AssetLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Purchase]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Purchase](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[PayeeID] [nvarchar](64) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[VendorID] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[Quantity] [decimal](15, 2) NULL,
	[LocationID] [nvarchar](15) NULL,
	[AssetClassID] [nvarchar](15) NULL,
	[ItemAmount] [money] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[IsVoid] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[BuyerID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Asset_Purchase] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Purchase_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Purchase_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssetID] [nvarchar](15) NULL,
	[AssetName] [nvarchar](64) NULL,
	[SerialNumber] [nvarchar](30) NULL,
	[BarcodeNumber] [nvarchar](30) NULL,
	[Description] [nvarchar](64) NULL,
	[RowIndex] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxAmountFC] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Purchase_Order]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Purchase_Order](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsImport] [bit] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[PurchaseFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[ContainerSizeID] [nvarchar](15) NULL,
	[BuyerID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[PriceIncludeTax] [bit] NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[PortLoading] [nvarchar](15) NULL,
	[PortDestination] [nvarchar](15) NULL,
	[ETA] [datetime] NULL,
	[ETD] [datetime] NULL,
	[ActualReqDate] [datetime] NULL,
	[INCOID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsShipped] [bit] NULL,
	[BOLNo] [nvarchar](20) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_FixedAsset_Purchase_Order] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Purchase_Order_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Purchase_Order_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssetID] [nvarchar](64) NOT NULL,
	[AssetName] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[IsSourcedRow] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL,
	[Remarks] [nvarchar](300) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Sale]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Sale](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[PayeeID] [nvarchar](64) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[Ref] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [money] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Asset_Sale] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Sale_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Sale_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssetID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Price] [money] NULL,
	[RowIndex] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxAmountFC] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Transfer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Transfer](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssetID] [nvarchar](15) NULL,
	[TransactionDate] [datetime] NULL,
	[DivisionFromID] [nvarchar](15) NULL,
	[DivisionToID] [nvarchar](15) NULL,
	[DepartmentFromID] [nvarchar](15) NULL,
	[DepartmentToID] [nvarchar](15) NULL,
	[LocationFromID] [nvarchar](15) NULL,
	[LocationToID] [nvarchar](15) NULL,
	[EmployeeFromID] [nvarchar](15) NULL,
	[EmployeeToID] [nvarchar](15) NULL,
	[Reference] [nvarchar](15) NULL,
	[TransferType] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Asset_Transfer] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FixedAsset_Transfer_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset_Transfer_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[AssetID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Reference] [nvarchar](15) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormList_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormList_Details](
	[FormType] [tinyint] NULL,
	[FormID] [nvarchar](50) NULL,
	[ControlID] [nvarchar](50) NULL,
	[ListValue] [nvarchar](50) NULL,
	[ListName] [nvarchar](50) NULL,
	[ValueIndex] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormMenuSubstituteText]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormMenuSubstituteText](
	[FormID] [int] NOT NULL,
	[FormText] [nvarchar](250) NULL,
	[MenuText] [nvarchar](250) NULL,
	[AliasName] [nvarchar](250) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Freight_Charge]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Freight_Charge](
	[SysDocID] [nvarchar](6) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Status] [tinyint] NULL,
	[Inactive] [bit] NULL,
	[IsVoid] [bit] NULL,
	[Discount] [money] NULL,
	[TaxAmount] [money] NULL,
	[Total] [money] NULL,
	[ValidDateFrom] [datetime] NULL,
	[ValidDateTo] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Freight_Charge] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Freight_Charge_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Freight_Charge_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ShippingCompanyID] [nvarchar](64) NULL,
	[SourcePortID] [nvarchar](15) NULL,
	[DestinationPortID] [nvarchar](15) NULL,
	[TypeID] [nvarchar](15) NULL,
	[Remarks] [nvarchar](255) NULL,
	[ContainerSizeID] [nvarchar](30) NULL,
	[FreeDays] [real] NULL,
	[TransitDays] [real] NULL,
	[Amount] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Garment_Rental]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garment_Rental](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[PackageID] [nvarchar](15) NULL,
	[ExpReturnDate] [datetime] NULL,
	[OutDate] [datetime] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[IsClosed] [bit] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[Charges] [money] NULL,
	[Total] [money] NULL,
	[CashAmount] [money] NULL,
	[CashAccountID] [nvarchar](15) NULL,
	[CardAccountID] [nvarchar](15) NULL,
	[CardAmount] [money] NULL,
	[AmountPaid] [money] NULL,
	[Balance] [money] NULL,
	[ReceiptVoucherID] [nvarchar](15) NULL,
	[ReceiptVoucherAmount] [money] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Garment_Rental] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Garment_Rental_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garment_Rental_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantitySettled] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[PackageID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[Amount] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Garment_Rental_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garment_Rental_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[RegisterID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[Charges] [money] NULL,
	[Total] [money] NULL,
	[CashAmount] [money] NULL,
	[CashAccountID] [nvarchar](15) NULL,
	[CardAccountID] [nvarchar](15) NULL,
	[CardAmount] [money] NULL,
	[AmountPaid] [money] NULL,
	[Balance] [money] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[IsDelivered] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Garment_Rental_Return] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Garment_Rental_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garment_Rental_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gauge_Range]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gauge_Range](
	[RangeID] [nvarchar](15) NOT NULL,
	[CustomReportType] [tinyint] NOT NULL,
	[CustomReportID] [nvarchar](15) NOT NULL,
	[StartValue] [float] NULL,
	[EndValue] [float] NULL,
	[Color] [nvarchar](15) NULL,
	[RangeColor] [int] NULL,
 CONSTRAINT [PK_Gauge_Range] PRIMARY KEY CLUSTERED 
(
	[RangeID] ASC,
	[CustomReportType] ASC,
	[CustomReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[General_Payment_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[General_Payment_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SourceSysDocID] [nvarchar](7) NOT NULL,
	[SourceVoucherID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [money] NOT NULL,
	[PayeeID] [nvarchar](64) NOT NULL,
	[PayeeType] [nvarchar](15) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Reference] [nvarchar](20) NULL,
	[Note] [nvarchar](1000) NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_General_Payment_Detail] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[General_Security]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[General_Security](
	[SecurityRoleID] [smallint] NULL,
	[IsAllowed] [bit] NULL,
	[UserID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](15) NULL,
	[intVal] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Generic_List]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generic_List](
	[GenericListType] [smallint] NOT NULL,
	[GenericListID] [nvarchar](15) NOT NULL,
	[GenericListName] [nvarchar](64) NULL,
	[GenericListShortName] [nvarchar](20) NULL,
	[Inactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Combo_List] PRIMARY KEY CLUSTERED 
(
	[GenericListType] ASC,
	[GenericListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GL_Setup]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_Setup](
	[CompanyID] [char](1) NULL,
	[AccountCustomFieldName1] [nvarchar](15) NULL,
	[AccountCustomFieldName2] [nvarchar](15) NULL,
	[AccountCustomFieldName3] [nvarchar](15) NULL,
	[AccountCustomFieldName4] [nvarchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[GL_Transaction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_Transaction](
	[TransactionID] [int] NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[POSShiftID] [int] NULL,
	[POSBatchID] [int] NULL,
	[IsPOS] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[SecondRegisterID] [nvarchar](15) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ExpAmount] [money] NULL,
	[ExpCode] [nvarchar](30) NULL,
	[ExpPercent] [decimal](18, 0) NULL,
	[IsDebit] [bit] NULL,
	[TransactionDate] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[GLType] [tinyint] NULL,
	[JournalID] [int] NULL,
	[TransferFromType] [char](1) NULL,
	[TransferToType] [char](1) NULL,
	[ChequeID] [int] NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[CheckNumber] [nvarchar](15) NULL,
	[CheckDate] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[FirstAccountID] [nvarchar](64) NULL,
	[SecondAccountID] [nvarchar](64) NULL,
	[TransactionStatus] [tinyint] NULL CONSTRAINT [DF_Transaction_TransactionStatus]  DEFAULT ((1)),
	[EmployeeID] [nvarchar](64) NULL,
	[ReasonID] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[TypeID] [int] NULL,
	[AnalysisID] [nvarchar](30) NULL,
	[RequestSysDocID] [nvarchar](7) NULL,
	[RequestVoucherID] [nvarchar](15) NULL,
	[IsSecondForm] [bit] NULL,
	[CheckDeliveredDate] [datetime] NULL,
	[TaxGroupID] [nvarchar](30) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Global Preferences]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global Preferences](
	[ID] [int] NOT NULL,
	[UserID] [nvarchar](15) NULL,
	[IsCurrentUser] [bit] NULL,
 CONSTRAINT [PK_Personals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GRN_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRN_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsCash] [bit] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[BuyerID] [nvarchar](64) NULL,
	[PurchaseFlow] [tinyint] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[PONumber] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_GRN_Return] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GRN_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRN_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[LocationID] [nvarchar](15) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[OrderRowIndex] [int] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Holiday_Calendar]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday_Calendar](
	[CalendarID] [nvarchar](64) NOT NULL,
	[CalendarName] [nvarchar](64) NOT NULL,
	[OffDays] [nvarchar](50) NULL,
	[OffDateFrom] [datetime] NULL,
	[OffDateTo] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[IsInactive] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Holiday_Calendar] PRIMARY KEY CLUSTERED 
(
	[CalendarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Holiday_Calendar_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday_Calendar_Detail](
	[CalendarID] [nvarchar](64) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Days] [int] NULL,
	[HolidayType] [nchar](10) NULL,
	[Remarks] [nvarchar](100) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Horse_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horse_Document](
	[HorseID] [nvarchar](15) NOT NULL,
	[DocumentNumber] [nvarchar](30) NOT NULL,
	[DocumentTypeID] [nvarchar](15) NOT NULL,
	[IssuePlace] [nvarchar](15) NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [smallint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Horse_Docs] PRIMARY KEY CLUSTERED 
(
	[HorseID] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Horse_Sex]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horse_Sex](
	[HorseSexID] [nvarchar](15) NOT NULL,
	[HorseSexName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Horse_Summary]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horse_Summary](
	[HorseCode] [nvarchar](50) NOT NULL,
	[HorseName] [nvarchar](50) NULL,
	[HorseType] [nvarchar](50) NULL,
	[RegisterNumber] [nvarchar](50) NULL,
	[IsInactive] [bit] NULL,
	[MicroChipNumber] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[Breed] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Colour] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[OwnershipTypeID] [nvarchar](50) NULL,
	[CategoryID] [nvarchar](50) NULL,
	[Sire] [nvarchar](50) NULL,
	[Dam] [nvarchar](50) NULL,
	[SireOfDam] [nvarchar](50) NULL,
	[Photo] [image] NULL,
	[CountryOfOrigin] [nvarchar](50) NULL,
	[CurrentOwnerShip] [nvarchar](50) NULL,
	[PreviousOwnership] [nvarchar](50) NULL,
	[OwnerShipChangedDate] [datetime] NULL,
	[Breeder] [nvarchar](50) NULL,
	[LocationID] [nvarchar](50) NULL,
	[RiderID] [nvarchar](50) NULL,
	[CareTaker] [nvarchar](50) NULL,
	[PassportIssueDate] [datetime] NULL,
	[PassportExpiryDate] [datetime] NULL,
	[RevalidationDate] [datetime] NULL,
	[ImportedFrom] [nvarchar](50) NULL,
	[ImportedDate] [datetime] NULL,
	[PastPerformance] [nvarchar](50) NULL,
	[ExportedTo] [nvarchar](50) NULL,
	[ReceivedFrom] [nvarchar](50) NULL,
	[ReceivedDate] [datetime] NULL,
	[TransferredTo] [nvarchar](50) NULL,
	[TransferredDate] [datetime] NULL,
	[SoldAt] [nvarchar](50) NULL,
	[SoldDate] [datetime] NULL,
	[SexChangedFrom] [nvarchar](50) NULL,
	[SexChangedDate] [datetime] NULL,
	[OwnerShipTransferDate] [datetime] NULL,
	[DeadDate] [datetime] NULL,
	[UserDefined1] [nvarchar](64) NULL,
	[UserDefined2] [nvarchar](64) NULL,
	[UserDefined3] [nvarchar](64) NULL,
	[UserDefined4] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Horse_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horse_Type](
	[HorseTypeID] [nvarchar](15) NOT NULL,
	[HorseTypeName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INCO]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INCO](
	[INCOID] [nvarchar](15) NOT NULL,
	[INCOName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_INCO] PRIMARY KEY CLUSTERED 
(
	[INCOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Industry]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Industry](
	[IndustryID] [nvarchar](15) NOT NULL,
	[IndustryName] [nvarchar](64) NOT NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Industry] PRIMARY KEY CLUSTERED 
(
	[IndustryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Insurance_Provider]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance_Provider](
	[InsuranceProviderID] [nvarchar](15) NOT NULL,
	[InsuranceProviderName] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsInactive] [bit] NULL,
	[IsMedical] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Insurance_Provider] PRIMARY KEY CLUSTERED 
(
	[InsuranceProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Adjustment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Adjustment](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransactionDate] [datetime] NULL,
	[LocationID] [nvarchar](15) NULL,
	[Reference] [nvarchar](20) NULL,
	[AdjustmentTypeID] [nvarchar](15) NULL,
	[AccountID] [nvarchar](64) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Inventory_Adjustment] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Adjustment_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory_Adjustment_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[Cost] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[ListVoucherID] [nvarchar](15) NULL,
	[ListSysDocID] [nvarchar](7) NULL,
	[ListRowIndex] [int] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Inventory_Damage]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Damage](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransactionDate] [datetime] NULL,
	[LocationID] [nvarchar](15) NULL,
	[Reference] [nvarchar](20) NULL,
	[AdjustmentTypeID] [nvarchar](15) NULL,
	[AccountID] [nvarchar](64) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Inventory_Damage] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Damage_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory_Damage_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[Cost] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Inventory_Dismantle]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Dismantle](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[DimantledProductID] [nvarchar](64) NULL,
	[QuantityDismantled] [decimal](18, 5) NULL,
	[UnitCost] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Inventory_Dismantle] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Dismantle_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Dismantle_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Cost_Percent] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitCost] [decimal](18, 5) NULL,
	[LocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
	[ITRowID] [int] NULL,
 CONSTRAINT [PK_Inventory_Dismantle_Detail] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Dismantle_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory_Dismantle_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Inventory_Repacking]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Repacking](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[RepackedProductID] [nvarchar](64) NULL,
	[QuantityRepacked] [decimal](18, 5) NULL,
	[UnitCost] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Packed_Item] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Repacking_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Repacking_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitCost] [decimal](18, 5) NULL,
	[LocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
	[ITRowID] [int] NULL,
 CONSTRAINT [PK_Packet_Item_Detail] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Repacking_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory_Repacking_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Inventory_Transactions]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory_Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[SysDocType] [int] NULL,
	[TransactionDate] [datetime] NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[LotNumber] [nvarchar](10) NULL,
	[RowIndex] [int] NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[EqWorkOrderID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[DivisionID] [nvarchar](15) NULL,
	[LocationID] [nvarchar](15) NULL,
	[ReturnedQuantity] [decimal](18, 5) NULL,
	[FOCQuantity] [decimal](18, 5) NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Discount] [decimal](18, 5) NULL,
	[AverageCost] [decimal](18, 5) NULL,
	[AssetValue] [money] NULL,
	[Reference] [nvarchar](20) NULL,
	[Description] [nvarchar](255) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[TransactionType] [tinyint] NULL,
	[Narration] [nvarchar](255) NULL,
	[Cost] [decimal](18, 5) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[IsNonCostedGRN] [bit] NULL,
	[IsVoid] [bit] NULL,
	[IsRecost] [bit] NULL,
	[RefSysDocID] [nvarchar](7) NULL,
	[RefVoucherID] [nvarchar](15) NULL,
	[RefRowIndex] [int] NULL,
	[RefTransactionID] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Inventory Costs] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Inventory_Transfer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Transfer](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransferTypeID] [nvarchar](15) NULL,
	[TransferAccountID] [nvarchar](64) NULL,
	[TransactionDate] [datetime] NULL,
	[LocationFromID] [nvarchar](15) NULL,
	[LocationToID] [nvarchar](15) NULL,
	[Reference] [nvarchar](20) NULL,
	[Description] [nvarchar](255) NULL,
	[VehicleNumber] [nvarchar](15) NULL,
	[DriverID] [nvarchar](15) NULL,
	[AcceptSysDocID] [nvarchar](7) NULL,
	[AcceptVoucherID] [nvarchar](15) NULL,
	[AcceptReference] [nvarchar](20) NULL,
	[AcceptDate] [datetime] NULL,
	[AcceptedBy] [nvarchar](15) NULL,
	[IsAccepted] [bit] NULL,
	[RejectSysDocID] [nvarchar](7) NULL,
	[RejectReference] [nvarchar](20) NULL,
	[RejectDate] [datetime] NULL,
	[RejectNote] [nvarchar](255) NULL,
	[RejectedBy] [nvarchar](15) NULL,
	[IsRejected] [bit] NULL,
	[RejectAcceptSysDocID] [nvarchar](7) NULL,
	[RejectAcceptVoucherID] [nvarchar](15) NULL,
	[RejectAcceptNote] [nvarchar](255) NULL,
	[RejectAcceptDate] [datetime] NULL,
	[RejectAcceptReference] [nvarchar](20) NULL,
	[RejectAcceptedBy] [nvarchar](15) NULL,
	[IsRejectAccepted] [bit] NULL,
	[IsVoid] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Inventory_Transfer] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory_Transfer_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory_Transfer_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[UnitID] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[Remarks] [nvarchar](255) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[AcceptedQuantity] [decimal](18, 5) NULL,
	[AcceptedUnitQuantity] [decimal](18, 5) NULL,
	[AcceptedFactor] [decimal](18, 5) NULL,
	[AcceptedFactorType] [char](1) NULL,
	[RejectedQuantity] [decimal](18, 5) NULL,
	[RejectedUnitQuantity] [decimal](18, 5) NULL,
	[RejectedFactor] [decimal](18, 5) NULL,
	[RejectedFactorType] [char](1) NULL,
	[RowIndex] [int] NULL,
	[ListVoucherID] [nvarchar](15) NULL,
	[ListSysDocID] [nvarchar](7) NULL,
	[ListRowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Inventory_Transfer_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Transfer_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NULL,
	[AccountID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Inventory_Transfer_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_DNote]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_DNote](
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_GRN]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_GRN](
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceNumber] [nvarchar](15) NULL,
	[GRNSysDocID] [nvarchar](7) NULL,
	[GRNNumber] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_Payment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Payment](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[TransactionDate] [datetime] NULL,
	[AccountID] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[PaymentMethodID] [nvarchar](15) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[RegisterID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item_Transaction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Transaction](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SysDocType] [int] NULL,
	[PartyID] [nvarchar](64) NULL,
	[PartyType] [nvarchar](64) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[SourceDocType] [tinyint] NULL,
	[SalesFlow] [tinyint] NULL,
	[CLUserID] [nvarchar](15) NULL,
	[IsExport] [bit] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Port] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[IsInvoiced] [bit] NULL,
	[IsShipped] [bit] NULL,
	[ContainerNumber] [nvarchar](30) NULL,
	[ContainerSizeID] [nvarchar](20) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[DriverID] [nvarchar](15) NULL,
	[VehicleID] [nvarchar](30) NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Item_Transaction] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item_Transaction_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Transaction_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[RowSource] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobID] [nvarchar](50) NOT NULL,
	[JobName] [nvarchar](64) NOT NULL,
	[CustomerID] [nvarchar](64) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[PONumber] [nvarchar](30) NULL,
	[SalesPersonID] [nvarchar](64) NULL,
	[ProjectManagerID] [nvarchar](64) NULL,
	[SiteLocationID] [nvarchar](15) NULL,
	[SiteLocationAddress] [nvarchar](255) NULL,
	[JobTypeID] [nvarchar](15) NULL,
	[WIPAccountID] [nvarchar](64) NULL,
	[IncomeAccountID] [nvarchar](64) NULL,
	[TimesheetContraAccountID] [nvarchar](64) NULL,
	[CostAccountID] [nvarchar](64) NULL,
	[RetentionAccountID] [nvarchar](64) NULL,
	[RetentionItemID] [nvarchar](15) NULL,
	[RetentionDescription] [nvarchar](255) NULL,
	[RetentionPercent] [decimal](5, 2) NULL,
	[RetentionAmount] [money] NULL,
	[RetentionPaid] [money] NULL,
	[RetentionDays] [decimal](18, 5) NULL,
	[RetentionDate] [datetime] NULL,
	[AdvanceAccountID] [nvarchar](64) NULL,
	[AdvanceItemID] [nvarchar](15) NULL,
	[AdvanceDescription] [nvarchar](255) NULL,
	[AdvanceAmount] [money] NULL,
	[AdvanceBilled] [money] NULL,
	[AdvanceApplied] [money] NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[ProjectAmount] [money] NULL,
	[ProjectBudget] [money] NULL,
	[CompletedPercent] [decimal](5, 2) NULL,
	[Reference] [nvarchar](255) NULL,
	[Note] [nvarchar](4000) NULL,
	[Inactive] [bit] NULL,
	[MiscellaneousAmount] [decimal](18, 5) NULL,
	[MiscellaneousVariance] [decimal](18, 5) NULL,
	[LaborAmount] [decimal](18, 5) NULL,
	[LaborVariance] [decimal](18, 5) NULL,
	[OverHeadAmount] [decimal](18, 5) NULL,
	[OverHeadVariance] [decimal](18, 5) NULL,
	[Profit] [decimal](18, 5) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_BOM]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_BOM](
	[JobBOMID] [nvarchar](15) NOT NULL,
	[BOMName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[IsInactive] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_BOM] PRIMARY KEY CLUSTERED 
(
	[JobBOMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_BOM_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_BOM_Detail](
	[JobBOMID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[LabourCost] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Budget]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Budget](
	[JobID] [nvarchar](50) NOT NULL,
	[CostCategoryID] [nvarchar](30) NOT NULL,
	[RowIndex] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitCost] [decimal](18, 5) NULL,
	[TotalCost] [money] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Project_Budget] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC,
	[CostCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Cost_Category]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Cost_Category](
	[CostCategoryID] [nvarchar](30) NULL,
	[CostCategoryName] [nvarchar](64) NULL,
	[Description] [nvarchar](64) NULL,
	[CostTypeID] [tinyint] NULL,
	[ParentCostCategoryID] [nvarchar](30) NULL,
	[AccountID] [nvarchar](64) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Equipment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Equipment](
	[JobID] [nvarchar](50) NOT NULL,
	[EquipmentID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[RowIndex] [tinyint] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Job_Equipment] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC,
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Estimation]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Estimation](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[MaterialOHP] [decimal](15, 2) NULL,
	[LabourOHP] [decimal](15, 2) NULL,
	[OtherOHP] [decimal](15, 2) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Reference] [nvarchar](20) NULL,
	[Note] [nvarchar](255) NULL,
	[LabelC1] [nvarchar](30) NULL,
	[LabelC2] [nvarchar](30) NULL,
	[LabelC3] [nvarchar](30) NULL,
	[LabelC4] [nvarchar](30) NULL,
	[LabelC5] [nvarchar](30) NULL,
	[LabelC6] [nvarchar](30) NULL,
	[LastRevisedDate] [datetime] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Estimation] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Estimation_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Estimation_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[PhaseID] [nvarchar](15) NULL,
	[BOQID] [nvarchar](15) NULL,
	[BOQQuantity] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[CostMarkUp] [decimal](15, 2) NULL,
	[MaterialOHP] [decimal](15, 2) NULL,
	[LabourOHP] [decimal](15, 2) NULL,
	[OtherOHP] [decimal](15, 2) NULL,
	[AttributeC1] [decimal](15, 2) NULL,
	[AttributeC2] [decimal](15, 2) NULL,
	[AttributeC3] [decimal](15, 2) NULL,
	[AttributeC4] [decimal](15, 2) NULL,
	[AttributeC5] [decimal](15, 2) NULL,
	[AttributeC6] [decimal](15, 2) NULL,
	[Remarks] [nvarchar](255) NULL,
	[Total] [decimal](18, 5) NULL,
	[RowRelation] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Estimation_Detail_History]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Estimation_Detail_History](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RevisionNo] [int] NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[PhaseID] [nvarchar](15) NULL,
	[BOQID] [nvarchar](15) NULL,
	[BOQQuantity] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[CostMarkUp] [decimal](15, 2) NULL,
	[MaterialOHP] [decimal](15, 2) NULL,
	[LabourOHP] [decimal](15, 2) NULL,
	[OtherOHP] [decimal](15, 2) NULL,
	[AttributeC1] [decimal](15, 2) NULL,
	[AttributeC2] [decimal](15, 2) NULL,
	[AttributeC3] [decimal](15, 2) NULL,
	[AttributeC4] [decimal](15, 2) NULL,
	[AttributeC5] [decimal](15, 2) NULL,
	[AttributeC6] [decimal](15, 2) NULL,
	[Remarks] [nvarchar](255) NULL,
	[Total] [decimal](18, 5) NULL,
	[RowRelation] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Estimation_Detail_Item]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Estimation_Detail_Item](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[BOQID] [nvarchar](15) NULL,
	[ProductID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitCost] [decimal](18, 5) NULL,
	[UnitLabourCost] [decimal](18, 5) NULL,
	[ActualCost] [decimal](18, 5) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[LabourCost] [decimal](18, 5) NULL,
	[MaterialTotal] [decimal](18, 5) NULL,
	[LabourTotal] [decimal](18, 5) NULL,
	[MaterialOH] [decimal](18, 5) NULL,
	[LabourOH] [decimal](18, 5) NULL,
	[OtherOH] [decimal](18, 5) NULL,
	[NetTotal] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[UnitID] [nvarchar](15) NULL,
	[RowRelation] [int] NULL,
	[Remarks] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Job_Estimation_Detail_Item_History]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Estimation_Detail_Item_History](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RevisionNo] [int] NULL,
	[BOQID] [nvarchar](15) NULL,
	[ProductID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitCost] [decimal](18, 5) NULL,
	[UnitLabourCost] [decimal](18, 5) NULL,
	[ActualCost] [decimal](18, 5) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[LabourCost] [decimal](18, 5) NULL,
	[MaterialTotal] [decimal](18, 5) NULL,
	[LabourTotal] [decimal](18, 5) NULL,
	[MaterialOH] [decimal](18, 5) NULL,
	[LabourOH] [decimal](18, 5) NULL,
	[OtherOH] [decimal](18, 5) NULL,
	[NetTotal] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[UnitID] [nvarchar](15) NULL,
	[RowRelation] [int] NULL,
	[Remarks] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Job_Estimation_History]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Estimation_History](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RevisionNo] [int] NULL,
	[TransactionDate] [datetime] NULL,
	[MaterialOHP] [decimal](15, 2) NULL,
	[LabourOHP] [decimal](15, 2) NULL,
	[OtherOHP] [decimal](15, 2) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Reference] [nvarchar](20) NULL,
	[Note] [nvarchar](255) NULL,
	[LabelC1] [nvarchar](30) NULL,
	[LabelC2] [nvarchar](30) NULL,
	[LabelC3] [nvarchar](30) NULL,
	[LabelC4] [nvarchar](30) NULL,
	[LabelC5] [nvarchar](30) NULL,
	[LabelC6] [nvarchar](30) NULL,
	[LastRevisedDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Expense_Issue]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Expense_Issue](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Expense_Issue] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Expense_Issue_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Expense_Issue_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[RowIndex] [int] NULL,
	[IsBillable] [bit] NULL,
	[IsBilled] [bit] NULL,
	[BilledAmount] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Fee]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Fee](
	[FeeID] [nvarchar](50) NOT NULL,
	[FeeName] [nvarchar](64) NULL,
	[FeeType] [tinyint] NOT NULL,
	[FeeAmount] [money] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Inactive] [bit] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Fee] PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Fee_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Fee_Detail](
	[JobID] [nvarchar](50) NOT NULL,
	[FeeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[RowIndex] [tinyint] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CustomerID] [nvarchar](64) NULL,
 CONSTRAINT [PK_Job_Fee_Detail] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC,
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Fee_Payment_Term]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Fee_Payment_Term](
	[JobID] [nvarchar](50) NULL,
	[FeeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[DueDate] [datetime] NULL,
	[CompletedPercentage] [decimal](5, 2) NULL,
	[Amount] [money] NULL,
	[AmountPercent] [decimal](5, 2) NULL,
	[TermType] [tinyint] NULL,
	[RowIndex] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Fee_Schedule]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Fee_Schedule](
	[ProjectID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[DueDate] [datetime] NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_Project_Fee_Schedule] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Inventory_Issue]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Inventory_Issue](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[RequireUpdate] [bit] NULL,
	[SourceSysDocType] [tinyint] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Inventory_Issue] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Inventory_Issue_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Inventory_Issue_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[JobID] [nvarchar](50) NULL,
	[LocationID] [nvarchar](15) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[RowIndex] [int] NULL,
	[IsBillable] [bit] NULL,
	[IsBilled] [bit] NULL,
	[BilledAmount] [money] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](6) NULL,
	[SourceRowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Job_Inventory_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Inventory_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Inventory_Return] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Inventory_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Inventory_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[JobID] [nvarchar](50) NULL,
	[LocationID] [nvarchar](15) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[Cost] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[BillType] [tinyint] NULL,
	[IsBilled] [bit] NULL,
	[BilledAmount] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Job_Invoice]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Invoice](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[JobID] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[RetentionAmount] [money] NULL,
	[RetentionAmountFC] [money] NULL,
	[RetentionPercent] [decimal](5, 2) NULL,
	[AdvanceAmount] [money] NULL,
	[AdvanceAmountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[SubTotal] [money] NULL,
	[Total] [money] NULL,
	[TotalCOGS] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](30) NULL,
	[IsDelivered] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[RequireUpdate] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Invoice] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Invoice_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Invoice_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ItemType] [tinyint] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[FeeID] [nvarchar](50) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[COGS] [money] NULL,
	[IsRecost] [bit] NULL,
	[RowSource] [tinyint] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[Cost] [money] NULL,
	[CostFC] [money] NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Remarks] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Invoice_SO_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Invoice_SO_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[FeeID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL,
	[Discount] [money] NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[LocationID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[QuantityShipped] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Maintenance_Schedule]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Maintenance_Schedule](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Reference2] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Maintenance_Schedule] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Maintenance_Schedule_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Maintenance_Schedule_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssetID] [nvarchar](64) NULL,
	[ActivityID] [nvarchar](15) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ScheduledOn] [nvarchar](15) NULL,
	[NextScheduleDate] [datetime] NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Maintenance_Service]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Maintenance_Service](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[Reference2] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Maintenance_Service] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Maintenance_Service_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Maintenance_Service_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssetID] [nvarchar](64) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ScheduleDate] [datetime] NULL,
	[NextScheduleDate] [datetime] NULL,
	[ScheduleSysDocID] [nvarchar](7) NULL,
	[ScheduleVoucherID] [nvarchar](15) NULL,
	[ScheduleRowIndex] [int] NULL,
	[RowIndex] [int] NULL,
	[Remarks] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Man_Hrs_Budgeting]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Man_Hrs_Budgeting](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[JobID] [nvarchar](50) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Man_Hrs_Budgeting] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Man_Hrs_Budgeting_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Man_Hrs_Budgeting_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[EmpPositionID] [nvarchar](15) NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[RequiredHrs] [numeric](5, 2) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Amount] [money] NULL,
	[Variance] [numeric](5, 2) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Material_Estimate]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Material_Estimate](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Material_Estimate] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Material_Estimate_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Material_Estimate_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[RequiredOn] [datetime] NULL,
	[RowIndex] [int] NULL,
	[IsBillable] [bit] NULL,
	[IsBilled] [bit] NULL,
	[BilledAmount] [money] NULL,
	[ItemType] [tinyint] NULL,
	[Variance] [real] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Job_Material_Requisition]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Material_Requisition](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](30) NULL,
	[Reference2] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[ReqonDate] [datetime] NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Material_Requisition] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Material_Requisition_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Material_Requisition_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[OnHand] [decimal](18, 5) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[Issued] [decimal](18, 5) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [int] NULL,
	[IsBillable] [bit] NULL,
	[IsBilled] [bit] NULL,
	[BilledAmount] [money] NULL,
	[ItemType] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Job_Task]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Task](
	[TaskID] [nvarchar](15) NOT NULL,
	[JobID] [nvarchar](50) NULL,
	[FeeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ActualStartDate] [datetime] NULL,
	[ActualEndDate] [datetime] NULL,
	[AssignedToID] [nvarchar](64) NULL,
	[FeePercentage] [decimal](5, 2) NULL,
	[CompletedPercentage] [decimal](5, 2) NULL,
	[Status] [tinyint] NULL,
	[CompletedDescription] [nvarchar](255) NULL,
	[TotalHours] [decimal](7, 2) NULL,
	[Note] [ntext] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[TaskGroupID] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Task_1] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Task_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Task_Group](
	[TaskGroupID] [nvarchar](15) NOT NULL,
	[TaskGroupName] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Job_Task_Group] PRIMARY KEY CLUSTERED 
(
	[TaskGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Timesheet]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Timesheet](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[RequestedBy] [nvarchar](30) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[EmployeeID] [nvarchar](15) NULL,
	[Month] [tinyint] NULL,
	[Year] [int] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Timesheet_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Timesheet_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[FeeID] [nvarchar](15) NULL,
	[TaskID] [nvarchar](15) NULL,
	[TaskPercent] [decimal](5, 2) NULL,
	[Description] [nvarchar](255) NULL,
	[TSDate] [datetime] NULL,
	[PayrollItemType] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Unit] [nvarchar](15) NULL,
	[Rate] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[RowIndex] [int] NULL,
	[IsBillable] [bit] NULL,
	[IsBilled] [bit] NULL,
	[BilledAmount] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Type](
	[JobTypeID] [nvarchar](15) NOT NULL,
	[JobTypeName] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[AMCEnabled] [bit] NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Job_Type] PRIMARY KEY CLUSTERED 
(
	[JobTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Vehicle_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Vehicle_Detail](
	[JobID] [nvarchar](50) NOT NULL,
	[VehicleID] [nvarchar](15) NOT NULL,
	[Odometer] [numeric](15, 2) NULL,
	[RegistrationNumber] [nvarchar](15) NULL,
	[Color] [nvarchar](15) NULL,
	[Model] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Vehicle_Detail] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Work_Order]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Work_Order](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AssemblyProductID] [nvarchar](64) NULL,
	[Status] [tinyint] NULL,
	[QuantityBuilt] [decimal](18, 5) NULL,
	[RequiredQuantity] [decimal](18, 5) NULL,
	[BOMID] [nvarchar](15) NULL,
	[UnitCost] [decimal](18, 5) NULL,
	[Description] [nvarchar](30) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Note] [nvarchar](255) NULL,
	[TransactionDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[LocationID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Job_Work_Order] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Work_Order_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Work_Order_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitCost] [decimal](18, 5) NULL,
	[LocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
 CONSTRAINT [PK_Job_Work_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Work_Order_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Work_Order_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](10, 5) NULL,
	[RateType] [char](1) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Journal]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[JournalID] [int] NOT NULL,
	[JournalDate] [datetime] NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SysDocType] [int] NULL,
	[Reference] [nvarchar](30) NULL,
	[Reference2] [nvarchar](30) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[Narration] [nvarchar](255) NULL,
	[Note] [nvarchar](255) NULL,
	[StoreID] [int] NULL,
	[IsVoid] [bit] NULL,
	[STJournalID] [nvarchar](15) NULL,
	[STJYear] [smallint] NULL,
	[STJMonth] [tinyint] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Journal__25010387E4E8CD31] UNIQUE NONCLUSTERED 
(
	[JournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Journal_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal_Details](
	[JournalDetailID] [int] IDENTITY(1,1) NOT NULL,
	[JournalID] [int] NOT NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[DivisionID] [nvarchar](15) NULL,
	[AccountID] [nvarchar](64) NOT NULL,
	[JDDate] [datetime] NULL,
	[DocType] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[DebitFC] [money] NULL,
	[CreditFC] [money] NULL,
	[RowIndex] [smallint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[Reference] [nvarchar](60) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[AnalysisID] [nvarchar](50) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[PaymentMethodType] [tinyint] NULL,
	[BankID] [nvarchar](15) NULL,
	[CheckbookID] [nvarchar](15) NULL,
	[CheckID] [int] NULL,
	[CheckDate] [datetime] NULL,
	[CheckNumber] [nvarchar](15) NULL,
	[IsARAP] [bit] NULL,
	[AllocationID] [int] NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[ConsignID] [nvarchar](22) NULL,
	[ConsignExpenseID] [nvarchar](15) NULL,
	[IsReconciled] [bit] NULL,
	[ReconcileDate] [datetime] NULL,
	[ReconciledBy] [nvarchar](15) NULL,
	[IsBilled] [bit] NULL,
	[AttributeID1] [nvarchar](50) NULL,
	[AttributeID2] [nvarchar](50) NULL,
	[JVEntryType] [tinyint] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
 CONSTRAINT [PK_Journal_Details] PRIMARY KEY CLUSTERED 
(
	[JournalDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lawyer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lawyer](
	[LawyerID] [nvarchar](15) NOT NULL,
	[LawyerName] [nvarchar](64) NOT NULL,
	[SelectionType] [char](10) NULL,
	[PartyID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Lawyer] PRIMARY KEY CLUSTERED 
(
	[LawyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Lead]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead](
	[LeadID] [nvarchar](64) NOT NULL,
	[LeadName] [nvarchar](64) NULL,
	[PrimaryAddressID] [nvarchar](15) NULL,
	[ShortName] [nvarchar](64) NULL,
	[ForeignName] [nvarchar](64) NULL,
	[CompanyName] [nvarchar](64) NULL,
	[ContactName] [nvarchar](64) NULL,
	[LeadSourceID] [nvarchar](15) NULL,
	[LeadOwnerID] [nvarchar](15) NULL,
	[IndustryID] [nvarchar](15) NULL,
	[LeadStatus] [nvarchar](30) NULL,
	[SourceLeadID] [nvarchar](15) NULL,
	[CompanySize] [tinyint] NULL,
	[EmailOptOut] [bit] NULL,
	[AnnualTurnOver] [money] NULL,
	[Rating] [int] NULL,
	[EmployeeCount] [int] NULL,
	[CountryID] [nvarchar](15) NULL,
	[AreaID] [nvarchar](15) NULL,
	[StageID] [nvarchar](15) NULL,
	[SubAreaID] [nvarchar](15) NULL,
	[DateEstablished] [datetime] NULL,
	[IsLeadSince] [datetime] NULL,
	[ReferredBy] [nvarchar](64) NULL,
	[IsInactive] [bit] NULL,
	[ExpectValue] [decimal](15, 2) NULL,
	[Photo] [image] NULL,
	[DivisionID] [nvarchar](15) NULL,
	[ReasonID] [nvarchar](15) NULL,
	[Remarks] [nvarchar](255) NULL,
	[ProfileDetails] [ntext] NULL,
	[Note] [ntext] NULL,
	[SalesPersonID] [nvarchar](64) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Lead] PRIMARY KEY CLUSTERED 
(
	[LeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lead_Activity_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead_Activity_Detail](
	[LeadID] [nvarchar](64) NOT NULL,
	[ActivityID] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[RowIndex] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lead_Address]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead_Address](
	[AddressID] [nvarchar](15) NOT NULL,
	[LeadID] [nvarchar](64) NOT NULL,
	[Suffix] [tinyint] NULL,
	[ContactName] [nvarchar](64) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address1] [nvarchar](64) NULL,
	[Address2] [nvarchar](64) NULL,
	[Address3] [nvarchar](64) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[Gender] [tinyint] NULL,
	[Country] [nvarchar](30) NULL,
	[BirthDay] [datetime] NULL,
	[Children] [nvarchar](255) NULL,
	[Hobbies] [nvarchar](64) NULL,
	[Language] [nvarchar](30) NULL,
	[SpouseName] [nvarchar](64) NULL,
	[Department] [nvarchar](30) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](64) NULL,
	[Website] [nvarchar](255) NULL,
	[Twitter] [nvarchar](30) NULL,
	[Facebook] [nvarchar](255) NULL,
	[Skype] [nvarchar](30) NULL,
	[LinkedIn] [nvarchar](64) NULL,
	[Comment] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[Latitude] [nvarchar](30) NULL,
	[Longitude] [nvarchar](30) NULL,
 CONSTRAINT [PK_Lead_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[LeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lead_Contact_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead_Contact_Detail](
	[LeadID] [nvarchar](64) NOT NULL,
	[ContactID] [nvarchar](64) NOT NULL,
	[JobTitle] [nvarchar](30) NULL,
	[Note] [nvarchar](255) NULL,
	[RowIndex] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lead_Followup_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead_Followup_Details](
	[FollowupID] [nvarchar](64) NOT NULL,
	[LeadID] [nchar](10) NULL,
	[CRMType] [int] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[ThisFollowupDate] [datetime] NULL,
	[NextFollowupDate] [datetime] NULL,
	[ThisFollowupByID] [nvarchar](64) NULL,
	[NextFollowupByID] [nvarchar](64) NULL,
	[ThisFollowupStatusID] [nvarchar](15) NULL,
	[Remark] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Lead_Followup_Details] PRIMARY KEY CLUSTERED 
(
	[FollowupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lead_Source]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead_Source](
	[LeadSourceID] [nvarchar](15) NOT NULL,
	[LeadSourceName] [nvarchar](30) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Lead_Source] PRIMARY KEY CLUSTERED 
(
	[LeadSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lead_Status]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead_Status](
	[LeadStatusID] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Lead_Status] PRIMARY KEY CLUSTERED 
(
	[LeadStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Leave_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave_Type](
	[LeaveTypeID] [nvarchar](15) NOT NULL,
	[LeaveTypeName] [nvarchar](30) NOT NULL,
	[Days] [smallint] NULL CONSTRAINT [DF_Leave_Type_Days]  DEFAULT ((0)),
	[IsPayable] [bit] NULL,
	[IsCumulative] [bit] NULL,
	[IsAnnual] [bit] NULL,
	[ActivateHC] [bit] NULL,
	[DeductionProportion] [float] NULL,
	[AccountID] [nvarchar](64) NULL,
	[MonthGreater1] [int] NULL,
	[MonthLesser1] [int] NULL,
	[AllowedDays1] [decimal](15, 2) NULL,
	[MonthGreater2] [int] NULL,
	[MonthLesser2] [int] NULL,
	[AllowedDays2] [decimal](15, 2) NULL,
	[MonthGreater3] [real] NULL,
	[MonthLesser3] [real] NULL,
	[AllowedDays3] [decimal](15, 2) NULL,
	[IsEncash] [bit] NULL,
	[IsLeaveSettle] [bit] NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Leave_Type] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Legal_Action_Status]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Legal_Action_Status](
	[LegalActionStatusID] [nvarchar](30) NOT NULL,
	[LegalActionStatusName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[IsFinalized] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Legal_Action_Status] PRIMARY KEY CLUSTERED 
(
	[LegalActionStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Legal_Actions]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Legal_Actions](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ActionName] [nvarchar](64) NOT NULL,
	[ActionDateTime] [datetime] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[ParentSysDocID] [nvarchar](7) NULL,
	[ParentVoucherID] [nvarchar](15) NULL,
	[Amount] [decimal](18, 5) NULL,
	[FileNo] [nvarchar](50) NULL,
	[CaseClient1] [nvarchar](15) NULL,
	[CaseClient2] [nvarchar](15) NULL,
	[CasePartyID] [nvarchar](64) NULL,
	[CaseTypeID] [nvarchar](15) NULL,
	[ClientType] [nvarchar](15) NULL,
	[LawyerID] [nvarchar](15) NULL,
	[StatusID] [nvarchar](15) NULL,
	[Note] [nvarchar](4000) NULL,
	[AnalysisID] [nvarchar](50) NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Legal_Actions] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Legal_Actions_Client_List]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Legal_Actions_Client_List](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ClientType] [nvarchar](15) NULL,
	[CaseClient] [nvarchar](15) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Legal_Activity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Legal_Activity](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ActivityName] [nvarchar](64) NOT NULL,
	[ActivityDateTime] [datetime] NULL,
	[ActionName] [nvarchar](64) NULL,
	[ParentSysDocID] [nvarchar](7) NULL,
	[ParentVoucherID] [nvarchar](15) NULL,
	[FileNo] [nvarchar](50) NULL,
	[CaseClient1] [nvarchar](15) NULL,
	[CaseClient2] [nvarchar](15) NULL,
	[CasePartyID] [nvarchar](64) NULL,
	[CaseTypeID] [nvarchar](15) NULL,
	[LawyerID] [nvarchar](15) NULL,
	[StatusID] [nvarchar](15) NULL,
	[ContactID] [nvarchar](15) NULL,
	[OwnerID] [nvarchar](15) NULL,
	[ActDateTime] [datetime] NULL,
	[Note] [nvarchar](4000) NULL,
	[AnalysisID] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Legal_Activity] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ListHiddenFields]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListHiddenFields](
	[FieldID] [nvarchar](15) NOT NULL,
	[CustomReportType] [tinyint] NOT NULL,
	[CustomReportID] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_ListHiddenFields] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC,
	[CustomReportType] ASC,
	[CustomReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loan_Entry]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan_Entry](
	[SysDocID] [nvarchar](15) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[LoanAccountID] [nvarchar](64) NULL,
	[InterestAccountID] [nvarchar](64) NULL,
	[LoanRepaymentAccountID] [nvarchar](64) NULL,
	[LoanDate] [datetime] NULL,
	[LoanAmount] [money] NULL,
	[InstallmentNumber] [nvarchar](15) NULL,
	[DedStartDate] [datetime] NULL,
	[InterestRate] [money] NULL,
	[Description] [nvarchar](1000) NULL,
	[Note] [nvarchar](1000) NULL,
	[LoanTermType] [tinyint] NULL,
	[MonthlyEMI] [money] NULL,
	[IsVoid] [bit] NULL,
	[IsClosed] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Loan_Entry] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loan_Entry_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan_Entry_Detail](
	[LoanSysDocID] [nvarchar](7) NULL,
	[LoanVoucherID] [nvarchar](15) NULL,
	[Installment] [nvarchar](15) NULL,
	[TransactionDate] [datetime] NULL,
	[InstallmentAmount] [money] NULL,
	[Principle] [money] NULL,
	[Interest] [money] NULL,
	[OutStandingPayment] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [nvarchar](15) NOT NULL,
	[LocationName] [nvarchar](64) NOT NULL,
	[LocationType] [tinyint] NULL,
	[SalesAccountID] [nvarchar](64) NULL,
	[COGSAccountID] [nvarchar](64) NULL,
	[InventoryAccountID] [nvarchar](64) NULL,
	[APAccountID] [nvarchar](64) NULL,
	[ARAccountID] [nvarchar](64) NULL,
	[EmployeeAccountID] [nvarchar](64) NULL,
	[SalesTaxAccountID] [nvarchar](64) NULL,
	[PurchaseTaxAccountID] [nvarchar](64) NULL,
	[DiscountGivenAccountID] [nvarchar](64) NULL,
	[DiscountReceivedAccountID] [nvarchar](64) NULL,
	[ExchangeGainLossAccountID] [nvarchar](64) NULL,
	[ProjectWIPAccountID] [nvarchar](64) NULL,
	[ProjectIncomeAccountID] [nvarchar](64) NULL,
	[ProjectCostAccountID] [nvarchar](64) NULL,
	[ProjectTimesheetContraAccountID] [nvarchar](64) NULL,
	[ProjectRetentionAccountID] [nvarchar](64) NULL,
	[ProjectAdvanceAccountID] [nvarchar](64) NULL,
	[ManuWIPAccountID] [nvarchar](64) NULL,
	[ManuTimesheetContraAccountID] [nvarchar](64) NULL,
	[ConsignInAccountID] [nvarchar](64) NULL,
	[ConsignInCommissionAccountID] [nvarchar](64) NULL,
	[ConsignInDiffAccountID] [nvarchar](64) NULL,
	[ConsignOutSalesAccountID] [nvarchar](64) NULL,
	[ConsignOutCOGSAccountID] [nvarchar](64) NULL,
	[UnInvoicedInventoryAccountID] [nvarchar](64) NULL,
	[AllocationDiscountAccountID] [nvarchar](64) NULL,
	[RoundOffAccountID] [nvarchar](64) NULL,
	[PurchasePrePaymentAccountID] [nvarchar](64) NULL,
	[PrepaymentAPAccountID] [nvarchar](64) NULL,
	[IsWarehouse] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[IsConsignOutLocation] [bit] NULL,
	[IsConsignInLocation] [bit] NULL,
	[IsSystem] [bit] NULL,
	[IsPOSLocation] [bit] NULL CONSTRAINT [DF_Location_IsPOSLocation]  DEFAULT ((0)),
	[POSCashAccountID] [nvarchar](64) NULL,
	[POSCardAccountID] [nvarchar](64) NULL,
	[TaxID] [nvarchar](64) NULL,
	[TaxSalesAccountID] [nvarchar](64) NULL,
	[TaxPercent] [decimal](18, 2) NULL,
	[TaxPurchaseAccountID] [nvarchar](64) NULL,
	[LocationCurrencyID] [nvarchar](5) NULL,
	[DefaultCustomerID] [nvarchar](64) NULL,
	[DefaultRegisterID] [nvarchar](15) NULL,
	[LeaveExpenseAccountID] [nvarchar](64) NULL,
	[EOSBenefitAccountID] [nvarchar](64) NULL,
	[ProvisionAccountID] [nvarchar](64) NULL,
	[TicketAccountID] [nvarchar](64) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Location_Inactive]  DEFAULT ((0)),
	[AreaID] [nvarchar](15) NULL,
	[CountryID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocationAccounts_Tax_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationAccounts_Tax_Detail](
	[LocationID] [nvarchar](15) NOT NULL,
	[TaxID] [nvarchar](64) NULL,
	[SalesAccountID] [nvarchar](64) NULL,
	[PurchaseAccountID] [nvarchar](64) NULL,
	[TaxPercent] [decimal](18, 2) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LPO_Receipt]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LPO_Receipt](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SysDocType] [int] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[Total] [money] NULL,
	[Reference] [nvarchar](20) NULL,
	[Note] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[IsReceived] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_LPO_Receipt] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LPO_Receipt_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LPO_Receipt_Details](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[PayeeID] [nvarchar](64) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[Description] [nvarchar](255) NULL,
	[LPONumber] [nvarchar](30) NULL,
	[LPODate] [datetime] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowIndex] [smallint] NULL,
	[Reference] [nvarchar](20) NULL,
	[IsVoid] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Material_Reservation]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_Reservation](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransactionDate] [datetime] NULL,
	[ValidDateFrom] [datetime] NULL,
	[ValidDateTo] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[RequireUpdate] [bit] NULL,
	[Description] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Material_Reservation] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Material_Reservation_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Material_Reservation_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Factor] [decimal](18, 5) NULL,
	[FactorType] [char](1) NULL,
	[Cost] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Matrix_Attribute_Dimension]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matrix_Attribute_Dimension](
	[ProductParentID] [nvarchar](64) NULL,
	[Dimension] [tinyint] NULL,
	[DimensionID] [nvarchar](15) NULL,
	[AttributeID] [nvarchar](15) NULL,
	[AttributeName] [nvarchar](32) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Matrix_Template]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matrix_Template](
	[TemplateID] [nvarchar](15) NOT NULL,
	[TemplateName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Matrix_Template] PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Matrix_Template_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matrix_Template_Detail](
	[TemplateID] [nvarchar](15) NULL,
	[Dimension] [tinyint] NULL,
	[DimensionID] [nvarchar](15) NULL,
	[AttributeID] [nvarchar](15) NULL,
	[AttributeName] [nvarchar](15) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu_Security]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Security](
	[MenuID] [nvarchar](255) NULL,
	[Enable] [bit] NULL,
	[Visible] [bit] NULL,
	[UserID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mfg_Production]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mfg_Production](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[WorkCompDate] [datetime] NULL,
	[JobOrderID] [nvarchar](64) NULL,
	[BOMID] [nvarchar](15) NULL,
	[RouteID] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Reference] [nvarchar](64) NULL,
	[Reference1] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Mfg_Production] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mfg_Production_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mfg_Production_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityBuild] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[CostFC] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[CostAllocation] [decimal](18, 5) NULL,
	[Total] [decimal](18, 5) NULL,
	[TotalFC] [decimal](18, 5) NULL,
	[NextRoute] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mfg_Production_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mfg_Production_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[RateType] [char](1) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Mfg_Production_Raw_Material]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mfg_Production_Raw_Material](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitPrice] [money] NULL,
	[UnitPriceFC] [money] NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[Description] [nvarchar](255) NULL,
	[Reference] [nvarchar](255) NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mfg_Production_Resource]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mfg_Production_Resource](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[EmployeeID] [nvarchar](15) NULL,
	[EmployeeName] [nvarchar](64) NULL,
	[PositionID] [nvarchar](15) NULL,
	[Hour] [decimal](18, 5) NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mfg_Work_Order]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mfg_Work_Order](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[Status] [tinyint] NULL,
	[Description] [nvarchar](30) NULL,
	[Note] [nvarchar](255) NULL,
	[TransactionDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[Reference] [nvarchar](20) NULL,
	[LocationID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Mfg_Work_Order] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mfg_Work_Order_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mfg_Work_Order_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[BOMID] [nvarchar](15) NULL,
	[RouteGroupID] [nvarchar](30) NULL,
	[Remarks] [nvarchar](255) NULL,
 CONSTRAINT [PK_Mfg_Work_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mfg_Work_Order_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mfg_Work_Order_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Modify_Transactions]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modify_Transactions](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[UserID] [nvarchar](64) NULL,
	[IsModify] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Modules]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[ModuleID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleKey] [nvarchar](100) NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[NationalityID] [nvarchar](15) NOT NULL,
	[NationalityName] [nvarchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[NationalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Opening_Balance_Batch]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opening_Balance_Batch](
	[BatchID] [nvarchar](15) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[CompanyID] [tinyint] NULL,
	[DivisionID] [nvarchar](15) NULL,
	[BatchDate] [datetime] NULL,
	[BatchType] [tinyint] NULL,
	[Reference] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[AccountID] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TransactionSysDocID] [nvarchar](7) NULL,
	[LocationID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Opening_Balance_Batch] PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC,
	[SysDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Opening_Balance_Batch_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opening_Balance_Batch_Detail](
	[BatchID] [nvarchar](15) NOT NULL,
	[SysDocID] [nvarchar](7) NULL,
	[TransactionSysDocID] [nvarchar](7) NULL,
	[BatchType] [tinyint] NULL,
	[AccountID] [nvarchar](64) NOT NULL,
	[ProductID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[PurchaseDate] [date] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[InvoiceAmount] [money] NULL,
	[BalanceAmount] [money] NULL,
	[VoucherID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[Reference] [nvarchar](30) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Opening_Balance_Leave]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opening_Balance_Leave](
	[BatchID] [nvarchar](15) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[BatchDate] [datetime] NULL,
	[BatchType] [tinyint] NULL,
	[Reference] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[TransactionSysDocID] [nvarchar](7) NULL,
	[LocationID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Opening_Balance_Leave] PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC,
	[SysDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Opening_Balance_Leave_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opening_Balance_Leave_Detail](
	[BatchID] [nvarchar](15) NOT NULL,
	[SysDocID] [nvarchar](7) NULL,
	[TransactionSysDocID] [nvarchar](7) NULL,
	[BatchType] [tinyint] NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[LeaveTypeID] [nvarchar](15) NULL,
	[LeaveStartDate] [datetime] NULL,
	[LeaveEndDate] [datetime] NULL,
	[LeaveTaken] [numeric](15, 0) NULL,
	[PaidDays] [int] NULL,
	[VoucherID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[Reference] [nvarchar](30) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Opening_Cheque_Issued]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Opening_Cheque_Issued](
	[ChequeID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ChequeNumber] [nvarchar](15) NOT NULL,
	[PayeeType] [varchar](1) NOT NULL,
	[PayeeID] [nvarchar](64) NOT NULL,
	[PayeeAccountID] [nvarchar](64) NULL,
	[BankID] [nvarchar](15) NULL,
	[ChequeDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[ExchangeRate] [decimal](10, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Note] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[Status] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[PDCAccountID] [nvarchar](64) NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[ClearanceDate] [datetime] NULL,
	[BankAccountID] [nvarchar](64) NULL,
	[ClearanceSysDocID] [nvarchar](7) NULL,
	[ClearanceVoucherID] [nvarchar](15) NULL,
	[ClearanceAccountID] [nvarchar](64) NULL,
	[IsPrinted] [bit] NULL,
	[PrintDate] [datetime] NULL,
	[PrintName] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Opening_Cheque_Issued] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[ChequeNumber] ASC,
	[PayeeType] ASC,
	[PayeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Opening_Cheque_Received]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Opening_Cheque_Received](
	[ChequeID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ChequeNumber] [nvarchar](15) NOT NULL,
	[BankID] [nvarchar](15) NOT NULL,
	[PayeeType] [varchar](1) NOT NULL,
	[PayeeID] [nvarchar](64) NOT NULL,
	[PayeeAccountID] [nvarchar](64) NULL,
	[ChequeDate] [datetime] NULL,
	[ReceiptDate] [datetime] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[ExchangeRate] [decimal](10, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ConAmountFC] [money] NULL,
	[ConRate] [decimal](18, 5) NULL,
	[Note] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[Status] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[PDCAccountID] [nvarchar](64) NULL,
	[DepositDate] [datetime] NULL,
	[DepositAccountID] [nvarchar](64) NULL,
	[DepositBankID] [nvarchar](15) NULL,
	[DepositSysDocID] [nvarchar](7) NULL,
	[DepositVoucherID] [nvarchar](15) NULL,
	[SendDate] [datetime] NULL,
	[SendBankAccountID] [nvarchar](64) NULL,
	[SendReference] [nvarchar](20) NULL,
	[DiscountDate] [datetime] NULL,
	[DiscountAccountID] [nvarchar](64) NULL,
	[DiscountBankAccountID] [nvarchar](64) NULL,
	[DiscountSysDocID] [nvarchar](7) NULL,
	[DiscountVoucherID] [nvarchar](15) NULL,
	[DiscountAmount] [money] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Opening_Cheque_Received_Entry] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[ChequeNumber] ASC,
	[BankID] ASC,
	[PayeeType] ASC,
	[PayeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Opportunity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opportunity](
	[OpportunityID] [nvarchar](15) NOT NULL,
	[OpportunityName] [nvarchar](64) NOT NULL,
	[Status] [tinyint] NULL,
	[ClosingDate] [datetime] NULL,
	[Probability] [tinyint] NULL,
	[Amount] [decimal](18, 2) NULL,
	[RelatedID] [nvarchar](64) NULL,
	[RelatedType] [tinyint] NULL,
	[OwnerID] [nvarchar](15) NULL,
	[DueDate] [datetime] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OverTimeEntry]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverTimeEntry](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[Month] [tinyint] NULL,
	[Year] [int] NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovedBy] [nvarchar](15) NULL,
	[ApprovalDate] [datetime] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OverTimeEntry_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverTimeEntry_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[PayrollPeriod] [datetime] NULL,
	[WorkDate] [datetime] NULL,
	[EmployeeID] [nvarchar](15) NOT NULL,
	[EmployeeName] [nvarchar](64) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[LocationID] [nvarchar](15) NULL,
	[FromTime] [datetime] NULL,
	[ToTime] [datetime] NULL,
	[Hours] [decimal](18, 5) NULL,
	[OTHours] [decimal](18, 5) NULL,
	[OTType] [nvarchar](50) NULL,
	[OTRate] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[RowIndex] [int] NULL,
	[LeaveDays] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[CustomerID] [nvarchar](64) NOT NULL,
	[FileOpenDate] [datetime] NULL,
	[FileNo] [nvarchar](64) NULL,
	[FirstName] [nvarchar](150) NULL,
	[MiddleName] [nvarchar](150) NULL,
	[LastName] [nvarchar](150) NULL,
	[NickName] [nvarchar](30) NULL,
	[BloodGroup] [nchar](5) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[BirthDate] [smalldatetime] NULL,
	[BirthPlace] [nvarchar](50) NULL,
	[Photo] [image] NULL,
	[NationalityID] [nvarchar](15) NULL,
	[UID] [nvarchar](50) NULL,
	[ReligionID] [nvarchar](15) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Gender] [char](1) NULL,
	[MaritalStatus] [tinyint] NULL,
	[NationalID] [nvarchar](30) NULL,
	[ChronicsControlID] [nchar](10) NULL,
	[AllergyControlID] [nchar](10) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Patient_Detail_Table]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Detail_Table](
	[CustomerID] [nvarchar](64) NULL,
	[RelativeName] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Relation] [nvarchar](50) NULL,
	[Remarks] [nvarchar](500) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient_Doc_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Doc_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Remind] [bit] NULL,
	[RemindDays] [numeric](3, 0) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Patient_Docs_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Document](
	[CustomerID] [nvarchar](15) NOT NULL,
	[DocumentNumber] [nvarchar](30) NOT NULL,
	[DocumentTypeID] [nvarchar](15) NOT NULL,
	[IssuePlace] [nvarchar](15) NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [smallint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Patient_Docs] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_Allocation_Batch]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment_Allocation_Batch](
	[BatchID] [int] IDENTITY(1,1) NOT NULL,
	[BatchDate] [datetime] NULL,
	[PartyType] [char](1) NULL,
	[PartyID] [nvarchar](64) NULL,
 CONSTRAINT [PK_Payment_Allocation_Batch] PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Payment_Method]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Method](
	[PaymentMethodID] [nvarchar](15) NOT NULL,
	[MethodName] [nvarchar](64) NOT NULL,
	[MethodType] [tinyint] NOT NULL CONSTRAINT [DF_Payment_Method_MethodType]  DEFAULT ((1)),
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DefaultAccountID] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Payment Methods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_Request]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment_Request](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TypeID] [tinyint] NULL,
	[TransactionDate] [datetime] NULL,
	[PayFromID] [nvarchar](64) NULL,
	[PayeeType] [char](1) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[AvailableBal] [money] NULL,
	[CurrentBal] [money] NULL,
	[CurrencyID] [nvarchar](7) NULL,
	[POSysDocID] [nvarchar](7) NULL,
	[POVoucherID] [nvarchar](15) NULL,
	[PLSysDocID] [nvarchar](7) NULL,
	[PLVoucherID] [nvarchar](15) NULL,
	[PaymentRequested] [money] NULL,
	[PaymentRequestedFC] [money] NULL,
	[InvoiceNos] [nvarchar](100) NULL,
	[Authorizedby] [nvarchar](30) NULL,
	[NoofInvoices] [int] NULL,
	[NoofPL] [int] NULL,
	[NoofBOL] [int] NULL,
	[NoofGoods] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reason] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Payment_Request] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Payment_Term]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Term](
	[PaymentTermID] [nvarchar](15) NOT NULL,
	[TermName] [nvarchar](64) NOT NULL,
	[NetDays] [int] NOT NULL,
	[DiscountDays] [tinyint] NOT NULL,
	[DiscountAmount] [money] NULL,
	[DiscountType] [tinyint] NOT NULL,
	[TermType] [tinyint] NOT NULL,
	[IsInstallments] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateUpdated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[PaymentTermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_Term_Installment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Term_Installment](
	[PaymentTermID] [nvarchar](15) NULL,
	[RowIndex] [tinyint] NULL,
	[Percentage] [int] NULL,
	[Days] [int] NULL,
	[TermType] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payroll_Transaction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll_Transaction](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[BankAccountID] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ChequeTotal] [money] NULL,
	[OtherCharges] [money] NULL,
	[OtherAccountID] [nvarchar](64) NULL,
	[Name] [nvarchar](64) NULL,
	[Month] [tinyint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsDebit] [bit] NULL,
	[PaymentMethodType] [tinyint] NULL,
	[TransactionDate] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[GLType] [tinyint] NULL,
	[JournalID] [int] NULL,
	[ChequeID] [int] NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[CheckNumber] [nvarchar](15) NULL,
	[CheckDate] [datetime] NULL,
	[Reference] [nvarchar](15) NULL,
	[TransactionStatus] [tinyint] NULL,
	[Description] [nvarchar](255) NULL,
	[TypeID] [int] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[TaxGroupID] [nvarchar](30) NULL,
	[TaxAmount] [money] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Payroll_Transaction] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payroll_Transaction_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll_Transaction_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[SheetID] [nvarchar](15) NULL,
	[SheetDocID] [nvarchar](15) NULL,
	[PayrollItemType] [tinyint] NULL,
	[PayrollItemID] [nvarchar](15) NULL,
	[PayType] [tinyint] NULL,
	[LoanSysDocID] [nvarchar](7) NULL,
	[LoanVoucherID] [nvarchar](15) NULL,
	[AccountID] [nvarchar](64) NULL,
	[Days] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowIndex] [smallint] NULL,
	[Reference] [nvarchar](20) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[SheetSysDocID] [nvarchar](15) NULL,
	[SheetVoucherID] [nvarchar](15) NULL,
	[SheetRowIndex] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollItem]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollItem](
	[PayrollItemID] [nvarchar](15) NOT NULL,
	[PayrollItemName] [nvarchar](30) NOT NULL,
	[PayrollItemType] [tinyint] NULL,
	[PayCodeType] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Allowance_Inactive]  DEFAULT ((1)),
	[InLeaveSalary] [bit] NULL CONSTRAINT [DF_Allowance_InLeaveSalary]  DEFAULT ((1)),
	[InDeduction] [bit] NULL,
	[InOvertime] [bit] NULL,
	[InServiceBenefit] [bit] NULL,
	[InFixed] [bit] NULL,
	[InSalaryDeduction] [bit] NULL,
	[AccountID] [nvarchar](64) NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Allowance] PRIMARY KEY CLUSTERED 
(
	[PayrollItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Performance_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performance_Details](
	[PositionID] [nvarchar](15) NOT NULL,
	[PerformanceParameter] [ntext] NULL,
	[Score] [decimal](15, 2) NULL,
	[RowIndex] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Period_Lock]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Period_Lock](
	[PeriodID] [int] IDENTITY(1,1) NOT NULL,
	[CloseDate] [datetime] NULL,
	[InventoryCloseDate] [datetime] NULL,
	[IsLocked] [bit] NULL,
	[Remarks] [nvarchar](255) NULL,
 CONSTRAINT [PK_Periods] PRIMARY KEY CLUSTERED 
(
	[PeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Physical_Stock_Entry]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Physical_Stock_Entry](
	[DocNumber] [nvarchar](50) NOT NULL,
	[PurchaseDate] [datetime] NULL,
	[Reference] [nvarchar](50) NULL,
	[LocationID] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_PhysicalStockEntry] PRIMARY KEY CLUSTERED 
(
	[DocNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Physical_Stock_Entry_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Physical_Stock_Entry_Detail](
	[DocNumber] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NULL,
	[ItemDescription] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[Qty] [decimal](18, 2) NULL,
	[PurchaseDate] [datetime] NULL,
	[Reference] [nvarchar](50) NULL,
	[LocationID] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pivot_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pivot_Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Chart_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pivot_Report]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pivot_Report](
	[PivotID] [nvarchar](15) NOT NULL,
	[PivotName] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[GroupID] [int] NULL,
	[DataQuery] [ntext] NULL,
	[ChartLayout] [xml] NULL,
	[HideTotal] [bit] NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Chart] PRIMARY KEY CLUSTERED 
(
	[PivotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pivot_Report_Field]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pivot_Report_Field](
	[PivotID] [nvarchar](15) NOT NULL,
	[FieldName] [nvarchar](30) NOT NULL,
	[DisplayName] [nvarchar](30) NULL,
	[DataType] [nvarchar](30) NULL,
	[Area] [tinyint] NULL,
	[GroupInterval] [int] NULL,
	[AreaIndex] [tinyint] NULL,
 CONSTRAINT [PK_Pivot_Report_Field] PRIMARY KEY CLUSTERED 
(
	[PivotID] ASC,
	[FieldName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PO_Shipment]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_Shipment](
	[SysDocID] [nvarchar](6) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[PurchaseFlow] [tinyint] NULL,
	[ContainerNumber] [nvarchar](15) NULL,
	[Port] [nvarchar](15) NULL,
	[LoadingPort] [nvarchar](15) NULL,
	[ETA] [datetime] NULL,
	[ATD] [datetime] NULL,
	[Status] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[PONumber] [nvarchar](20) NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[Shipper] [nvarchar](15) NULL,
	[ClearingAgent] [nvarchar](30) NULL,
	[Weight] [decimal](18, 5) NULL,
	[IsReceived] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[Value] [money] NULL,
	[ShipStatus] [bit] NULL,
	[TransporterID] [nvarchar](50) NULL,
	[ContainerSizeID] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[BuyerID] [nvarchar](64) NULL,
 CONSTRAINT [PK_PO_Shipment] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PO_Shipment_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_Shipment_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[SourceDocType] [tinyint] NULL,
	[IsSourcedRow] [bit] NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[RowIndex] [tinyint] NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Port]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Port](
	[PortID] [nvarchar](15) NOT NULL,
	[PortName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[CountryID] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Port] PRIMARY KEY CLUSTERED 
(
	[PortID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Batch]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POS_Batch](
	[BatchID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [nvarchar](15) NULL,
	[OpenDate] [datetime] NULL,
	[CloseDate] [datetime] NULL,
	[Status] [char](1) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_POS_Batch] PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[POS_Cashier]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Cashier](
	[CashierID] [nvarchar](15) NOT NULL,
	[CashierName] [nvarchar](60) NULL,
	[LocationID] [nvarchar](15) NULL,
	[ComputerName] [nvarchar](30) NULL,
	[ReceiptDocID] [nvarchar](15) NULL,
	[ReturnDocID] [nvarchar](15) NULL,
	[CashAccountID] [nvarchar](64) NULL,
	[CardReceivedAccountID] [nvarchar](64) NULL,
	[CheckAccountID] [nvarchar](64) NULL,
 CONSTRAINT [PK_POS_Cashier] PRIMARY KEY CLUSTERED 
(
	[CashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_CashRegister]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CashRegister](
	[CashRegisterID] [nvarchar](15) NOT NULL,
	[CashRegisterName] [nvarchar](60) NULL,
	[LocationID] [nvarchar](15) NULL,
	[ComputerName] [nvarchar](30) NULL,
	[ReceiptDocID] [nvarchar](15) NULL,
	[ReturnDocID] [nvarchar](15) NULL,
	[DefaultCustomerID] [nvarchar](64) NULL,
	[DiscountAccountID] [nvarchar](64) NULL,
	[ExpenseDocID] [nvarchar](7) NULL,
	[PettyCashAccountID] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[DateUpdated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_POS_CashRegister] PRIMARY KEY CLUSTERED 
(
	[CashRegisterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_CashRegister_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CashRegister_Expense](
	[CashRegisterID] [nvarchar](15) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[AccountID] [nvarchar](64) NULL,
	[RowIndex] [tinyint] NULL,
 CONSTRAINT [PK_POS_CashRegister_ExpenseAccounts] PRIMARY KEY CLUSTERED 
(
	[CashRegisterID] ASC,
	[DisplayName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_CashRegister_PaymentMethod]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CashRegister_PaymentMethod](
	[CashRegisterID] [nvarchar](15) NOT NULL,
	[PaymentMethodID] [nvarchar](15) NOT NULL,
	[DisplayName] [nvarchar](64) NULL,
	[AccountID] [nvarchar](64) NULL,
	[Inactive] [bit] NULL,
	[RowIndex] [tinyint] NULL,
 CONSTRAINT [PK_POS_CashRegister_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[CashRegisterID] ASC,
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_HOLD]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_HOLD](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ShiftID] [int] NULL,
	[BatchID] [int] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[IsCash] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[PriceIncludeTax] [bit] NULL,
	[Status] [tinyint] NULL CONSTRAINT [DF_POS_HOLD_Status]  DEFAULT ((1)),
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[SearchValue] [nvarchar](50) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalCOGS] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsDelivered] [bit] NULL CONSTRAINT [DF_POS_HOLD_IsDelivered]  DEFAULT ((0)),
	[Note] [nvarchar](255) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[RequireUpdate] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_POS_HOLD] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Hold_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Hold_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Discount] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](6) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsDNRow] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Shift]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POS_Shift](
	[ShiftID] [int] NOT NULL,
	[BatchID] [int] NOT NULL,
	[LocationID] [nvarchar](15) NULL,
	[UserID] [nvarchar](15) NULL,
	[CashRegisterID] [nvarchar](15) NULL,
	[OpenDate] [datetime] NULL,
	[CloseDate] [datetime] NULL,
	[OpeningCash] [money] NULL,
	[ClosingCash] [money] NULL,
	[Status] [char](1) NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_POS_Shift] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC,
	[BatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Position]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [nvarchar](15) NOT NULL,
	[PositionName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[JobDescription] [ntext] NULL,
	[AppraisalInterval] [int] NULL,
	[AppraisalFromDate] [datetime] NULL,
	[AppraisalToDate] [datetime] NULL,
	[ReportTo] [nvarchar](15) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Position_Inactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Position_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position_Details](
	[PositionID] [nvarchar](15) NOT NULL,
	[KPIParameter] [ntext] NULL,
	[Weightage] [decimal](15, 2) NULL,
	[Scale] [ntext] NULL,
	[Target] [decimal](15, 2) NULL,
	[RowIndex] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price_Level]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_Level](
	[PriceLevelID] [nvarchar](15) NOT NULL,
	[PriceLevelName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[IsInactive] [bit] NULL,
	[DateUpdated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Price Levels] PRIMARY KEY CLUSTERED 
(
	[PriceLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price_List]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_List](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ValidDateFrom] [datetime] NULL,
	[ValidDateTo] [datetime] NULL,
	[ApplicableToChild] [bit] NULL,
	[Inactive] [bit] NULL,
	[Status] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[TaxAmount] [money] NULL,
	[Total] [money] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price_List_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_List_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[CustomerProductID] [nvarchar](64) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Print_Template_Map]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Print_Template_Map](
	[MapID] [nvarchar](15) NOT NULL,
	[ScreenType] [tinyint] NULL,
	[ScreenID] [nvarchar](255) NULL,
	[ScreenArea] [nvarchar](64) NULL,
	[TemplateName] [nvarchar](64) NULL,
	[FileName] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Print_Template_Map_1] PRIMARY KEY CLUSTERED 
(
	[MapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Description2] [nvarchar](255) NULL,
	[Description3] [nvarchar](255) NULL,
	[ParentProductID] [nvarchar](64) NULL,
	[MatrixParentID] [nvarchar](64) NULL,
	[ClassID] [nvarchar](15) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[UPC] [nvarchar](30) NULL,
	[IsPriceEmbedded] [bit] NULL,
	[ExcludeFromCatalogue] [bit] NULL,
	[VendorRef] [nvarchar](30) NULL,
	[Attribute1] [nvarchar](30) NULL,
	[Attribute2] [nvarchar](30) NULL,
	[Attribute3] [nvarchar](30) NULL,
	[ItemType] [tinyint] NULL CONSTRAINT [DF_Product_ItemType]  DEFAULT ((1)),
	[UnitPrice1] [decimal](18, 5) NULL,
	[UnitPrice2] [decimal](18, 5) NULL,
	[UnitPrice3] [decimal](18, 5) NULL,
	[MinPrice] [decimal](18, 5) NULL,
	[StandardCost] [decimal](18, 5) NULL,
	[AverageCost] [decimal](18, 5) NOT NULL,
	[LastCost] [decimal](18, 5) NULL,
	[CostMethod] [tinyint] NULL,
	[Flag] [tinyint] NULL,
	[IsTrackLot] [bit] NULL,
	[IsTrackSerial] [bit] NULL,
	[BOMID] [nvarchar](15) NULL,
	[CategoryID] [nvarchar](15) NULL,
	[QuantityPerUnit] [real] NULL CONSTRAINT [DF_Products_QuantityPerUnit]  DEFAULT ((0)),
	[IsInactive] [bit] NULL CONSTRAINT [DF_Products_IsDiscontinued]  DEFAULT ((0)),
	[IsHoldSale] [bit] NULL,
	[HideInPOS] [bit] NULL,
	[Photo] [image] NULL,
	[Weight] [numeric](5, 2) NULL,
	[UnitID] [nvarchar](15) NULL,
	[ReorderLevel] [decimal](18, 5) NULL,
	[DefaultLocationID] [nvarchar](15) NULL,
	[COGSAccount] [nvarchar](64) NULL,
	[IncomeAccount] [nvarchar](64) NULL,
	[ExpenseCode] [nvarchar](50) NULL,
	[AssetAccount] [nvarchar](64) NULL,
	[PreferredVendor] [nvarchar](64) NULL,
	[StyleID] [nvarchar](15) NULL,
	[Attribute] [nvarchar](30) NULL,
	[Size] [nvarchar](30) NULL,
	[BrandID] [nvarchar](15) NULL,
	[ManufacturerID] [nvarchar](15) NULL,
	[MaterialID] [nvarchar](15) NULL,
	[FinishingID] [nvarchar](15) NULL,
	[ColorID] [nvarchar](15) NULL,
	[GradeID] [nvarchar](15) NULL,
	[StandardID] [nvarchar](15) NULL,
	[PType1] [nvarchar](50) NULL,
	[PType2] [nvarchar](50) NULL,
	[PType3] [nvarchar](50) NULL,
	[PType4] [nvarchar](50) NULL,
	[PType5] [nvarchar](50) NULL,
	[PType6] [nvarchar](50) NULL,
	[PType7] [nvarchar](50) NULL,
	[PType8] [nvarchar](50) NULL,
	[Origin] [nvarchar](30) NULL,
	[WarrantyPeriod] [numeric](5, 0) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[ReservedQuantity] [decimal](18, 5) NULL,
	[OrderedQuantity] [decimal](18, 5) NULL,
	[IgnoreCostDiffAmount] [decimal](5, 2) NULL,
	[Note] [ntext] NULL,
	[IsTaxable] [bit] NULL,
	[RackBin] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxIDNumber] [nvarchar](30) NULL,
	[UserDefined1] [nvarchar](64) NULL,
	[UserDefined2] [nvarchar](64) NULL,
	[UserDefined3] [nvarchar](64) NULL,
	[UserDefined4] [nvarchar](64) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[W3PLRentPrice] [decimal](18, 5) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_AppliedModels_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_AppliedModels_Detail](
	[ProductID] [nvarchar](64) NOT NULL,
	[VehicleMakeID] [nvarchar](15) NULL,
	[VehicleTypeID] [nvarchar](15) NULL,
	[Remarks] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Attribute]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Attribute](
	[AttributeID] [nvarchar](15) NOT NULL,
	[AttributeName] [nvarchar](30) NOT NULL,
	[IsInactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Brand]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Brand](
	[BrandID] [nvarchar](15) NOT NULL,
	[BrandName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL CONSTRAINT [DF_Product_Brand_IsInactive]  DEFAULT ((0)),
	[Note] [nvarchar](255) NULL,
	[PreferredVendor] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Category]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category](
	[CategoryID] [nvarchar](15) NOT NULL,
	[CategoryName] [nvarchar](125) NOT NULL,
	[ParentCategoryID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL CONSTRAINT [DF_Product Categories_IsInactive]  DEFAULT ((0)),
	[AgeGroup1] [smallint] NULL,
	[AgeGroup2] [smallint] NULL,
	[AgeGroup3] [smallint] NULL,
	[Note] [nvarchar](255) NULL,
	[StandardPricePercent] [decimal](18, 2) NULL,
	[WholesalePricePercent] [decimal](18, 2) NULL,
	[SpecialPricePercent] [decimal](18, 2) NULL,
	[MinimumPricePercent] [decimal](18, 2) NULL,
	[CommissionPercent] [decimal](4, 2) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Category_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category_Detail](
	[ProductID] [nvarchar](64) NOT NULL,
	[ProductCategoryID] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Product_Category_Detail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Class]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Class](
	[ClassID] [nvarchar](15) NOT NULL,
	[ClassName] [nvarchar](64) NOT NULL,
	[ItemType] [tinyint] NULL,
	[CostMethod] [tinyint] NULL,
	[CategoryID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL CONSTRAINT [DF_Product_Class_IsInactive_1]  DEFAULT ((0)),
	[UnitID] [nvarchar](15) NULL,
	[COGSAccount] [nvarchar](64) NULL,
	[IncomeAccount] [nvarchar](64) NULL,
	[AssetAccount] [nvarchar](64) NULL,
	[Note] [ntext] NULL,
	[IsTaxable] [bit] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[W3PLRentPrice] [decimal](18, 5) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_COGS_Change]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_COGS_Change](
	[ItemCode] [nvarchar](64) NULL,
	[InvoiceNumber] [nvarchar](15) NULL,
	[DocID] [nvarchar](6) NULL,
	[RowIndex] [int] NULL,
	[LotNo] [int] NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[COGS] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Location]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Location](
	[LocationID] [nvarchar](15) NULL,
	[ProductID] [nvarchar](64) NULL,
	[Quantity] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Lot]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Lot](
	[LotNumber] [int] NOT NULL,
	[ItemCode] [nvarchar](64) NULL,
	[Reference] [nvarchar](100) NULL,
	[SourceLotNumber] [int] NULL,
	[Cost] [decimal](18, 5) NULL,
	[AvgCost] [decimal](18, 5) NULL,
	[LotQty] [decimal](18, 5) NULL,
	[SoldQty] [decimal](18, 5) NULL,
	[ReturnedQty] [decimal](18, 5) NULL,
	[DocID] [nvarchar](8) NOT NULL,
	[ReceiptNumber] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NULL,
	[LocationID] [nvarchar](15) NULL,
	[ReceiptDate] [datetime] NULL,
	[ProductionDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[SupplierCode] [nvarchar](64) NULL,
	[IsDeleted] [bit] NULL,
	[BinID] [nvarchar](30) NULL,
	[RackID] [nvarchar](30) NULL,
	[Reference2] [nvarchar](30) NULL,
	[SourceRecordID] [int] NULL,
 CONSTRAINT [PK_Product_Lot] PRIMARY KEY CLUSTERED 
(
	[LotNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Lot_Issue_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Lot_Issue_Detail](
	[LotNumber] [nvarchar](15) NULL,
	[Reference] [nvarchar](40) NULL,
	[TransactionDate] [datetime] NULL,
	[SourceLotNumber] [nvarchar](15) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[ProductID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[BinID] [nvarchar](30) NULL,
	[RackID] [nvarchar](30) NULL,
	[SoldQty] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Reference2] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Lot_Receiving_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Lot_Receiving_Detail](
	[LotNumber] [nvarchar](40) NULL,
	[SourceLotNumber] [int] NULL,
	[LocationID] [nvarchar](15) NULL,
	[BinID] [nvarchar](30) NULL,
	[RackID] [nvarchar](30) NULL,
	[ProductID] [nvarchar](64) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[LotQty] [decimal](18, 5) NULL,
	[SoldQty] [decimal](18, 5) NULL,
	[ReceiptDate] [datetime] NULL,
	[ProductionDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[Reference2] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Lot_Sales]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Lot_Sales](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [nvarchar](7) NULL,
	[InvoiceNumber] [nvarchar](15) NULL,
	[TransactionDate] [datetime] NULL,
	[RowIndex] [int] NULL,
	[ItemCode] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[ReturnQty] [decimal](18, 5) NULL,
	[LotNo] [int] NULL,
	[SoldQty] [decimal](18, 5) NULL,
	[FOCQuantity] [decimal](18, 5) NULL,
	[Discount] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[IsSettled] [bit] NULL,
	[BinID] [nvarchar](30) NULL,
	[RackID] [nvarchar](30) NULL,
	[Reference2] [nvarchar](30) NULL,
 CONSTRAINT [PK_Product_Lot_Sales] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Lot_Sales_PickList]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Lot_Sales_PickList](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [nvarchar](7) NULL,
	[InvoiceNumber] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[ItemCode] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[ReturnQty] [decimal](18, 5) NULL,
	[LotNo] [int] NULL,
	[SoldQty] [decimal](18, 5) NULL,
	[FOCQuantity] [decimal](18, 5) NULL,
	[Discount] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[IsSettled] [bit] NULL,
	[BinID] [nvarchar](15) NULL,
	[Reference2] [nvarchar](30) NULL,
 CONSTRAINT [PK_Product_Lot_Sales_PickList] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Make]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Make](
	[MakeID] [nvarchar](15) NOT NULL,
	[MakeName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Make] PRIMARY KEY CLUSTERED 
(
	[MakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Manufacturer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Manufacturer](
	[ManufacturerID] [nvarchar](15) NOT NULL,
	[ManufacturerName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL CONSTRAINT [DF_Product_Manufacturer_IsInactive]  DEFAULT ((0)),
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product Manufacturers] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Model]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Model](
	[ModelID] [nvarchar](15) NOT NULL,
	[ModelName] [nvarchar](64) NOT NULL,
	[TypeID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Model] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Parent]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Parent](
	[ProductParentID] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Dimensions] [tinyint] NULL,
	[DIM1] [nvarchar](15) NULL,
	[DIM2] [nvarchar](15) NULL,
	[DIM3] [nvarchar](15) NULL,
	[UnitPrice1] [decimal](18, 5) NULL,
	[UnitPrice2] [decimal](18, 5) NULL,
	[UnitPrice3] [decimal](18, 5) NULL,
	[MinPrice] [decimal](18, 5) NULL,
	[ClassID] [nvarchar](15) NULL,
	[ExcludeFromCatalogue] [bit] NULL,
	[ParentType] [tinyint] NULL,
	[LookupCode] [nvarchar](30) NULL,
	[Photo] [image] NULL,
	[ItemType] [tinyint] NULL,
	[CostMethod] [tinyint] NULL,
	[CategoryID] [nvarchar](15) NULL,
	[QuantityPerUnit] [real] NULL,
	[UnitID] [nvarchar](15) NULL,
	[BrandID] [nvarchar](15) NULL,
	[ManufacturerID] [nvarchar](15) NULL,
	[PreferredVendor] [nvarchar](15) NULL,
	[Origin] [nvarchar](30) NULL,
	[IsInactive] [bit] NULL,
	[Note] [ntext] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Parent] PRIMARY KEY CLUSTERED 
(
	[ProductParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Parent_Components]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Parent_Components](
	[ProductParentID] [nvarchar](64) NULL,
	[ProductID] [nvarchar](64) NULL,
	[Attribute1] [nvarchar](15) NULL,
	[Attribute2] [nvarchar](15) NULL,
	[Attribute3] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Parts_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Parts_Detail](
	[ProductID] [nvarchar](64) NOT NULL,
	[Specification] [ntext] NULL,
	[VehicleMakeID] [nvarchar](15) NULL,
	[VehicleTypeID] [nvarchar](15) NULL,
	[VehicleModelID] [nvarchar](15) NULL,
	[PartsMakeTypeID] [nvarchar](15) NULL,
	[PartsTypeID] [nvarchar](15) NULL,
	[PartsFamilyID] [nvarchar](15) NULL,
	[PartsChasisNo] [nvarchar](100) NULL,
	[PartsModel] [nvarchar](30) NULL,
	[PartsEngineNo] [nvarchar](100) NULL,
	[OEMCode] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Price_Bulk_Update]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Price_Bulk_Update](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Status] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Price_Bulk_Update] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Price_Bulk_Update_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Price_Bulk_Update_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CategoryID] [nvarchar](15) NULL,
	[LastPurchasePrice] [decimal](18, 2) NULL,
	[StandardPricePercent] [decimal](18, 2) NULL,
	[StandardPrice] [decimal](18, 2) NULL,
	[WholesalePricePercent] [decimal](18, 2) NULL,
	[WholesalePrice] [decimal](18, 2) NULL,
	[SpecialPricePercent] [decimal](18, 2) NULL,
	[SpecialPrice] [decimal](18, 2) NULL,
	[MinimumPricePercent] [decimal](18, 2) NULL,
	[MinimumPrice] [decimal](18, 2) NULL,
	[StandardCost] [decimal](18, 2) NULL,
	[RowIndex] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_PriceList_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_PriceList_Detail](
	[ProductID] [nvarchar](64) NOT NULL,
	[UnitPrice1] [decimal](18, 5) NULL,
	[UnitPrice2] [decimal](18, 5) NULL,
	[UnitPrice3] [decimal](18, 5) NULL,
	[MinPrice] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[LocationID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[SizeID] [nvarchar](15) NOT NULL,
	[SizeName] [nvarchar](30) NOT NULL,
	[IsInactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Specification]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Specification](
	[SpecificationID] [nvarchar](15) NOT NULL,
	[SpecificationName] [nvarchar](30) NOT NULL,
	[IsInactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Specification] PRIMARY KEY CLUSTERED 
(
	[SpecificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Style]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Style](
	[StyleID] [nvarchar](15) NOT NULL,
	[StyleName] [nvarchar](30) NOT NULL,
	[IsInactive] [bit] NULL CONSTRAINT [DF_Product_Style_IsInactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Style] PRIMARY KEY CLUSTERED 
(
	[StyleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Substitute_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Substitute_Detail](
	[ProductID] [nvarchar](64) NOT NULL,
	[SubstituteProductID] [nvarchar](64) NULL,
	[SubProductDescription] [nvarchar](255) NULL,
	[UnitPrice] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NOT NULL,
	[MakeID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Product_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Unit]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Unit](
	[ProductID] [nvarchar](64) NOT NULL,
	[UnitID] [nvarchar](15) NOT NULL,
	[FactorType] [char](1) NULL,
	[Factor] [real] NULL,
	[IsMainUnit] [bit] NULL,
 CONSTRAINT [PK_Product_Unit] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Project_Expense_Allocation]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Expense_Allocation](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[Name] [nvarchar](64) NULL,
	[Month] [tinyint] NULL,
	[Year] [smallint] NULL,
	[TransactionDate] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](15) NULL,
	[TransactionStatus] [tinyint] NULL,
	[Description] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Project_Expense_Allocation] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_Expense_Allocation_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Expense_Allocation_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[OTAmount] [money] NULL,
	[GrossSalary] [money] NULL,
	[ProjectID] [nvarchar](30) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Hours] [numeric](15, 2) NULL,
	[RowIndex] [int] NULL,
	[Amount] [money] NULL,
	[IsVoid] [bit] NULL,
	[SheetSysDocID] [nvarchar](15) NULL,
	[SheetVoucherID] [nvarchar](15) NULL,
	[SheetRowIndex] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_SubContract_PI]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_SubContract_PI](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsCash] [bit] NULL,
	[IsImport] [bit] NULL,
	[PurchaseFlow] [tinyint] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[BuyerID] [nvarchar](64) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[PONumber] [nvarchar](50) NULL,
	[BOLNo] [nvarchar](20) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TermID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[ContainerNumber] [nvarchar](20) NULL,
	[Port] [nvarchar](15) NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Shipper] [nvarchar](15) NULL,
	[ClearingAgent] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Project_SubContract_PI] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_SubContract_PI_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_SubContract_PI_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[LCost] [decimal](18, 5) NULL,
	[LCostAmount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[OrderValue] [decimal](18, 5) NULL,
	[Invoiced] [decimal](18, 5) NULL,
	[PercentCompleted] [decimal](5, 2) NULL,
	[CurrentValue] [decimal](18, 5) NULL,
	[CurrentPercent] [decimal](5, 2) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[PORVoucherID] [nvarchar](15) NULL,
	[PORSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsPORRow] [bit] NULL,
	[LotNumber] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowSource] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL,
	[Remarks] [nvarchar](300) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_Subcontract_PO]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Subcontract_PO](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsImport] [bit] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[PurchaseFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[ContainerSizeID] [nvarchar](15) NULL,
	[BuyerID] [nvarchar](64) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[PortLoading] [nvarchar](15) NULL,
	[PortDestination] [nvarchar](15) NULL,
	[ETA] [datetime] NULL,
	[ETD] [datetime] NULL,
	[ActualReqDate] [datetime] NULL,
	[INCOID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsShipped] [bit] NULL,
	[BOLNo] [nvarchar](20) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Project_Subcontract_PO] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_Subcontract_PO_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Subcontract_PO_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[IsSourcedRow] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL,
	[Remarks] [nvarchar](300) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyID] [nvarchar](15) NOT NULL,
	[PropertyName] [nvarchar](64) NOT NULL,
	[ShortName] [nvarchar](30) NULL,
	[OfferTypeID] [nvarchar](15) NULL,
	[FixedAssetID] [nvarchar](15) NULL,
	[PropertyClassID] [nvarchar](15) NULL,
	[CountryID] [nvarchar](15) NULL,
	[CityID] [nvarchar](15) NULL,
	[AreaID] [nvarchar](15) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[YearBuilt] [smallint] NULL,
	[Builtby] [nvarchar](64) NULL,
	[LandArea] [decimal](18, 2) NULL,
	[BuildArea] [decimal](18, 2) NULL,
	[OwnerName] [nvarchar](64) NULL,
	[RegisterNumber] [nvarchar](30) NULL,
	[RentIncomeAccountID] [nvarchar](15) NULL,
	[PrepaidRentIncomeAccountID] [nvarchar](15) NULL,
	[Note] [ntext] NULL,
	[Status] [bit] NULL,
	[IsPeriodicInvoice] [bit] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxIDNumber] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[Photo] [image] NULL,
	[ElectricityRegnNumber] [nvarchar](50) NULL,
	[TelecomRegnNumber] [nvarchar](50) NULL,
	[MunicipalityRegnNumber] [nvarchar](50) NULL,
	[ElectricityPremiseNumber] [nvarchar](50) NULL,
	[ElectricityContractNumber] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Agent]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Agent](
	[PropertyAgentID] [nvarchar](15) NOT NULL,
	[PropertyAgentName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Property_Agent] PRIMARY KEY CLUSTERED 
(
	[PropertyAgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Cancel]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Cancel](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[PropertyID] [nvarchar](15) NULL,
	[UnitID] [nvarchar](15) NULL,
	[CustomerID] [nvarchar](15) NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractEndDate] [datetime] NULL,
	[TotalDays] [numeric](10, 0) NULL,
	[LastStayDate] [datetime] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[ParentSysDocID] [nvarchar](7) NULL,
	[ParentVoucherID] [nvarchar](15) NULL,
	[AgreementType] [nvarchar](15) NULL,
	[AgreementStatus] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[PropertyAgentID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Cancel] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Cancel_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Property_Cancel_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[IncomeID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Property_Category]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Category](
	[CategoryID] [nvarchar](15) NOT NULL,
	[CategoryName] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Property_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Category_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Category_Detail](
	[PropertyID] [nvarchar](64) NOT NULL,
	[CategoryID] [nvarchar](15) NOT NULL,
	[EntityType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Property_Category_Detail] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Class]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Class](
	[PropertyClassID] [nvarchar](15) NOT NULL,
	[PropertyClassName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Property_Class] PRIMARY KEY CLUSTERED 
(
	[PropertyClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Doc_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Doc_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Remind] [bit] NULL,
	[RemindDays] [numeric](3, 0) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Docs_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Document](
	[PropertyID] [nvarchar](15) NOT NULL,
	[DocumentNumber] [nvarchar](30) NOT NULL,
	[DocumentTypeID] [nvarchar](15) NOT NULL,
	[IssuePlace] [nvarchar](15) NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [smallint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Docs] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Facility]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Facility](
	[PropertyID] [nvarchar](64) NOT NULL,
	[FacilityID] [nvarchar](15) NOT NULL,
	[Type] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Owner_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Owner_Detail](
	[PropertyID] [nvarchar](15) NOT NULL,
	[PropertyOwnerID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[OwnerShipPercent] [decimal](15, 3) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Refund_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Property_Refund_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[IncomeID] [nvarchar](50) NULL,
	[Description] [nvarchar](64) NULL,
	[PaidAmount] [money] NULL,
	[Charges] [money] NULL,
	[RefundAmount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Property_Rent]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Property_Rent](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[PropertyID] [nvarchar](15) NULL,
	[UnitID] [nvarchar](15) NULL,
	[CustomerID] [nvarchar](15) NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractEndDate] [datetime] NULL,
	[TotalDays] [numeric](10, 0) NULL,
	[NoofInstallments] [int] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[ParentSysDocID] [nvarchar](7) NULL,
	[ParentVoucherID] [nvarchar](15) NULL,
	[Total] [money] NULL,
	[AgreementType] [nvarchar](15) NULL,
	[AgreementStatus] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[Note] [nvarchar](255) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[PropertyAgentID] [nvarchar](15) NULL,
	[InvoiceStartDate] [datetime] NULL,
	[IsPeriodicInvoice] [bit] NULL,
	[Frequency] [char](1) NULL,
	[FrequencyCount] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Rent] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Property_Rent_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Property_Rent_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[IncomeID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[Discount] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Property_Service_Assign]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Service_Assign](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[ServiceProviderID] [nvarchar](15) NULL,
	[PlannedDate] [datetime] NULL,
	[StatusDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[Amount] [decimal](18, 4) NULL,
	[Remarks] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Service_Assign] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Service_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Service_Detail](
	[VoucherID] [nvarchar](15) NOT NULL,
	[ReportingDate] [datetime] NULL,
	[PropertyID] [nvarchar](15) NULL,
	[UnitID] [nvarchar](15) NULL,
	[ServiceTypeID] [nvarchar](15) NULL,
	[RequestDetails] [nvarchar](255) NULL,
	[AssignedToID] [nvarchar](15) NULL,
	[PlannedDate] [datetime] NULL,
	[StatusDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[Remarks] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Service_Detail] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Service_Request]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Service_Request](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ReportingDate] [datetime] NULL,
	[PropertyID] [nvarchar](15) NULL,
	[UnitID] [nvarchar](15) NULL,
	[TenantID] [nvarchar](15) NULL,
	[PriorityStatus] [nchar](10) NULL,
	[RequiredDatetime] [datetime] NULL,
	[ConvenientDatetime] [datetime] NULL,
	[RequestNotes] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Service_Request] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_ServiceFacility_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_ServiceFacility_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NULL,
	[FacilityID] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_ServiceType_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_ServiceType_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [int] NULL,
	[ServiceTypeID] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Tenant_Doc_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Tenant_Doc_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Remind] [bit] NULL,
	[RemindDays] [numeric](3, 0) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Tenant_Docs_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Tenant_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Tenant_Document](
	[CustomerID] [nvarchar](15) NOT NULL,
	[DocumentNumber] [nvarchar](30) NOT NULL,
	[DocumentTypeID] [nvarchar](15) NOT NULL,
	[IssuePlace] [nvarchar](15) NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [smallint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Tenant_Docs] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Transaction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Transaction](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RegisterID] [nvarchar](15) NULL,
	[BankAccountID] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Name] [nvarchar](64) NULL,
	[Month] [tinyint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsDebit] [bit] NULL,
	[PaymentMethodType] [tinyint] NULL,
	[TransactionDate] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[GLType] [tinyint] NULL,
	[JournalID] [int] NULL,
	[ChequeID] [int] NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[CheckNumber] [nvarchar](15) NULL,
	[CheckDate] [datetime] NULL,
	[Reference] [nvarchar](15) NULL,
	[TransactionStatus] [tinyint] NULL,
	[Description] [nvarchar](255) NULL,
	[TypeID] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Transaction] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Transaction_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Transaction_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TenantID] [nvarchar](64) NULL,
	[SourceSysDocID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[IncomeType] [tinyint] NULL,
	[IncomeID] [nvarchar](15) NULL,
	[PayType] [tinyint] NULL,
	[AccountID] [nvarchar](64) NULL,
	[Days] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowIndex] [smallint] NULL,
	[Reference] [nvarchar](20) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_Unit]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Unit](
	[PropertyUnitID] [nvarchar](15) NOT NULL,
	[PropertyUnitName] [nvarchar](64) NOT NULL,
	[ShortName] [nvarchar](30) NULL,
	[UnitStatus] [nvarchar](15) NULL,
	[AvailableFrom] [datetime] NULL,
	[AvailableTo] [datetime] NULL,
	[PropertyID] [nvarchar](15) NULL,
	[ParentUnitID] [nvarchar](15) NULL,
	[UnitTypeID] [nvarchar](15) NULL,
	[NoBedRooms] [int] NULL,
	[NoBathRooms] [int] NULL,
	[TotalRooms] [int] NULL,
	[Area] [decimal](18, 2) NULL,
	[NoofParking] [int] NULL,
	[ViewTypeID] [nvarchar](15) NULL,
	[KitchenTypeID] [nvarchar](15) NULL,
	[Note] [ntext] NULL,
	[Status] [bit] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[Photo] [image] NULL,
	[PropertyType] [tinyint] NULL,
	[ElectricityPremiseNumber] [nvarchar](50) NULL,
	[MunicipalityFileNumber] [nvarchar](50) NULL,
	[ElectricityFileNumber] [nvarchar](50) NULL,
	[MunicipalityPermitNumber] [nvarchar](50) NULL,
	[ElectricityPermitNumber] [nvarchar](50) NULL,
	[RentalIncome] [money] NULL,
	[IsVirtual] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_Unit] PRIMARY KEY CLUSTERED 
(
	[PropertyUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_VirtualUnit]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_VirtualUnit](
	[PropertyVirtualUnitID] [nvarchar](30) NOT NULL,
	[PropertyVirtualUnitName] [nvarchar](150) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Property_VirtualUnit] PRIMARY KEY CLUSTERED 
(
	[PropertyVirtualUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property_VirtualUnit_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_VirtualUnit_Detail](
	[PropertyVirtualUnitID] [nvarchar](64) NOT NULL,
	[PropertyUnitID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[SharingPercent] [decimal](15, 3) NULL,
	[RowIndex] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyIncome_Code]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyIncome_Code](
	[IncomeID] [nvarchar](15) NOT NULL,
	[IncomeName] [nvarchar](64) NULL,
	[Description] [nvarchar](64) NULL,
	[AccountID] [nvarchar](64) NULL,
	[IncomeType] [tinyint] NULL,
	[IncomeRate] [money] NULL,
	[Inactive] [bit] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_PropertyIncome_Code] PRIMARY KEY CLUSTERED 
(
	[IncomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Claim]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Claim](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[SourceSysDocID] [nvarchar](50) NULL,
	[SourceVoucherID] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NULL,
	[ClaimAmount] [money] NULL,
	[ClaimDetails] [nvarchar](255) NULL,
	[CurrencyID] [nvarchar](7) NULL,
	[CreditNoteNo] [nvarchar](30) NULL,
	[CRNoteAmount] [money] NULL,
	[ClaimStatus] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Claim] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Cost_Entry]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Cost_Entry](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[PurchaseFlow] [tinyint] NULL,
	[ContainerNumber] [nvarchar](15) NULL,
	[Port] [nvarchar](15) NULL,
	[LoadingPort] [nvarchar](15) NULL,
	[ETA] [datetime] NULL,
	[ATD] [datetime] NULL,
	[Status] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[VendorID] [nvarchar](64) NULL,
	[PONumber] [nvarchar](20) NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[Shipper] [nvarchar](15) NULL,
	[ClearingAgent] [nvarchar](30) NULL,
	[Weight] [decimal](18, 5) NULL,
	[IsReceived] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[Value] [money] NULL,
	[ShipStatus] [bit] NULL,
	[TransporterID] [nvarchar](50) NULL,
	[ContainerSizeID] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[BuyerID] [nvarchar](64) NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Cost_Entry] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Cost_Entry_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchase_Cost_Entry_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[SupplierID] [nvarchar](15) NULL,
	[Amount] [money] NULL,
	[Cost] [decimal](10, 5) NULL,
	[DueDate] [datetime] NULL,
	[AmountFC] [money] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[CurrencyID] [nchar](10) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[RowIndex] [smallint] NULL,
	[Remarks] [nvarchar](3000) NULL,
	[AllocatedCost] [decimal](10, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Purchase_Invoice]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Invoice](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsCash] [bit] NULL,
	[IsImport] [bit] NULL,
	[IsTaxIncluded] [bit] NULL,
	[IsHoldForPayment] [bit] NULL,
	[PurchaseFlow] [tinyint] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[BuyerID] [nvarchar](64) NULL,
	[PriceIncludeTax] [bit] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[PONumber] [nvarchar](50) NULL,
	[Status] [tinyint] NULL CONSTRAINT [DF_Purchase_Invoice_Status]  DEFAULT ((1)),
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TermID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](30) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[ContainerNumber] [nvarchar](20) NULL,
	[Port] [nvarchar](15) NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[Shipper] [nvarchar](15) NULL,
	[ClearingAgent] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Invoice] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Invoice_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Invoice_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[LCost] [decimal](18, 5) NULL,
	[LCostAmount] [money] NULL,
	[Discount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[Remarks] [nvarchar](3000) NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[PORVoucherID] [nvarchar](15) NULL,
	[PORSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsPORRow] [bit] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[IsSourcedRow] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[LotNumber] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowSource] [tinyint] NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[ITRowID] [int] NULL,
	[RefSlNo] [int] NULL,
	[RefText1] [nvarchar](50) NULL,
	[RefText2] [nvarchar](50) NULL,
	[RefNum1] [decimal](18, 5) NULL,
	[RefNum2] [decimal](18, 5) NULL,
	[RefDate1] [datetime] NULL,
	[RefDate2] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Invoice_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchase_Invoice_Expense](
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[RateType] [char](1) NULL,
	[PCSysDocID] [nvarchar](7) NULL,
	[PCVoucherID] [nvarchar](15) NULL,
	[PCRowIndex] [smallint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Purchase_Invoice_NonInv]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Invoice_NonInv](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsCash] [bit] NULL,
	[IsImport] [bit] NULL,
	[PurchaseFlow] [tinyint] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[BuyerID] [nvarchar](64) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[PONumber] [nvarchar](50) NULL,
	[PriceIncludeTax] [bit] NULL,
	[BOLNo] [nvarchar](20) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TermID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[ContainerNumber] [nvarchar](20) NULL,
	[Port] [nvarchar](15) NULL,
	[BOLNumber] [nvarchar](20) NULL,
	[SupplierInvoiceNumber] [nvarchar](40) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[Shipper] [nvarchar](15) NULL,
	[ClearingAgent] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Invoice_NonInv] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Invoice_NonInv_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Invoice_NonInv_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[LCost] [decimal](18, 5) NULL,
	[LCostAmount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[PORVoucherID] [nvarchar](15) NULL,
	[PORSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsPORRow] [bit] NULL,
	[LotNumber] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowSource] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[AttributeID1] [nvarchar](50) NULL,
	[AttributeID2] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Invoice_NonInv_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchase_Invoice_NonInv_Expense](
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Purchase_Order]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Order](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsImport] [bit] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[PurchaseFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[ContainerSizeID] [nvarchar](15) NULL,
	[BuyerID] [nvarchar](64) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[RequiredDate] [datetime] NULL,
	[PriceIncludeTax] [bit] NULL,
	[DeliveryAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[DeliveryAddress] [nvarchar](255) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NOT NULL CONSTRAINT [DF_Purchase_Order_Status]  DEFAULT ((1)),
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](50) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[LocationID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[Reference] [nvarchar](100) NULL,
	[Reference2] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[PortLoading] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[PortDestination] [nvarchar](15) NULL,
	[ETA] [datetime] NULL,
	[ETD] [datetime] NULL,
	[ActualReqDate] [datetime] NULL,
	[INCOID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[TaxAmount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[IsShipped] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Remarks1] [nvarchar](2000) NULL,
	[Remarks2] [nvarchar](2000) NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Order] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Order_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Order_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[MinGuarantee] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[Length] [decimal](18, 5) NULL,
	[Width] [decimal](18, 5) NULL,
	[Height] [decimal](18, 5) NULL,
	[Number] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[IsSourcedRow] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[RefSlNo] [int] NULL,
	[RefText1] [nvarchar](50) NULL,
	[RefText2] [nvarchar](50) NULL,
	[RefNum1] [decimal](18, 5) NULL,
	[RefNum2] [decimal](18, 5) NULL,
	[RefDate1] [datetime] NULL,
	[RefDate2] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Order_NonInv]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Order_NonInv](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsImport] [bit] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[PurchaseFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[ContainerSizeID] [nvarchar](15) NULL,
	[BuyerID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[PriceIncludeTax] [bit] NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[PortLoading] [nvarchar](15) NULL,
	[PortDestination] [nvarchar](15) NULL,
	[ETA] [datetime] NULL,
	[ETD] [datetime] NULL,
	[ActualReqDate] [datetime] NULL,
	[INCOID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsShipped] [bit] NULL,
	[BOLNo] [nvarchar](20) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Order_NonInv] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Order_NonInv_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Order_NonInv_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[IsSourcedRow] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL,
	[Remarks] [nvarchar](3000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Payment_Invoice]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Payment_Invoice](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SourceSysDocID] [nvarchar](50) NULL,
	[SourceVoucherID] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NULL,
	[POAmount] [money] NULL,
	[Paid] [money] NULL,
	[Balance] [money] NULL,
	[CurrencyID] [nvarchar](7) NULL,
	[TermID] [nvarchar](15) NULL,
	[SuggestedDue] [money] NULL,
	[Amount] [decimal](18, 2) NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Payment_Invoice] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Prepayment_Invoice]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Prepayment_Invoice](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NULL,
	[SourceSysDocID] [nvarchar](50) NULL,
	[SourceVoucherID] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NULL,
	[POAmount] [money] NULL,
	[Paid] [money] NULL,
	[Balance] [money] NULL,
	[CurrencyID] [nvarchar](7) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[DueDate] [datetime] NULL,
	[PrepaymentTermID] [nvarchar](15) NULL,
	[SuggestedDue] [money] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[IsVoid] [bit] NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[Remarks] [nvarchar](500) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Prepayment_Invoice] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Quote]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Quote](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[IsImport] [bit] NULL,
	[DueDate] [datetime] NULL,
	[PurchaseFlow] [tinyint] NULL,
	[BuyerID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[PriceIncludeTax] [bit] NULL,
	[TermID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Quote] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Quote_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Quote_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[QuantityOrdered] [decimal](18, 5) NULL,
	[UnitID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Receipt]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Receipt](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[BuyerID] [nvarchar](64) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[PurchaseFlow] [tinyint] NULL,
	[PONumber] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[IsImport] [bit] NULL,
	[IsInvoiced] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[Reference] [nvarchar](30) NULL,
	[Reference2] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[POSysDocID] [nvarchar](7) NULL,
	[POVoucherID] [nvarchar](15) NULL,
	[TransporterID] [nvarchar](30) NULL,
	[VehicleID] [nvarchar](15) NULL,
	[DriverID] [nvarchar](15) NULL,
	[ContainerNumber] [nvarchar](30) NULL,
	[ContainerSizeID] [nvarchar](20) NULL,
	[ClaimStatus] [tinyint] NULL,
	[GroupName] [nvarchar](64) NULL,
	[ClaimAmount] [money] NULL,
	[ClaimAmountFC] [money] NULL,
	[ClaimCurrencyID] [nvarchar](5) NULL,
	[ClaimCurrencyRate] [decimal](10, 5) NULL,
	[ClaimRef1] [nvarchar](30) NULL,
	[ClaimRef2] [nvarchar](30) NULL,
	[ClaimRemarks] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_PO_Receipt] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Receipt_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Receipt_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[RowIndex] [smallint] NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[LocationID] [nvarchar](15) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsPORRow] [bit] NULL,
	[RowSource] [smallint] NULL,
	[PKSysDocID] [nvarchar](7) NULL,
	[PKVoucherID] [nvarchar](15) NULL,
	[PKRowIndex] [int] NULL,
	[ListVoucherID] [nvarchar](15) NULL,
	[ListSysDocID] [nvarchar](7) NULL,
	[ListRowIndex] [int] NULL,
	[ITRowID] [int] NULL,
	[RefSlNo] [int] NULL,
	[RefText1] [nvarchar](50) NULL,
	[RefText2] [nvarchar](50) NULL,
	[RefNum1] [decimal](18, 5) NULL,
	[RefNum2] [decimal](18, 5) NULL,
	[RefDate1] [datetime] NULL,
	[RefDate2] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[IsCash] [bit] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[BuyerID] [nvarchar](64) NULL,
	[PurchaseFlow] [tinyint] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [smallmoney] NULL,
	[PriceIncludeTax] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[VendorReferenceNo] [nvarchar](40) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[IsDelivered] [bit] NULL,
	[RequireUpdate] [bit] NULL,
	[SourceDocType] [tinyint] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Purchase_Return] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[AmountFC] [money] NULL,
	[Amount] [money] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quality_Claim]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quality_Claim](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NULL,
	[ClaimAmount] [money] NULL,
	[ReceivedAmount] [money] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TotalPallets] [int] NULL,
	[TotalQuantity] [decimal](10, 2) NULL,
	[Note] [ntext] NULL,
	[LocationID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[SurveyType] [tinyint] NULL,
	[DateReceived] [datetime] NULL,
	[DateInspected] [datetime] NULL,
	[SurveyerID] [nvarchar](15) NULL,
	[Surveyer2ID] [nvarchar](15) NULL,
	[SurveyDate] [datetime] NULL,
	[ClaimDate] [datetime] NULL,
	[VesselName] [nvarchar](20) NULL,
	[ContainerNumber] [nvarchar](20) NULL,
	[OriginID] [nvarchar](15) NULL,
	[ClaimStatus] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[CloseDescription] [nvarchar](255) NULL,
	[CRSysDocID] [nvarchar](7) NULL,
	[CRVoucherID] [nvarchar](15) NULL,
	[BatchNumber] [nvarchar](15) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Quality_Claim] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quality_Claim_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quality_Claim_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[RowType] [tinyint] NULL,
	[CommodityID] [nvarchar](15) NULL,
	[VarietyID] [nvarchar](15) NULL,
	[BrandID] [nvarchar](15) NULL,
	[Grade] [nvarchar](15) NULL,
	[IssueName] [nvarchar](20) NULL,
	[IssuePercent] [decimal](8, 2) NULL,
	[UnitCost] [money] NULL,
	[ReceivedQuantity] [decimal](10, 2) NULL,
	[Quantity] [decimal](10, 2) NULL,
	[LossRatio] [decimal](8, 2) NULL,
	[ClaimRate] [money] NULL,
	[ClaimAmount] [money] NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quality_Task]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quality_Task](
	[TaskID] [nvarchar](15) NOT NULL,
	[ContainerNumber] [nvarchar](64) NOT NULL,
	[VendorID] [nvarchar](15) NULL,
	[LocationID] [nvarchar](15) NULL,
	[ReceiveDate] [datetime] NULL,
	[GRNSysDocID] [nvarchar](30) NULL,
	[GRNVoucherID] [nvarchar](30) NULL,
	[Description] [nvarchar](255) NULL,
	[AssignedTo] [nvarchar](64) NULL,
	[CommodityID] [nvarchar](30) NULL,
	[Status] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Quality_Task] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rack]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rack](
	[RackID] [nvarchar](30) NOT NULL,
	[BinID] [nvarchar](30) NOT NULL,
	[RackName] [nvarchar](64) NULL,
	[Inactive] [bit] NULL,
	[Remarks] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Rack] PRIMARY KEY CLUSTERED 
(
	[RackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recurring_Transaction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recurring_Transaction](
	[TransactionID] [varchar](50) NOT NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[SysDocType] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[RepeateEvery] [char](1) NULL,
	[Interval] [tinyint] NULL,
	[LastRunDate] [date] NULL,
	[LastSysDocID] [nvarchar](7) NULL,
	[LastVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[ProcessedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Recurring_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Recurring_Transaction_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recurring_Transaction_Detail](
	[TransactionID] [varchar](50) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[CreatedSysDocID] [nvarchar](7) NULL,
	[CreatedVoucherID] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Register]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[RegisterID] [nvarchar](15) NOT NULL,
	[RegisterName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[CashAccountID] [nvarchar](64) NULL,
	[CardReceivedAccountID] [nvarchar](64) NULL,
	[PDCReceivedAccountID] [nvarchar](64) NULL,
	[PDCIssuedAccountID] [nvarchar](64) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Register_Inactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[RegisterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Release_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release_Type](
	[ReleaseTypeID] [nvarchar](30) NOT NULL,
	[ReleaseTypeName] [nvarchar](64) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Release_Type] PRIMARY KEY CLUSTERED 
(
	[ReleaseTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Religion]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religion](
	[ReligionID] [nvarchar](15) NOT NULL,
	[ReligionName] [nvarchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Religion] PRIMARY KEY CLUSTERED 
(
	[ReligionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reminder_Setting]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reminder_Setting](
	[ReminderID] [tinyint] NULL,
	[UserID] [nvarchar](15) NULL,
	[Days] [tinyint] NULL,
	[IsSelected] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rental_Posting]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental_Posting](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SheetName] [nvarchar](30) NULL,
	[TransactionDate] [datetime] NULL,
	[Month] [tinyint] NULL,
	[Year] [smallint] NULL,
	[AsofDate] [datetime] NULL,
	[Note] [nvarchar](255) NULL,
	[Reference] [nvarchar](15) NULL,
	[IsPosted] [bit] NULL,
	[IsClosed] [bit] NULL,
	[IsVoid] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_PropertyRental_Posting] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rental_Posting_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental_Posting_Detail](
	[SysDocID] [nvarchar](15) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [nchar](10) NULL,
	[TenantID] [nvarchar](64) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](6) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RentedDays] [decimal](18, 5) NULL,
	[NetAmount] [money] NULL,
	[PaidAmount] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rental_Posting_Detail_Item]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental_Posting_Detail_Item](
	[SysDocID] [nvarchar](15) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TenantID] [nvarchar](64) NULL,
	[PayrollItemID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[RowIndex] [int] NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](6) NULL,
	[PayType] [tinyint] NULL,
	[Amount] [money] NULL,
	[PayableAmount] [money] NULL,
	[DaysRented] [decimal](18, 5) NULL,
	[Paid] [money] NULL,
	[PayCodeType] [tinyint] NULL,
	[IsFixed] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation_Detail](
	[ReserveID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SysDocType] [int] NULL,
	[ProductID] [nvarchar](64) NULL,
	[LotNumber] [nvarchar](50) NULL,
	[JobID] [nvarchar](50) NULL,
	[CustomerID] [nvarchar](64) NULL,
	[OrderRowIndex] [int] NULL,
	[Quantity] [decimal](18, 5) NULL,
	[ValidDateUpTo] [datetime] NULL,
	[SourceReserveID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Returned_Cheque_Reason]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returned_Cheque_Reason](
	[ReasonID] [nvarchar](15) NOT NULL,
	[ReasonName] [nvarchar](64) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Returned_Cheque_Reason_Inactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Returned_Cheque_Reason] PRIMARY KEY CLUSTERED 
(
	[ReasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rider_Summary]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rider_Summary](
	[RiderID] [nvarchar](50) NOT NULL,
	[RiderName] [nvarchar](50) NULL,
	[IsInactive] [bit] NULL,
	[Type] [nvarchar](50) NULL,
	[LicenseNumber] [nvarchar](50) NULL,
	[FEIRegisterNumber] [nvarchar](50) NULL,
	[FathersName] [nvarchar](50) NULL,
	[FamilyName] [nvarchar](50) NULL,
	[Nationality] [nvarchar](50) NULL,
	[DateofBirth] [datetime] NULL,
	[Gender] [nvarchar](50) NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Route]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[RouteID] [nvarchar](30) NOT NULL,
	[RouteName] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[BOMID] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
	[Remarks] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Route_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route_Group](
	[RouteGroupID] [nvarchar](30) NOT NULL,
	[RouteGroupName] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Route_Group] PRIMARY KEY CLUSTERED 
(
	[RouteGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Route_Group_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route_Group_Detail](
	[RouteGroupID] [nvarchar](30) NOT NULL,
	[Step] [int] NOT NULL,
	[RouteID] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[PreviousStep] [int] NULL,
	[Remarks] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salary_Addition]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_Addition](
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](15) NULL,
	[ApprovalDate] [datetime] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Salary_Addition] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salary_Addition_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_Addition_Detail](
	[VoucherID] [nvarchar](15) NOT NULL,
	[PayrollPeriod] [datetime] NULL,
	[EmployeeID] [nvarchar](15) NOT NULL,
	[EmployeeName] [nvarchar](64) NULL,
	[AdditionCode] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Rate] [money] NULL,
	[Amount] [money] NULL,
	[AmountType] [nvarchar](5) NULL,
	[Remarks] [nvarchar](500) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salary_Deduction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_Deduction](
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](15) NULL,
	[ApprovalDate] [datetime] NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Salary_Deduction] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salary_Deduction_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_Deduction_Detail](
	[VoucherID] [nvarchar](15) NOT NULL,
	[PayrollPeriod] [datetime] NULL,
	[EmployeeID] [nvarchar](15) NOT NULL,
	[EmployeeName] [nvarchar](64) NULL,
	[DeductionCode] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Rate] [money] NULL,
	[Amount] [money] NULL,
	[Remarks] [nvarchar](500) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalarySheet]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalarySheet](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[SheetName] [nvarchar](100) NULL,
	[TransactionDate] [datetime] NULL,
	[Month] [tinyint] NULL,
	[Year] [smallint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Note] [nvarchar](255) NULL,
	[Reference] [nvarchar](15) NULL,
	[IsPosted] [bit] NULL,
	[IsClosed] [bit] NULL,
	[IsVoid] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Salary_Sheet_1] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalarySheet_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalarySheet_Detail](
	[SysDocID] [nvarchar](15) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RowIndex] [nchar](10) NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[WorkDays] [decimal](18, 5) NULL,
	[Absent] [decimal](18, 5) NULL,
	[AnnualLeaves] [decimal](18, 5) NULL,
	[UnpaidAnnualLeaves] [decimal](18, 5) NULL,
	[NormalLeaves] [decimal](18, 5) NULL,
	[SickLeaves] [decimal](18, 5) NULL,
	[Basic] [money] NULL,
	[Allowance] [money] NULL,
	[Deduction] [money] NULL,
	[LoanDeduction] [money] NULL,
	[OTHours] [decimal](18, 5) NULL,
	[OTRate] [money] NULL,
	[OTAmount] [money] NULL,
	[OTBase] [money] NULL,
	[OTFactor] [decimal](18, 5) NULL,
	[NetSalary] [money] NULL,
	[OTFixedAmount] [money] NULL,
	[OTIsFixed] [bit] NULL,
	[PaidAmount] [money] NULL,
	[Remarks] [nvarchar](3000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalarySheet_Detail_Item]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalarySheet_Detail_Item](
	[SysDocID] [nvarchar](15) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[PayrollItemID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[RowIndex] [int] NULL,
	[LoanSysDocID] [nvarchar](7) NULL,
	[PayType] [tinyint] NULL,
	[Amount] [money] NULL,
	[PayableAmount] [money] NULL,
	[DaysWorked] [decimal](18, 5) NULL,
	[Paid] [money] NULL,
	[InDeduction] [bit] NULL,
	[PayCodeType] [tinyint] NULL,
	[IsFixed] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Enquiry]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Enquiry](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[IsExport] [bit] NULL,
	[DueDate] [datetime] NULL,
	[SalesFlow] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_Enquiry] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Enquiry_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Enquiry_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[QuantityShipped] [decimal](18, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Forecasting]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Forecasting](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[LocationFrom] [nvarchar](15) NULL,
	[Period] [int] NULL,
	[Loc1] [nvarchar](15) NULL,
	[Loc2] [nvarchar](15) NULL,
	[Loc3] [nvarchar](15) NULL,
	[Loc4] [nvarchar](15) NULL,
	[Loc5] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Note] [nvarchar](4000) NULL,
	[CalculationMethod] [tinyint] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_Forecasting] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Forecasting_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Forecasting_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Loc1Qty] [decimal](18, 5) NULL,
	[Loc2Qty] [decimal](18, 5) NULL,
	[Loc3Qty] [decimal](18, 5) NULL,
	[Loc4Qty] [decimal](18, 5) NULL,
	[Loc5Qty] [decimal](18, 5) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[UnitID] [nvarchar](15) NULL,
	[RowSource] [tinyint] NULL,
	[Quantity] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Invoice]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Invoice](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[CLUserID] [nvarchar](15) NULL,
	[IsCash] [bit] NULL,
	[IsExport] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ReportTo] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL CONSTRAINT [DF_Sales_Invoice_Status]  DEFAULT ((1)),
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[PriceIncludeTax] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[RoundOff] [money] NULL,
	[Total] [money] NULL,
	[TotalCOGS] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[IsDelivered] [bit] NULL CONSTRAINT [DF_Sales_Invoice_IsDelivered]  DEFAULT ((0)),
	[IsWeightInvoice] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[ExpAmount] [money] NULL,
	[ExpCode] [nvarchar](30) NULL,
	[ExpPercent] [decimal](18, 0) NULL,
	[RequireUpdate] [bit] NULL,
	[DriverID] [nvarchar](15) NULL,
	[VehicleID] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_Invoice] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Invoice_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Invoice_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[FOCQuantity] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Discount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[COGS] [money] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[IsDNRow] [bit] NULL,
	[IsRecost] [bit] NULL,
	[ITRowID] [int] NULL,
	[RowSource] [tinyint] NULL,
	[WeightQuantity] [decimal](18, 5) NULL,
	[WeightPrice] [decimal](18, 5) NULL,
	[ConsignmentNo] [nvarchar](50) NULL,
	[ListVoucherID] [nvarchar](15) NULL,
	[ListSysDocID] [nvarchar](7) NULL,
	[ListRowIndex] [int] NULL,
	[RefSlNo] [int] NULL,
	[RefText1] [nvarchar](50) NULL,
	[RefText2] [nvarchar](50) NULL,
	[RefNum1] [decimal](18, 5) NULL,
	[RefNum2] [decimal](18, 5) NULL,
	[RefDate1] [datetime] NULL,
	[RefDate2] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Invoice_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_Invoice_Expense](
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[Description] [nvarchar](64) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[IsDeduct] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Sales_Invoice_NonInv]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Invoice_NonInv](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[CLUserID] [nvarchar](15) NULL,
	[IsCash] [bit] NULL,
	[IsExport] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ReportTo] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[PriceIncludeTax] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[RoundOff] [money] NULL,
	[Total] [money] NULL,
	[TotalCOGS] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[IsDelivered] [bit] NULL,
	[IsWeightInvoice] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[ExpAmount] [money] NULL,
	[ExpCode] [nvarchar](30) NULL,
	[ExpPercent] [decimal](18, 0) NULL,
	[RequireUpdate] [bit] NULL,
	[DriverID] [nvarchar](15) NULL,
	[VehicleID] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[PropertyID] [nvarchar](15) NULL,
	[PropertyUnitID] [nvarchar](15) NULL,
	[AgentID] [nvarchar](15) NULL,
	[InvoiceType] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_Invoice_NonInv] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Invoice_NonInv_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Invoice_NonInv_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[FOCQuantity] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Discount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[COGS] [money] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[IsDNRow] [bit] NULL,
	[IsRecost] [bit] NULL,
	[ITRowID] [int] NULL,
	[RowSource] [tinyint] NULL,
	[WeightQuantity] [decimal](18, 5) NULL,
	[WeightPrice] [decimal](18, 5) NULL,
	[ConsignmentNo] [nvarchar](50) NULL,
	[ListVoucherID] [nvarchar](15) NULL,
	[ListSysDocID] [nvarchar](7) NULL,
	[ListRowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Man_Target]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Man_Target](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Month] [int] NULL,
	[TargetType] [nvarchar](15) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Man_Target_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Man_Target_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SalesManGroupID] [nvarchar](15) NULL,
	[SalesManID] [nvarchar](15) NULL,
	[ProductClassID] [nvarchar](15) NULL,
	[ProductCategoryID] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL,
	[Amount] [money] NULL,
	[CommissionPercent] [money] NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Order]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Order](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[IsExport] [bit] NULL,
	[DueDate] [datetime] NULL,
	[SalesFlow] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[PriceIncludeTax] [bit] NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[TaxAmount] [money] NULL,
	[RoundOff] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_Order] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Order_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Order_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[Discount] [money] NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[LocationID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[RefSlNo] [int] NULL,
	[RefText1] [nvarchar](50) NULL,
	[RefText2] [nvarchar](50) NULL,
	[RefNum1] [decimal](18, 5) NULL,
	[RefNum2] [decimal](18, 5) NULL,
	[RefDate1] [datetime] NULL,
	[RefDate2] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Order_ProductLot_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Order_ProductLot_Detail](
	[LotNumber] [nvarchar](50) NULL,
	[Reference] [nvarchar](50) NULL,
	[SourceLotNumber] [nvarchar](15) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[ProductID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[BinID] [nvarchar](15) NULL,
	[RackID] [nvarchar](30) NULL,
	[SoldQty] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[Reference2] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_POS]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_POS](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[ShiftID] [int] NULL,
	[BatchID] [int] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[IsCash] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[PriceIncludeTax] [bit] NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [decimal](18, 2) NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [decimal](18, 2) NULL,
	[Change] [decimal](18, 2) NULL,
	[TotalCOGS] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsDelivered] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[RequireUpdate] [bit] NULL,
	[SearchValue] [nvarchar](64) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_POS] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_POS_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_POS_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[Barcode] [nvarchar](64) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Discount] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[COGS] [money] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](6) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL,
	[IsDNRow] [bit] NULL,
	[IsRecost] [bit] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Quote]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Quote](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[EntityType] [nvarchar](2) NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[SalesFlow] [tinyint] NULL,
	[RequiredDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL CONSTRAINT [DF_Sales_Quote_Status]  DEFAULT ((1)),
	[CurrencyID] [nvarchar](5) NULL,
	[PriceIncludeTax] [bit] NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[RoundOff] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[Note] [nvarchar](4000) NULL,
	[Remarks1] [nvarchar](2000) NULL,
	[Remarks2] [nvarchar](2000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[LastRevisedDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_Quote] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Quote_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Quote_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [real] NULL,
	[UnitFactor] [real] NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[Cost] [decimal](18, 5) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[RefSlNo] [int] NULL,
	[RefText1] [nvarchar](50) NULL,
	[RefText2] [nvarchar](50) NULL,
	[RefNum1] [decimal](18, 5) NULL,
	[RefNum2] [decimal](18, 5) NULL,
	[RefDate1] [datetime] NULL,
	[RefDate2] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Quote_Detail_History]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Quote_Detail_History](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RevisionNo] [int] NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [real] NULL,
	[UnitFactor] [real] NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Quote_History]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Quote_History](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[RevisionNo] [int] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[EntityType] [nvarchar](2) NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[SalesFlow] [tinyint] NULL,
	[RequiredDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[LastRevisedDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Receipt]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Receipt](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RegisterID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[IsDelivered] [bit] NULL,
	[Note] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_Receipt] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Receipt_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Receipt_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[OrderRowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Return]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Return](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[IsCash] [bit] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ReportTo] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[PriceIncludeTax] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[ReasonID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[RoundOff] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[IsDelivered] [bit] NULL,
	[RequireUpdate] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sales_Return_1] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Return_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Return_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[TaxAmount] [money] NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[DNoteVoucherID] [nvarchar](15) NULL,
	[DNoteSysDocID] [nvarchar](7) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL,
	[OrderRowIndex] [int] NULL,
	[SourceDocType] [tinyint] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ITRowID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salesperson]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesperson](
	[SalespersonID] [nvarchar](64) NOT NULL,
	[FullName] [nvarchar](64) NULL,
	[Alias] [nvarchar](64) NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[ReportTo] [nvarchar](64) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[GroupID] [nvarchar](15) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NULL,
	[Website] [nvarchar](30) NULL,
	[BankName] [nvarchar](30) NULL,
	[BankBranch] [nvarchar](30) NULL,
	[BankAccountNumber] [nvarchar](30) NULL,
	[CommissionPercent] [decimal](4, 2) NULL,
	[CommissionType] [tinyint] NULL,
	[AreaID] [nvarchar](15) NULL,
	[CountryID] [nvarchar](15) NULL,
	[EmailStatement] [bit] NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateUpdated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Salesperson] PRIMARY KEY CLUSTERED 
(
	[SalespersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salesperson_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesperson_Group](
	[GroupID] [nvarchar](15) NOT NULL,
	[GroupName] [nvarchar](30) NOT NULL,
	[POSAccess] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Salesperson_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesProforma_Invoice]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesProforma_Invoice](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[IsExport] [bit] NULL,
	[DueDate] [datetime] NULL,
	[SalesFlow] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[BillingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[ShipToAddress] [nvarchar](255) NULL,
	[PriceIncludeTax] [bit] NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[TaxAmount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](50) NULL,
	[Note] [nvarchar](4000) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[ShippingReference] [nvarchar](15) NULL,
	[SourcePortID] [nvarchar](15) NULL,
	[DestinationPortID] [nvarchar](15) NULL,
	[ETD] [datetime] NULL,
	[ETA] [datetime] NULL,
	[Weight] [decimal](18, 5) NULL,
	[TransporterID] [nvarchar](50) NULL,
	[ClearingAgent] [nvarchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_SalesProforma_Invoice1_Detail] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesProforma_Invoice_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesProforma_Invoice_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[TaxPercentage] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[RowIndex] [smallint] NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[Remarks] [nvarchar](3000) NULL,
	[SpecificationID] [nvarchar](15) NULL,
	[StyleID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Screen_Security]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screen_Security](
	[ScreenID] [nvarchar](60) NULL,
	[ViewRight] [bit] NULL,
	[DeleteRight] [bit] NULL,
	[EditRight] [bit] NULL,
	[NewRight] [bit] NULL,
	[UserID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Security_Cheque]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Security_Cheque](
	[VoucherID] [nvarchar](15) NOT NULL,
	[SysDocID] [nvarchar](15) NOT NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[ChequeNumber] [nvarchar](15) NULL,
	[IssueDate] [datetime] NULL,
	[Amount] [money] NULL,
	[ChequeDate] [datetime] NULL,
	[PayeeType] [char](1) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[IsVoid] [bit] NULL,
	[VoidDate] [datetime] NULL,
	[Note] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
 CONSTRAINT [PK_Security_Cheque_1] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC,
	[SysDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Service_Activity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Activity](
	[ServiceActivityID] [nvarchar](15) NOT NULL,
	[ServiceActivityName] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_Service_Activity] PRIMARY KEY CLUSTERED 
(
	[ServiceActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service_CallTrack]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_CallTrack](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[JobID] [nvarchar](50) NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactNo] [nvarchar](30) NULL,
	[Location] [nvarchar](30) NULL,
	[ReqReceivedDate] [datetime] NULL,
	[ReqReceivedTime] [time](7) NULL,
	[ServiceEmployeeID] [nvarchar](15) NULL,
	[ServiceAssignDate] [datetime] NULL,
	[ServiceAssignTime] [time](7) NULL,
	[ServiceUnder] [nchar](4) NULL,
	[ServiceStartDate] [datetime] NULL,
	[ServiceStartTime] [time](7) NULL,
	[ServiceFinishedDate] [datetime] NULL,
	[ServiceFinishedTime] [time](7) NULL,
	[TravelHours] [int] NULL,
	[TravelMins] [int] NULL,
	[LabourHours] [int] NULL,
	[LabourMins] [int] NULL,
	[ServiceHours] [numeric](15, 2) NULL,
	[ServiceTotal] [numeric](15, 2) NULL,
	[PartsTotal] [numeric](15, 2) NULL,
	[LabourTotal] [numeric](15, 2) NULL,
	[TravelTotal] [numeric](15, 2) NULL,
	[TotalCharges] [numeric](15, 2) NULL,
	[RepairDetails] [ntext] NULL,
	[Status] [tinyint] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_ServiceCallTrack] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service_ClientAsset_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_ClientAsset_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ClientAssetID] [nvarchar](15) NULL,
	[SerialNo] [nvarchar](50) NULL,
	[ProblemDescription] [nvarchar](255) NULL,
	[RowIndex] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service_Item]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Item](
	[ServiceItemID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[ServiceType] [nvarchar](50) NULL,
	[APAccountID] [nvarchar](64) NULL,
	[RepeatCountDays] [nvarchar](50) NULL,
	[RepeatCountKM] [nchar](50) NULL,
	[ReminderDays] [nvarchar](50) NULL,
	[ReminderKM] [nchar](50) NULL,
	[VehicleType] [nvarchar](50) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[Inactive] [bit] NULL,
 CONSTRAINT [PK_Service_Item] PRIMARY KEY CLUSTERED 
(
	[ServiceItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service_PartsReplaced_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_PartsReplaced_Detail](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ProductID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[ChargeableStatus] [bit] NULL,
	[RowIndex] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [nvarchar](64) NULL,
	[SName] [nvarchar](64) NULL,
	[SKey] [nvarchar](64) NULL,
	[SValue] [nvarchar](69) NULL,
	[SData] [ntext] NULL,
	[SBinData] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Setup_Inventory]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setup_Inventory](
	[CompanyID] [tinyint] NULL,
	[Price1Name] [nvarchar](15) NULL,
	[Price2Name] [nvarchar](15) NULL,
	[Price3Name] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipping_Method]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping_Method](
	[ShippingMethodID] [nvarchar](15) NOT NULL,
	[ShippingMethodName] [nvarchar](64) NOT NULL,
	[ContactName] [nvarchar](64) NULL,
	[Phone] [nvarchar](30) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Shippers_IsInactive]  DEFAULT ((0)),
	[TrackShipment] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[DateUpdated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Shipers] PRIMARY KEY CLUSTERED 
(
	[ShippingMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shortcut]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shortcut](
	[ShortcutType] [tinyint] NOT NULL,
	[UserID] [nvarchar](15) NOT NULL,
	[ShortcutKey] [nvarchar](30) NOT NULL,
	[ShortcutText] [nvarchar](30) NULL,
 CONSTRAINT [PK_Shortcut] PRIMARY KEY CLUSTERED 
(
	[ShortcutType] ASC,
	[UserID] ASC,
	[ShortcutKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skill]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[SkillID] [nvarchar](15) NOT NULL,
	[SkillName] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Smartlist]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smartlist](
	[SmartListID] [int] IDENTITY(1,1) NOT NULL,
	[SmartListName] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[Query] [ntext] NULL,
	[ReportData] [image] NULL,
	[CategoryID] [nvarchar](30) NULL,
	[ParentID] [nvarchar](30) NULL,
	[DrillAction] [tinyint] NULL,
	[DrillCardTypeID] [int] NULL,
	[DrillCardIDField] [nvarchar](30) NULL,
	[DrillTransactionSysDocIDField] [nvarchar](30) NULL,
	[DrillTransactionVoucherIDField] [nvarchar](30) NULL,
	[DrillParm1] [nvarchar](30) NULL,
	[DrillParm2] [nvarchar](30) NULL,
	[DrillParm3] [nvarchar](30) NULL,
	[DrillParm4] [nvarchar](30) NULL,
	[IsSubReport] [bit] NULL,
	[DrillSubReportID] [int] NULL,
	[IsPreview] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[DisplayNote] [nvarchar](4000) NULL,
	[IsHideDateFilter] [bit] NULL,
	[IsSetDateEqualTo] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Smartlist] PRIMARY KEY CLUSTERED 
(
	[SmartListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Smartlist_Category]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smartlist_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](30) NULL,
	[ParentID] [nvarchar](30) NULL,
	[RowIndex] [int] NULL,
 CONSTRAINT [PK_Smartlist_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sponsor]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsor](
	[SponsorID] [nvarchar](15) NOT NULL,
	[SponsorName] [nvarchar](64) NULL,
	[MOLId] [nvarchar](64) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Sponsor_IsInactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Sponsor] PRIMARY KEY CLUSTERED 
(
	[SponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Standing_Journal]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standing_Journal](
	[StandingJournalID] [nvarchar](15) NOT NULL,
	[Reference] [nvarchar](30) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TransactionSysDocID] [nvarchar](7) NULL,
	[StartYear] [smallint] NULL,
	[StartMonth] [tinyint] NULL,
	[EndYear] [smallint] NULL,
	[EndMonth] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[Narration] [nvarchar](255) NULL,
	[Note] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Standing_Journal_1] PRIMARY KEY CLUSTERED 
(
	[StandingJournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Standing_Journal_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standing_Journal_Detail](
	[StandingJournalID] [nvarchar](15) NOT NULL,
	[AccountID] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[RowIndex] [smallint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[Reference] [nvarchar](30) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[PayeeType] [nvarchar](1) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[CostCenterID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Surveyor]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surveyor](
	[SurveyorID] [nvarchar](15) NOT NULL,
	[SurveyorName] [nvarchar](64) NOT NULL,
	[Tel] [nvarchar](40) NULL,
	[Mobile] [nvarchar](40) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Surveyor] PRIMARY KEY CLUSTERED 
(
	[SurveyorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sync_Activity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sync_Activity](
	[SyncActvityID] [int] IDENTITY(1,1) NOT NULL,
	[SyncActivityType] [tinyint] NULL,
	[SyncTokenID] [int] NULL,
	[EntityID] [nvarchar](64) NULL,
	[SysDocID] [nvarchar](7) NULL,
	[SyncLogDate] [datetime] NULL,
	[UserID] [nvarchar](64) NULL,
	[MachineID] [nvarchar](64) NULL,
	[Description] [nvarchar](500) NULL,
	[ActivityDataView] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[System_Doc_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Doc_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[SysDocType] [int] NULL,
	[RowIndex] [int] NULL,
	[PrintTemplate] [nvarchar](100) NULL,
	[TemplateDescription] [nvarchar](30) NULL,
	[TemplateKeyword] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[System_Doc_Entity_Link]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Doc_Entity_Link](
	[SysDocID] [nvarchar](7) NOT NULL,
	[EntityID] [nvarchar](64) NOT NULL,
	[EntityType] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[System_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Document](
	[SysDocID] [nvarchar](7) NOT NULL,
	[SysDocType] [int] NULL,
	[DocName] [nvarchar](64) NULL,
	[CompanyID] [tinyint] NULL,
	[DivisionID] [nvarchar](15) NULL,
	[PrintTitle] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[PrintTemplateName] [nvarchar](64) NULL,
	[ConsignOutLocationID] [nvarchar](15) NULL,
	[ConsignInSalesAccountID] [nvarchar](64) NULL,
	[ConsignInCOGSAccountID] [nvarchar](64) NULL,
	[ConsignInPayableAccountID] [nvarchar](64) NULL,
	[SalesAccountID] [nvarchar](64) NULL,
	[COGSAccountID] [nvarchar](64) NULL,
	[SalesTaxAccountID] [nvarchar](64) NULL,
	[DiscountGivenAccountID] [nvarchar](64) NULL,
	[NextNumber] [bigint] NULL,
	[PriceIncludeTax] [bit] NULL,
	[NumberPrefix] [nvarchar](10) NULL,
	[LastNumber] [nvarchar](15) NULL,
	[NextTempNumber] [bigint] NULL,
	[AllowFOC] [bit] NULL,
	[IsBOLMandatory] [bit] NULL,
	[IsSupplierInvoiceNoMandatory] [bit] NULL,
	[ItemFilterBasedonCustomer] [bit] NULL,
	[AllowMultiTemplate] [bit] NULL,
	[Inactive] [bit] NULL,
	[PrintAfterSave] [bit] NULL,
	[DoPrint] [bit] NULL,
	[OpenListQuery] [nvarchar](max) NULL,
	[IsSystem] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_System_Document] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tabs_Security]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tabs_Security](
	[TabID] [nvarchar](255) NOT NULL,
	[Visible] [bit] NULL,
	[UserID] [nvarchar](15) NULL,
	[GroupID] [nvarchar](15) NULL,
 CONSTRAINT [PK_Tab_Security] PRIMARY KEY CLUSTERED 
(
	[TabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task_Steps]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Steps](
	[TaskStepID] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[TaskTypeID] [nvarchar](30) NOT NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Task_Steps] PRIMARY KEY CLUSTERED 
(
	[TaskStepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task_Transaction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Transaction](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TaskName] [nvarchar](50) NULL,
	[TaskTypeID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[StartDate] [datetime] NULL,
	[DocType] [int] NULL,
	[AssignedSysDocID] [nvarchar](7) NULL,
	[AssignedVouherID] [nvarchar](15) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Task_Transaction] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task_Transaction_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Transaction_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TaskStepID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[DefaultAssigneeID] [nvarchar](15) NULL,
	[StartDate] [datetime] NULL,
	[DeadLine] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[DocType] [int] NULL,
	[PreRequest] [nvarchar](50) NULL,
	[DaysAllowed] [tinyint] NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task_Transaction_Status]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Transaction_Status](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[TaskName] [nvarchar](15) NOT NULL,
	[TaskStepID] [nvarchar](30) NOT NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[TRSysDocID] [nvarchar](7) NULL,
	[TRVoucherID] [nvarchar](15) NULL,
	[Status] [nvarchar](7) NULL,
	[Remarks] [nvarchar](255) NULL,
	[Message] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Task_Transaction_Status] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Type](
	[TaskTypeID] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Task_Type] PRIMARY KEY CLUSTERED 
(
	[TaskTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task_Type_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task_Type_Detail](
	[TaskTypeID] [nvarchar](64) NOT NULL,
	[TaskStepID] [nvarchar](64) NULL,
	[DefaultAssigneeID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[DocTypeID] [tinyint] NULL,
	[DocTypeName] [varchar](50) NULL,
	[DaysAllowed] [tinyint] NULL,
	[PreRequest] [nvarchar](50) NULL,
	[RowIndex] [smallint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Tax]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax](
	[TaxCode] [nvarchar](15) NOT NULL,
	[TaxName] [nvarchar](64) NULL,
	[Description] [nvarchar](64) NULL,
	[Remarks] [nvarchar](2000) NULL,
	[SalesTaxAccountID] [nvarchar](64) NULL,
	[PurchaseTaxAccountID] [nvarchar](64) NULL,
	[TaxReverseChargeAccountID] [nvarchar](64) NULL,
	[TaxID] [nvarchar](15) NULL,
	[TaxType] [nvarchar](15) NULL,
	[CalculationMethod] [tinyint] NULL,
	[TaxRate] [money] NULL,
	[IsFixed] [bit] NULL,
	[IsPercent] [bit] NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Tax] PRIMARY KEY CLUSTERED 
(
	[TaxCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tax_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax_Detail](
	[SysDocID] [nvarchar](15) NOT NULL,
	[VoucherID] [nvarchar](30) NOT NULL,
	[TaxLevel] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NOT NULL,
	[TaxItemID] [nvarchar](15) NOT NULL,
	[CalculationMethod] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TaxRate] [decimal](18, 5) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[OrderIndex] [int] NULL,
	[RowIndex] [int] NULL,
	[AccountID] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tax_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax_Group](
	[TaxGroupID] [nvarchar](15) NOT NULL,
	[TaxGroupName] [nvarchar](64) NULL,
	[Note] [nvarchar](64) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Tax_Group] PRIMARY KEY CLUSTERED 
(
	[TaxGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tax_Group_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax_Group_Detail](
	[TaxGroupID] [nvarchar](15) NOT NULL,
	[TaxCode] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](64) NOT NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tax_ProductClass_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax_ProductClass_Detail](
	[ClassID] [nvarchar](15) NOT NULL,
	[TaxID] [nvarchar](15) NOT NULL,
	[TaxPercent] [decimal](18, 2) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Temporary_Transaction]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temporary_Transaction](
	[AutoKeyID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [nvarchar](64) NULL,
	[SName] [nvarchar](64) NULL,
	[SKey] [nvarchar](275) NULL,
	[SValue] [nvarchar](69) NULL,
	[SData] [ntext] NULL,
	[SBinData] [image] NULL,
	[SysDocID] [nvarchar](64) NULL,
	[VoucherID] [nvarchar](64) NULL,
	[CustomerID] [nvarchar](30) NULL,
	[TransactionDate] [nvarchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tenancy_Contract]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenancy_Contract](
	[ContractID] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[Landlord] [nvarchar](64) NULL,
	[Tenant] [nvarchar](64) NULL,
	[ContactID] [nvarchar](64) NULL,
	[Location] [nvarchar](30) NULL,
	[Status] [tinyint] NULL,
	[ContractAmount] [money] NULL,
	[Installments] [tinyint] NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Note] [ntext] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Tenancy_Contract] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Total_Mile_Report]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Total_Mile_Report](
	[VehicleID] [nvarchar](15) NULL,
	[StartDate] [datetime] NULL,
	[TotalOdometer] [numeric](15, 2) NULL,
	[TotalDriveTime] [numeric](15, 2) NULL,
	[TotalStopTime] [numeric](15, 2) NULL,
	[TotalIdleTime] [numeric](15, 2) NULL,
	[VehiclePlate] [nvarchar](250) NULL,
	[FleetName] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TR_Application]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TR_Application](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TransactionDate] [datetime] NULL,
	[PayeeType] [nvarchar](1) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[Reference] [nvarchar](15) NULL,
	[DueDate] [datetime] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RequestSysDocID] [nvarchar](7) NULL,
	[RequestVoucherID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[IsVoid] [bit] NULL,
	[POSysDocID] [nvarchar](7) NULL,
	[POVoucherID] [nvarchar](15) NULL,
	[InvoiceNos] [nvarchar](100) NULL,
	[Authorizedby] [nvarchar](30) NULL,
	[NoofInvoices] [int] NULL,
	[NoofPL] [int] NULL,
	[NoofBOL] [int] NULL,
	[NoofGoods] [nvarchar](30) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](64) NULL,
	[UpdatedBy] [nvarchar](64) NULL,
 CONSTRAINT [PK_TR_Application] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trade_License]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trade_License](
	[TradeLicenseID] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[Sponsors] [nvarchar](255) NULL,
	[ContactID] [nvarchar](64) NULL,
	[Partners] [nvarchar](255) NULL,
	[RegisterNumber] [nvarchar](20) NULL,
	[LegalType] [nvarchar](30) NULL,
	[IssuePlace] [nvarchar](30) NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[RenewDate] [smalldatetime] NULL,
	[Status] [tinyint] NULL,
	[Note] [ntext] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Trade_License] PRIMARY KEY CLUSTERED 
(
	[TradeLicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction_Details]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Details](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[AccountID] [nvarchar](64) NULL,
	[Description] [nvarchar](255) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ExpAmount] [money] NULL,
	[ExpCode] [nvarchar](30) NULL,
	[ExpPercent] [decimal](18, 0) NULL,
	[RowIndex] [int] NULL,
	[Reference] [nvarchar](20) NULL,
	[PayeeID] [nvarchar](64) NULL,
	[BankFacilityID] [nvarchar](15) NULL,
	[DueDate] [datetime] NULL,
	[PayeeType] [nvarchar](1) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[CostCenterID] [nvarchar](15) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[IsVoid] [bit] NULL,
	[PaymentMethodID] [nvarchar](15) NULL,
	[ChequebookID] [nvarchar](15) NULL,
	[BankID] [nvarchar](15) NULL,
	[CheckNumber] [nvarchar](20) NULL,
	[CheckDate] [datetime] NULL,
	[ChequeID] [int] NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[ConsignID] [nvarchar](22) NULL,
	[ConsignExpenseID] [nvarchar](15) NULL,
	[IsBilled] [bit] NULL,
	[AttributeID1] [nvarchar](50) NULL,
	[AttributeID2] [nvarchar](50) NULL,
	[RefDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transporter]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transporter](
	[TransporterID] [nvarchar](30) NOT NULL,
	[TransporterName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Account]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Account](
	[EntityID] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Candidate]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Candidate](
	[EntityID] [nvarchar](64) NULL,
	[TDEE] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Contact]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Contact](
	[EntityID] [nvarchar](64) NOT NULL,
	[FATHERNAME] [nvarchar](30) NULL,
	[ISMARRIED] [bit] NULL,
 CONSTRAINT [PK_UDF_Contact] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Customer]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Customer](
	[EntityID1] [nvarchar](64) NULL,
	[EntityID2] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Employee]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Employee](
	[EntityID] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_FixedAsset]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_FixedAsset](
	[EntityID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Horse]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Horse](
	[EntityID] [nvarchar](64) NULL,
	[TEST] [nvarchar](30) NULL,
	[YU] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Job]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Job](
	[EntityID] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Lead]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Lead](
	[EntityID] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Product]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Product](
	[EntityID] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Property]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Property](
	[EntityID] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_PropertyUnit]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_PropertyUnit](
	[EntityID] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Setup]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Setup](
	[UDFTableName] [nvarchar](64) NOT NULL,
	[FieldName] [nvarchar](15) NOT NULL,
	[FormName] [nvarchar](64) NULL,
	[DisplayName] [nvarchar](30) NULL,
	[TableName] [nvarchar](30) NULL,
	[DataType] [tinyint] NULL,
	[FieldSize] [smallint] NULL,
	[ListType] [smallint] NULL,
	[UDListName] [nvarchar](64) NULL,
 CONSTRAINT [PK_UDF_Setup] PRIMARY KEY CLUSTERED 
(
	[UDFTableName] ASC,
	[FieldName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UDF_Vendor]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDF_Vendor](
	[EntityID] [nvarchar](64) NOT NULL,
	[LABID] [nvarchar](30) NULL,
 CONSTRAINT [PK_UDF_Vendor] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unallocated_Lot_Items]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unallocated_Lot_Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[RowIndex] [int] NULL,
	[LocationID] [nvarchar](15) NULL,
	[Quantity] [decimal](18, 5) NULL,
	[Price] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Unallocated_Lot_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [nvarchar](15) NOT NULL,
	[UnitName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Favorite]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Favorite](
	[UserID] [nvarchar](15) NULL,
	[FavoriteType] [tinyint] NULL,
	[DocumentID] [nvarchar](15) NULL,
	[FavoriteName] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Group](
	[GroupID] [nvarchar](15) NOT NULL,
	[GroupName] [nvarchar](30) NULL,
	[CanCreateCard] [bit] NULL,
	[CanEditCard] [bit] NULL CONSTRAINT [DF_User_Group_CanEditCard]  DEFAULT ((0)),
	[CanDeleteCard] [bit] NULL CONSTRAINT [DF_User_Group_CanDeleteCard]  DEFAULT ((0)),
	[CanCreateTransaction] [bit] NULL,
	[CanEditTransaction] [bit] NULL,
	[CanDeleteTransaction] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_User Groups_IsInactive]  DEFAULT ((0)),
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_User Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Group_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Group_Detail](
	[GroupID] [nvarchar](15) NOT NULL,
	[UserID] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_User Group Assignments] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Location_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Location_Detail](
	[LocationID] [nvarchar](15) NOT NULL,
	[UserID] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_User_Location_Detail] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](15) NOT NULL,
	[UserName] [nvarchar](64) NOT NULL,
	[EmployeeID] [nvarchar](64) NULL,
	[LocationID] [nvarchar](15) NULL,
	[DefaultSalespersonID] [nvarchar](15) NULL,
	[DefaultInventoryLocationID] [nvarchar](15) NULL,
	[DefaultTransactionLocationID] [nvarchar](15) NULL,
	[DefaultTransactionRegisterID] [nvarchar](15) NULL,
	[CanCreateCard] [bit] NULL,
	[CanEditCard] [bit] NULL,
	[CanDeleteCard] [bit] NULL,
	[CanCreateTransaction] [bit] NULL,
	[CanEditTransaction] [bit] NULL,
	[CanDeleteTransaction] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](30) NULL,
	[CLUserPass] [nvarchar](64) NULL,
	[ISCLUser] [bit] NULL,
	[Inactive] [bit] NULL,
	[IsAdmin] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [nvarchar](15) NOT NULL,
	[VehicleName] [nvarchar](30) NULL,
	[RegistrationNumber] [nvarchar](15) NULL,
	[RegistrationCityID] [nvarchar](15) NULL,
	[CountryID] [nvarchar](15) NULL,
	[WorkingAreaID] [nvarchar](15) NULL,
	[ChasisNumber] [nvarchar](20) NULL,
	[VehicleTypeID] [nvarchar](15) NULL,
	[Color] [nvarchar](15) NULL,
	[Year] [smallint] NULL,
	[Fuel] [nvarchar](15) NULL,
	[Model] [nvarchar](15) NULL,
	[FixedAssetID] [nvarchar](15) NULL,
	[InsuranceVendorID] [nvarchar](64) NULL,
	[InsurancePolicyNumber] [nvarchar](20) NULL,
	[InsuranceExpiryDate] [datetime] NULL,
	[RegistrationExpiryDate] [datetime] NULL,
	[CustomExpiryDate1] [datetime] NULL,
	[CustomExpiryDate2] [datetime] NULL,
	[CustomExpiryDate3] [datetime] NULL,
	[TrackingNumber] [nvarchar](30) NULL,
	[LocationID] [nvarchar](15) NULL,
	[DivisionID] [nvarchar](15) NULL,
	[DriverID] [nvarchar](15) NULL,
	[OwnedBy] [nvarchar](64) NULL,
	[AnalysisID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[WeightCapacity] [decimal](10, 2) NULL,
	[VehicleWeight] [decimal](10, 2) NULL,
	[TrafficFileNo] [nvarchar](64) NULL,
	[PlateNo] [nvarchar](64) NULL,
	[Origin] [nvarchar](15) NULL,
	[Photo] [image] NULL,
	[Note] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle_Doc_Type]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Doc_Type](
	[TypeID] [nvarchar](15) NOT NULL,
	[TypeName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Remind] [bit] NULL,
	[RemindDays] [numeric](3, 0) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Vehicle_Doc_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle_Document]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Document](
	[VehicleID] [nvarchar](15) NOT NULL,
	[DocumentNumber] [nvarchar](30) NOT NULL,
	[DocumentTypeID] [nvarchar](15) NOT NULL,
	[IssuePlace] [nvarchar](15) NULL,
	[IssueDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [smallint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Vehicle_Document] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle_Maintenance_Entry]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Maintenance_Entry](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VehicleNumber] [nvarchar](50) NULL,
	[Odometer] [nvarchar](50) NULL,
	[ServiceType] [nvarchar](50) NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[PurchaseFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[BuyerID] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[SourceDocType] [tinyint] NULL,
	[ServiceProvider] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[IsCash] [bit] NULL,
	[IsImport] [bit] NULL,
	[TimeRequired] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[TaxOption] [tinyint] NULL,
	[PayeeTaxGroupID] [nvarchar](15) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[Total] [money] NULL,
	[TotalFC] [money] NULL,
	[Note] [nvarchar](4000) NULL,
	[Status] [tinyint] NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[NextServiceScheduleStatus] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Maintenance_Entry] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle_Maintenance_Entry_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehicle_Maintenance_Entry_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[LCost] [decimal](18, 5) NULL,
	[LCostAmount] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxAmount] [decimal](18, 5) NULL,
	[RowIndex] [smallint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[QuantityReceived] [decimal](18, 5) NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[RowSource] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Vehicle_Maintenance_Scheduler]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Maintenance_Scheduler](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VehicleNumber] [nvarchar](50) NULL,
	[Odometer] [nvarchar](50) NULL,
	[ServiceType] [nvarchar](50) NULL,
	[ServiceProvider] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[TimeRequired] [nvarchar](50) NULL,
	[MaintenanceDate] [datetime] NULL,
	[IsVoid] [bit] NULL,
	[TrackMaintenance] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Maintenance_Scheduler] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle_Mileage_Track]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Mileage_Track](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[IsDateWise] [bit] NULL,
	[Note] [ntext] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle_Mileage_Track_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Mileage_Track_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[TripDate] [datetime] NULL,
	[TripTime] [datetime] NULL,
	[VehicleID] [nvarchar](15) NULL,
	[Name] [nvarchar](50) NULL,
	[Purpose] [nvarchar](50) NULL,
	[DriverID] [nvarchar](15) NULL,
	[PreviousReading] [int] NULL,
	[CurrentReading] [int] NULL,
	[Mileage] [int] NULL,
	[Remarks] [nvarchar](255) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[VendorID] [nvarchar](64) NOT NULL,
	[VendorName] [nvarchar](64) NOT NULL,
	[ShortName] [nvarchar](64) NULL,
	[ForeignName] [nvarchar](64) NULL,
	[CompanyName] [nvarchar](64) NULL,
	[LegalName] [nvarchar](64) NULL,
	[ContactName] [nvarchar](64) NULL,
	[TermID] [nvarchar](15) NULL,
	[VendorClassID] [nvarchar](15) NULL,
	[AcceptCheckPayment] [bit] NULL,
	[AcceptPDC] [bit] NULL,
	[CreditLimitType] [tinyint] NULL,
	[CreditAmount] [money] NULL,
	[APAccountID] [nvarchar](64) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[AreaID] [nvarchar](15) NULL,
	[VendorGroupID] [nvarchar](15) NULL,
	[CountryID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsInactive] [bit] NULL,
	[IsHold] [bit] NULL,
	[IsHoldForPayment] [bit] NULL,
	[IsServiceProvider] [bit] NULL,
	[AllowOAP] [bit] NULL,
	[Photo] [image] NULL,
	[Flag] [tinyint] NULL,
	[BankName] [nvarchar](50) NULL,
	[BankBranch] [nvarchar](100) NULL,
	[BankAccountNumber] [nvarchar](30) NULL,
	[SwiftCode] [nvarchar](50) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[TaxIDNumber] [nvarchar](30) NULL,
	[PaymentTermID] [nvarchar](15) NULL,
	[Note] [nvarchar](255) NULL,
	[PaymentMethodID] [nvarchar](15) NULL,
	[ParentVendorID] [nvarchar](64) NULL,
	[BuyerID] [nvarchar](64) NULL,
	[PrimaryAddressID] [nvarchar](15) NULL,
	[LicenseExpDate] [datetime] NULL,
	[ContractExpDate] [datetime] NULL,
	[Balance] [money] NULL,
	[PDCAmount] [money] NULL,
	[AllowConsignment] [bit] NULL,
	[ConsignComPercent] [decimal](5, 2) NULL,
	[UserDefined1] [nvarchar](64) NULL,
	[UserDefined2] [nvarchar](64) NULL,
	[UserDefined3] [nvarchar](64) NULL,
	[UserDefined4] [nvarchar](64) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor_Address]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_Address](
	[AddressID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[ContactName] [nvarchar](64) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address1] [nvarchar](64) NULL,
	[Address2] [nvarchar](64) NULL,
	[Address3] [nvarchar](64) NULL,
	[AddressPrintFormat] [nvarchar](255) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Department] [nvarchar](30) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](64) NULL,
	[Website] [nvarchar](255) NULL,
	[Comment] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Vendor_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor_Class]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_Class](
	[ClassID] [nvarchar](15) NOT NULL,
	[ClassName] [nvarchar](64) NOT NULL,
	[APAccountID] [nvarchar](64) NULL,
	[IsInactive] [bit] NULL,
	[Note] [nvarchar](255) NULL,
	[TaxOption] [tinyint] NULL,
	[TaxGroupID] [nvarchar](15) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[VendorGroupID] [nvarchar](15) NULL,
 CONSTRAINT [PK_Vendor_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor_Contact_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_Contact_Detail](
	[VendorID] [nvarchar](64) NOT NULL,
	[ContactID] [nvarchar](64) NOT NULL,
	[JobTitle] [nvarchar](30) NULL,
	[Note] [nvarchar](64) NULL,
	[RowIndex] [smallint] NULL,
 CONSTRAINT [PK_Vendor_Contact_Detail] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC,
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor_Group]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_Group](
	[GroupID] [nvarchar](15) NOT NULL,
	[GroupName] [nvarchar](30) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Vendor_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor_Price_List]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_Price_List](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[VendorID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[BuyerID] [nvarchar](64) NULL,
	[ValidDateFrom] [datetime] NULL,
	[ValidDateTo] [datetime] NULL,
	[ApplicableToChild] [bit] NULL,
	[Inactive] [bit] NULL,
	[Status] [tinyint] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[TaxAmount] [money] NULL,
	[Total] [money] NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor_Price_List_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_Price_List_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[VendorProductID] [nvarchar](64) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Remarks] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VER1002]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VER1002](
	[Version] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Visa]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Visa](
	[VisaID] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](64) NULL,
	[SponsorID] [nvarchar](15) NULL,
	[VisaType] [tinyint] NULL,
	[ApplicantName] [nvarchar](64) NULL,
	[Days] [numeric](3, 0) NULL,
	[Nationality] [nvarchar](15) NULL,
	[Gender] [char](1) NULL,
	[BirthDate] [smalldatetime] NULL,
	[ContactID] [nvarchar](64) NULL,
	[PassportNumber] [nvarchar](15) NULL,
	[PassportIssuePlace] [nvarchar](30) NULL,
	[PassportExpiryDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[ValidityDate] [datetime] NULL,
	[IssuePlace] [nvarchar](30) NULL,
	[ArrivalDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[DepartureDate] [datetime] NULL,
	[Note] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Company_Visa] PRIMARY KEY CLUSTERED 
(
	[VisaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[W3PL_Delivery]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[W3PL_Delivery](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[SourceDocType] [tinyint] NULL,
	[SalesFlow] [tinyint] NULL,
	[IsExport] [bit] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[JobID] [nvarchar](50) NULL,
	[CostCategoryID] [nvarchar](30) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Reference2] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsInvoiced] [bit] NULL,
	[IsShipped] [bit] NULL,
	[ContainerNumber] [nvarchar](30) NULL,
	[ContainerSizeID] [nvarchar](20) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[DriverID] [nvarchar](15) NULL,
	[VehicleID] [nvarchar](15) NULL,
	[Note] [nvarchar](4000) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_W3PL_Delivery] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[W3PL_Delivery_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[W3PL_Delivery_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantityReturned] [decimal](18, 5) NULL,
	[QuantityShipped] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceRowIndex] [int] NULL,
	[RowSource] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[W3PL_Expense]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[W3PL_Expense](
	[SysDocID] [nvarchar](7) NULL,
	[VoucherID] [nvarchar](15) NULL,
	[ExpenseID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL,
	[SourceSysDocID] [nvarchar](15) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[Description] [nvarchar](255) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[Reference] [nvarchar](15) NULL,
	[CurrencyID] [nvarchar](15) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[RateType] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[W3PL_GRN]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[W3PL_GRN](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[DivisionID] [nvarchar](15) NULL,
	[CompanyID] [tinyint] NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ConsignLocationID] [nvarchar](15) NULL,
	[RequiredDate] [datetime] NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[IsClosed] [bit] NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsInvoiced] [bit] NULL,
	[TransporterID] [nvarchar](50) NULL,
	[ArrivalPort] [nvarchar](30) NULL,
	[ArrivalDate] [datetime] NULL,
	[ContainerNo] [nvarchar](30) NULL,
	[BLNo] [nvarchar](30) NULL,
	[InvoiceSysDocID] [nvarchar](7) NULL,
	[InvoiceVoucherID] [nvarchar](15) NULL,
	[Note] [nvarchar](4000) NULL,
	[CloseDate] [datetime] NULL,
	[CloseNote] [nvarchar](255) NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Warehouse3PL_GRN] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[W3PL_GRN_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[W3PL_GRN_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[QuantityInvoiced] [decimal](18, 5) NULL,
	[QuantityDelivered] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[OrderVoucherID] [nvarchar](15) NULL,
	[OrderSysDocID] [nvarchar](7) NULL,
	[InvoiceRowIndex] [int] NULL,
	[LastRentDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[W3PL_Invoice]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[W3PL_Invoice](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[CustomerID] [nvarchar](64) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SalesFlow] [tinyint] NULL,
	[DueDate] [datetime] NULL,
	[IsCash] [bit] NULL,
	[RegisterID] [nvarchar](15) NULL,
	[SalespersonID] [nvarchar](64) NULL,
	[ConsignSysDocID] [nvarchar](7) NULL,
	[ConsignVoucherID] [nvarchar](15) NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingAddressID] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[CurrencyID] [nvarchar](5) NULL,
	[CurrencyRate] [decimal](18, 5) NULL,
	[TermID] [nvarchar](15) NULL,
	[ShippingMethodID] [nvarchar](15) NULL,
	[IsVoid] [bit] NULL,
	[Reference] [nvarchar](20) NULL,
	[Discount] [money] NULL,
	[DiscountFC] [money] NULL,
	[TaxAmount] [money] NULL,
	[TaxAmountFC] [money] NULL,
	[CommissionPercent] [money] NULL,
	[CommissionAmount] [money] NULL,
	[Total] [money] NULL,
	[TotalCOGS] [money] NULL,
	[TotalFC] [money] NULL,
	[PONumber] [nvarchar](15) NULL,
	[IsDelivered] [bit] NULL,
	[Note] [nvarchar](4000) NULL,
	[PaymentMethodType] [tinyint] NULL,
	[RequireUpdate] [bit] NULL,
	[ApprovalStatus] [tinyint] NULL,
	[VerificationStatus] [tinyint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_W3PL_Invoice] PRIMARY KEY CLUSTERED 
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[W3PL_Invoice_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[W3PL_Invoice_Detail](
	[SysDocID] [nvarchar](7) NOT NULL,
	[VoucherID] [nvarchar](15) NOT NULL,
	[ProductID] [nvarchar](64) NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[DLQuantity] [decimal](18, 5) NULL,
	[StoreQuantity] [decimal](18, 5) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[UnitWeight] [decimal](18, 5) NULL,
	[TotalWeight] [decimal](18, 5) NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceFC] [decimal](18, 5) NULL,
	[Amount] [money] NULL,
	[AmountFC] [money] NULL,
	[ExpenseAmount] [money] NULL,
	[UnitExpense] [money] NULL,
	[Description] [nvarchar](255) NULL,
	[UnitID] [nvarchar](15) NULL,
	[UnitQuantity] [decimal](18, 5) NULL,
	[UnitFactor] [decimal](18, 5) NULL,
	[FactorType] [nvarchar](1) NULL,
	[SubunitPrice] [decimal](18, 5) NULL,
	[RowIndex] [tinyint] NULL,
	[LocationID] [nvarchar](15) NULL,
	[SourceSysDocID] [nvarchar](7) NULL,
	[SourceVoucherID] [nvarchar](15) NULL,
	[SourceRowIndex] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebDashboard]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebDashboard](
	[WebDashboardID] [nvarchar](30) NOT NULL,
	[UserID] [nvarchar](15) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[RowIndex] [int] NULL,
	[ZoneIndex] [int] NULL,
	[ZoneLayout] [ntext] NULL,
	[Layout] [ntext] NULL,
	[SelectedGadgets] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_WebDashboards] PRIMARY KEY CLUSTERED 
(
	[WebDashboardID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Work_Location]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work_Location](
	[WorkLocationID] [nvarchar](15) NOT NULL,
	[WorkLocationName] [nvarchar](64) NOT NULL,
	[WorkLocationType] [tinyint] NULL,
	[JobID] [nvarchar](50) NULL,
	[Note] [nvarchar](255) NULL,
	[Inactive] [bit] NULL CONSTRAINT [DF_Work_Location_Inactive]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
 CONSTRAINT [PK_Work_Location] PRIMARY KEY CLUSTERED 
(
	[WorkLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workflow]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflow](
	[WorkflowID] [nvarchar](15) NOT NULL,
	[WorkflowName] [nvarchar](30) NULL,
	[TableName] [nvarchar](64) NULL,
	[EntityType] [tinyint] NULL,
	[EntityName] [nvarchar](30) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Workflow] PRIMARY KEY CLUSTERED 
(
	[WorkflowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workflow_Step]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflow_Step](
	[WorkflowID] [nvarchar](15) NOT NULL,
	[StepID] [nvarchar](15) NOT NULL,
	[StepName] [nvarchar](30) NULL,
	[ActionType] [tinyint] NULL,
	[AllowEdit] [bit] NULL,
	[AllowDelete] [bit] NULL,
	[AllowVoid] [bit] NULL,
	[AllowPrint] [bit] NULL,
	[NotifyUser] [bit] NULL,
	[SendEmail] [bit] NULL,
	[EmailField] [nvarchar](30) NULL,
 CONSTRAINT [PK_Workflow_Step] PRIMARY KEY CLUSTERED 
(
	[WorkflowID] ASC,
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workflow_Step_Action]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflow_Step_Action](
	[WorkflowID] [nvarchar](15) NULL,
	[StepID] [nvarchar](15) NULL,
	[RowIndex] [smallint] NULL,
	[ActionType] [tinyint] NULL,
	[FieldName] [nvarchar](30) NULL,
	[FieldValue] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workflow_Steps_Next]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflow_Steps_Next](
	[WorkflowID] [nvarchar](15) NULL,
	[StepID] [nvarchar](15) NULL,
	[NextStepID] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Axo_Product_Lot_Quantity]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Axo_Product_Lot_Quantity]
AS
SELECT        TOP (100) PERCENT PL.LotNumber, PL.ItemCode AS ProductID, PL.LocationID, PL.AvgCost, PL.Cost, SUM(PL2.LotQty) AS ReceivedQuantity, SUM(PL.LotQty) 
                         AS LotQty, SUM(PL.SoldQty) AS SoldQty, SUM(PL.LotQty - PL.SoldQty) AS Quantity, PL2.DocID, PL2.ReceiptNumber, PL2.ReceiptDate, PL2.SupplierCode, 
                         PL2.Reference, PL2.ProductionDate, PL2.ExpiryDate, LOC.LocationName,PL2.Reference2
FROM            (SELECT        ISNULL(SourceLotNumber, LotNumber) AS LotNumber, ItemCode, Cost, AvgCost, LotQty - ISNULL(ReturnedQty, 0) AS LotQty, SoldQty, LocationID
                          FROM            dbo.Product_Lot AS Lot
                          WHERE        (LotQty - ISNULL(SoldQty, 0) - ISNULL(ReturnedQty, 0) <> 0)) AS PL INNER JOIN
                         dbo.Product_Lot AS PL2 ON PL.LotNumber = PL2.LotNumber INNER JOIN
                         dbo.Location AS LOC ON LOC.LocationID = PL.LocationID
GROUP BY PL.LotNumber, PL.ItemCode, PL.LocationID, PL.AvgCost, PL.Cost, PL2.DocID, PL2.ReceiptNumber, PL2.ReceiptDate, PL2.SupplierCode, PL2.Reference,PL2.Reference2, 
                         PL2.ProductionDate, PL2.ExpiryDate, LOC.LocationName
ORDER BY ProductID, PL.LotNumber
GO
/****** Object:  View [dbo].[Axo_Product_Aging]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Axo_Product_Aging]
AS
SELECT        TOP (100) PERCENT PL.ProductID, DATEDIFF(Day, MIN(ISNULL(PL.ReceiptDate, GETDATE())), GETDATE()) AS Age
FROM            dbo.Axo_Product_Lot_Quantity AS PL INNER JOIN
                         dbo.Location AS LOC ON LOC.LocationID = PL.LocationID
WHERE        (ISNULL(LOC.IsConsignOutLocation, 'False') = 'False')
GROUP BY PL.ProductID
ORDER BY PL.ProductID
GO
/****** Object:  View [dbo].[Ax_Expense_Journals]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Ax_Expense_Journals]
AS
SELECT        JD.AccountID, J.JournalDate AS Date, J.VoucherID, AG.GroupName, AC.AccountName, AC.Alias, ISNULL(JD.Debit, 0) - ISNULL(JD.Credit, 0) AS Amount, 
                         AN.AnalysisName AS Analysis
FROM            dbo.Journal_Details AS JD INNER JOIN
                         dbo.Journal AS J ON J.SysDocID = JD.SysDocID AND J.VoucherID = JD.VoucherID INNER JOIN
                         dbo.Account AS AC ON AC.AccountID = JD.AccountID INNER JOIN
                         dbo.Account_Group AS AG ON AC.GroupID = AG.GroupID LEFT OUTER JOIN
                         dbo.Analysis AS AN ON AN.AnalysisID = JD.AnalysisID
WHERE        (AG.TypeID = 4) AND (ISNULL(J.IsVoid, 'False') = 'False')
GO
/****** Object:  View [dbo].[Axo_Consign_Item_Lot]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Axo_Consign_Item_Lot]
AS
WITH MyCTE AS (SELECT        ItemCode, LotNumber, SourceLotNumber, ReceiptNumber, LocationID, LotQty - SoldQty AS Quantity
                                      FROM            dbo.Product_Lot AS LOT1
                                      WHERE        (SourceLotNumber IS NULL)
                                      UNION ALL
                                      SELECT        LOT2.ItemCode, LOT2.LotNumber, LOT2.SourceLotNumber, LOT2.ReceiptNumber, LOT2.LocationID, LOT2.LotQty - LOT2.SoldQty AS Quantity
                                      FROM            dbo.Product_Lot AS LOT2 INNER JOIN
                                                               MyCTE AS MyCTE_2 ON LOT2.SourceLotNumber = MyCTE_2.LotNumber
                                      WHERE        (LOT2.SourceLotNumber IS NOT NULL))
    SELECT        TOP (100) PERCENT MyCTE_1.ItemCode, P.Description, ISNULL(MyCTE_1.SourceLotNumber, MyCTE_1.LotNumber) AS LotNumber, PL.Reference, 
                              PL.ReceiptNumber, LOC.LocationName, PL.SupplierCode + ' | ' + Ven.VendorName AS Suplier, MyCTE_1.Quantity
     FROM            MyCTE AS MyCTE_1 INNER JOIN
                              dbo.Product_Lot AS PL ON PL.LotNumber = ISNULL(MyCTE_1.SourceLotNumber, MyCTE_1.LotNumber) INNER JOIN
                              dbo.Product AS P ON P.ProductID = MyCTE_1.ItemCode INNER JOIN
                              dbo.Location AS LOC ON LOC.LocationID = MyCTE_1.LocationID LEFT OUTER JOIN
                              dbo.Vendor AS Ven ON Ven.VendorID = PL.SupplierCode
     WHERE        (P.ItemType = 5)
     ORDER BY MyCTE_1.ItemCode, P.Description
GO
/****** Object:  View [dbo].[Axo_Customer_Balance_Summary]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Axo_Customer_Balance_Summary]
AS
SELECT DISTINCT TOP (100) PERCENT ARJ.CustomerID, CUS.CustomerName, ISNULL
                             ((SELECT        SUM(ISNULL(Debit, 0) - ISNULL(Credit, 0)) + ISNULL
                                                              ((SELECT        SUM(ISNULL(RealizedGainLoss, 0)) AS Expr1
                                                                  FROM            dbo.AR_Payment_Allocation AS ARP
                                                                  WHERE        (CustomerID = ARJ.CustomerID)), 0) AS Expr1
                                 FROM            dbo.ARJournal AS ARJ2
                                 WHERE        (ARJ.CustomerID = CustomerID) AND (ISNULL(IsPDCRow, 'False') = 'False') AND (ISNULL(IsVoid, 'False') = 'False')), 0) AS Balance,
                             (SELECT        ISNULL(SUM(Amount), 0) AS Expr1
                               FROM            dbo.Cheque_Received AS CR
                               WHERE        (Status IN (1, 3, 4)) AND (PayeeType = 'C') AND (ARJ.CustomerID = PayeeID) AND (ISNULL(IsVoid, 'False') = 'False')) AS PDC
FROM            dbo.ARJournal AS ARJ INNER JOIN
                         dbo.Customer AS CUS ON ARJ.CustomerID = CUS.CustomerID
WHERE        (ISNULL(ARJ.IsVoid, 'False') = 'False') AND (ISNULL(ARJ.IsPDCRow, 'False') = 'False') AND (ISNULL
                             ((SELECT        SUM(ISNULL(Debit, 0) - ISNULL(Credit, 0)) + ISNULL
                                                              ((SELECT        SUM(ISNULL(RealizedGainLoss, 0)) AS Expr1
                                                                  FROM            dbo.AR_Payment_Allocation AS ARP
                                                                  WHERE        (CustomerID = ARJ.CustomerID)), 0) AS Expr1
                                 FROM            dbo.ARJournal AS ARJ2
                                 WHERE        (ARJ.CustomerID = CustomerID) AND (ISNULL(IsPDCRow, 'False') = 'False') AND (ISNULL(IsVoid, 'False') = 'False')), 0) <> 0)
GO
/****** Object:  View [dbo].[AXO_Journal]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AXO_Journal]
AS
SELECT J.JournalID,JD.JournalDetailID,JD.DivisionID, CONVERT(date, J.JournalDate, 106) AS JournalDate, J.SysDocID, J.VoucherID, J.SysDocType, JD.AccountID, ACC.AccountName,AG.GroupID,
CASE WHEN AG.TypeID=1 THEN 'Asset' WHEN AG.TypeID=2 THEN 'Liability' WHEN AG.TypeID=3 THEN 'Income' WHEN AG.TypeID=4 THEN 'Expense' WHEN AG.TypeID=5 THEN 'Capital' END AS [Type],
AG.GroupName, 
ISNULL(JD.Debit, 0) AS Debit, ISNULL(JD.Credit, 0) AS Credit,ISNULL(JD.DebitFC, 0) AS DebitFC, ISNULL(JD.CreditFC, 0) AS CreditFC,  J.Reference, J.Reference2,  J.Narration, J.Note, 
JD.Description AS JD_Description, 
JD.CurrencyID AS JD_CurrencyID, JD.CurrencyRate AS JD_CurrencyRate, JD.Reference AS JD_Reference, JD.PayeeID, 
JD.PayeeType, JD.AnalysisID, JD.CostCenterID, JD.BankID, 
JD.CheckbookID, JD.CheckID, JD.CheckDate, JD.CheckNumber, JD.IsARAP, JD.JobID, 
JD.CostCategoryID,  JD.JDDate, JD.AttributeID1, JD.AttributeID2
FROM Journal J INNER JOIN
Journal_Details JD WITH(NOLOCK) ON J.JournalID = JD.JournalID INNER JOIN
Account AS ACC WITH(NOLOCK) ON ACC.AccountID = JD.AccountID
INNER JOIN Account_Group AG WITH(NOLOCK) ON ACC.GroupID = AG.GroupID
WHERE (ISNULL(J.IsVoid, 0) = 0)
GO
/****** Object:  View [dbo].[AXO_Lot_Lotledger]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AXO_Lot_Lotledger] AS

SELECT ReceiptDate,LocationID,LotNumber,ISNULL(SourceLotNumber,LotNumber) AS 'SrcLotNo',

ItemCode,LotQty,RowIndex,DocID,ReceiptNumber, ProductionDate, ExpiryDate, Reference 

FROM Product_Lot

UNION

SELECT PLS.TransactionDate,PLS.LocationID,PLS.LotNo,PL.LotNumber AS 'SrcLotNo',

PLS.ItemCode,PLS.SoldQty*-1,PLS.RowIndex,PLS.DocID,PLS.InvoiceNumber, ProductionDate, ExpiryDate , Reference 

FROM Product_Lot_Sales PLS

INNER JOIN Product_Lot PL ON ISNULL(PL.SourceLotNumber,PL.LotNumber)=PLS.LotNo
AND PL.ItemCode = PLS.ItemCode and PLS.DocID = PL.DocID and PLS.InvoiceNumber = PL.ReceiptNumber
GO
/****** Object:  View [dbo].[Axo_Purchase_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[Axo_Purchase_Detail]

AS
SELECT        Type, [Doc ID], [Doc Number], ProductID, Description, ISNULL(COGS1, COGS2) AS COGS, ROUND(ISNULL(COGS1, COGS2) / Quantity, 5) AS AverageCost, VendorID, 

                         Date, BuyerID, Amount - ISNULL(COGS1, COGS2) AS Profit,  Reference, CurrencyID, CurrencyRate, Quantity, UnitPrice, Amount, AmountFC

FROM            (SELECT        Type, [Doc ID], [Doc Number], ProductID, Description, RowIndex, SourceSysDocID, SourceVoucherID,

                                                        (SELECT        TOP (1) - (1 * AssetValue) AS Expr1

                                                          FROM            dbo.Inventory_Transactions AS XIT

                                                          WHERE        (SysDocID = X.[Doc ID]) AND (VoucherID = X.[Doc Number]) AND (ProductID = X.ProductID) AND (RowIndex = X.RowIndex) AND 

                                                                                    (ABS(Quantity) = ABS(X.Quantity))) AS COGS1,

                                                        (SELECT        - (1 * AssetValue) AS Expr1

                                                          FROM            dbo.Inventory_Transactions AS XIT

                                                          WHERE        (SysDocID = X.SourceSysDocID) AND (VoucherID = X.SourceVoucherID) AND (ProductID = X.ProductID) AND 

                                                                                    (RowIndex = X.SourceRowIndex) AND (ABS(Quantity) = ABS(X.Quantity))) AS COGS2, SourceRowIndex, VendorID, Date, BuyerID, 

                                                Reference, CurrencyID, CurrencyRate, Quantity, UnitPrice, Amount, AmountFC

                          FROM            (SELECT        33 AS Type, SID.SysDocID AS [Doc ID], SID.VoucherID AS [Doc Number], SID.ProductID, SID.Description, SID.RowIndex, 

                                                                              SID.OrderSysDocID AS SourceSysDocID, SID.OrderVoucherID AS SourceVoucherID, SID.OrderRowIndex AS SourceRowIndex, SI.VendorID, 

                                                                              SI.TransactionDate AS Date, SI.BuyerID,  SI.Reference, SI.CurrencyID, SI.CurrencyRate, SID.Quantity, SID.UnitPrice, 

                                                                              SID.Amount, SID.AmountFC

                                                    FROM            dbo.Purchase_Invoice AS SI INNER JOIN

                                                                              dbo.Purchase_Invoice_Detail AS SID ON SI.SysDocID = SID.SysDocID AND SI.VoucherID = SID.VoucherID

                                                    WHERE        (ISNULL(SI.IsVoid, 'False') = 'False') AND (SID.Quantity <> 0)

                                                    UNION

                                               
                                                    SELECT        35 AS Type, SID.SysDocID AS [Doc ID], SID.VoucherID AS [Doc Number], SID.ProductID, SID.Description, SID.RowIndex, NULL 

                                                                             AS SourceSysDocID, NULL AS SourceVoucherID, NULL AS SourceRowIndex, SI.VendorID, SI.TransactionDate AS Date, SI.BuyerID, 

                                                                              SI.Reference, SI.CurrencyID, SI.CurrencyRate, - (1 * SID.Quantity) AS Quantity, SID.UnitPrice, 

                                                                             - (1 * SID.Quantity * SID.UnitPrice) AS Amount, - (1 * SID.Quantity * SID.UnitPriceFC) AS AmountFC

                                                    FROM            dbo.Purchase_Return AS SI INNER JOIN

                                                                             dbo.Purchase_Return_Detail AS SID ON SI.SysDocID = SID.SysDocID AND SI.VoucherID = SID.VoucherID

                                                    WHERE        (ISNULL(SI.IsVoid, 'False') = 'False') AND (SID.Quantity <> 0)

                                                    UNION

                                                    SELECT        56 AS Type, SID.SysDocID AS [Doc ID], SID.VoucherID AS [Doc Number], SID.ProductID, SID.Description, SID.RowIndex, 

                                                                             SI.ConsignSysDocID AS SourceSysDocID, SI.ConsignVoucherID AS SourceVoucherID, SID.ConsignRowIndex AS SourceRowIndex, 

                                                                             SI.VendorID, SI.TransactionDate AS Date, SI.SalespersonID,  SI.Reference, SI.CurrencyID, SI.CurrencyRate, 

                                                                             SID.Quantity, SID.UnitPrice, SID.Amount, SID.AmountFC

                                                    FROM            dbo.ConsignIn_Settlement AS SI INNER JOIN

                                                                             dbo.ConsignIn_Settlement_Detail AS SID ON SI.SysDocID = SID.SysDocID AND SI.VoucherID = SID.VoucherID

                                                    WHERE        (ISNULL(SI.IsVoid, 'False') = 'False') AND (SID.Quantity <> 0)) AS X) AS Purchase
GO
/****** Object:  View [dbo].[Axo_Sales_Detail]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Axo_Sales_Detail]
AS


SELECT        Sale.Type, Sale.[Doc ID], Sale.[Doc Number], Sale.ProductID, Sale.Description, CASE WHEN pd.ItemType = 5 THEN Amount ELSE COGS END AS COGS, 
ROUND(CASE WHEN pd.ItemType = 5 THEN Amount ELSE COGS END / Sale.Quantity, 5) AS AverageCost, Sale.CustomerID, Sale.Date, Sale.SalespersonID, Sale.ReportTo, 
Sale.Amount - CASE WHEN pd.ItemType = 5 THEN Amount ELSE COGS END AS Profit, Sale.IsExport, Sale.Reference, Sale.CurrencyID, Sale.CurrencyRate, Sale.Quantity, Sale.UnitPrice, Sale.Amount, Sale.AmountFC
FROM            (

SELECT        Type, [Doc ID], [Doc Number], ProductID, Description, RowIndex, SourceSysDocID, SourceVoucherID,
(SELECT        SUM(- (1 * AssetValue)) AS COGS
FROM            dbo.Inventory_Transactions AS XIT
WHERE        (X.ITRowID = TransactionID)) + ISNULL
((SELECT        SUM(- (1 * AssetValue)) AS COGS
FROM            dbo.Inventory_Transactions AS XIT
WHERE        (SysDocType = 29) AND (X.ITRowID = RefTransactionID)), 0) AS COGS, CustomerID, Date, SalespersonID, ReportTo, IsExport, Reference, CurrencyID, CurrencyRate, Quantity, UnitPrice, Amount, 
AmountFC
FROM            (

SELECT        25 AS Type, SID.SysDocID AS [Doc ID], SID.VoucherID AS [Doc Number], SID.ProductID, SID.Description, SID.RowIndex, SID.OrderSysDocID AS SourceSysDocID, SID.OrderVoucherID AS SourceVoucherID, SID.OrderRowIndex AS SourceRowIndex
, SI.CustomerID, SI.TransactionDate AS Date, SI.SalespersonID, SI.ReportTo, SI.IsExport, SI.Reference, SI.CurrencyID, SI.CurrencyRate, SID.Quantity 
--SID.UnitPrice As 
, CASE	WHEN sid.FactorType = 'M' then sid.UnitPrice * sid.UnitFactor WHEN sid.FactorType ='D' then sid.UnitPrice / sid.UnitFactor 	WHEN sid.FactorType IS NULL THEN sid.UnitPrice end as [UnitPrice]
, SID.Amount, SID.AmountFC, SID.ITRowID
FROM            dbo.Sales_Invoice AS SI INNER JOIN
dbo.Sales_Invoice_Detail AS SID ON SI.SysDocID = SID.SysDocID AND SI.VoucherID = SID.VoucherID
WHERE        (ISNULL(SI.IsVoid, 'False') = 'False') AND (SID.Quantity <> 0)

UNION

SELECT        46 AS Type, SID.SysDocID AS [Doc ID], SID.VoucherID AS [Doc Number], SID.ProductID, SID.Description, SID.RowIndex, NULL AS SourceSysDocID, NULL AS SourceVoucherID, NULL AS SourceRowIndex, 
SI.CustomerID, SI.TransactionDate AS Date, SI.SalespersonID, '' AS ReportTo, 'False' AS IsExport, SI.Reference, SI.CurrencyID, SI.CurrencyRate, SID.Quantity
--, SID.UnitPrice
, CASE	WHEN sid.FactorType = 'M' then sid.UnitPrice * sid.UnitFactor WHEN sid.FactorType ='D' then sid.UnitPrice / sid.UnitFactor 	WHEN sid.FactorType IS NULL THEN sid.UnitPrice end as [UnitPrice]
, SID.Amount, SID.AmountFC, 
SID.ITRowID
FROM            dbo.Sales_POS AS SI INNER JOIN
dbo.Sales_POS_Detail AS SID ON SI.SysDocID = SID.SysDocID AND SI.VoucherID = SID.VoucherID
WHERE        (ISNULL(SI.IsVoid, 'False') = 'False') AND (SID.Quantity <> 0)

UNION

SELECT        27 AS Type, SID.SysDocID AS [Doc ID], SID.VoucherID AS [Doc Number], SID.ProductID, SID.Description, SID.RowIndex, NULL AS SourceSysDocID, NULL AS SourceVoucherID, NULL AS SourceRowIndex, 
SI.CustomerID, SI.TransactionDate AS Date, SI.SalespersonID, SI.ReportTo, 'False' AS IsExport, SI.Reference, SI.CurrencyID, SI.CurrencyRate, - (1 * SID.Quantity) AS Quantity
--, SID.UnitPrice
, CASE	WHEN sid.FactorType = 'M' then sid.UnitPrice * sid.UnitFactor WHEN sid.FactorType ='D' then sid.UnitPrice / sid.UnitFactor 	WHEN sid.FactorType IS NULL THEN sid.UnitPrice end as [UnitPrice]
, - (1 * SID.Amount) AS Amount, - (1 * SID.AmountFC) AS AmountFC, SID.ITRowID
FROM            dbo.Sales_Return AS SI INNER JOIN
dbo.Sales_Return_Detail AS SID ON SI.SysDocID = SID.SysDocID AND SI.VoucherID = SID.VoucherID
WHERE        (ISNULL(SI.IsVoid, 'False') = 'False') AND (SID.Quantity <> 0)

UNION

SELECT        48 AS Type, SID.SysDocID AS [Doc ID], SID.VoucherID AS [Doc Number], SID.ProductID, SID.Description, SID.RowIndex, SI.ConsignSysDocID AS SourceSysDocID, 
SI.ConsignVoucherID AS SourceVoucherID, SID.ConsignRowIndex AS SourceRowIndex, SI.CustomerID, SI.TransactionDate AS Date, SI.SalespersonID, '' AS ReportTo, 'False' AS IsExport, SI.Reference, 
SI.CurrencyID, SI.CurrencyRate, SID.Quantity
--, SID.UnitPrice
, CASE	WHEN sid.FactorType = 'M' then sid.UnitPrice * sid.UnitFactor WHEN sid.FactorType ='D' then sid.UnitPrice / sid.UnitFactor 	WHEN sid.FactorType IS NULL THEN sid.UnitPrice end as [UnitPrice]
, SID.Amount, SID.AmountFC, SID.ITRowID
FROM            dbo.ConsignOut_Settlement AS SI INNER JOIN
dbo.ConsignOut_Settlement_Detail AS SID ON SI.SysDocID = SID.SysDocID AND SI.VoucherID = SID.VoucherID
WHERE        (ISNULL(SI.IsVoid, 'False') = 'False') AND (SID.Quantity <> 0)

) AS X

) AS Sale INNER JOIN dbo.Product AS PD ON Sale.ProductID = PD.ProductID
GO
/****** Object:  View [dbo].[Axo_Sales_Summary]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Axo_Sales_Summary]
AS
SELECT        25 AS [Type], SysDocID[Doc ID], VoucherID[Doc Number], SI.CustomerID, Cus.CustomerName, TransactionDate[Date], S.SalespersonID, IsExport, S.FullName AS [Salesperson Name], Reference, SI.CurrencyID, 
                         CurrencyRate, Total, TotalFC,Discount,DiscountFC,TaxAmount,TaxAmountFC
FROM            Sales_Invoice SI INNER JOIN
                         Customer CUS ON Cus.customerID = SI.CustomerID LEFT OUTER JOIN
                         Salesperson S ON S.SalespersonID = SI.SalespersonID
WHERE        ISNULL(IsVoid, 'False') = 'False'
UNION
SELECT        46 AS [Type], SysDocID[Doc ID], VoucherID[Doc Number], SI.CustomerID, Cus.CustomerName, TransactionDate[Date], S.SalespersonID, 'False' AS IsExport, S.FullName AS [Salesperson Name], Reference, 
                         SI.CurrencyID, CurrencyRate, Total, TotalFC,Discount,DiscountFC,TaxAmount,TaxAmountFC
FROM            Sales_POS SI INNER JOIN
                         Customer CUS ON Cus.customerID = SI.CustomerID LEFT OUTER JOIN
                         Salesperson S ON S.SalespersonID = SI.SalespersonID
WHERE        ISNULL(IsVoid, 'False') = 'False'
UNION
SELECT        27 AS [Type], SysDocID[Doc ID], VoucherID[Doc Number], SI.CustomerID, Cus.CustomerName, TransactionDate[Date], S.SalespersonID, 'False' AS IsExport, S.FullName AS [Salesperson Name], Reference, 
                         SI.CurrencyID, CurrencyRate, - 1 * Total AS Total, - 1 * TotalFC AS TotalFC,-1*Discount AS Discount,-1*DiscountFC as DiscountFC,-1 *TaxAmount as TaxAmount,-1 * TaxAmountFC as TaxAmountFC
FROM            Sales_Return SI INNER JOIN
                         Customer CUS ON Cus.customerID = SI.CustomerID LEFT OUTER JOIN
                         Salesperson S ON S.SalespersonID = SI.SalespersonID
WHERE        ISNULL(IsVoid, 'False') = 'False'
UNION
SELECT        48 AS [Type], SysDocID[Doc ID], VoucherID[Doc Number], SI.CustomerID, Cus.CustomerName, TransactionDate[Date], S.SalespersonID, 'False' AS IsExport, S.FullName AS [Salesperson Name], Reference, 
                         SI.CurrencyID, CurrencyRate, Total, TotalFC,Discount,DiscountFC,TaxAmount,TaxAmountFC
FROM            ConsignOut_Settlement SI INNER JOIN
                         Customer CUS ON Cus.customerID = SI.CustomerID LEFT OUTER JOIN
                         Salesperson S ON S.SalespersonID = SI.SalespersonID
WHERE        ISNULL(IsVoid, 'False') = 'False'
GO
/****** Object:  View [dbo].[axo_stemp]    Script Date: 2021/09/22 11:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[axo_stemp] 
as  
select convert(date,SI.TransactionDate) TransactionDate, SID.ProductID,SID.Description, SID.Quantity, SID.LocationID from Sales_Invoice_Detail SID INNER JOIN Sales_Invoice SI On SID.SysDocID=SI.SysDocID AND SID.VoucherID=SI.VoucherID
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Account_AccountID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Account_AccountID] ON [dbo].[Account]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_Account_Group_TypeID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [NCI_Account_Group_TypeID] ON [dbo].[Account_Group]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20161116-113329]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161116-113329] ON [dbo].[Account_Group]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_APDoc]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_APDoc] ON [dbo].[AP_Payment_Allocation]
(
	[InvoiceSysDocID] ASC,
	[InvoiceVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_PaymentDoc]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_PaymentDoc] ON [dbo].[AP_Payment_Allocation]
(
	[PaymentSysDocID] ASC,
	[PaymentVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JID_001]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_JID_001] ON [dbo].[AP_Payment_Allocation]
(
	[APJournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_DocID_VoucherID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_DocID_VoucherID] ON [dbo].[APJournal]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_ARDoc]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_ARDoc] ON [dbo].[AR_Payment_Allocation]
(
	[InvoiceSysDocID] ASC,
	[InvoiceVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_PaymentDoc]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_PaymentDoc] ON [dbo].[AR_Payment_Allocation]
(
	[PaymentSysDocID] ASC,
	[PaymentVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AR_Payment_Allocation_CustomerID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_AR_Payment_Allocation_CustomerID] ON [dbo].[AR_Payment_Allocation]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CUST_VOUCHID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_CUST_VOUCHID] ON [dbo].[AR_Payment_Allocation]
(
	[CustomerID] ASC,
	[InvoiceVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_DocID_VoucherID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_DocID_VoucherID] ON [dbo].[ARJournal]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ARJournal_CustomerID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_ARJournal_CustomerID] ON [dbo].[ARJournal]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CUSTID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_CUSTID] ON [dbo].[ARJournal]
(
	[CustomerID] ASC
)
INCLUDE ( 	[IsPDCRow],
	[Debit],
	[Credit],
	[IsVoid]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DOCID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_DOCID] ON [dbo].[ARJournal]
(
	[SysDocID] ASC
)
INCLUDE ( 	[CustomerID],
	[ARDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Banks]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Banks] ON [dbo].[Bank]
(
	[BankName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Countries]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Countries] ON [dbo].[Country]
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20160111-151236]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160111-151236] ON [dbo].[Customer]
(
	[CustomerClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CustID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_CustID] ON [dbo].[Delivery_Note]
(
	[CustomerID] ASC
)
INCLUDE ( 	[SysDocID],
	[VoucherID],
	[IsVoid],
	[IsInvoiced]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DN_CustID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_DN_CustID] ON [dbo].[Delivery_Note]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DN_SysdocID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_DN_SysdocID] ON [dbo].[Delivery_Note]
(
	[SysDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DN_TrDt]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_DN_TrDt] ON [dbo].[Delivery_Note]
(
	[TransactionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DN_VoucherID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_DN_VoucherID] ON [dbo].[Delivery_Note]
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Delivery_Note_Detail_ProductID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Delivery_Note_Detail_ProductID] ON [dbo].[Delivery_Note_Detail]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DNote]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_DNote] ON [dbo].[Delivery_Note_Detail]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DNTSysDoc_VoucherID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_DNTSysDoc_VoucherID] ON [dbo].[Delivery_Return]
(
	[DNoteSysDocID] ASC,
	[DNoteVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_DocID_VoucherID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_DocID_VoucherID] ON [dbo].[Employee_Journal]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_SysDoc_VoucherID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_SysDoc_VoucherID] ON [dbo].[Inventory_Transactions]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Inventory_Transactions_ProductID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Inventory_Transactions_ProductID] ON [dbo].[Inventory_Transactions]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RefTransactionID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_RefTransactionID] ON [dbo].[Inventory_Transactions]
(
	[SysDocType] ASC,
	[RefTransactionID] ASC,
	[TransactionID] ASC
)
INCLUDE ( 	[AssetValue]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Journal_1805111]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Journal_1805111] ON [dbo].[Journal]
(
	[JournalDate] ASC
)
INCLUDE ( 	[JournalID],
	[IsVoid]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Journal_1805112]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Journal_1805112] ON [dbo].[Journal]
(
	[JournalID] ASC,
	[JournalDate] ASC
)
INCLUDE ( 	[IsVoid]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-DOC_ID_VOUCHERID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-DOC_ID_VOUCHERID] ON [dbo].[Journal]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER INDEX [NonClusteredIndex-DOC_ID_VOUCHERID] ON [dbo].[Journal] DISABLE
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_23434]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_23434] ON [dbo].[Journal_Details]
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[IsARAP] ASC
)
INCLUDE ( 	[CheckDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_JD_1805111]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_JD_1805111] ON [dbo].[Journal_Details]
(
	[AccountID] ASC
)
INCLUDE ( 	[Debit],
	[Credit]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_JD_1805112]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_JD_1805112] ON [dbo].[Journal_Details]
(
	[AccountID] ASC
)
INCLUDE ( 	[JournalID],
	[Debit],
	[Credit]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_jd_JDdate]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_jd_JDdate] ON [dbo].[Journal_Details]
(
	[JDDate] ASC
)
INCLUDE ( 	[Debit],
	[Credit]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_JD_JournalID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_JD_JournalID] ON [dbo].[Journal_Details]
(
	[JournalID] ASC
)
INCLUDE ( 	[Reference]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Terms]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Terms] ON [dbo].[Payment_Term]
(
	[TermName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Product_productID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Product_productID] ON [dbo].[Product]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Product Categories]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Product Categories] ON [dbo].[Product_Category]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Product_Lot_ProductID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Product_Lot_ProductID] ON [dbo].[Product_Lot]
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20151225-011922]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20151225-011922] ON [dbo].[Product_Lot]
(
	[DocID] ASC,
	[ReceiptNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_DocID_VoucherID_IND]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_DocID_VoucherID_IND] ON [dbo].[Product_Lot_Issue_Detail]
(
	[SysDocID] ASC,
	[VoucherID] ASC,
	[RowIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_ProductID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_ProductID] ON [dbo].[Product_Lot_Issue_Detail]
(
	[ProductID] ASC
)
INCLUDE ( 	[LotNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SourceLot]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_SourceLot] ON [dbo].[Product_Lot_Issue_Detail]
(
	[SourceLotNumber] ASC
)
INCLUDE ( 	[SysDocID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IND_LotNo]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_LotNo] ON [dbo].[Product_Lot_Sales]
(
	[LotNo] ASC
)
INCLUDE ( 	[RecordID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Product_Lot_Sale_DocID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Product_Lot_Sale_DocID] ON [dbo].[Product_Lot_Sales]
(
	[DocID] ASC,
	[InvoiceNumber] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Product_Lot_Sales_ProductID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Product_Lot_Sales_ProductID] ON [dbo].[Product_Lot_Sales]
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SysDoc_VID_001]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_SysDoc_VID_001] ON [dbo].[Purchase_Invoice_Detail]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IND_SysDoc_Voucher]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IND_SysDoc_Voucher] ON [dbo].[Purchase_Order_Detail]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160111-150928]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160111-150928] ON [dbo].[Sales_Invoice]
(
	[TransactionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20160111-151032]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160111-151032] ON [dbo].[Sales_Invoice]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OrderVID_DocID_Index]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderVID_DocID_Index] ON [dbo].[Sales_Invoice_Detail]
(
	[OrderVoucherID] ASC,
	[OrderSysDocID] ASC,
	[OrderRowIndex] ASC
)
INCLUDE ( 	[SysDocID],
	[VoucherID],
	[RowIndex]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OrderVID_OrderSysID_Index]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderVID_OrderSysID_Index] ON [dbo].[Sales_Invoice_Detail]
(
	[OrderVoucherID] ASC,
	[OrderSysDocID] ASC,
	[OrderRowIndex] ASC
)
INCLUDE ( 	[SysDocID],
	[VoucherID],
	[RowIndex]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Sales_Invoice_Detail_ProductID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_Sales_Invoice_Detail_ProductID] ON [dbo].[Sales_Invoice_Detail]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20160111-151051]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160111-151051] ON [dbo].[Sales_Invoice_Detail]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SourceSys_Voucher_Ind]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [SourceSys_Voucher_Ind] ON [dbo].[Sales_Return_Detail]
(
	[SourceSysDocID] ASC,
	[SourceVoucherID] ASC,
	[SourceRowIndex] ASC
)
INCLUDE ( 	[Quantity]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Shippers]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Shippers] ON [dbo].[Shipping_Method]
(
	[ShippingMethodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TR_Application]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_TR_Application] ON [dbo].[TR_Application]
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SYSDOCID_VOUCHERID]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE NONCLUSTERED INDEX [SYSDOCID_VOUCHERID] ON [dbo].[Transaction_Details]
(
	[SysDocID] ASC,
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users]    Script Date: 2021/09/22 11:02:27 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account_Analysis_Detail] ADD  CONSTRAINT [DF_Account_Analysis_Details_IsOptional]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[Bank_Facility_Payment] ADD  CONSTRAINT [DF_Bank_Facility_Payment_TransactionStatus]  DEFAULT ((1)) FOR [TransactionStatus]
GO
ALTER TABLE [dbo].[Bank_Facility_Transaction] ADD  CONSTRAINT [DF_Bank_Facility_Transaction_TransactionStatus]  DEFAULT ((1)) FOR [TransactionStatus]
GO
ALTER TABLE [dbo].[Bill_Of_Lading] ADD  CONSTRAINT [DF_BillOfLading_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Buyer] ADD  CONSTRAINT [DF_Buyer_IsInactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[Candidate] ADD  CONSTRAINT [DF_Candidate_MaritalStatus]  DEFAULT ((1)) FOR [MaritalStatus]
GO
ALTER TABLE [dbo].[Cheque_Register] ADD  CONSTRAINT [DF_Cheque_Register_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_IsInactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[Consign_In] ADD  CONSTRAINT [DF_Consign_In_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Consign_Out] ADD  CONSTRAINT [DF_Consign_Out_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ConsignIn_Return] ADD  CONSTRAINT [DF_ConsignIn_Return_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ConsignIn_Return] ADD  CONSTRAINT [DF_ConsignIn_Return_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[ConsignIn_Settlement] ADD  CONSTRAINT [DF_ConsignIn_Settlement_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ConsignIn_Settlement] ADD  CONSTRAINT [DF_ConsignIn_Settlement_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[ConsignOut_Return] ADD  CONSTRAINT [DF_ConsignOut_Return_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ConsignOut_Return] ADD  CONSTRAINT [DF_ConsignOut_Return_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[ConsignOut_Settlement] ADD  CONSTRAINT [DF_ConsignOut_Settlement_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ConsignOut_Settlement] ADD  CONSTRAINT [DF_ConsignOut_Settlement_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Container_Tracking] ADD  CONSTRAINT [DF_Container_Tracking_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Cost_Center] ADD  CONSTRAINT [DF_Cost_Center_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Customer_Category] ADD  CONSTRAINT [DF_Customer_Category_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Customer_Group] ADD  CONSTRAINT [DF_Customer_Group_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Delivery_Note] ADD  CONSTRAINT [DF_Delivery_Note_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Delivery_Return] ADD  CONSTRAINT [DF_Delivery_Return_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Discipline_Action_Type] ADD  CONSTRAINT [DF_Discipline_Action_Type_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Division] ADD  CONSTRAINT [DF_Division_IsInactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Employee_Activity_Type] ADD  CONSTRAINT [DF_Employee_Activity_Type_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Entity_Category] ADD  CONSTRAINT [DF_Entity_Category_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Export_PackingList] ADD  CONSTRAINT [DF_Export_Packing_List_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Export_PickList] ADD  CONSTRAINT [DF_Export_PickList_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[FixedAsset_Purchase_Order] ADD  CONSTRAINT [DF_FixedAsset_Purchase_Order_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Freight_Charge] ADD  CONSTRAINT [DF_Freight_Charge_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Garment_Rental] ADD  CONSTRAINT [DF_Garment_Rental_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Garment_Rental_Return] ADD  CONSTRAINT [DF_Garment_Rental_Return_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Garment_Rental_Return] ADD  CONSTRAINT [DF_Garment_Rental_Return_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Global Preferences] ADD  CONSTRAINT [DF_Personals_IsCurrentUser]  DEFAULT ((0)) FOR [IsCurrentUser]
GO
ALTER TABLE [dbo].[GRN_Return] ADD  CONSTRAINT [DF_GRN_Return_IsCash]  DEFAULT ((0)) FOR [IsCash]
GO
ALTER TABLE [dbo].[GRN_Return] ADD  CONSTRAINT [DF_GRN_Return_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Item_Transaction] ADD  CONSTRAINT [DF_Item_Transaction_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Job_Invoice] ADD  CONSTRAINT [DF_Job_Invoice_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Job_Invoice] ADD  CONSTRAINT [DF_Job_Invoice_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Job_Material_Requisition] ADD  CONSTRAINT [DF_Job_Material_Requisition_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[LPO_Receipt] ADD  CONSTRAINT [DF_Table_1_IsDelivered]  DEFAULT ((0)) FOR [IsReceived]
GO
ALTER TABLE [dbo].[Opening_Cheque_Received] ADD  CONSTRAINT [DF_Opening_Cheque_Received_Entry_IsVoid]  DEFAULT ((0)) FOR [IsVoid]
GO
ALTER TABLE [dbo].[Opening_Cheque_Received] ADD  CONSTRAINT [DF_Opening_Cheque_Received_Entry_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_MaritalStatus]  DEFAULT ((1)) FOR [MaritalStatus]
GO
ALTER TABLE [dbo].[Patient_Doc_Type] ADD  CONSTRAINT [DF_Patient_Docs_Type_Remind]  DEFAULT ((0)) FOR [Remind]
GO
ALTER TABLE [dbo].[Payroll_Transaction] ADD  CONSTRAINT [DF_Payroll_Transaction_TransactionStatus]  DEFAULT ((1)) FOR [TransactionStatus]
GO
ALTER TABLE [dbo].[PO_Shipment] ADD  CONSTRAINT [DF_PO_Shipment_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Port] ADD  CONSTRAINT [DF_Port_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Price_Level] ADD  CONSTRAINT [DF_Price Levels_IsInactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[Price_List] ADD  CONSTRAINT [DF_Price_List_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product_Attribute] ADD  CONSTRAINT [DF_Product_Attribute_IsInactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[Product_Group] ADD  CONSTRAINT [DF_Product_Group_IsInactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[Product_Price_Bulk_Update] ADD  CONSTRAINT [DF_Product_Price_Bulk_Update_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product_Size] ADD  CONSTRAINT [DF_Product_Size_IsInactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[Product_Specification] ADD  CONSTRAINT [DF_Product_Specification_IsInactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[Project_Expense_Allocation] ADD  CONSTRAINT [DF_Project_Expense_Allocation_TransactionStatus]  DEFAULT ((1)) FOR [TransactionStatus]
GO
ALTER TABLE [dbo].[Project_SubContract_PI] ADD  CONSTRAINT [DF_Project_SubContract_PI_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Project_Subcontract_PO] ADD  CONSTRAINT [DF_Project_Subcontract_PO_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Property_Category] ADD  CONSTRAINT [DF_Property_Category_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Property_Doc_Type] ADD  CONSTRAINT [DF_Property_Docs_Type_Remind]  DEFAULT ((0)) FOR [Remind]
GO
ALTER TABLE [dbo].[Property_Facility] ADD  CONSTRAINT [DF_Property_Facility_Type]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[Property_Tenant_Doc_Type] ADD  CONSTRAINT [DF_Property_Tenant_Docs_Type_Remind]  DEFAULT ((0)) FOR [Remind]
GO
ALTER TABLE [dbo].[Property_Transaction] ADD  CONSTRAINT [DF_Property_Transaction_TransactionStatus]  DEFAULT ((1)) FOR [TransactionStatus]
GO
ALTER TABLE [dbo].[Purchase_Cost_Entry] ADD  CONSTRAINT [DF_Purchase_Cost_Entry_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Purchase_Invoice_NonInv] ADD  CONSTRAINT [DF_Purchase_Invoice_NonInv_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Purchase_Order_NonInv] ADD  CONSTRAINT [DF_Purchase_Order_NonInv_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Purchase_Quote] ADD  CONSTRAINT [DF_Purchase_Quote_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Purchase_Receipt] ADD  CONSTRAINT [DF_PO_Receipt_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Purchase_Return] ADD  CONSTRAINT [DF_Purchase_Return_IsCash]  DEFAULT ((0)) FOR [IsCash]
GO
ALTER TABLE [dbo].[Purchase_Return] ADD  CONSTRAINT [DF_Purchase_Return_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Purchase_Return] ADD  CONSTRAINT [DF_Purchase_Return_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Sales_Enquiry] ADD  CONSTRAINT [DF_Sales_Enquiry_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Sales_Invoice_NonInv] ADD  CONSTRAINT [DF_Sales_Invoice_NonInv_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Sales_Invoice_NonInv] ADD  CONSTRAINT [DF_Sales_Invoice_NonInv_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Sales_Order] ADD  CONSTRAINT [DF_Sales_Order_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Sales_POS] ADD  CONSTRAINT [DF_Sales_POS_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Sales_POS] ADD  CONSTRAINT [DF_Sales_POS_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Sales_Quote_History] ADD  CONSTRAINT [DF_Sales_Quote_History_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Sales_Receipt] ADD  CONSTRAINT [DF_Sales_Receipt_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Sales_Receipt] ADD  CONSTRAINT [DF_Sales_Receipt_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Sales_Return] ADD  CONSTRAINT [DF_Sales_Return_IsCash]  DEFAULT ((0)) FOR [IsCash]
GO
ALTER TABLE [dbo].[Sales_Return] ADD  CONSTRAINT [DF_Sales_Return_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Sales_Return] ADD  CONSTRAINT [DF_Sales_Return_IsDelivered_1]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Salesperson] ADD  CONSTRAINT [DF_Salesperson_Inactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[SalesProforma_Invoice] ADD  CONSTRAINT [DF_SalesProforma_Invoice1_Detail_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Service_CallTrack] ADD  CONSTRAINT [DF_ServiceCallTrack_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Vehicle_Doc_Type] ADD  CONSTRAINT [DF_Vehicle_Doc_Type_Remind]  DEFAULT ((0)) FOR [Remind]
GO
ALTER TABLE [dbo].[Vehicle_Maintenance_Entry] ADD  CONSTRAINT [DF_Vehicle_Maintenance_Entry_Status1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Vendor_Group] ADD  CONSTRAINT [DF_Vendor_Group_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Vendor_Price_List] ADD  CONSTRAINT [DF_Vendor_Price_List_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[W3PL_Delivery] ADD  CONSTRAINT [DF_W3PL_Delivery_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[W3PL_GRN] ADD  CONSTRAINT [DF_W3PL_GRN_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[W3PL_Invoice] ADD  CONSTRAINT [DF_W3PL_Invoice_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[W3PL_Invoice] ADD  CONSTRAINT [DF_W3PL_Invoice_IsDelivered_1]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Account_Group] ([GroupID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account_Group]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Bank] FOREIGN KEY([BankID])
REFERENCES [dbo].[Bank] ([BankID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Bank]
GO
ALTER TABLE [dbo].[Analysis]  WITH CHECK ADD  CONSTRAINT [FK_Analysis_Analysis_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Analysis_Group] ([GroupID])
GO
ALTER TABLE [dbo].[Analysis] CHECK CONSTRAINT [FK_Analysis_Analysis_Group]
GO
ALTER TABLE [dbo].[APJournal]  WITH CHECK ADD  CONSTRAINT [FK_APJournal_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[APJournal] CHECK CONSTRAINT [FK_APJournal_Vendor]
GO
ALTER TABLE [dbo].[ARJournal]  WITH CHECK ADD  CONSTRAINT [FK_ARJournal_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[ARJournal] CHECK CONSTRAINT [FK_ARJournal_Customer]
GO
ALTER TABLE [dbo].[Bank_Facility]  WITH CHECK ADD  CONSTRAINT [FK_BankFacility_BankFacilityGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Bank_Facility_Group] ([GroupID])
GO
ALTER TABLE [dbo].[Bank_Facility] CHECK CONSTRAINT [FK_BankFacility_BankFacilityGroup]
GO
ALTER TABLE [dbo].[Budgeting]  WITH CHECK ADD  CONSTRAINT [FK_Budgeting_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currency] ([CurrencyID])
GO
ALTER TABLE [dbo].[Budgeting] CHECK CONSTRAINT [FK_Budgeting_Currency]
GO
ALTER TABLE [dbo].[Cheque_Issued]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Issued_Bank] FOREIGN KEY([BankID])
REFERENCES [dbo].[Bank] ([BankID])
GO
ALTER TABLE [dbo].[Cheque_Issued] CHECK CONSTRAINT [FK_Cheque_Issued_Bank]
GO
ALTER TABLE [dbo].[Cheque_Received]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Received_Account] FOREIGN KEY([PDCAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Cheque_Received] CHECK CONSTRAINT [FK_Cheque_Received_Account]
GO
ALTER TABLE [dbo].[Cheque_Received]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Received_Cheque_Received] FOREIGN KEY([SysDocID], [VoucherID], [ChequeNumber], [BankID], [PayeeType], [PayeeID])
REFERENCES [dbo].[Cheque_Received] ([SysDocID], [VoucherID], [ChequeNumber], [BankID], [PayeeType], [PayeeID])
GO
ALTER TABLE [dbo].[Cheque_Received] CHECK CONSTRAINT [FK_Cheque_Received_Cheque_Received]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company Information_Users] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company Information_Users]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company Information_Users1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company Information_Users1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([ARAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Area] FOREIGN KEY([AreaID])
REFERENCES [dbo].[Area] ([AreaID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Area]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Country]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currency] ([CurrencyID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Currency]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer] FOREIGN KEY([ParentCustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer_Class] FOREIGN KEY([CustomerClassID])
REFERENCES [dbo].[Customer_Class] ([ClassID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer_Class]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer_Group] FOREIGN KEY([CustomerGroupID])
REFERENCES [dbo].[Customer_Group] ([GroupID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer_Group]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Division] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[Division] ([DivisionID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Division]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Payment_Method] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[Payment_Method] ([PaymentMethodID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Payment_Method]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Payment_Term] FOREIGN KEY([TermID])
REFERENCES [dbo].[Payment_Term] ([PaymentTermID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Payment_Term]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Payment_Term1] FOREIGN KEY([PaymentTermID])
REFERENCES [dbo].[Payment_Term] ([PaymentTermID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Payment_Term1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Salesperson] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[Salesperson] ([SalespersonID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Salesperson]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Shipping_Method] FOREIGN KEY([ShippingMethodID])
REFERENCES [dbo].[Shipping_Method] ([ShippingMethodID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Shipping_Method]
GO
ALTER TABLE [dbo].[Customer_Address]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_Address] CHECK CONSTRAINT [FK_Customer_Address_Customer]
GO
ALTER TABLE [dbo].[Employee_DisciplinaryAction]  WITH CHECK ADD  CONSTRAINT [FK_Employee_DisciplinaryAction_Employee_DisciplinaryAction] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Employee_Activity] ([ActivityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee_DisciplinaryAction] CHECK CONSTRAINT [FK_Employee_DisciplinaryAction_Employee_DisciplinaryAction]
GO
ALTER TABLE [dbo].[Employee_DisciplinaryAction]  WITH CHECK ADD  CONSTRAINT [FK_Employee_DisciplinaryAction_Employee_DisciplinaryAction1] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Employee_DisciplinaryAction] ([ActivityID])
GO
ALTER TABLE [dbo].[Employee_DisciplinaryAction] CHECK CONSTRAINT [FK_Employee_DisciplinaryAction_Employee_DisciplinaryAction1]
GO
ALTER TABLE [dbo].[Employee_Journal]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Journal_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee_Journal] CHECK CONSTRAINT [FK_Employee_Journal_Employee]
GO
ALTER TABLE [dbo].[Employee_Leave_Request]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Leave_Request_Employee_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Employee_Activity] ([ActivityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee_Leave_Request] CHECK CONSTRAINT [FK_Employee_Leave_Request_Employee_Activity]
GO
ALTER TABLE [dbo].[Employee_Promotion]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Promotion_Employee_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Employee_Activity] ([ActivityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee_Promotion] CHECK CONSTRAINT [FK_Employee_Promotion_Employee_Activity]
GO
ALTER TABLE [dbo].[Employee_Rehire]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Rehire_Employee_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Employee_Activity] ([ActivityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee_Rehire] CHECK CONSTRAINT [FK_Employee_Rehire_Employee_Activity]
GO
ALTER TABLE [dbo].[Employee_Resumption]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Resumption_Employee_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Employee_Activity] ([ActivityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee_Resumption] CHECK CONSTRAINT [FK_Employee_Resumption_Employee_Activity]
GO
ALTER TABLE [dbo].[Employee_Termination]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Termination_Employee_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Employee_Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[Employee_Termination] CHECK CONSTRAINT [FK_Employee_Termination_Employee_Activity]
GO
ALTER TABLE [dbo].[Employee_Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Transfer_Employee_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Employee_Activity] ([ActivityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee_Transfer] CHECK CONSTRAINT [FK_Employee_Transfer_Employee_Activity]
GO
ALTER TABLE [dbo].[GL_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_GL_Transaction_Account_First] FOREIGN KEY([FirstAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[GL_Transaction] CHECK CONSTRAINT [FK_GL_Transaction_Account_First]
GO
ALTER TABLE [dbo].[GL_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_GL_Transaction_Account_Second] FOREIGN KEY([SecondAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[GL_Transaction] CHECK CONSTRAINT [FK_GL_Transaction_Account_Second]
GO
ALTER TABLE [dbo].[GL_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_GL_Transaction_GL_Transaction] FOREIGN KEY([SysDocID], [VoucherID])
REFERENCES [dbo].[GL_Transaction] ([SysDocID], [VoucherID])
GO
ALTER TABLE [dbo].[GL_Transaction] CHECK CONSTRAINT [FK_GL_Transaction_GL_Transaction]
GO
ALTER TABLE [dbo].[Global Preferences]  WITH CHECK ADD  CONSTRAINT [FK_Personals_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Global Preferences] CHECK CONSTRAINT [FK_Personals_Users]
GO
ALTER TABLE [dbo].[Inventory_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Transactions_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Inventory_Transactions] CHECK CONSTRAINT [FK_Inventory_Transactions_Location]
GO
ALTER TABLE [dbo].[Inventory_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Transactions_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Inventory_Transactions] CHECK CONSTRAINT [FK_Inventory_Transactions_Product]
GO
ALTER TABLE [dbo].[Inventory_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Transactions_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Inventory_Transactions] CHECK CONSTRAINT [FK_Inventory_Transactions_Unit]
GO
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_GL Transactions_Currencies] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currency] ([CurrencyID])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_GL Transactions_Currencies]
GO
ALTER TABLE [dbo].[Journal_Details]  WITH CHECK ADD  CONSTRAINT [FK_Journal_Details_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Journal_Details] CHECK CONSTRAINT [FK_Journal_Details_Account]
GO
ALTER TABLE [dbo].[POS_CashRegister]  WITH CHECK ADD  CONSTRAINT [FK_POS_CashRegister_Customer] FOREIGN KEY([DefaultCustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[POS_CashRegister] CHECK CONSTRAINT [FK_POS_CashRegister_Customer]
GO
ALTER TABLE [dbo].[Price_Level]  WITH CHECK ADD  CONSTRAINT [FK_Price Levels_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Price_Level] CHECK CONSTRAINT [FK_Price Levels_Users]
GO
ALTER TABLE [dbo].[Price_Level]  WITH CHECK ADD  CONSTRAINT [FK_Price Levels_Users1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Price_Level] CHECK CONSTRAINT [FK_Price Levels_Users1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Register_Account_Card] FOREIGN KEY([CardReceivedAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Register_Account_Card]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Register_Account_Cash] FOREIGN KEY([CashAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Register_Account_Cash]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Register_Account_PDC] FOREIGN KEY([PDCIssuedAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Register_Account_PDC]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Register_Account_PDCR] FOREIGN KEY([PDCReceivedAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Register_Account_PDCR]
GO
ALTER TABLE [dbo].[Transaction_Details]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Details_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Transaction_Details] CHECK CONSTRAINT [FK_Transaction_Details_Account]
GO
ALTER TABLE [dbo].[Transaction_Details]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Details_Bank] FOREIGN KEY([BankID])
REFERENCES [dbo].[Bank] ([BankID])
GO
ALTER TABLE [dbo].[Transaction_Details] CHECK CONSTRAINT [FK_Transaction_Details_Bank]
GO
ALTER TABLE [dbo].[Transaction_Details]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Details_Cost_Center] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[Cost_Center] ([CostCenterID])
GO
ALTER TABLE [dbo].[Transaction_Details] CHECK CONSTRAINT [FK_Transaction_Details_Cost_Center]
GO
ALTER TABLE [dbo].[User_Group_Detail]  WITH NOCHECK ADD  CONSTRAINT [FK_User Group Assignments_User Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[User_Group] ([GroupID])
GO
ALTER TABLE [dbo].[User_Group_Detail] CHECK CONSTRAINT [FK_User Group Assignments_User Groups]
GO
ALTER TABLE [dbo].[User_Group_Detail]  WITH CHECK ADD  CONSTRAINT [FK_User Group Assignments_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Group_Detail] CHECK CONSTRAINT [FK_User Group Assignments_Users]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Account] FOREIGN KEY([APAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Account]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Area] FOREIGN KEY([AreaID])
REFERENCES [dbo].[Area] ([AreaID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Area]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Buyer] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Buyer] ([BuyerID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Buyer]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Country]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Payment_Method] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[Payment_Method] ([PaymentMethodID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Payment_Method]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Payment_Term] FOREIGN KEY([TermID])
REFERENCES [dbo].[Payment_Term] ([PaymentTermID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Payment_Term]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Shipping_Method] FOREIGN KEY([ShippingMethodID])
REFERENCES [dbo].[Shipping_Method] ([ShippingMethodID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Shipping_Method]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Vendor_Class] FOREIGN KEY([VendorClassID])
REFERENCES [dbo].[Vendor_Class] ([ClassID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Vendor_Class]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Vendor_Group] FOREIGN KEY([VendorGroupID])
REFERENCES [dbo].[Vendor_Group] ([GroupID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Vendor_Group]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [CK_Company Information] CHECK  (([FiscalFirstMonth]>=(1) AND [FiscalFirstMonth]<=(12)))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [CK_Company Information]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Does it use taxing system' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'IsTax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Determines if the PO is already fully shipped by PO Shipment.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FixedAsset_Purchase_Order', @level2type=N'COLUMN',@level2name=N'IsShipped'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Determines if this row is from a GRN which is not yet costed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory_Transactions', @level2type=N'COLUMN',@level2name=N'IsNonCostedGRN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'check,tranfer,cash,creditcard?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Payment_Method', @level2type=N'COLUMN',@level2name=N'MethodType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default account ID that the transaction is debit/credited' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Payment_Method', @level2type=N'COLUMN',@level2name=N'DefaultAccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Determines if the PO is already fully shipped by PO Shipment.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase_Order', @level2type=N'COLUMN',@level2name=N'IsShipped'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Determines if the PO is already fully shipped by PO Shipment.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase_Order_NonInv', @level2type=N'COLUMN',@level2name=N'IsShipped'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if the prepayment invoice is closed means cant pay anymore and it can be allocated to invoices.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase_Prepayment_Invoice', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Settings', @level2type=N'COLUMN',@level2name=N'SName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Settings', @level2type=N'COLUMN',@level2name=N'SKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Settings', @level2type=N'COLUMN',@level2name=N'SValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Temporary_Transaction', @level2type=N'COLUMN',@level2name=N'SName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Temporary_Transaction', @level2type=N'COLUMN',@level2name=N'SKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Temporary_Transaction', @level2type=N'COLUMN',@level2name=N'SValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "JD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "J"
            Begin Extent = 
               Top = 6
               Left = 280
               Bottom = 135
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AC"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 135
               Right = 692
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AG"
            Begin Extent = 
               Top = 6
               Left = 730
               Bottom = 135
               Right = 900
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AN"
            Begin Extent = 
               Top = 6
               Left = 938
               Bottom = 135
               Right = 1108
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ax_Expense_Journals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ax_Expense_Journals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MyCTE_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PL"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 135
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 486
               Bottom = 135
               Right = 697
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LOC"
            Begin Extent = 
               Top = 6
               Left = 735
               Bottom = 135
               Right = 1008
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ven"
            Begin Extent = 
               Top = 6
               Left = 1046
               Bottom = 135
               Right = 1252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Consign_Item_Lot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Consign_Item_Lot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Consign_Item_Lot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ARJ"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUS"
            Begin Extent = 
               Top = 6
               Left = 280
               Bottom = 135
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Customer_Balance_Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Customer_Balance_Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PL"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LOC"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 135
               Right = 553
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Product_Aging'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Product_Aging'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PL2"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 135
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LOC"
            Begin Extent = 
               Top = 6
               Left = 486
               Bottom = 135
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PL"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Product_Lot_Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Product_Lot_Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PD"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 136
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sale"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Sales_Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Sales_Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Sales_Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Axo_Sales_Summary'
GO
USE [master]
GO
ALTER DATABASE [AXOLONMST] SET  READ_WRITE 
GO
