/****** Object:  Table [dbo].[Accounts]    Script Date: 3/29/2025 5:52:41 PM ******/
create database ChildrenVaccinationSystem
use ChildrenVaccinationSystem

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Email] [nvarchar](450) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](450) NULL,
	[Address] [nvarchar](max) NULL,
	[Gender] [bit] NULL,
	[Role] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[VerificationToken] [varchar](36) NULL,
	[EmailLastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[ResetPasswordToken] [nvarchar](36) NULL,
	[UpdateEmailOTP] [nvarchar](36) NULL,
	[TempUpdateEmail] [nvarchar](450) NULL,
	[FacilityId] [nvarchar](36) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [nvarchar](36) NOT NULL,
	[Title] [nvarchar](450) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Children]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Children](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ChildCode] [nvarchar](450) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Height] [float] NULL,
	[Weight] [float] NULL,
	[Gender] [bit] NULL,
	[AccountId] [nvarchar](36) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[MedicalNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_Children] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [nvarchar](36) NOT NULL,
	[Code] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](450) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Facilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageSource] [nvarchar](450) NOT NULL,
	[BlogId] [nvarchar](36) NULL,
	[VaccineId] [nvarchar](36) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CountryId] [nvarchar](36) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageItems]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageItems](
	[PackageId] [nvarchar](36) NOT NULL,
	[VaccineId] [nvarchar](36) NOT NULL,
 CONSTRAINT [PK_PackageItems] PRIMARY KEY CLUSTERED 
(
	[PackageId] ASC,
	[VaccineId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccinations]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccinations](
	[Id] [nvarchar](36) NOT NULL,
	[Price] [float] NOT NULL,
	[Schedule] [date] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[ChildId] [nvarchar](36) NOT NULL,
	[DoctorId] [nvarchar](36) NULL,
	[VaccinatorId] [nvarchar](36) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[PaymentType] [int] NULL,
	[PaymentLocation] [int] NULL,
	[PaymentMethod] [int] NULL,
	[VaccineId] [nvarchar](36) NULL,
	[FacilityId] [nvarchar](36) NULL,
	[CurrentSequence] [int] NULL,
 CONSTRAINT [PK_Vaccinations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaccineInventory]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaccineInventory](
	[BatchNumber] [nvarchar](450) NOT NULL,
	[FacilityId] [nvarchar](36) NOT NULL,
	[VaccineId] [nvarchar](36) NOT NULL,
	[Stock] [int] NOT NULL,
	[ImportedDate] [date] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
 CONSTRAINT [PK_VaccineInventory] PRIMARY KEY CLUSTERED 
(
	[FacilityId] ASC,
	[VaccineId] ASC,
	[BatchNumber] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccines]    Script Date: 3/29/2025 5:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccines](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartRecommendedAge] [int] NULL,
	[EndRecommendedAge] [int] NULL,
	[DosageInterval] [int] NULL,
	[CategoryId] [nvarchar](36) NOT NULL,
	[ManufacturerId] [nvarchar](36) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[CreatedTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedTime] [datetimeoffset](7) NOT NULL,
	[DeletedTime] [datetimeoffset](7) NULL,
	[Dosage] [float] NULL,
	[Sequence] [int] NULL,
 CONSTRAINT [PK_Vaccines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'00ce5c08-6656-4b18-9a1b-8a581f009423', N'Phạm Ngọc Ánh', CAST(N'2002-07-19' AS Date), N'anhpn@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'051beac5-48fe-400e-8dd6-6d14227a8b51', N'Phạm Hoài Nam', CAST(N'2000-09-08' AS Date), N'namph@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'056d12f3-0a60-434d-9bc4-2d3b87e7afdc', N'Phan Văn Hoàng', CAST(N'2001-05-16' AS Date), N'hoangpv@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'082be32e-c10c-40e0-8e6d-01cc8d959640', N'Đặng Bảo Long', CAST(N'2001-03-25' AS Date), N'longdb@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'09d69bd1-5132-4b82-b772-3402a87d208d', N'Hoàng Minh Châu', CAST(N'2001-03-29' AS Date), N'chauhm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'0b966e17-ed2b-4621-848d-7c9ef700c2e7', N'Nguyễn Thanh Trúc', CAST(N'2000-10-11' AS Date), N'trucnt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'0c3b189d-19f8-4f4c-a120-3d961b9ae458', N'Hoàng Mai Phương', CAST(N'2003-05-12' AS Date), N'phuonghm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'0dcc3e1e-5856-42c9-93a1-969a6fc3f4d9', N'VietHoang', CAST(N'1996-03-03' AS Date), N'zalo@gmail.com', N'$2a$11$.pdJI5X7cKEwKjsRE4KxuOJPwK9.6IWOavI7J0RvPa8EBRmGc0pEC', NULL, NULL, 1, 2, N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-28T23:52:18.0494926+07:00' AS DateTimeOffset), CAST(N'2025-03-28T23:52:18.0494926+07:00' AS DateTimeOffset), NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'0ee2a45b-7c64-451e-8fd8-30f37a8591ad', N'Tô Thu Hằng', CAST(N'2003-08-23' AS Date), N'hangtt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'0ff4c66d-30fd-4c79-871c-3fc03c5e0ce7', N'Phan Ngọc Bích', CAST(N'2001-03-29' AS Date), N'bichpn@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'187bb9c1-de1c-41ca-8d9d-5ac73060615c', N'Trần Thị Thanh', CAST(N'2003-03-22' AS Date), N'thanhtt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'1c81cba7-7ee9-41b9-b563-bad8291aca90', N'Nguyễn Văn Thịnh', CAST(N'2001-02-18' AS Date), N'thinhnv@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'1cef4f30-5700-43d8-a62c-1e4739c37e46', N'Lý Mỹ Duyên', CAST(N'2000-09-15' AS Date), N'duenlm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'1d67fcfd-df95-42d8-8498-f6c3110022d8', N'Ngô Minh Châu', CAST(N'2002-10-11' AS Date), N'chaunm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'1DB643E0-3AB8-4E94-A318-AB54878AE273', N'Trí', CAST(N'2004-11-11' AS Date), NULL, N'$2a$11$h0ctN89LZuaVUqPaNjtTjO0BDrmNzoURF4CBp7M01Q/Vo/4/oJifu', N'0392199370', N'Bcons Bình Dương', 1, 4, N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', NULL, CAST(N'2025-03-28T22:18:41.0662944+07:00' AS DateTimeOffset), CAST(N'2025-03-28T22:18:41.0662944+07:00' AS DateTimeOffset), NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'1e4246e5-b246-4966-b69c-9975e7c4f7fa', N'Tô Bảo Châu', CAST(N'2002-07-25' AS Date), N'chautb@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'23c7591e-d67f-4018-98af-2fdaa07e7425', N'Trương Hải Đăng', CAST(N'2003-12-30' AS Date), N'dangth@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'270839b9-8c30-45f9-9cec-585fbd49a2e6', N'Trần Nhật Minh', CAST(N'2000-07-30' AS Date), N'minhtn@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'2c8528cc-66bb-4255-871a-5d800f776b4b', N'Phan Gia Bảo', CAST(N'2000-08-22' AS Date), N'baopg@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'305E9E3B-6FA2-4BFC-90E1-406523A8C804', N'Thanh', CAST(N'1999-11-11' AS Date), NULL, N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', N'123456', NULL, 1, 4, NULL, NULL, NULL, CAST(N'2025-03-28T22:18:41.0662940+07:00' AS DateTimeOffset), CAST(N'2025-03-28T22:18:41.0662940+07:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-28T22:18:41.0662940+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'35d52975-1d03-41d1-bdab-7c03afc9fa69', N'Nguyễn Minh Đức', CAST(N'2003-08-30' AS Date), N'ducnm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'37594910-8261-47bc-b6bd-ef5f748ff3ae', N'Lê Tiến Phát', CAST(N'2002-09-22' AS Date), N'phongpt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'386c3aca-ab86-4a3b-9ae7-7d9ab35e5ae5', N'Đỗ Thanh Trúc', CAST(N'2000-02-14' AS Date), N'trucdt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'3944a067-66ea-4f47-adce-e10b55fcd2ad', N'Nguyễn Lê Thanh Uyên', CAST(N'2001-03-18' AS Date), N'uyennlt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'3a166d4a-428c-4d6b-9431-a845fed74c55', N'Vũ Thanh Trúc', CAST(N'2000-04-09' AS Date), N'trucvt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'4486eb40-3278-4501-91c8-4fd12e27e34d', N'Đỗ Thị Kim', CAST(N'2000-07-04' AS Date), N'kimdt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'48392aca-f8de-44d4-bdca-f3b7f451e86c', N'Lý Thị Ngọc', CAST(N'2000-04-03' AS Date), N'ngoclth@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'49995251-0d4a-4e7c-9692-8c614b2e114e', N'Hoàng Thị Thu Hà', CAST(N'2003-11-05' AS Date), N'hathth@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'4bfdcc80-1d6a-431b-b916-021832a23a76', N'Nguyễn Hữu Trí', CAST(N'2003-05-12' AS Date), N'trinh@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), CAST(N'2025-03-27T21:26:52.0413213+07:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T13:55:57.5545897+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'4e77146a-1c31-4dca-81f9-0593089f0059', N'Trương Mỹ Linh', CAST(N'2001-11-03' AS Date), N'linhtm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'4e8ee56e-11d2-4385-848a-32e99d9da1ba', N'Nguyễn Minh Tuấn', CAST(N'2003-01-21' AS Date), N'tuanmn@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'50c3f9dd-3743-4443-9d60-672b937ad4d9', N'Vũ Quang Huy', CAST(N'2001-07-19' AS Date), N'huyvq@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'5650bc3d-1a86-4d97-88d7-1edd610fa366', N'Ngô Minh Phúc', CAST(N'2000-06-23' AS Date), N'phucnm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'Quản Lí', CAST(N'1998-03-19' AS Date), N'manager01@gmail.com', N'$2a$11$gETGsfFRhA03QI7GGyUr9.TomSO25hR8Sw47Yhx8V0bpPa2WhgTs2', NULL, NULL, 1, 0, N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T09:18:36.3220000+00:00' AS DateTimeOffset), CAST(N'2025-03-08T09:18:36.3220000+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-08T09:18:36.3220000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'56dbe675-fa0f-4859-95bf-f5c4d1105853', N'Đặng Quỳnh Như', CAST(N'2002-04-18' AS Date), N'nhudq@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'599d4e80-6457-4c7d-a1a8-eb191d8030ad', N'Hoàng Gia Bảo', CAST(N'2003-09-07' AS Date), N'baohg@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'59e11dea-1e06-4f4c-9f62-176587f47396', N'Trịnh Mỹ Duyên', CAST(N'2001-06-14' AS Date), N'duyentm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'64527dba-8522-4d08-8172-74b38adf27b0', N'Ngô Đình Khoa', CAST(N'2002-09-28' AS Date), N'khoand@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'65c76593-6c3a-4f5e-8798-1efbfdd0a6ad', N'Nguyễn Văn Khôi', CAST(N'2000-10-10' AS Date), N'khoinv@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'671df9fa-e488-4849-bb65-e2c97f287128', N'Lâm Bảo Châu', CAST(N'2000-07-09' AS Date), N'chaulb@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'691d11e7-4628-430b-9762-a656cb8a94d2', N'Phạm Hoàng Nam', CAST(N'2001-11-10' AS Date), N'namph112@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'6ea1b99a-819a-4e21-a0bf-4b044270a92b', N'Lý Anh Tú', CAST(N'2002-11-29' AS Date), N'tula@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'707b2772-7760-4fc4-bff5-8eec0fa9e968', N'Phạm Gia Huy', CAST(N'2000-05-14' AS Date), N'huygp@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'710a6285-730d-49a5-b07c-1c09218cb970', N'Phan Văn Khánh', CAST(N'2003-04-08' AS Date), N'khanhpv@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'72435a1b-b334-4c24-a795-afb195efa10e', N'Lý Hải Nam', CAST(N'2002-06-23' AS Date), N'namlh@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'73c38a38-1813-4dc5-859e-01c00a4366aa', N'Bùi Thanh Phong', CAST(N'2003-09-05' AS Date), N'phongbt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', N'David Ho', CAST(N'2004-06-13' AS Date), N'customer01@gmail.com', N'$2a$11$GKGGrqpdkbcu3h8ocZL8ze.cEyRz5.HfhqneRDUAWQdUDx0gUteEC', N'0962372219', N'Vung Tau', 1, 4, N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', NULL, CAST(N'2025-03-08T09:34:08.3970000+00:00' AS DateTimeOffset), CAST(N'2025-03-08T09:34:08.3970000+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-01-01T10:34:08.3970000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'7A6F3E08-C2C1-4B70-B5EA-241C1E4B24D6', N'VietHoang', CAST(N'1989-03-01' AS Date), N'juchado@gmail.com', N'$2a$11$lrKTT09R3x811eFKu3sD2esUr29tVJyOmQsqWhdRKuizukmIj0PRu', N'0828278868', N'Vung Tau', 1, 4, N'7A6F3E08-C2C1-4B70-B5EA-241C1E4B24D6', N'7A6F3E08-C2C1-4B70-B5EA-241C1E4B24D6', NULL, CAST(N'2025-03-28T17:23:54.3141881+07:00' AS DateTimeOffset), CAST(N'2025-03-28T17:25:25.3375364+07:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-28T17:23:54.3141881+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'7cf4b1b0-1330-44af-8698-49c590c6de67', N'Anh Nhân Viên', CAST(N'2004-03-03' AS Date), N'staff01@gmail.com', N'$2a$12$MzwTBRaPbAeSoCX2HzhvfejUt85C5K9LbsTwSMoWVPS8RnmFDvlwW', NULL, NULL, 1, 1, N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T09:23:32.8740000+00:00' AS DateTimeOffset), CAST(N'2025-03-26T00:04:06.0472749+07:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-08T09:23:32.8740000+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'7e37d43f-6202-422f-a4a1-bafaac894840', N'Vũ Thị Mai Anh', CAST(N'2001-04-21' AS Date), N'anhvtm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'819c8b04-c171-43a5-af1d-40d6531dd0d1', N'Đặng Anh Tuấn', CAST(N'2000-06-25' AS Date), N'tuanad@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'82281d19-3eb0-47cd-81f0-d7c0622c0af5', N'Trần Hoàng Quân', CAST(N'2002-08-17' AS Date), N'quantq@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'86318cc3-8ee6-4d9a-9745-d68e40dfcd41', N'Bùi Thị Bích', CAST(N'2001-06-03' AS Date), N'bichbt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'8F5232F0-21DB-460C-807A-E9595A0B9261', N'Ho Ngoc Sang', CAST(N'2000-03-10' AS Date), NULL, N'$2a$11$E/OAYJrYEJTINWMaQeOeZOtBC5om7Qja5fsEeYq/Lh75H/fXTfxvy', N'0962372218', N'Vung Tau', 1, 4, N'7CF4B1B0-1330-44AF-8698-49C590C6DE67', N'7CF4B1B0-1330-44AF-8698-49C590C6DE67', NULL, CAST(N'2025-03-29T07:49:03.1318144+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:49:03.1318144+07:00' AS DateTimeOffset), NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'a06ec325-a35f-4c54-b8e4-5811234b8c4a', N'Nguyễn Hữu Thắng', CAST(N'2002-07-15' AS Date), N'thangnh@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'a5f4beac-49f2-45ef-8859-f66466aba3c4', N'Đoàn Thanh Tùng', CAST(N'2001-02-28' AS Date), N'tungdt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'a8060592-8dae-4012-90b4-b1f3edd9b6cb', N'Lê Minh Hùng', CAST(N'2000-03-22' AS Date), N'hunglm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'afc4b085-4521-4177-a1fb-af0e400fd10c', N'Tô Thảo Nhi', CAST(N'2001-12-19' AS Date), N'nhitt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'b0ccc769-2ac4-40ad-8b07-bc2c7207ab4c', N'Bùi Anh Tuấn', CAST(N'2001-11-17' AS Date), N'tuanba@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'b0f72194-a571-4edb-a7b0-cdafb0dcf434', N'Đặng Quốc Huy', CAST(N'2000-02-18' AS Date), N'huydq@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'b879df6b-f405-4361-a6d8-aded8b7ecb20', N'Trần Quốc Bảo', CAST(N'2002-09-10' AS Date), N'baotq@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'b8b9ddc4-550a-48b5-ba78-e6feb75ff3aa', N'Trần Thị Hạnh', CAST(N'2000-12-02' AS Date), N'hanhtt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'bad2230f-4697-440f-a43a-2ea166f74732', N'Huỳnh Mỹ Linh', CAST(N'2001-12-02' AS Date), N'linhhm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'bdc9ada4-9c4e-4f40-b415-3237cc6e6160', N'Vũ Thị Bích Ngọc', CAST(N'2000-10-08' AS Date), N'ngocvtb@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'c02a68c5-1a3e-4c91-a6b0-0354bb0d5adb', N'Nguyễn Văn An', CAST(N'2001-05-14' AS Date), N'annv@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'c6c41d25-a631-4a25-a838-fe3dc30d84e0', N'Lê Minh Trí', CAST(N'2003-11-20' AS Date), N'trilm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'cc4e4bf8-3869-4d77-8850-92df9442db4b', N'Lê Ngọc Mai', CAST(N'2000-05-28' AS Date), N'mailn@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:06:03.7611126+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'E5F67890-1234-5678-9ABC-DEF012345678')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'cc6566b3-c5cf-4bae-bdbd-165fcde66ed9', N'Đinh Gia Huy', CAST(N'2002-12-22' AS Date), N'huydg@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'd213e051-d3f2-42c8-922e-6a93a5c1134f', N'Trần Thị Minh', CAST(N'2002-08-21' AS Date), N'minhtt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'd4305c51-e7d2-4c17-a56b-b5cd99932153', N'Vũ Quốc Anh', CAST(N'2000-07-17' AS Date), N'anhvq@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'd6aba132-df70-406c-8cfb-9bfd720c0618', N'Bùi Minh Trí', CAST(N'2003-05-30' AS Date), N'tribm@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'd6e644d6-5143-49c9-98e2-be387ba2bac7', N'Hải Thượng Lãn Ông', CAST(N'1720-04-03' AS Date), N'doctor01@gmail.com', N'$2a$11$gETGsfFRhA03QI7GGyUr9.TomSO25hR8Sw47Yhx8V0bpPa2WhgTs2', NULL, NULL, 1, 2, N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T09:26:44.5490000+00:00' AS DateTimeOffset), CAST(N'2025-03-08T09:26:44.5490000+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-08T09:26:44.5490000+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'debc0740-d134-4b40-bc3a-9e92feb63b86', N'Đỗ Thị Thanh Hằng', CAST(N'2003-02-09' AS Date), N'hangdtt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'e509a8ab-7bc9-42a4-8ea1-3994e73433ab', N'Hoàng Bảo Khánh', CAST(N'2003-07-05' AS Date), N'khanhhb@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:04:11.1523562+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'ed81a1b5-fd8a-434b-85a0-b81985a09418', N'Phương Trinh', CAST(N'2004-03-07' AS Date), N'vaccinator01@gmail.com', N'$2a$11$gETGsfFRhA03QI7GGyUr9.TomSO25hR8Sw47Yhx8V0bpPa2WhgTs2', NULL, NULL, 0, 3, N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T09:28:25.0670000+00:00' AS DateTimeOffset), CAST(N'2025-03-08T09:28:25.0670000+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-08T09:28:25.0670000+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'f06a6249-7ade-445c-87d7-c2d53d34ff57', N'Lê Bảo Ngọc', CAST(N'2003-10-07' AS Date), N'ngoclbn@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'f102d55c-d634-4624-b7ba-c9e95351e598', N'Nguyễn Thanh Sơn', CAST(N'2002-06-15' AS Date), N'sonnt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 1, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'f34ff572-411a-41f3-a268-0e96cfcd65bb', N'Trịnh Quang Huy', CAST(N'2002-08-14' AS Date), N'huytq@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 2, NULL, NULL, NULL, CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:01:09.8076138+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'f62545bf-a9c7-4bee-886f-c3b6d7815656', N'Trịnh Hoài An', CAST(N'2003-09-12' AS Date), N'anth@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'f759cca9-a04d-48db-881f-1b2a9bbfd792', N'Tô Văn Hiếu', CAST(N'2001-01-25' AS Date), N'hieutv@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:20:30.8987409+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'B2C3D4E5-F678-9012-3456-789ABCDEF012')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'fc72be75-7d10-422f-ab6b-81e86544e6e0', N'Ngô Thùy Dương', CAST(N'2002-01-12' AS Date), N'duongnt@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 0, 2, NULL, NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T15:02:16.7109464+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'D4E5F678-9012-3456-789A-BCDEF0123456')
GO
INSERT [dbo].[Accounts] ([Id], [Name], [DateOfBirth], [Email], [Password], [PhoneNumber], [Address], [Gender], [Role], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [VerificationToken], [EmailLastUpdatedTime], [ResetPasswordToken], [UpdateEmailOTP], [TempUpdateEmail], [FacilityId]) VALUES (N'fead2cbe-4f37-4f8a-9fc4-3b60dc6ed105', N'Đỗ Hải Đăng', CAST(N'2003-03-08' AS Date), N'dangdh@kidsvaccine.vn', N'$2a$11$LkDLCqQZrs8W91I3laC0QOhtu0smIHM5.m7D0JWS5uf8aNvX2b2qC', NULL, NULL, 1, 3, NULL, NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, CAST(N'2025-03-27T14:59:55.4104977+00:00' AS DateTimeOffset), NULL, NULL, NULL, N'C3D4E5F6-7890-1234-5678-9ABCDEF01234')
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1', N'Gói vắc xin cho trẻ em', N'<p>Hệ thống tiêm chủng <strong>Kids Vaccine</strong> với hàng trăm trung tâm tiêm chủng trên toàn quốc cung cấp danh mục vắc xin đa dạng hơn 50 loại nhập khẩu chính hãng, đảm bảo chất lượng, giá cả phù hợp, quy trình tiêm chủng an toàn… Đặc biệt, <strong>Kids Vaccine </strong>cung cấp nhiều gói vắc xin linh hoạt, phù hợp với nhu cầu và độ tuổi của tất cả các đối tượng trong xã hội. Tham gia Gói vắc xin tại <strong>Kids Vaccine</strong>, <strong>Quý Khách hàng sẽ được hưởng những đặc quyền khác biệt</strong>:</p><ol><li>Đảm bảo có đầy đủ các loại vắc xin theo phác đồ, đảm bảo tiêm đúng lịch, đúng loại, kể cả khi vắc xin khan hiếm, bao gồm cả những mũi tiêm cơ bản và các loại vắc xin khan hiếm.</li><li>Gói vắc xin linh hoạt theo độ tuổi, tình trạng sức khỏe cá nhân, các yếu tố dịch bệnh, vùng miền, thời gian sử dụng. Đặc biệt, linh hoạt với các điều kiện chi phí với nhiều ưu đãi, hỗ trợ trả góp không lãi suất lên đến 12 tháng và chia nhỏ chi phí mua Gói vắc xin thành nhiều lần thanh toán.</li><li>Vắc xin lưu giữ, bảo quản theo thời gian hợp đồng nghiêm ngặt theo tiêu chuẩn Quốc tế với hệ thống hàng trăm kho lạnh đạt chuẩn GSP (Good Storage Practices) và hệ thống dây chuyền lạnh (Cold chain) hiện đại hàng đầu Việt Nam.</li><li>Cam kết không tăng giá trong thời gian của Gói vắc xin. Ưu đãi giá và luôn có quà tặng hấp dẫn. Nhận quà sinh nhật hàng năm trong thời gian tham gia Hợp đồng Gói vắc xin. Được đón tiếp phục vụ tại không gian ưu tiên, riêng tư, tiện nghi. Ưu tiên phục vụ khám và tiêm…</li><li>Tự động nhắc lịch tiêm qua tin nhắn, lưu giữ và tra cứu lịch sử tiêm chủng dễ dàng. Miễn phí giấy xác nhận tiêm chủng (tiếng Anh, tiếng Việt) theo biểu mẫu phù hợp yêu cầu của Khách hàng.</li></ol><h3><br></h3><h2><strong>DANH MỤC GÓI VẮC XIN CHO TRẺ</strong></h2><h3><strong>Gói 1: vắc xin Hexaxim – Rotarix – Varilrix</strong></h3><p><strong>STT</strong> <strong>PHÒNG BỆNH</strong> <strong>TÊN</strong></p><p><strong> VẮC XIN</strong> <strong>NƯỚC</strong></p><p><strong> SẢN XUẤT</strong> <strong>SỐ MŨI THEO PHÁC ĐỒ</strong> <strong>6 THÁNG</strong> <strong>9 THÁNG</strong> <strong>12 THÁNG</strong> <strong>24 THÁNG</strong> 2 tháng Tiêu chảy do rota virus Rotarix GSK/Bỉ 2 2 2 2 2 Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh do HIB , Viêm gan B (6 in 1) Hexaxim Sanofi/Pháp 4 3 3 3 4 Hội chứng nhiễm trùng, viêm màng não, viêm phổi, nhiễm khuẩn huyết, viêm tai giữa do phế cầu Synflorix GSK/Bỉ 4 3 3 4 4 Viêm màng não do não mô cầu nhóm B Bexsero GSK / Ý 3 2 2 3 3 6 tháng Cúm Vaxigrip tetra/ Influvac Tetra Sanofi (Pháp)/ Abbott (Hà Lan) 3 1 2 2 3 9 tháng Sởi Mvvac Polyvac/Việt Nam 1 1 1 1 Viêm não Nhật bản Imojev Sanofi/Thái Lan 2 1 1 2 Viêm màng não do não mô cầu nhóm A,C,Y,W Menactra Sanofi/Mỹ 2 1 2 2 Thủy Đậu Varilrix GSK/Bỉ 2 1 2 2 12 tháng Sởi- Quai bị – Rubella MMR-II MSD/Mỹ 2 1 1 Viêm gan A,B Twinrix GSK/Bỉ 2 1 2 24 tháng Thương hàn Typhoid Vi Davac/Việt Nam 1 1 Tả mOrcvax Vabiotech/Việt Nam 2 2 Tổng số liều 11 16 22 29 GIÁ GÓI 14,142,000 19,040,400 26,702,400 30,979,200 <strong>GIÁ GÓI ƯU ĐÃI</strong> <strong>13,434,900 </strong> <strong> 17,897,976 </strong> <strong> 24,833,232 </strong> <strong> 28,810,656 </strong> Số tiền ưu đãi 707,100 1,142,424 1,869,168 2,168,544</p><p>&nbsp;</p><h3><strong>Gói 2: Hexaxim – Rotateq – Varilrix</strong></h3><p><strong>STT</strong> <strong>PHÒNG BỆNH</strong> <strong>TÊN</strong></p><p><strong> VẮC XIN</strong> <strong>NƯỚC</strong></p><p><strong> SẢN XUẤT</strong> <strong>SỐ MŨI THEO PHÁC ĐỒ</strong> <strong>6 THÁNG</strong> <strong>9 THÁNG</strong> <strong>12 THÁNG</strong> <strong>24 THÁNG</strong> 2 tháng Tiêu chảy do rota virus Rotateq Mỹ 3 3 3 3 3 Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh do HIB , Viêm gan B (6 in 1) Hexaxim Sanofi/Pháp 4 3 3 3 4 Hội chứng nhiễm trùng, viêm màng não, viêm phổi, nhiễm khuẩn huyết, viêm tai giữa do phế cầu Synflorix GSK/Bỉ 4 3 3 4 4 Viêm màng não do não mô cầu nhóm B Bexsero GSK / Ý 3 2 2 3 3 6 tháng Cúm Vaxigrip tetra/ Influvac Tetra Sanofi (Pháp)/ Abbott (Hà Lan) 3 1 2 2 3 9 tháng Sởi Mvvac Polyvac/Việt Nam 1 1 1 1 Viêm não Nhật bản Imojev Sanofi/Thái Lan 2 1 1 2 Viêm màng não do não mô cầu nhóm A,C,Y,W Menactra Sanofi/Mỹ 2 1 2 2 Thủy Đậu Varilrix GSK/Bỉ 2 1 2 2 12 tháng Sởi- Quai bị – Rubella MMR-II MSD/Mỹ 2 1 1 Viêm gan A,B Twinrix GSK/Bỉ 2 1 2 24 tháng Thương hàn Typhoid Vi Davac/Việt Nam 1 1 Tả mOrcvax Vabiotech/Việt Nam 2 2 Tổng số liều 12 17 23 30 GIÁ GÓI 14,556,000 19,454,400 27,116,400 31,393,200 <strong>GIÁ GÓI ƯU ĐÃI</strong> <strong>13,828,200 </strong> <strong> 18,287,136 </strong> <strong> 25,218,252 </strong> <strong> 29,195,676 </strong> Số tiền ưu đãi 727,800 1,167,264 1,898,148 2,197,524</p><p><br></p><p>&nbsp;</p><h3><strong>Gói 3: Infanrix Hexa – Rotateq – Varilrix</strong></h3><p><strong>STT</strong> <strong>PHÒNG BỆNH</strong> <strong>TÊN</strong></p><p><strong> VẮC XIN</strong> <strong>NƯỚC</strong></p><p><strong> SẢN XUẤT</strong> <strong>SỐ MŨI THEO PHÁC ĐỒ</strong> <strong>6 THÁNG</strong> <strong>9 THÁNG</strong> <strong>12 THÁNG</strong> <strong>24 THÁNG</strong> 2 tháng Tiêu chảy do rota virus Rotateq Mỹ 3 3 3 3 3 Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh do HIB , Viêm gan B (6 in 1) Infanrix Hexa GSK/Bỉ 4 3 3 3 4 Hội chứng nhiễm trùng, viêm màng não, viêm phổi, nhiễm khuẩn huyết, viêm tai giữa do phế cầu Synflorix GSK/Bỉ 4 3 3 4 4 Viêm màng não do não mô cầu nhóm B Bexsero GSK/ Ý 3 2 2 3 3 6 tháng Cúm Vaxigrip tetra/ Influvac Tetra Sanofi (Pháp)/ Abbott (Hà Lan) 3 1 2 2 3 9 tháng Sởi Mvvac Polyvac/Việt Nam 1 1 1 1 Viêm não Nhật bản Imojev Sanofi/Thái Lan 2 1 1 2 Viêm màng não do não mô cầu nhóm A,C,Y,W Menactra Sanofi/Mỹ 2 1 2 2 Thủy Đậu Varilrix GSK/Bỉ 2 1 2 2 12 tháng Sởi- Quai bị – Rubella MMR-II MSD/Mỹ 2 1 1 Viêm gan A,B Twinrix GSK/Bỉ 2 1 2 24 tháng Thương hàn Typhoid Vi Davac/Việt Nam 1 1 Tả mOrcvax Vabiotech/Việt Nam 2 2 Tổng số liều 12 17 23 30 GIÁ GÓI 14,437,200 19,335,600 26,997,600 31,234,800 <strong>GIÁ GÓI ƯU ĐÃI</strong> <strong>13,715,340 </strong> <strong>18,175,464</strong> <strong> 25,107,768</strong> <strong>29,048,364</strong> Số tiền ưu đãi 721,860 1,160,136 1,889,832 2,186,436</p><p><br></p><p>&nbsp;</p><h3><strong>Gói 4: Infanrix Hexa – Rotarix – Varilrix</strong></h3><p><strong>STT</strong> <strong>PHÒNG BỆNH</strong> <strong>TÊN</strong></p><p><strong> VẮC XIN</strong> <strong>NƯỚC</strong></p><p><strong> SẢN XUẤT</strong> <strong>SỐ MŨI THEO PHÁC ĐỒ</strong> <strong>6 THÁNG</strong> <strong>9 THÁNG</strong> <strong>12 THÁNG</strong> <strong>24 THÁNG</strong> 2 tháng Tiêu chảy do rota virus Rotarix GSK/Bỉ 2 2 2 2 2 Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh do HIB , Viêm gan B (6 in 1) Infanrix Hexa GSK/Bỉ 4 3 3 3 4 Hội chứng nhiễm trùng, viêm màng não, viêm phổi, nhiễm khuẩn huyết, viêm tai giữa do phế cầu Synflorix GSK/Bỉ 4 3 3 4 4 Viêm màng não do não mô cầu nhóm B Bexsero Ý 3 2 2 3 3 6 tháng Cúm Vaxigrip tetra/ Influvac Tetra Sanofi (Pháp)/ Abbott (Hà Lan) 3 1 2 2 3 9 tháng Sởi Mvvac Polyvac/Việt Nam 1 1 1 1 Viêm não Nhật bản Imojev Sanofi/Thái Lan 2 1 1 2 Viêm màng não do não mô cầu nhóm A,C,Y,W Menactra Sanofi/Mỹ 2 1 2 2 Thủy Đậu Varilrix GSK/Bỉ 2 1 2 2 12 tháng Sởi- Quai bị – Rubella MMR-II MSD/Mỹ 2 1 1 Viêm gan A,B Twinrix GSK/Bỉ 2 1 2 24 tháng Thương hàn Typhoid Vi Davac/Việt Nam 1 1 Tả mOrcvax Vabiotech/Việt Nam 2 2 Tổng số liều 11 16 22 29 GIÁ GÓI 14,023,200 18,921,600 26,583,600 30,820,800 <strong>GIÁ GÓI ƯU ĐÃI</strong> <strong>13,322,040 </strong> <strong> 17,786,304 </strong> <strong> 24,722,748 </strong> <strong> 28,663,344 </strong> Số tiền ưu đãi 701,160 1,135,296 1,860,852 2,157,456</p><p><br></p><p>&nbsp;</p><h3><strong>Gói 5: Infanrix Hexa – Rotarix – Varivax</strong></h3><p><strong>STT</strong> <strong>PHÒNG BỆNH</strong> <strong>TÊN</strong></p><p><strong> VẮC XIN</strong> <strong>NƯỚC</strong></p><p><strong> SẢN XUẤT</strong> <strong>SỐ MŨI THEO PHÁC ĐỒ</strong> <strong>6 THÁNG</strong> <strong>9 THÁNG</strong> <strong>12 THÁNG</strong> <strong>24 THÁNG</strong> 2 tháng Tiêu chảy do rota virus Rotarix GSK/Bỉ 2 2 2 2 2 Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh do HIB , Viêm gan B (6 in 1) Infanrix Hexa GSK/Bỉ 4 3 3 3 4 Hội chứng nhiễm trùng, viêm màng não, viêm phổi, nhiễm khuẩn huyết, viêm tai giữa do phế cầu Synflorix GSK/Bỉ 4 3 3 4 4 Viêm màng não do não mô cầu nhóm B Bexsero GSK / Ý 3 2 2 3 3 6 tháng Cúm Vaxigrip tetra/ Influvac Tetra Sanofi (Pháp)/ Abbott (Hà Lan) 3 1 2 2 3 9 tháng Sởi Mvvac Polyvac/Việt Nam 1 1 1 1 Viêm não Nhật bản Imojev Sanofi/Thái Lan 2 1 1 2 Viêm màng não do não mô cầu nhóm A,C,Y,W Menactra Sanofi/Mỹ 2 1 2 2 12 tháng Thủy Đậu Varivax Mỹ 2 1 2 Sởi- Quai bị – Rubella MMR-II MSD/Mỹ 2 1 1 Viêm gan A,B Twinrix GSK/Bỉ 2 1 2 24 tháng Thương hàn Typhoid Vi Davac/Việt Nam 1 1 Tả mOrcvax Vabiotech/Việt Nam 2 2 Tổng số liều 11 15 21 29 GIÁ GÓI 14,023,200 17,619,600 25,281,600 30,820,800 <strong>GIÁ GÓI ƯU ĐÃI</strong> <strong> 13,322,040</strong> <strong> 16,562,424</strong> <strong> 23,511,888</strong> <strong> 28,663,344</strong> Số tiền ưu đãi 701,160 1,057,176 1,769,712 2,157,456</p><p><em>.</em></p><p>&nbsp;</p><h3><strong>Gói 6: Infanrix Hexa – Rotateq – Varivax</strong></h3><p><strong>STT</strong> <strong>PHÒNG BỆNH</strong> <strong>TÊN</strong></p><p><strong> VẮC XIN</strong> <strong>NƯỚC</strong></p><p><strong> SẢN XUẤT</strong> <strong>SỐ MŨI THEO PHÁC ĐỒ</strong> <strong>6 THÁNG</strong> <strong>9 THÁNG</strong> <strong>12 THÁNG</strong> <strong>24 THÁNG</strong> 2 tháng Tiêu chảy do rota virus Rotateq Mỹ 3 3 3 3 3 Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh do HIB , Viêm gan B (6 in 1) Infanrix Hexa GSK/Bỉ 4 3 3 3 4 Hội chứng nhiễm trùng, viêm màng não, viêm phổi, nhiễm khuẩn huyết, viêm tai giữa do phế cầu Synflorix GSK/Bỉ 4 3 3 4 4 Viêm màng não do não mô cầu nhóm B Bexsero GSK / Ý 3 2 2 3 3 6 tháng Cúm Vaxigrip tetra/ Influvac Tetra Sanofi (Pháp)/ Abbott (Hà Lan) 3 1 2 2 3 9 tháng Sởi Mvvac Polyvac/Việt Nam 1 1 1 1 Viêm não Nhật bản Imojev Sanofi/Thái Lan 2 1 1 2 Viêm màng não do não mô cầu nhóm A,C,Y,W Menactra Sanofi/Mỹ 2 1 2 2 12 tháng Thủy Đậu Varivax Mỹ 2 1 2 Sởi- Quai bị – Rubella MMR-II MSD/Mỹ 2 1 1 Viêm gan A,B Twinrix GSK/Bỉ 2 1 2 24 tháng Thương hàn Typhoid Vi Davac/Việt Nam 1 1 Tả mOrcvax Vabiotech/Việt Nam 2 2 Tổng số liều 12 16 22 30 GIÁ GÓI 14,437,200 18,033,600 25,695,600 31,234,800 <strong>GIÁ GÓI ƯU ĐÃI</strong> <strong>13,715,340 </strong> <strong>16,951,584 </strong> <strong>23,896,908 </strong> <strong>29,048,364 </strong> Số tiền ưu đãi 721,860 1,082,016 1,798,692 2,186,436</p><p><br></p><p>&nbsp;</p><h3><strong>Gói 7: Hexaxim – Rotateq – Varivax</strong></h3><p><strong>STT</strong> <strong>PHÒNG BỆNH</strong> <strong>TÊN</strong></p><p><strong> VẮC XIN</strong> <strong>NƯỚC</strong></p><p><strong> SẢN XUẤT</strong> <strong>SỐ MŨI THEO PHÁC ĐỒ</strong> <strong>6 THÁNG</strong> <strong>9 THÁNG</strong> <strong>12 THÁNG</strong> <strong>24 THÁNG</strong> 2 tháng Tiêu chảy do rota virus Rotateq Mỹ 3 3 3 3 3 Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh do HIB , Viêm gan B (6 in 1) Hexaxim Sanofi/Pháp 4 3 3 3 4 Hội chứng nhiễm trùng, viêm màng não, viêm phổi, nhiễm khuẩn huyết, viêm tai giữa do phế cầu Synflorix GSK/Bỉ 4 3 3 4 4 Viêm màng não do não mô cầu nhóm B Bexsero GSK / Ý 3 2 2 3 3 6 tháng Cúm Vaxigrip tetra/ Influvac Tetra Sanofi (Pháp)/ Abbott (Hà Lan) 3 1 2 2 3 9 tháng Sởi Mvvac Polyvac/Việt Nam 1 1 1 1 Viêm não Nhật bản Imojev Sanofi/Thái Lan 2 1 1 2 Viêm màng não do não mô cầu nhóm A,C,Y,W Menactra Sanofi/Mỹ 2 1 2 2 12 tháng Thủy Đậu Varivax Mỹ 2 1 2 Sởi- Quai bị – Rubella MMR-II MSD/Mỹ 2 1 1 Viêm gan A,B Twinrix GSK/Bỉ 2 1 2 24 tháng Thương hàn Typhoid Vi Davac/Việt Nam 1 1 Tả mOrcvax Vabiotech/Việt Nam 2 2 Tổng số liều 12 16 22 30 GIÁ GÓI 14,556,000 18,152,400 25,814,400 31,393,200 <strong>GIÁ GÓI ƯU ĐÃI</strong> <strong>13,828,200 </strong> <strong>17,063,256 </strong> <strong>24,007,392 </strong> <strong>29,195,676 </strong> Số tiền ưu đãi 727,800 1,089,144 1,807,008 2,197,524</p><p><br></p><p>&nbsp;</p><h3><strong>Gói 8: Hexaxim – Rotarix – Varivax</strong></h3><p><strong>STT</strong> <strong>PHÒNG BỆNH</strong> <strong>TÊN</strong></p><p><strong> VẮC XIN</strong> <strong>NƯỚC</strong></p><p><strong> SẢN XUẤT</strong> <strong>SỐ MŨI THEO PHÁC ĐỒ</strong> <strong>6 THÁNG</strong> <strong>9 THÁNG</strong> <strong>12 THÁNG</strong> <strong>24 THÁNG</strong> 2 tháng Tiêu chảy do rota virus Rotarix GSK/Bỉ 2 2 2 2 2 Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh do HIB , Viêm gan B (6 in 1) Hexaxim Sanofi/Pháp 4 3 3 3 4 Hội chứng nhiễm trùng, viêm màng não, viêm phổi, nhiễm khuẩn huyết, viêm tai giữa do phế cầu Synflorix GSK/Bỉ 4 3 3 4 4 Viêm màng não do não mô cầu nhóm B Bexsero GSK / Ý 3 2 2 3 3 6 tháng Cúm Vaxigrip tetra/ Influvac Tetra Sanofi (Pháp)/ Abbott (Hà Lan) 3 1 2 2 3 9 tháng Sởi Mvvac Polyvac/Việt Nam 1 1 1 1 Viêm não Nhật bản Imojev Sanofi/Thái Lan 2 1 1 2 Viêm màng não do não mô cầu nhóm A,C,Y,W Menactra Sanofi/Mỹ 2 1 2 2 12 tháng Thủy đậu Varivax Mỹ 2 1 2 Sởi- Quai bị – Rubella MMR-II MSD/Mỹ 2 1 1 Viêm gan A,B Twinrix GSK/Bỉ 2 1 2 24 tháng Thương hàn Typhoid Vi Davac/Việt Nam 1 1 Tả mOrcvax Vabiotech/Việt Nam 2 2 Tổng số liều 11 15 21 29 GIÁ GÓI 14,142,000 17,738,400 25,400,400 30,979,200 <strong>GIÁ GÓI ƯU ĐÃI</strong> <strong>13,434,900 </strong> <strong>16,674,096 </strong> <strong>23,622,372 </strong> <strong>28,810,656 </strong> Số tiền ưu đãi 707,100 1,064,304 1,778,028 2,168,544</p>', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-28T22:11:14.2182822+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'15477f5a-26a0-49e9-a2ee-f4e8bf626a18', N'Tại sao nên tiêm chủng cho con?', N'Vaccine cứu sống con người. Chỉ riêng vaccine phòng bệnh sởi đã được ước tính là đã ngăn chặn hơn 21 triệu ca tử vong từ năm 2000 đến 2017.

Vaccine sẽ giúp bảo vệ con bạn khỏi những bệnh tật có thể gây hại nghiêm trọng hoặc tử vong, đặc biệt là ở những người có hệ miễn dịch đang phát triển như trẻ sơ sinh.

Việc tiêm chủng cho con bạn là rất quan trọng. Nếu không, những bệnh dễ lây lan như sởi, bạch hầu và bại liệt, vốn đã được tiêu diệt ở nhiều quốc gia, sẽ quay trở lại.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'22e99f5d-59d0-4671-a2a2-fadc1791d823', N'Tại sao phải tuân theo lịch tiêm chủng cho trẻ em?

', N'Vào tuần đầu tiên của tháng 9 năm nay, các quan chức y tế Mỹ đã ghi nhận 247 ca mắc bệnh sởi, một căn bệnh dễ lây lan. Để hiểu rõ hơn, trong năm 2023, chỉ có 59 ca mắc sởi được báo cáo trong cả năm.

Điều này không có gì ngạc nhiên, vì tỷ lệ tiêm chủng cho các bệnh có thể phòng ngừa ở trẻ em đã giảm, theo Trung tâm Kiểm soát và Phòng ngừa Dịch bệnh (CDC). Giữa năm học 2019–2020 và năm học 2022–2023, tỷ lệ trẻ em mẫu giáo được tiêm chủng đầy đủ đã giảm từ 95% xuống 93%.

Ngay cả một sự giảm nhỏ như vậy cũng ảnh hưởng đến miễn dịch cộng đồng, điều giúp bảo vệ cộng đồng của chúng ta. (Miễn dịch cộng đồng xảy ra khi có đủ người được tiêm chủng để làm giảm khả năng lây lan bệnh trong cộng đồng chưa tiêm chủng.) Đối với bệnh sởi, chúng ta cần 95% dân số — cả trẻ em và người lớn — được tiêm chủng để đạt được miễn dịch cộng đồng.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'28866930-3da7-4f66-b4ce-4ba0e6f2cbdf', N'Các loại vaccine thường xuyên tiêm cho trẻ em', N'Vaccine hoạt động bằng cách bắt chước tác nhân gây bệnh (vi khuẩn hoặc virus) gây ra bệnh. Chúng chuẩn bị hệ thống miễn dịch của cơ thể để đối phó với sự tiếp xúc trong tương lai với virus hoặc vi khuẩn gây bệnh. Các phần của tác nhân gây bệnh mà hệ miễn dịch nhận dạng là vật lạ đối với cơ thể và được gọi là kháng nguyên. Tiêm vaccine giúp cơ thể tiếp xúc với các kháng nguyên này. Vaccine có thể chứa vi khuẩn hoặc virus đã bị suy yếu, hoặc các phần của vi khuẩn hoặc virus, hoặc thông tin di truyền cho một protein cụ thể giúp cơ thể sản xuất một lượng nhỏ protein đó. Sau khi tiêm vaccine, hệ thống miễn dịch của cơ thể nhận ra các kháng nguyên từ vaccine là vật lạ và không nên có trong cơ thể, nhưng các kháng nguyên này không gây bệnh cho người nhận vaccine. Sau khi nhận vaccine, nếu virus hoặc vi khuẩn gây bệnh xâm nhập vào cơ thể trong tương lai, hệ thống miễn dịch đã chuẩn bị và phản ứng nhanh chóng và mạnh mẽ để tấn công tác nhân gây bệnh, ngăn không cho người đó bị bệnh. Vaccine thường được tiêm bằng cách tiêm (tiêm chủng), nhưng một số được uống, và một loại được xịt vào mũi.

Có nhiều loại vaccine được tiêm cho trẻ em:

Virus sống đã suy yếu - Những vaccine này chứa virus sống đã bị suy yếu trong quá trình sản xuất để không gây ra bệnh cho người được tiêm chủng. Tuy nhiên, vì chúng chứa một lượng nhỏ virus sống đã suy yếu, những người có hệ miễn dịch yếu nên tham khảo ý kiến bác sĩ trước khi tiêm. Ví dụ bao gồm vaccine phòng thủy đậu, rota virus và sởi, quai bị, rubella (sởi Đức).
Virus đã chết - Những vaccine này chứa virus đã bị giết chết để không gây bệnh, nhưng cơ thể vẫn nhận diện và kích thích sản xuất kháng thể chống lại virus. Chúng có thể được tiêm cho những người có hệ miễn dịch yếu. Ví dụ bao gồm vaccine phòng bệnh bại liệt và viêm gan A.
Subunits - Trong một số trường hợp, toàn bộ virus hoặc vi khuẩn không cần thiết để phản ứng miễn dịch phòng ngừa bệnh; chỉ cần những phần quan trọng, một phần hoặc một "subunit" của vi khuẩn hoặc virus gây bệnh để bảo vệ. Một ví dụ là vaccine phòng ngừa cúm (influenza) được tiêm, vì nó được làm từ các phần của virus cúm.
Toxoids - Một số vi khuẩn gây bệnh cho con người bằng cách tiết ra chất độc (toxin). Các nhà khoa học phát hiện rằng làm suy yếu các chất độc này, để chúng được "khử độc", không gây bệnh. Các vaccine chứa toxoids bao gồm những vaccine phòng ngừa bệnh uốn ván và bạch hầu.
Recombinant - Những vaccine này được tạo ra bằng kỹ thuật di truyền, một quá trình và phương pháp thao tác với vật liệu di truyền của một sinh vật. Vaccine phòng ngừa một số bệnh do virus papillomavirus ở người (HPV) gây ra, chẳng hạn như ung thư cổ tử cung, là ví dụ của loại vaccine này. Trong trường hợp này, các gen mã hóa cho một protein cụ thể từ mỗi loại virus HPV có trong vaccine được biểu hiện trong nấm men để tạo ra số lượng lớn protein. Protein được sản xuất này được tinh chế và dùng để tạo vaccine. Vì vaccine chỉ chứa protein, không phải toàn bộ virus, vaccine không thể gây nhiễm HPV.
Polysaccharides - Để bảo vệ chống lại một số vi khuẩn gây bệnh, các kháng nguyên chính trong vaccine là các chất giống đường gọi là polysaccharides; chúng được tinh chế từ vi khuẩn để làm vaccine polysaccharide. Tuy nhiên, vaccine chỉ chứa polysaccharides tinh chế chỉ có hiệu quả ở trẻ em lớn và người lớn. Pneumovax 23, một vaccine phòng bệnh viêm phổi do 23 chủng vi khuẩn khác nhau gây ra, là một ví dụ của vaccine polysaccharide.
Conjugates - Vaccine chỉ làm từ polysaccharides không hoạt động tốt ở trẻ em nhỏ vì hệ miễn dịch của chúng chưa phát triển đầy đủ. Để tạo vaccine bảo vệ trẻ em nhỏ chống lại bệnh gây ra bởi một số vi khuẩn, polysaccharides được kết hợp với một protein để hệ miễn dịch có thể nhận diện và phản ứng với polysaccharides. Protein này hoạt động như một "vận chuyển viên" cho phần của vaccine giúp kích thích hệ miễn dịch tạo ra các kháng thể bảo vệ trong cơ thể. Ví dụ về vaccine conjugate bao gồm vaccine phòng bệnh xâm nhập do vi khuẩn Haemophilus influenzae type b (Hib) gây ra.
Messenger RNA (mRNA) - mRNA là một thành phần tự nhiên trong cơ thể và mang thông tin di truyền cần thiết để tạo protein. Tương tự, mRNA trong vaccine mRNA cũng cung cấp chỉ dẫn cho các tế bào trong cơ thể để tạo protein. Ví dụ, một số vaccine phòng ngừa COVID-19 chứa một đoạn mRNA tổng hợp chỉ dẫn các tế bào trong cơ thể tạo ra protein "spike" đặc trưng của virus SARS-CoV-2. Khi được tiêm vaccine, cơ thể tạo ra các bản sao của protein spike, không gây bệnh, và hệ miễn dịch học cách phản ứng phòng vệ, tạo ra phản ứng miễn dịch chống lại SARS-CoV-2 khi cơ thể gặp phải. Ví dụ về vaccine mRNA bao gồm các vaccine phòng COVID-19: Comirnaty, Moderna COVID-19 Vaccine, Pfizer-BioNTech COVID-19 Vaccine và Spikevax.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2FAA0E24-DA2E-400B-AB4D-EE40C4C633D1', N'Những điều cần biết sau khi tiêm chủng', N'<p><img src="https://vnvc.vn/wp-content/uploads/2024/11/nhung-dieu-can-biet-sau-khi-tiem-chung.jpg"></p><h3>Mục lục</h3><ol><li><a href="#theo-doi-sau-tiem-chung" rel="noopener noreferrer" target="_blank">Theo dõi sau tiêm chủng</a></li><li><a href="#nhung-phan-ung-thuong-gap-khi-tiem-vac-xin" rel="noopener noreferrer" target="_blank">Những phản ứng thường gặp khi tiêm vắc xin</a></li></ol><h3><strong>Theo dõi sau tiêm chủng</strong></h3><p><strong>1. Trẻ em và người lớn đều cần được theo dõi</strong> tối thiểu 30 phút tại cơ sở tiêm chủng. Nếu phát hiện các biểu hiện bất thường, nôn trớ, thở nhanh hay ngắt quãng, thở khò khè, da mẩn đỏ,… cần báo ngay cho nhân viên y tế gần nhất.</p><p>Trẻ em cần tiếp tục được theo dõi trong 24 – 48 giờ sau khi tiêm bao gồm:</p><ul><li>Thân nhiệt, nhịp thở</li><li>Sự tỉnh táo (chơi đùa), ăn, ngủ</li><li>Quan sát da toàn thân và vùng tiêm (sưng, mẩm đỏ, phát ban)</li></ul><p><strong>2. Chăm sóc trẻ sau tiêm chủng</strong></p><ul><li>Cho trẻ mặc quần áo thoáng mát</li><li>Duy trì chế độ dinh dưỡng hàng ngày, cho trẻ bú mẹ và uống nước nhiều hơn</li><li>Có thể dùng thuốc hạ sốt thông thường (paracetamol, ibuprofen) với liều phù hợp cân nặng khi trẻ sốt &gt; 38.5oC, quấy khóc.</li><li>Nếu tại vết tiêm sưng, đỏ, có thể chườm lạnh để giúp giảm đau và giảm sưng cho trẻ</li><li>Khi bế trẻ tránh chạm vào vết tiêm, không xoa dầu, chườm nóng, nặn chanh, đắp khoai tây hay bôi đắp bất cứ thứ gì lên vết tiêm vì có thể gây nhiễm trùng vết tiêm</li><li>Không dùng aspirin, không dùng thêm các thuốc ho và hạ sốt khác vì các chế phẩm này có thể làm tăng liều paracetamol ở trẻ</li></ul><h3><strong>Những phản ứng thường gặp khi tiêm vắc xin</strong></h3><p>&nbsp;<strong>STT</strong>&nbsp;<strong>Loại bệnh</strong> <strong>&nbsp;Tên vắc xin phòng bệnh</strong> <strong>&nbsp;Đối tượng – Lịch tiêm – Liều – Đường dùng</strong>&nbsp;<strong>Các phản ứng sau tiêm chủng thường gặp</strong>&nbsp;1&nbsp;Lao&nbsp;BCG&nbsp;<strong>Cho trẻ sơ sinh</strong></p><p>• Lịch tiêm 1 mũi duy nhất. Tiêm càng sớm càng tốt trong tháng đầu tiên sau sinh khi trẻ có cân nặng trên 2000 gram.</p><p>• Liều dùng: 0.1 ml</p><p>• Đường dùng: tiêm trong da, mặt ngoài phía trên cánh tay hoặc vai trái • Tại chỗ tiêm: đau, sưng, nóng</p><p>• Toàn thân: Trẻ sốt nhẹ, quấy khóc, bú kém, thường hết sau một vài ngày</p><p>• Thông thường sau khi tiêm BCG, xuất hiện một nốt nhỏ tại chỗ tiêm và biến mất sau 30 phút. Khoảng 2 tuần xuất hiện một vết loét đỏ có kích thước nhỏ, sau 2 tuần vết loét tự lành và để lại sẹo khoảng 5mm.</p><p>• Nếu trong thời gian đó xuất hiện hạch cổ, hạch nách, hạch dưới xương đòn trái, nốt mủ</p><p>quá to tại chỗ tiêm (đường kính trên 1cm) cần đến cơ sở y tế khám lại ngay.&nbsp;2&nbsp;Viêm gan B</p><p>Có thể là 1 trong 3 tên sau: Engerix B</p><p>Euvax B</p><p>Hepavax</p><p>&nbsp;<strong>Cho trẻ từ sơ sinh và người lớn</strong></p><p>• Lịch tiêm thông thường 3 mũi</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: 1 tháng sau mũi một</p><p>– Mũi 3: 5 tháng sau mũi hai</p><p>• Lịch tiêm đặc biệt 4 mũi</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: 1 tháng sau mũi một</p><p>– Mũi 3: 1 tháng sau mũi hai</p><p>– Mũi 4: 10 tháng sau mũi ba</p><p>Lịch tiêm này dùng khi phối hợp với các vắc xin khác, trẻ có mẹ nhiễm viêm gan B, người mới tiếp xúc với nguồn bệnh, người di trú hoặc không thể tuân thủ phác đồ thông thường.</p><p>• Liều dùng:</p><p><strong>Engerix B</strong></p><p>–&nbsp;Trẻ em 0 – dưới 20 tuổi:0.5 ml (tương đương 10mcg)</p><p>– Người từ trên 20 tuổi: 1 ml (tương đương 20mcg)</p><p><strong>Euvax</strong></p><p>– Trẻ em 0 – 15 tuổi: 0.5 ml (tương đương 10mcg)</p><p>– Người từ 16 tuổi: 1 ml (tương đương 20mcg)</p><p><strong>Hepavax</strong></p><p>– Trẻ em 0 – 10 tuổi: 0.5 ml (tương đương 10mcg)</p><p>– Người &gt;10 tuổi: 1 ml (tương đương 20mcg)</p><p>• Đường dùng: tiêm bắp</p><p>&nbsp;• Tại chỗ tiêm: đau, sưng nhẹ</p><p>• Toàn thân: sốt nhẹ, trẻ quấy khóc.</p><p>• Các triệu chứng thường hết sau vài giờ đến 1 – 2 ngày.&nbsp;3 Bạch hầu,</p><p>Ho gà,</p><p>Uốn ván</p><p>Bại liệt</p><p>Hib,</p><p>Viêm gan B Infanrix Hexa</p><p>Hexaxim</p><p>(6 trong 1) <strong>Cho trẻ từ 2 tháng tuổi trở lên</strong></p><p>• Lịch tiêm 4 mũi</p><p>– Mũi 1,2,3: khi trẻ 2,3,4 tháng tuổi hoặc 2,4,6 tháng tuổi.</p><p>– Mũi 4: khi trẻ 16 – 18 tháng tuổi</p><p>• Liều dùng: 0.5 ml</p><p>• Đường dùng: tiêm bắp&nbsp;• Tại chỗ tiêm: sưng đỏ, đau từ 1 – 3 ngày. Có thể nổi cục cứng sau khoảng 1-3 tuần sẽ tự khỏi</p><p>• Toàn thân: Trẻ có thể sốt, quấy khóc, nôn, tiêu chảy, bú kém.&nbsp;4 Bạch hầu</p><p>Ho gà</p><p>Uốn ván</p><p>Bại liệt</p><p>Hib Pentaxim</p><p>(5 trong 1)</p><p>Infanrix-IPV + Hib <strong>Cho trẻ từ 2 tháng tuổi trở lên đến 24 tháng</strong></p><p>• Lịch tiêm 4 mũi</p><p>– Mũi 1,2,3: khi trẻ 2,3,4 tháng tuổi hoặc 2,4,6 tháng tuổi.</p><p>– Mũi 4: khi trẻ 16-18 tháng tuổi</p><p>• Liều dùng: 0.5 ml</p><p>• Đường dùng: tiêm bắp</p><p>Infanrix-IPV+ Hib có thể tiêm cho trẻ đến trước sinh nhật 5 tuổi.</p><p>&nbsp;• Tại chỗ tiêm: nốt quầng đỏ, nốt cứng lớn hơn 2 cm. Các triệu chứng trên thường gặp trong 48 giờ sau khi tiêm và có thể kéo dài 48 – 72 giờ.</p><p>• Toàn thân: trẻ có thể sốt, quấy khóc, tiêu chảy, nôn, chán ăn, buồn ngủ, phát ban</p><p>• Các mũi tiêm sau, trẻ thường có phản ứng sau tiêm mạnh hơn so với những lần tiêm trước do đã có miễn dịch trước đó như sốt</p><p>nhiều hơn, tại chỗ tiêm có thể đỏ, sưng nhiều hơn hoặc lan ra toàn bộ tay chân bên tiêm, thường tự khỏi trong vòng 3-5 ngày&nbsp;5 Bạch hầu</p><p>Ho gà</p><p>Uốn ván</p><p>Bại liệt&nbsp;Tetraxim</p><p>(4 trong 1) <strong>Cho trẻ từ 2 tháng tuổi trở lên đến dưới 7 tuổi</strong></p><p>• Lịch tiêm 5 mũi</p><p>– Mũi 1,2,3: khi trẻ 2,3,4 tháng tuổi hoặc 2,4,6 tháng tuổi.</p><p>– Mũi 4: khi trẻ 16 – 18 tháng tuổi</p><p>– Mũi 5: từ 4 – 6 tuổi</p><p>Nếu trẻ từ 7 đến 13 tuổi mà chưa tiêm đủ 4 liều cơ bản bạch hầu – ho gà – uốn ván (Chọn vắc xin phù hợp với độ tuổi)</p><p>• Lịch tiêm 3 liều:</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: 1 tháng sau mũi 1</p><p>– Mũi 3: 6 tháng sau mũi 2</p><p>• Liều dùng: 0.5 ml</p><p>• Đường dùng: tiêm bắp • Tại chỗ tiêm: đỏ, sưng (có thể hơn 5cm) hoặc lan ra toàn bộ chi bên tiêm. Xảy ra trong vòng 24 – 72 giờ sau khi tiêm vắc xin và tự khỏi trong vòng 3-5 ngày</p><p>• Toàn thân: sốt, tiêu chảy, kém ăn, quấy khóc&nbsp;6&nbsp;Bạch hầu</p><p>Ho gà</p><p>Uốn ván Có thể là 1 trong 2 tên sau</p><p>Adacel</p><p>Boostrix</p><p><strong>Cho trẻ từ 4 tuổi trở lên và người lớn đã tiêm lịch cơ bản bạch hầu – ho gà – uốn ván</strong></p><p>• Lịch tiêm 1 mũi</p><p>– Tiêm nhắc 1 mũi mỗi 10 năm</p><p><strong>Cho trẻ từ 4 tuổi trở lên và người lớn chưa tiêm đủ lịch cơ bản bạch hầu – ho gà – uốn ván</strong></p><p>• Lịch tiêm 3 mũi:</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: 1 tháng sau mũi 1</p><p>– Mũi 3: 6 tháng sau mũi 2</p><p>• Liều dùng: 0.5 ml</p><p>• Đường dùng: tiêm bắp</p><p><strong>Adacel không tiêm cho người trên 64 tuổi</strong></p><p><strong>Boostrix: Xem xét tiêm cho phụ nữ đang mang thai 3 tháng giữa hoặc 3 tháng cuối thai kỳ</strong></p><p>•Tại chỗ tiêm: đau, sưng, đỏ</p><p>•Toàn thân: sốt, mệt mỏi, đau đầu, rối loạn tiêu hóa</p><p>7 Bạch hầu</p><p>Uốn ván</p><p>Td <strong>Cho trẻ từ 7 tuổi trở lên và người lớn đã tiêm lịch cơ bản bạch hầu – uốn ván</strong></p><p><strong> </strong>– Lịch tiêm 1 mũi</p><p>– Tiêm nhắc 1 mũi mỗi 10 năm</p><p><strong> Cho trẻ từ 7 tuổi trở lên và người lớn chưa tiêm đủ lịch cơ bản bạch hầu – ho gà – uốn ván:</strong></p><p><strong> </strong>Lịch tiêm 2 mũi:</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: 1 tháng sau mũi 1</p><p>– Sau 6 tháng nhắc lại 1 lần</p><p><strong> Tiêm nhắc 1 mũi mỗi 10 năm</strong></p><p><strong> Liều dùng: 0.5ml</strong></p><p><strong> Đường dùng: tiêm bắp sâu</strong></p><p><strong> </strong> • Tại chỗ tiêm: đau, quần đỏ, sưng nhẹ</p><p>• Sốt nhẹ 38-39oC, đau cơ cánh tay, đau đầu</p><p>• Các triệu chứng nhẹ và thường tự khỏi sau vài ngày.&nbsp;8 Viêm màng não, viêm phổi và các bệnh khác do Haemophilus influenzae type b (Hib) QuimiHib <strong>Trẻ từ 2 tháng tuổi đến dưới 12 tháng tuổi</strong></p><p><strong> </strong>– Mũi 1: Lúc 2 tháng tuổi</p><p>– Mũi 2: hai tháng sau mũi 1</p><p>– Mũi 3: hai tháng sau mũi 2</p><p><strong> Một mũi tiêm nhắc khi trẻ 16-18 tháng tuổi, cách mũi ba tối thiểu 6 tháng</strong></p><p><strong> </strong>– Khi trẻ từ 12 tháng tuổi: tiêm một mũi duy nhất</p><p>– Không tiêm vắc xin này khi trẻ trên 15 tuổi</p><p><strong> Liều dùng: 0.5 ml</strong></p><p><strong> Đường dùng: Tiêm bắp</strong> • Tại chỗ tiêm: Sưng, đau đỏ và có thể ngứa tại vị trí tiêm</p><p>• Toàn thân: Sốt nhẹ, quấy khóc, biếng ăn, buồn nôn, nôn, tiêu chảy</p><p>• Các triệu chứng thường nhẹ và thường tự khỏi từ 1 – 3 ngày.&nbsp;9 Bệnh tiêu chảy do Rota virus</p><p>Có thể là 1 trong 3 tên sau:</p><p>Rotarix</p><p>Rotateq</p><p>Rotavin</p><p><strong>Rotarix: cho trẻ từ 6 tuần tuổi đến trước 24 tuần tuổi</strong></p><p>– Lịch uống 2 liều liên tiếp cách nhau tối thiểu 4 tuần</p><p>– Liều dùng: 1.5ml</p><p><strong>Rotateq cho trẻ từ 7.5 tuần đến trước 32 tuần tuổi</strong></p><p>– Liều đầu tiên khi trẻ 7.5 – 12 tuần tuổi</p><p>– Lịch uống 3 liều liên tiếp cách nhau tối thiểu 4 tuần</p><p>– Liều dùng: 2 ml</p><p><strong>Rotavin: Cho trẻ từ 6 tuần tuổi đến trước 6 tháng tuổi</strong></p><p>– Lịch uống 2 liều liên tiếp cách nhau tối thiểu 4 tuần.</p><p>– Liều dùng: 2 ml</p><p>• Toàn thân: rối loạn tiêu hóa và thường tự khỏi sau vài ngày.</p><p>• Nếu đi ngoài phân nước nhiều lần, nôn nhiều, có dấu hiệu mất nước nên khám lại ngay tại cơ sở y tế.&nbsp;10 Bệnh do phế cầu (viêm màng não, viêm phổi, nhiễm khuẩn huyết,viêm tai giữa) Có thể là 1 trong 2 tên sau:</p><p>Synflorix</p><p>Prevenar-13</p><p><strong>Synflorix: Cho trẻ từ 2 tháng tuổi – 5 tuổi (Có thể tiêm sớm lúc 6 tuần tuổi)</strong></p><p>• Lịch tiêm 4 mũi cho trẻ từ 2 – 6 tháng tuổi</p><p>– 3 mũi cơ bản cách nhau tối thiểu 1 tháng.</p><p>– Mũi 4: 6 tháng sau mũi 3 (Nếu trên 1 tuổi, mũi 4 có thể cách mũi 3 là hai tháng)</p><p>• Lịch tiêm 3 mũi cho trẻ từ 7 – 11 tháng tuổi</p><p>– 2 mũi cơ bản cách nhau ít nhất 1 tháng.</p><p>– Mũi 3: sáu tháng sau mũi 2 (Nếu trên một tuổi, mũi 3 có thể cách mũi 2 là 2 tháng)</p><p>• Lịch tiêm 2 mũi cho trẻ từ 1 đến 5 tuổi</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: cách mũi 1 ít nhất hai tháng.</p><p>• Liều dùng: 0.5ml</p><p>• Đường dùng: tiêm bắp</p><p>Không tiêm vắc xin này khi trẻ trên 5 tuổi</p><p><strong>Prevenar 13: Cho trẻ từ 6 tuần tuổi trở lên và người lớn</strong></p><p>• Trẻ từ 6 tuần đến 6 tháng tuổi:</p><p>– 3 mũi cơ bản cách nhau tối thiểu 1 tháng</p><p>– Mũi 4 cách mũi 3 tám tháng. Hoặc nếu trẻ 11 – 15 tháng, thì mũi 4 cách mũi 3 tối thiểu 2 tháng</p><p>• Trẻ từ 7 tháng tuổi đến 11 tháng tuổi</p><p>– 2 mũi cơ bản cách nhau tối thiểu 1 tháng</p><p>– Mũi 3 khi trẻ trên 12 tháng tuổi. Mũi 3 cách mũi 2 tối thiểu 2 tháng</p><p>• Trẻ từ 12 tháng tuổi đến 23 tháng tuổi: 2 mũi tiêm cách nhau tối thiểu 2 tháng</p><p>• Trẻ em từ 2 tuổi trở lên và người lớn: tiêm 1 mũi duy nhất.</p><p>• Liều dùng: 0.5ml</p><p>• Đường dùng: tiêm bắp</p><p><strong>Synflorix</strong></p><p>• Tại chỗ tiêm: sưng, đau, đỏ</p><p>• Toàn thân: trẻ có thể sốt trên 38°C, ăn uống kém, bị kích thích, quấy khóc</p><p><strong>Prevenar 13</strong></p><p>• Tại chỗ tiêm: ban đỏ, chay cứng, sưng đau, tăng nhạy cảm tại chỗ tiêm.</p><p>• Toàn thân: sốt, đau đầu, buồn ngủ, giảm cảm giác thèm ăn, nôn mửa, tiêu chảy.</p><p>&nbsp;11 Bệnh cúm Có thể là 1 trong 4 tên sau:</p><p>Vaxigrip Tetra</p><p>Influvac Tetra</p><p>GC Flu</p><p>Quadrivalent</p><p>Ivacflu-S</p><p><strong>Vaxigrip Tetra: cho trẻ từ 6 tháng tuổi và người lớn</strong></p><p>Trẻ từ 6 tháng đến dưới 9 tuổi chưa từng tiêm ngừa cúm: 2 mũi cách nhau ít nhất 1 tháng và tiêm nhắc 01 mũi hàng năm.</p><p>– Trẻ từ 6 tháng tuổi đến dưới 9 tuổi đã được tiêm ngừa cúm, trẻ từ 9 tuổi và người lớn: Tiêm 01 mũi và tiêm nhắc 01 mũi hàng năm.</p><p>– Liều dùng: 0.5 ml</p><p><strong>Influvac Tetra: cho trẻ từ 6 tháng tuổi trở lên và người lớn</strong></p><p>– Trẻ từ 6 tháng tuổi đến dưới 9 tuổi chưa từng tiêm ngừa cúm: mũi 1 lần tiêm đầu tiên, mũi 2 cách mũi 1 ít nhất 4 tuần và tiêm nhắc 01 mũi hàng năm</p><p>– Từ 9 tuổi trở lên: lịch tiêm mũi 1 duy nhất và nhắc lại hằng năm.</p><p>Liều dùng: 0.5ml</p><p><strong>GC Flu Quadrivalent: cho trẻ từ 6 tháng tuổi và người lớn</strong></p><p>– Trẻ từ 6 tháng tuổi đến dưới 9 tuổi chưa từng tiêm ngừa cúm: 2 mũi cách nhau ít nhất 1 tháng và tiêm nhắc 01 mũi hàng năm</p><p>– Trẻ từ 6 tháng tuổi đến dưới 9 tuổi đã được tiêm ngừa cúm, trẻ từ 9 tuổi và người lớn: Tiêm 01 mũi và tiêm nhắc 01 mũi hàng năm</p><p>– Liều dùng: 0.5 ml</p><p>Ivacflu-S: Cho người từ 18 đến 60 tuổi:</p><p>– Lịch tiêm 1 mũi và tiêm nhắc 01 mũi hàng năm</p><p>– Liều dùng: 0.5 ml</p><p>– Đường dùng: Tiêm bắp</p><p>•Tại chỗ tiêm: đau, đỏ, sưng</p><ul><li>•Toàn thân: đau đầu, sốt, mệt mỏi&nbsp;12 Bệnh sởi Mvvac Liều thứ 1: tiêm cho trẻ từ 9 tháng tuổi trở lên;</li><li>Liều thứ 2 (vắc xin phối hợp Sởi – Quai bị – Rubella): được tiêm cho trẻ từ 12 tháng tuổi (cách mũi sởi đơn ít nhất 1 tháng);</li><li>Liều thứ 3: 3 năm sau hoặc lúc trẻ 4-6 tuổi.</li></ul><p>• Tại chỗ tiêm: đau, sưng, đỏ</p><p>• Toàn thân: sốt, ban, ho, sổ mũi.</p><p>&nbsp;13 Bệnh sởi</p><p>Quai bị</p><p>Rubella</p><p>Có thể là 1 trong 3 tên sau:</p><p>MMR II</p><p>Measles Mumps</p><p>Rubella</p><p><strong>Cho trẻ từ 12 tháng tuổi và người lớn</strong></p><p>• Lịch tiêm 2 mũi cho trẻ từ 12 tháng tuổi trở lên đến dưới 7 tuổi</p><p>Nếu trẻ đã được tiêm mũi sởi trước đó</p><p>– Mũi 1: lần tiêm đầu tiên và phải cách mũi sởi đơn trước đó ít nhất 1 tháng</p><p>– Mũi 2: khi trẻ 4 – 6 tuổi, cách mũi 1 ít nhất một tháng</p><p>Nếu trẻ chưa được tiêm mũi sởi trước đó thì tiêm 2 mũi cách nhau 3 tháng</p><p>• Lịch tiêm 2 mũi cho trẻ từ 7 tuổi và người lớn</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: cách mũi 1 ít nhất 1 tháng</p><p><strong>Phụ nữ nên hoàn tất lịch tiêm trước khi có thai ít nhất 3 tháng</strong></p><p>• Liều dùng: 0.5ml</p><p>• Đường dùng: tiêm dưới da, nên tiêm mặt ngoài phía trên cánh tay.</p><p>Vắc xin Measles, mumps, Rubella (Ấn Độ) chỉ định tiêm cho trẻ 12 tháng tuổi đến 10 tuổi</p><p>• Tại chỗ tiêm: đau tại nơi tiêm trong một thời gian ngắn</p><p>• Toàn thân: sốt, mề đay, phát ban nhẹ, buồn nôn, nôn, tiêu chảy&nbsp;14 Thủy đậu Có thể là 1 trong 3 tên sau:</p><p>Varivax</p><p>Varilrix</p><p>Varicella <strong>Đối với Varivax, Varicella:</strong></p><p><strong> Cho trẻ từ 12 tháng tuổi và người lớn chưa từng mắc bệnh</strong></p><p>• Lịch tiêm cho trẻ từ 12 tháng tuổi đến 12 tuổi:</p><p>– Mũi 1: lần đầu tiên tiêm</p><p>– Khuyến cáo mũi 2: cách mũi 2 ít nhất 3 tháng</p><p>• Lịch tiêm cho trẻ từ 13 tuổi và người lớn</p><p>– Mũi 1: Lần đầu tiên tiêm</p><p>– Mũi 2: Cách mũi 1 ít nhất 1 tháng</p><p>• Liều dùng 0.5 ml</p><p>• Đường dùng: tiêm dưới da, nên tiêm mặt ngoài phía trên cánh tay.</p><p><strong>Đối với Varilrix: cho trẻ từ 9 tháng tuổi và người lớn chưa từng mắc bệnh</strong></p><p>Trẻ từ 9 tháng đến 12 tuổi: 2 mũi</p><p>– Mũi 1: Lần đầu tiên tiêm.</p><p>– Mũi 2: Cách mũi 1 ít nhất 3 tháng.</p><p>Trẻ từ 13 tuổi trở lên và người lớn: 2 mũi</p><p>– Tiêm 2 mũi cách nhau ít nhất 1 tháng (Không tiêm trước 4 tuần)</p><p>• Liều dùng 0.5 ml</p><p>• Đường dùng: tiêm dưới da ở vùng cơ delta hoặc vùng má ngoài đùi.</p><p><strong>Phụ nữ nên hoàn tất lịch tiêm vắc xin thủy đậu trước khi có thai tốt nhất 3 tháng</strong></p><p>• Đường dùng: tiêm dưới da, nên tiêm mặt ngoài phía trên cánh tay.</p><p>• Tại chỗ tiêm: phát ban dạng thủy đậu, đau, đỏ, sưng</p><p>• Toàn thân: sốt</p><p><strong>Thận trọng: </strong>tránh dùng chế phẩm chứa salicylate (thuốc aspirin hoặc các chế phẩm bôi, dán giảm đau) trong ít nhất 6 tuần sau tiêm.&nbsp;15 Viêm não Nhật Bản B</p><p>Có thể là 1 trong 2 tên sau</p><p>Jevax</p><p>Imojev <strong>JEVAX: Cho trẻ từ 12 tháng tuổi và người lớn</strong></p><p>• Lịch tiêm 3 mũi</p><p>– Mũi 1: lần tiêm đầu tiên.</p><p>– Mũi 2: 1-2 tuần sau mũi 1.</p><p>– Mũi 3: 1 năm sau mũi 2.</p><p>• Tiêm nhắc 1 mũi mỗi 3 năm</p><p>• Liều dùng:</p><p>– Trẻ từ 12 tháng tuổi đến ≤ 36 tháng tuổi: 0.5ml</p><p>– Trẻ &gt; 36 tháng tuổi và người lớn: 1ml</p><p>• Đường dùng: tiêm dưới da, nên tiêm mặt ngoài phía trên cánh tay.</p><p><strong>IMOJEV: cho trẻ từ 9 tháng tuổi và người lớn</strong></p><p>– Lịch tiêm 2 mũi cho trẻ từ 9 tháng tuổi đến 18 tuổi: tiêm 2 mũi cách nhau ít nhất 1 năm.</p><p>– Lịch tiêm cho người trên 18 tuổi: Tiêm 1 liều duy nhất.</p><p>• Liều dùng: 0.5ml</p><p>• Đường dùng: tiêm dưới da.</p><p><strong>JEVAX</strong></p><p>• Tại chỗ tiêm: đau sưng, đỏ</p><p>• Toàn thân: mệt mỏi, đau đầu, sốt</p><p><strong>Imojev</strong></p><p>• Tại chỗ tiêm: đau, đỏ, sưng tại vị trí tiêm là triệu chứng thường gặp</p><p>• Toàn thân: sốt, đau đầu, đau cơ, mệt mỏi, cáu kỉnh, mất cảm giác thèm ăn, nôn.</p><p>&nbsp;16 Viêm gan A Có thể 1 trong 2 tên sau:</p><p>Avaxim</p><p>Havax Cho trẻ từ 12 tháng tuổi và người lớn</p><p>• Lịch tiêm 2 mũi cách nhau ít nhất 6 – 12 tháng</p><p>• Liều dùng:</p><p><strong>Avaxim</strong></p><p>–&nbsp;Trẻ em từ 12 tháng tuổi đến dưới 16 tuổi: Avaxim 80UI 0.5ml</p><p>– Người từ 16 tuổi trở lên: Avaxim 160UI 0.5ml</p><p><strong>Havax</strong></p><p>– Trẻ em từ 24 tháng tuổi –</p><p>dưới 18 tuổi: Havax 0,5ml</p><p>– Người lớn từ 18 tuổi trở lên: Havax 1 ml</p><p>• Đường dùng: tiêm bắp • Tại chỗ tiêm: có thể sưng quầng đỏ từ 1-2 ngày&nbsp;17 Viêm gan A+B Twinrix <strong>Cho trẻ từ 12 tháng tuổi trở lên và người lớn</strong></p><p>• Lịch tiêm 2 mũi cho trẻ từ 12 tháng – 15 tuổi</p><p>– Mũi 1: lần tiêm đầu tiêm</p><p>– Mũi 2: 6 tháng sau mũi 1</p><p>• Lịch tiêm 3 mũi cho người từ 16 tuổi trở lên:</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: một tháng sau mũi 1</p><p>– Mũi 3: sáu tháng sau mũi 1</p><p>• Liều dùng: 1 ml</p><p>• Đường dùng: tiêm bắp • Tại chỗ tiêm: đau, sưng, đỏ</p><p>• Toàn thân: đau đầu, khó chịu&nbsp;18 Viêm màng não do não mô cầu A,C,Y,W135</p><p>Menactra <strong>Cho trẻ từ 9 tháng tuổi trở lên và người lớn đến 55 tuổi</strong></p><p>• Lịch tiêm:</p><p>– Trẻ từ 9 tháng đến dưới 24 tháng tuổi: tiêm 2 liều cách nhau ít nhất 3 tháng.</p><p>– Trẻ em từ 2 tuổi và người lớn đến 55 tuổi: Tiêm 1 liều.</p><p>– Có thể tiêm 1 liều nhắc lại cho trẻ từ 15 tuổi đến 55 tuổi nếu tiếp tục có nguy cơ mắc bệnh. Mũi tiêm nhắc cách mũi tiêm trước ít nhất 4 năm.</p><p>• Liều dùng: 0.5 ml</p><p>• Đường dùng: tiêm bắp</p><p>• Tại chỗ tiêm: đau-sưng-đỏ tại vị trí tiêm</p><p>• Toàn thân: ngủ gà, cáu kỉnh, nhức đầu, mệt mỏi, tiêu chảy, chán ăn.</p><p>Các triệu chứng thường nhẹ và thoáng qua</p><p>&nbsp;19 Viêm màng não do não mô cầu B+C VA-Mengoc-BC <strong>Cho trẻ từ 6 tháng tuổi trở lên và người lớn đến 45 tuổi</strong></p><p>• Lịch tiêm: 2 mũi cách nhau 2 tháng</p><p>• Liều dùng: 0.5 ml</p><p>• Đường dùng: tiêm bắp sâu •Tại chỗ tiêm: sưng đau, có thể tạo cục cứng, sau khoảng 72 giờ sẽ tự khỏi</p><p>•Toàn thân: sốt nhẹ&nbsp;20 Ung thư cổ tử cung, u nhú do HPV Gardasil <strong>Cho trẻ gái từ 9 tuổi đến 26 tuổi</strong></p><p>• Lịch tiêm 3 mũi</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: 1-2 tháng sau mũi 1</p><p>– Mũi 3: 4 tháng sau mũi 2</p><p>Khi cần điều chỉnh lịch tiêm thì mũi 2 phải cách mũi 1 ít nhất 1 tháng và mũi 3 phải cách mũi 2 ít nhất 3 tháng.</p><p>• Liều dùng: 0.5ml</p><p>• Đường dùng: tiêm bắp • Tại chỗ tiêm: có thể ban đỏ, sưng, đau, ngứa&nbsp;21 Uốn ván VAT <strong>Cho trẻ em và người lớn</strong></p><p>• Lịch tiêm cơ bản 3 mũi</p><p>– Mũi 1: lần tiêm đầu tiên</p><p>– Mũi 2: 1 tháng sau mũi một</p><p>– Mũi 3: 6 – 12 tháng sau mũi một</p><p><strong>Tiêm nhắc mỗi 5 – 10 năm</strong></p><p>• Lịch tiêm 5 mũi ở phụ nữ tuổi sinh đẻ</p><p>(từ 15 – 44 tuổi)</p><p>– Ba mũi cơ bản</p><p>– Mũi 4: một năm sau mũi 3</p><p>– Mũi 5: một năm sau mũi 4</p><p>• Lịch tiêm ở phụ nữ mang thai chưa</p><p>từng tiêm vắc xin:</p><p>– Mũi 1: tiêm sớm khi phát hiện có thai, thường tiêm vào 3 tháng giữa thai kỳ</p><p>– Mũi 2: cách mũi 1 ít nhất một tháng,</p><p>yêu cầu trước ngày dự sinh ít nhất một</p><p>tháng</p><p>• Lịch tiêm ở phụ nữ mang thai đã từng</p><p>tiêm vắc xin:</p><p>– Tiêm một mũi (nếu mũi cuối &lt; 5 năm)</p><p>– Tiêm hai mũi (nếu mũi cuối &gt; 5 năm)</p><p>• Liều dùng: 0.5 mL</p><p>• Đường dùng: tiêm bắp sâu</p><p><strong>Lưu ý khi đã phơi nhiễm bệnh uốn ván: tiêm huyết thanh kháng uốn ván và tiếp tục tiêm chủng đủ phác đồ.</strong></p><p><strong> </strong> • Tại chỗ tiêm: đau, quầng đỏ, nốt cứng hay sưng xuất hiện trong vòng 48 giờ sau khi tiêm và kéo dài</p><p>trong 1-2 ngày</p><p>• Toàn thân: sốt, khó chịu</p><p>thoáng qua.&nbsp;22 Thương hàn Typhim VI <strong>Cho trẻ từ 2 tuổi trở lên và người lớn</strong></p><p>• Lịch tiêm 1 mũi</p><p>• Liều dùng: 0.5ml</p><p>• Đường dùng: tiêm bắp hoặc dưới da</p><p><strong>Tiêm nhắc: mỗi 3 năm nếu có nguy cơ nhiễm bệnh</strong></p><p>• Tại chỗ tiêm: đau, sưng, quầng đỏ&nbsp;23&nbsp;Tả mORCVAX</p><p><strong>Cho trẻ từ 2 tuổi và người lớn</strong></p><p>• Lịch cơ bản: 2 liều uống cách nhau 14 ngày</p><p>• Lịch nhắc lại: trước mùa dịch tả, 2 liều uống cách nhau 14 ngày</p><p>• Liều dùng: 1.5ml</p><p>• Thường gặp: sau khi uống vắc xin, có cảm giác buồn nôn, nôn.</p><p>• Hiếm gặp: đau đầu, đau bụng, tiêu chảy, sốt</p><p>• Các triệu chứng không tự khỏi không cần điều trị.</p><p>&nbsp;24&nbsp;Bệnh dại</p><p>&nbsp;Verorab <strong>Cho trẻ em trên 2 tháng tuổi và người lớn</strong></p><p>• Lịch tiêm dự phòng 5 mũi</p><p>– Vào các ngày 0-7-28 và 1 năm sau</p><p>– Tiêm nhắc 1 mũi mỗi 5 năm</p><p>• Lịch tiêm khi xác định có phơi nhiễm</p><p>– Người chưa tiêm dự phòng: 5 mũi vào các ngày 0-3-7-14-28</p><p>– Người đã tiêm dự phòng: 2 mũi vào các ngày 0-3</p><p>• Liều dùng: 0.5 ml</p><p>• Đường dùng: tiêm bắp • Tại chỗ tiêm: đau, quầng đỏ, sưng, ngứa và nốt cứng</p><p>• Toàn thân: sốt, đau đầu,</p><p>chóng mặt, mệt mỏi.</p><p><strong>Lưu ý:</strong> Khi có phơi nhiễm</p><p>(bị súc vật liếm, cào, cắn, …) phải sơ cứu và rửa sạch vết thương với thật nhiều nước và xà phòng. Sau đó rửa lại thật kỹ bằng nước sạch. Tiếp tục rửa vết thương bằng cồn IOD. Đưa bệnh nhân tới trung tâm tiêm chủng. Tùy vào mức độ của tiếp xúc mà cán bộ tiêm ngừa có thể chỉ định tiêm thêm globulin miễn dịch.</p><p><strong>Nên tiêm thêm vắc xin uốn ván ở tất cả các trường hợp có phơi nhiễm.</strong></p><p><strong> </strong></p><p><strong>Ghi chú:</strong></p><ul><li>Lịch tiêm có thể thay đổi tùy theo loại vắc xin, sự tuân thủ phác đồ tiêm chủng và cập nhật hướng dẫn của cơ quan y tế.</li><li>Một số tác dụng phụ hiếm gặp có thể không được liệt kê ở đây.</li></ul>', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-28T00:13:18.8202208+07:00' AS DateTimeOffset), CAST(N'2025-03-28T22:11:45.3124433+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'444a5dd5-48c1-430e-a777-175aef24a881', N'Những điều cần biết về miễn trừ vaccine và thay đổi lịch tiêm chủng', N'Mỗi bang đều có các luật yêu cầu trẻ em phải tiêm một số vaccine nhất định trước khi đi học hoặc vào nhà trẻ. Tuy nhiên, cha mẹ có thể có quyền từ chối một hoặc nhiều vaccine vì lý do y tế, tôn giáo hoặc cá nhân.

Các luật miễn trừ vaccine thay đổi từ bang này sang bang khác. Một số bang dễ dàng hơn trong việc cấp miễn trừ vaccine so với những bang khác.

Thống kê cho thấy các bang nơi miễn trừ vaccine dễ dàng có tỷ lệ trẻ em chưa được tiêm chủng cao hơn các bang có quy trình khó khăn hơn. Trẻ em không được tiêm vaccine có nguy cơ mắc bệnh cao hơn. Tỷ lệ miễn trừ cao đã liên quan đến sự bùng phát của các bệnh như sởi, quai bị và ho gà (whooping cough).

Các đợt bùng phát sởi vào năm 2019 là một trong những đợt tồi tệ nhất trong nhiều thập kỷ, với CDC báo cáo 1.274 ca. Vào năm 2020, số ca mắc sởi ở Mỹ đã giảm lần đầu tiên trong sáu năm. Từ ngày 1 tháng 1 đến ngày 31 tháng 12 năm 2022, tổng cộng có 121 ca mắc sởi được báo cáo tại 6 khu vực. Năm 2022, có 322 ca mắc quai bị. Đợt bùng phát lớn nhất gần đây xảy ra vào năm 2016 ở một cộng đồng gắn kết tại Arkansas và dẫn đến 3.000 ca mắc bệnh.

Những đợt bùng phát bệnh này và các đợt bùng phát bệnh khác đã khiến một số bang xem xét việc thông qua các luật miễn trừ vaccine nghiêm ngặt hơn, trong khi một số bang, như Arizona, đã nới lỏng các hạn chế.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'582f4c36-db3b-4b56-b18e-761afdb1bde0', N'Điều quan trọng đối với các bậc phụ huynh', N'Hãy suy nghĩ kỹ và thu thập thông tin từ các nguồn đáng tin cậy trước khi thay đổi lịch tiêm chủng cho con bạn. Lịch tiêm chủng có mục đích bảo vệ con bạn — và cả những người xung quanh con bạn.', N'
5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'
5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'80345ba8-f4ca-4d29-b41f-ed85467c3b34', N'Lo lắng về việc tiêm nhiều vaccine cùng lúc?', N'Các bậc phụ huynh đôi khi lo lắng về việc tiêm nhiều vaccine cùng lúc, điều này được yêu cầu theo lịch tiêm chủng, đặc biệt là ở các mốc tiêm 2, 4 và 6 tháng tuổi. Không chỉ là an toàn, mà khi phụ huynh dãn ra lịch tiêm chủng, việc bảo vệ trẻ sẽ mất nhiều thời gian hơn, khiến trẻ sơ sinh dễ bị các bệnh này tấn công. Điều này cũng có nghĩa là nhiều lần khám bác sĩ hơn: nghiên cứu cho thấy trẻ em có phụ huynh chọn lịch tiêm chủng khác sẽ có thêm ba lần khám tiêm so với trẻ em theo lịch tiêm chủng khuyến nghị.

Lợi ích và Rủi ro

Vaccine là một loại thuốc. Giống như bất kỳ loại thuốc nào, vaccine có lợi ích và rủi ro, và mặc dù rất hiệu quả, không có vaccine nào đạt hiệu quả 100% trong việc phòng ngừa bệnh hoặc 100% an toàn cho mọi cá nhân. Hầu hết các tác dụng phụ của vaccine thường nhẹ và ngắn hạn. Ví dụ, một người có thể cảm thấy đau tại chỗ tiêm hoặc bị sốt nhẹ. Các phản ứng nghiêm trọng từ vaccine rất hiếm, nhưng chúng vẫn có thể xảy ra.

"Phụ huynh cần biết rằng rủi ro bị tổn thương bởi vaccine nhỏ hơn rất nhiều so với rủi ro mắc các bệnh nghiêm trọng do các bệnh truyền nhiễm," bác sĩ David Kaslow, Giám đốc Văn phòng Nghiên cứu và Đánh giá Vaccine tại CBER cho biết. "Tiêm chủng là một bước rất quan trọng để giúp trẻ có một khởi đầu khỏe mạnh."

Quy trình phát triển vaccine và đánh giá của FDA là rất nghiêm ngặt và toàn diện, và vaccine được giám sát chặt chẽ sau khi FDA phê duyệt thông qua các hệ thống giám sát khác nhau để phát hiện các phản ứng phụ hiếm gặp hoặc các biến chứng lâu dài có thể xảy ra.

Để biết thêm thông tin về các phản ứng phụ có thể xảy ra, hãy trao đổi với nhà cung cấp dịch vụ chăm sóc sức khỏe của bạn, và một số vaccine cũng có nhãn phê duyệt của FDA dành riêng cho người nhận vaccine, có thể là nguồn thông tin hữu ích. Điều quan trọng là thảo luận với nhà cung cấp dịch vụ chăm sóc sức khỏe về bất kỳ phản ứng nào trước đây với vaccine và bất kỳ tác dụng phụ nào sau khi tiêm vaccine.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'93A3B41A-D5CF-451C-AF32-43B6C4016DE7', N'Vì sao phải tiêm chủng cho trẻ?', N'<p>Mỗi người, ở bất kỳ giai đoạn nào trong cuộc đời, đều cần được tiêm phòng các loại vắc xin phù hợp để phòng ngừa nguy cơ bệnh tật, bảo vệ sức khỏe cả trẻ em và người lớn. Đối với trẻ em, nhất là nhóm tuổi mầm non, tiểu học và đặc biệt là nhóm trẻ dưới 5 tuổi, việc tiêm chủng vắc xin, cụ thể là tiêm chủng đầy đủ và đúng lịch lại càng trở nên vô cùng quan trọng vì những lý do sau:</p><ul><li><strong>Miễn dịch trẻ nhận được từ mẹ chỉ tồn t</strong>ại trong thời gian rất ngắn: Trẻ sơ sinh và trẻ nhỏ rất dễ mắc các bệnh truyền nhiễm nguy hiểm, khi mắc bệnh thì khó phát hiện, khó điều trị và tỷ lệ tử vong cao. Từ 6 tháng đến 3 tuổi, miễn dịch mà trẻ nhận được từ mẹ trong thai kỳ qua nhau thai và ở giai đoạn sơ sinh qua sữa mẹ gần như mất hoàn toàn trong khi hệ thống miễn dịch của bé vẫn chưa đủ phát triển để tự tạo ra kháng thể, trí nhớ miễn dịch cũng chưa hoàn chỉnh, khi chẳng may mắc bệnh thì vẫn tồn tại nguy cơ tái phát bệnh rất cao trong tương lai. Việc tiêm chủng sẽ giúp trẻ hình thành hệ miễn dịch riêng để phòng tránh bệnh tật, giảm nguy cơ mắc bệnh nặng và thậm chí tử vong.</li><li><strong>Sức đề kháng yếu:</strong>&nbsp;Trẻ dưới 5 tuổi có sức đề kháng kém, khả năng miễn dịch từ những mũi tiêm vắc xin lúc sơ sinh và những năm đầu đời giảm dần theo thời gian và không còn đủ mạnh để bảo vệ trẻ. Vì vậy, cần tiêm chủng để duy trì, củng cố khả năng phòng bệnh.</li><li><strong>Giảm nguy cơ mắc bệnh, ngăn ngừa biến chứng và di chứng nguy hiểm:</strong>&nbsp;Trẻ em có hệ miễn dịch chưa hoàn thiện, dễ mắc các bệnh truyền nhiễm nguy hiểm. Khi được tiêm vắc xin, trẻ ít mắc bệnh hơn; nếu có mắc bệnh, triệu chứng thường nhẹ hơn, giảm nguy cơ bệnh nặng và các di chứng lâu dài như như liệt, mù, điếc, mất chân tay, mất nhận thức, chậm phát triển trí tuệ, thể chất và giảm thiểu tối đa nguy cơ tử vong.</li><li><strong>Tạo “lá chắn miễn dịch” mạnh mẽ:</strong>&nbsp;Vắc xin hoạt động như một tấm lá chắn bảo vệ, giúp cơ thể phát triển khả năng phòng chống hiệu quả với nhiều loại virus, vi khuẩn… Khi đã tiêm ngừa vắc xin, hệ miễn dịch của trẻ có khả năng nhận diện và đánh bại tác nhân gây bệnh nhanh chóng nếu chẳng may trẻ có tiếp xúc với các tác nhân gây bệnh trong tương lai.</li><li><strong>Phòng bệnh sớm, bảo vệ từ sớm:</strong>&nbsp;Từ lúc sinh ra, trẻ đã tiếp xúc với môi trường và nhiều người xung quanh dẫn đến nguy cơ cao lây nhiễm mầm bệnh và mắc các bệnh truyền nhiễm nguy hiểm từ những người thân qua các hành vi thân mật với trẻ như ôm, hôn môi, thơm má… Tiêm phòng sớm giúp cơ thể trẻ có được khả năng phòng vệ từ sớm, bảo vệ khỏi các bệnh nguy hiểm từ những ngày đầu đời.</li><li><strong>Tăng cường tiếp xúc xã hội:</strong>&nbsp;Trẻ lớn khi bắt đầu đi học, sẽ tiếp xúc với nhóm người quy mô lớn hơn, đông đúc hơn, di chuyển nhiều nơi hơn và tỷ lệ, tần suất tiếp xúc giữa người và người cũng cao hơn. Điều này làm gia tăng đáng kể nguy cơ lây nhiễm, lây lan mầm bệnh trong cộng đồng, khiến trẻ dễ nhiễm bệnh. Tiêm chủng vắc xin cho trẻ giúp giảm thiểu rủi ro lây nhiễm trong môi trường học đường, tạo điều kiện học tập an toàn và thuận lợi cho trẻ.</li><li><strong>Điều kiện đến trường:</strong>&nbsp;Tại nhiều quốc gia, tiêm chủng đầy đủ là yêu cầu bắt buộc để trẻ được nhập học. Xác nhận đã tiêm các loại vắc xin quan trọng giúp đảm bảo an toàn sức khỏe cộng đồng, đồng thời mang lại sự an tâm cho phụ huynh khi con đến trường.</li></ul><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/be-di-tiem-vac-xin.jpg"><em>Trẻ học tiểu học, mầm non, mẫu giáo, đặc biệt là trẻ dưới 5 tuổi có nguy cơ cao mắc bệnh, biến chứng nguy hiểm, di chứng nghiệm trọng, thậm chí tử vong, cần được ưu tiên tiêm chủng đầy đủ, đúng lịch.</em></p><p>Khi trẻ bước vào độ tuổi trung học cơ sở và trung học phổ thông, hệ miễn dịch và sức đề kháng đã phát triển mạnh mẽ hơn. Tuy nhiên, đây cũng là giai đoạn trẻ trải qua những biến đổi đáng kể về trí tuệ, thể chất và tâm sinh lý. Trẻ bắt đầu khám phá bản thân, vượt qua các rào cản, mở rộng mối quan hệ và tiếp xúc nhiều hơn với môi trường xã hội.</p><p>Điều này tạo ra “khoảng trống miễn dịch” nếu trẻ không được tiêm nhắc lại các mũi vắc xin quan trọng. Dưới đây là lý do tiêm chủng ở&nbsp;<strong>giai đoạn tiền học đường và học đường</strong>&nbsp;là rất cần thiết:</p><ul><li><strong>Nguy cơ tiếp xúc với mầm bệnh tăng cao:</strong>&nbsp;Ở lứa tuổi này, trẻ tiếp xúc rộng rãi hơn với nhiều người và nhiều môi trường khác nhau, dẫn đến nguy cơ lây nhiễm bệnh cao hơn. Không tiêm nhắc lại một số vắc xin quan trọng đã tiêm ở giai đoạn trước khiến nồng độ kháng thể của trẻ bị tụt giảm nghiêm trọng, thậm chí “cạn kiệt” hoàn toàn, không còn đủ khả năng bảo vệ trẻ trước sự tấn công của hàng trăm loại virus, vi khuẩn ở môi trường bên ngoài, làm gia tăng nguy cơ đối mặt với các bệnh truyền nhiễm và các gánh nặng do bệnh gây ra.</li><li><strong>Tăng cường miễn dịch trong giai đoạn phát triển:</strong>&nbsp;Độ tuổi này là thời điểm “nhảy vọt” về cả trí tuệ, thể chất lẫn tâm sinh lý. Việc đảm bảo rằng hệ miễn dịch của trẻ luôn được củng cố giúp trẻ vượt qua giai đoạn phát triển này thuận lợi, mạnh mẽ và khỏe mạnh.</li><li><strong>Giữ vững thành tích học tập và thành công trong cuộc sống xã hội:</strong>&nbsp;Khi trẻ bị bệnh, thời gian nghỉ học kéo dài có thể ảnh hưởng đến thành tích học tập và các hoạt động xã hội. Việc tiêm phòng đảm bảo sức khỏe tốt để trẻ có thể duy trì sự liên tục trong học tập và tham gia các hoạt động ngoại khóa, giúp trẻ có cơ hội phát triển toàn diện trong tương lai.</li><li><strong>Bảo vệ sức khỏe cộng đồng:</strong>&nbsp;Việc trẻ được tiêm chủng đầy đủ không chỉ là bảo vệ cá nhân mà còn góp phần duy trì sức khỏe cộng đồng. Khi một người có miễn dịch với bệnh, nguy cơ lây nhiễm cho những người khác cũng được giảm thiểu đáng kể. Khi nhiều người có miễn dịch, có thể thúc đẩy nhanh chóng mục tiêu kiểm soát dịch bệnh trong cộng đồng, xa hơn là loại trừ và thanh toán hoàn toàn các bệnh dịch nguy hiểm.</li></ul><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/be-trai-khoe-manh.jpg"><em>Với những lợi ích to lớn này, việc tiêm chủng đầy đủ, đúng lịch là hành động thiết yếu để đảm bảo tương lai khỏe mạnh cho trẻ.</em></p><h2><strong>7 lợi ích khi tiêm chủng vắc xin cho trẻ</strong></h2><h3><strong>1. Bảo vệ trẻ khỏi các bệnh nguy hiểm</strong></h3><p>Trẻ em là nhóm dễ bị tổn thương hơn so với các đối tượng khác trước các bệnh truyền nhiễm, vì hệ miễn dịch của trẻ chưa hoàn thiện, khả năng đề kháng với sự xâm nhập, tấn công và gây bệnh của các loại virus, vi khuẩn của trẻ rất non nớt. Các bệnh truyền nhiễm không chỉ ảnh hưởng đến sức khỏe thể chất của trẻ, gây những hệ lụy như liệt, dị tật và khuyết tật cơ thể, mà còn có thể tác động nghiêm trọng đến sức khỏe tâm thần, dẫn đến thiểu năng trí tuệ và giảm khả năng học tập. Do đó, việc tiêm chủng vắc xin đầy đủ và đúng lịch mang lại cho trẻ nhiều lợi thế sức khỏe, tạo điều kiện thuận lợi cho sự phát triển toàn diện về thể chất và trí tuệ của trẻ trong tương lai.</p><p>Nhờ có vắc xin và nỗ lực tiêm chủng vắc xin của hệ thống y học dự phòng toàn cầu, số ca tử vong do sởi giảm từ 2,6 triệu ca/năm xuống còn 122.000 ca/năm (2012), số ca tử vong do ho gà giảm từ 1,3 triệu ca/năm xuống còn 63.000 ca/năm (2013), số ca mắc mới bạch hầu giảm từ 80.000 ca năm 1975 xuống còn dưới 10.000 ca (2017), vắc xin phòng các bệnh do vi khuẩn Hib gây ra giảm 90% tỷ lệ mắc viêm màng não do vi khuẩn Hib ở Châu Âu trong 10 năm… Từ những thành quả và giá trị đó, có thể thấy vắc xin đóng vai trò vô cùng quan trọng trong việc bảo vệ trẻ khỏi các bệnh truyền nhiễm nghiêm trọng, giảm tỷ lệ mắc, biến chứng, di chứng và tử vong.</p><p>Hiện nay, theo “nhu cầu miễn dịch” của cộng đồng và sự phát triển vượt bậc của công nghệ học hiện đại, đã có rất nhiều loại vắc xin phòng nhiều bệnh truyền nhiễm nguy hiểm cho cả trẻ em và người lớn, bao gồm: sởi, quai bị, rubella, thủy đậu, cúm mùa, bạch hầu, ho gà, uốn ván, bại liệt, thương hàn, viêm gan A, viêm gan B, các bệnh do HiB, viêm não Nhật Bản, các bệnh do não mô cầu nhóm A, B, C, Y, W-135, bệnh tiêu chảy do Rotavirus, zona thần kinh, các bệnh do phế cầu, các bệnh do HPV như ung thư cổ tử cung, ung thư hậu môn, ung thư vòm họng, ung thư âm đạo, ung thư âm hộ, tiền ung thư/loạn sản, mụn cóc sinh dục…</p><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/tiem-chung-cho-be.jpg"><em>Tiêm vắc xin cho trẻ giúp bảo vệ khỏi nguy cơ mắc các bệnh truyền nhiễm nguy hiểm, chặn đứng các biến chứng nghiêm trọng, di chứng kéo dài, thậm chí tử vong.</em></p><h3><strong>2. Tăng cường hệ miễn dịch</strong></h3><p>Vắc xin hoạt động dựa trên cơ chế “bắt chước” quá trình nhiễm trùng tự nhiên của cơ thể. Khi một loại vắc xin được đưa vào cơ thể, các thành phần kháng nguyên trong vắc xin được cơ thể nhận diện như các “kẻ xâm nhập”, kích thích cơ thể ngay lập tức huy động các thành phần của hệ thống miễn dịch, bao gồm các tế bào bạch cầu và các tế bào lympho hoạt động, nhằm sản sinh ra kháng thể trung hòa các thành phần kháng nguyên trong vắc xin.</p><p>Không chỉ sản sinh kháng thể tạm thời, hệ thống miễn dịch của cơ thể còn sản sinh ra các tế bào lympho B mang trí nhớ miễn dịch, các tế bào này ghi nhớ các đặc điểm của kháng nguyên, nếu sau này trẻ bị phơi nhiễm với vi khuẩn, virus có chứa các thành phần khác nguyên tương ứng, hệ miễn dịch sẽ phản ứng nhanh và mạnh mẽ hơn, giúp bảo vệ cơ thể chống lại nguy cơ mắc bệnh.</p><p>Một số loại vắc xin sau khi tiêm xong, nồng độ kháng thể hình thành sẽ suy giảm dần theo thời gian, cần tiêm nhắc lại vào một thời điểm nhất định trong tương lai để bổ sung, tăng cường hệ miễn dịch và duy trì lượng kháng thể cần thiết, giúp cơ thể được bảo vệ mạnh mẽ nhất. Một số vắc xin mang lại sự bảo vệ suốt đời, giúp trẻ em tránh khỏi nhiều bệnh nguy hiểm trong suốt cuộc đời.</p><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/be-gai-khoe-manh.jpg"><em>Tiêm vắc xin cho trẻ em giúp tăng cường hệ miễn dịch, tạo ra trí nhớ miễn dịch, bảo vệ trẻ chống lại sự tấn công của các bệnh truyền nhiễm nguy hiểm trong tương lai.</em></p><h3><strong>3. Bảo vệ cộng đồng</strong></h3><p>Tiêm vắc xin không chỉ dừng lại ở việc bảo vệ cá nhân mà còn mang lại lợi ích cho toàn cộng đồng thông qua khái niệm “miễn dịch cộng đồng” (herd immunity). Miễn dịch cộng đồng hình thành sau khi một tỷ lệ lớn dân số được tiêm vắc xin, khiến mầm bệnh không có “vật chủ” để ký sinh và phát triển, làm giảm khả năng lây lan của mầm bệnh từ người này sang người khác, giúp giảm thiểu, kiểm soát tốt hoặc loại trừ hoàn toàn các ổ dịch bệnh truyền nhiễm nguy hiểm.</p><p>Ngay cả những người chưa được tiêm phòng hoặc không thể tiêm vì lý do sức khỏe không đáp ứng điều kiện tiêm vắc xin cũng được bảo vệ nhờ vào “lá chắn miễn dịch” của cộng đồng. Trẻ em có hệ miễn dịch suy giảm hoặc các đối tượng có tình trạng sức khỏe đặc biệt như trẻ sơ sinh, phụ nữ mang thai, người có bệnh nền, người đang bị suy giảm miễn dịch/ sử dụng các loại thuốc ức chế miễn dịch… không thể tiêm vắc xin cũng chính là những đối tượng dễ bị tổn thương, dễ mắc bệnh, nguy cơ cao biến chứng và tử vong. Bằng việc tiêm chủng cho số đông trong cộng đồng, mức độ bao phủ của miễn dịch trong cộng đồng sẽ được nâng cao, giúp giảm nguy cơ những người yếu thế không có đủ điều kiện tiêm vắc xin bị lây nhiễm mầm bệnh, mắc bệnh và gánh chịu những mối đe dọa bệnh tật.</p><p>Ở khía cạnh thực tế hơn, miễn dịch cộng đồng là việc tiêm chủng vắc xin đầy đủ, đúng lịch giúp ngăn chặn nguy cơ trẻ mắc bệnh, trẻ trở thành nguồn lây bệnh trực tiếp cho những người xung quanh, bạn bè, gia đình, đặc biệt là trẻ sơ sinh, phụ nữ có thai và người cao tuổi có bệnh lý nền (tim mạch, tiểu đường, huyết áp…).</p><p>Lịch sử y học cũng đã chứng minh tiêm vắc xin có thể bảo vệ cộng đồng, giúp kiểm soát, loại trừ và thậm chí thanh toán các bệnh truyền nhiễm nguy hiểm. Tiêu biểu như đậu mùa đã được thế giới thanh toán vào năm 1980 nhờ nỗ lực đẩy mạnh tỷ lệ bao phủ tiêm chủng vắc xin đậu mùa trên diện rộng.</p><p>Tại Việt Nam, cũng nhờ nỗ lực của Chương trình Tiêm chủng mở rộng, không ngừng thúc đẩy tỷ lệ tiêm ngừa các loại vắc xin quan trọng, bệnh bại liệt đã được thanh toán tại Việt Nam vào năm 2000, đến năm 2005, Việt Nam tiếp tục loại trừ uốn ván sơ sinh, tiếp tục theo đuổi mục tiêu kiểm soát tốt các bệnh truyền nhiễm nguy hiểm khác như viêm gan B, sởi, quai bị, rubella, bạch hầu, ho gà, uốn ván…</p><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/ca-gia-dinh-tiem-chung-day-du.jpg"><em>Tiêm chủng cho trẻ góp phần bảo vệ sức khỏe cộng đồng, góp phần đẩy nhanh tiến độ đạt được lý tưởng thanh toán hoàn toàn các bệnh truyền nhiễm nguy hiểm trên toàn cầu</em></p><h3><strong>4. Tiết kiệm chi phí chăm sóc y tế</strong></h3><p>Tiêm chủng có chi phí thấp hơn rất nhiều so với khoản tiền chi trả cho việc điều trị các bệnh mà trẻ có thể mắc phải. Theo Quỹ Nhi đồng Liên Hợp Quốc (UNICEF), cứ 100 USD (khoảng 2,5 triệu đồng) bỏ ra cho việc tiêm phòng có thể tiết kiệm tới 1.600 USD (khoảng 40 triệu đồng) cho chi phí khám và điều trị khi trẻ mắc bệnh. Tại Việt Nam, sau 6 tuổi, trẻ không còn được hưởng Bảo hiểm y tế 100%, gây tốn kém cho việc điều trị khi chẳng may mắc bệnh. Nhiều bệnh truyền nhiễm có chi phí điều trị lên đến hàng trăm triệu đồng, gây ảnh hưởng lớn đến sức khỏe của trẻ cũng như tài chính và thời gian của gia đình.</p><h3><strong>5. Đáp ứng nhu cầu của thời đại</strong></h3><p>Trong bối cảnh hiện tại, khi cơ hội học tập, du học, du lịch nước ngoài hay di cư ngoại quốc ngày càng mở rộng, nguy cơ mắc các bệnh truyền nhiễm mà trẻ chưa từng gặp phải ở địa phương cũng tăng cao. Với những trẻ vị thành niên, thanh thiếu niên, việc tiêm chủng đầy đủ không chỉ là biện pháp bảo vệ sức khỏe cá nhân mà còn là yêu cầu bắt buộc của hầu hết các quốc gia cho du học sinh và các khách du lịch hay dân nhập cư. Việc này đảm bảo rằng trẻ sẽ không mắc các bệnh truyền nhiễm nguy hiểm, tạo điều kiện thuận lợi cho quá trình học tập và sinh sống tại đất nước mới.</p><h3><strong>6. Củng cố miễn dịch cho trẻ lớn</strong></h3><p>Trẻ lớn trên 5 tuổi, đặc biệt là các trẻ vị thành niên và thanh thiếu niên, việc tiêm vắc xin nhắc lại rất quan trọng để củng cố và duy trì khả năng miễn dịch đã hình thành từ việc tiêm vắc xin lúc nhỏ, giúp trẻ “gia hạn” thời gian được bảo vệ khỏi những bệnh truyền nhiễm mà trẻ đã được tiêm phòng từ trước.</p><p>Hơn nữa, giai đoạn này còn là lúc cần bổ sung các loại vắc xin tiêm mới, vắc xin mà trẻ chưa có cơ hội tiêm khi còn nhỏ. Ngoài ra, khi có loại vắc xin thế hệ mới với hiệu quả phòng bệnh vượt trội hơn so với vắc xin cùng loại đã tiêm lúc nhỏ, trẻ cũng có thể tiêm thêm các loại vắc xin thế hệ mới này theo chỉ định của bác sĩ nhằm tối ưu hóa hiệu quả bảo vệ khỏi các bệnh nguy hiểm. Nhờ đó, hệ miễn dịch của trẻ sẽ được cập nhật và chuẩn bị tốt hơn.</p><h3><strong>7. Ngăn chặn các bệnh lây truyền qua đường tình dục</strong></h3><p>Trong giai đoạn dậy thì, sự tò mò về giới tính và sự phát triển về mặt tình dục có thể dẫn đến hành vi quan hệ tình dục ở trẻ, phổ biến nhất là trẻ vị thành niên, thanh thiếu niên. Đây là thời điểm quan trọng để tiêm các loại vắc xin phòng ngừa các bệnh lây truyền qua đường tình dục như HPV (gây ung thư cổ tử cung, âm đạo, hậu môn và mụn cóc sinh dục). Bằng cách tiêm chủng, trẻ có thể giảm nguy cơ mắc các bệnh này, đồng thời giảm thiểu các biến chứng nghiêm trọng nếu chẳng may mắc phải.</p><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/tiem-phong-hpv-cho-be-gai.jpg"><em>Hiện nay, độ tuổi mắc các bệnh do HPV ngày càng trẻ hóa, độ tuổi dậy thì trung bình của trẻ ngày càng nhỏ, trẻ tiếp xúc với quan hệ tình dục lần đầu sớm hơn, do đó bố mẹ cần chủ động tìm hiểu và khuyến khích con thực hiện các biện pháp phòng ngừa khoa học, đặc biệt là cho trẻ tiêm ngừa HPV từ lúc 9 tuổi</em></p><h2><strong>Những hiểu lầm phổ biến về tiêm chủng</strong></h2><h3><strong>1. Vắc xin gây tự kỷ</strong></h3><p>Một trong những hiểu lầm phổ biến nhất về tiêm chủng là vắc xin gây ra tự kỷ. Hiểu lầm này bắt nguồn từ một nghiên cứu năm 1998 của Andrew Wakefield đăng trên tạp chí Lancet, trong đó tuyên bố rằng có mối liên hệ giữa vắc xin MMR (sởi, quai bị, rubella) và tự kỷ. Tuy nhiên, nghiên cứu này đã bị loại bỏ vì các sai sót nghiêm trọng về phương pháp và tính toàn vẹn dữ liệu. Các nghiên cứu quy mô lớn sau đó đã không tìm thấy bằng chứng cho mối liên hệ này. Tổ chức Y tế Thế giới (WHO) và các tổ chức y tế hàng đầu khác đều khẳng định rằng không có mối quan hệ nào giữa vắc xin và tự kỷ.</p><h3><strong>2. Trẻ khỏe mạnh không cần tiêm vắc xin</strong></h3><p>Một hiểu lầm khác là trẻ khỏe mạnh không cần tiêm vắc xin. Quan điểm này là vô cùng sai lầm, có thể gây nguy hiểm đến sức khỏe và tính mạng của trẻ, vì các bệnh truyền nhiễm có thể ảnh hưởng đến tất cả mọi đối tượng, ngay cả ở những người lớn khỏe mạnh nhất cũng không loại trừ nguy cơ mắc bệnh, biến chứng và tử vong.</p><h3><strong>3. Tiêm chủng gây nhiều tác dụng phụ nghiêm trọng</strong></h3><p>Mặc dù vắc xin rất an toàn nhưng vẫn có một tỷ lệ nhỏ bị phản ứng sau tiêm chủng gọi là sự cố bất lợi sau tiêm. Không phải ai cũng sẽ gặp tác dụng phụ. Trong thực tế, hầu hết các tác dụng phụ của vắc xin thường nhẹ và tạm thời, như sốt nhẹ, đau tại chỗ tiêm hoặc mệt mỏi, khó chịu có thể tự khỏi sau 2 – 3 ngày. Những triệu chứng này có thể được kiểm soát bằng việc dùng thuốc do bác sĩ kê, hoặc đắp khăn lạnh lên vị trí tiêm. Nếu cảm thấy lo lắng, cha mẹ nên hỏi bác sĩ hoặc nhân viên y tế.</p><p>Những tác dụng phụ nghiêm trọng của vắc xin rất hiếm như phản ứng phản vệ có thể gây nguy hiểm đến tính mạng nhưng nếu được phát hiện sớm và điều trị kịp thời sẽ khỏi hoàn toàn mà không để lại di chứng gì. Điều quan trọng là sau khi tiêm chủng, người dân cần tuân thủ theo đúng hướng dẫn của bác sĩ về việc theo dõi các phản ứng sau tiêm và các dấu hiệu cảnh báo.</p><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/me-cham-soc-be-bi-benh.jpg"><em>Phản ứng sau tiêm vắc xin thường là phản ứng nhẹ, tự giới hạn và hồi phục toàn trạng sau vài ngày mà không cần can thiệp điều trị y tế.</em></p><h2><strong>Một số điều bố mẹ cần biết để trẻ tiêm chủng được an toàn</strong></h2><h3><strong>1. Tìm hiểu và nắm rõ thông tin về vắc xin</strong></h3><p>Trước khi cho trẻ đi tiêm chủng vắc xin, bố mẹ cần chủ động tìm hiểu kỹ càng về các loại vắc xin mà trẻ cần tiêm cùng các thông tin chi tiết về loại vắc xin như thành phần, tác dụng, liều lượng tiêm, lịch tiêm cũng như các phản ứng có thể xảy ra sau khi tiêm, cách xử trí thích hợp… để có đủ lượng kiến thức cần thiết để đối chiếu với thông tin cơ sở tiêm chủng cung cấp và chủ động xử trí trong các tình huống bất lợi xảy ra sau tiêm của con.</p><p>Bố mẹ có thể tham khảo ý kiến bác sĩ, tìm hiểu trên các trang web y khoa uy tín như Cổng thông tin Bộ Y tế (<a href="https://moh.gov.vn/" rel="noopener noreferrer" target="_blank">https://moh.gov.vn/</a>), Trung tâm Kiểm soát và Phòng ngừa Bệnh tật Thành phố – HCDC (<a href="https://hcdc.vn/" rel="noopener noreferrer" target="_blank">https://hcdc.vn/</a>)</p><h3><strong>2. Lên lịch tiêm chủng đúng hạn</strong></h3><p>Việc tuân thủ nghiêm ngặt lịch tiêm chủng theo khuyến cáo của các chuyên gia, bác sĩ tiêm chủng là rất quan trọng. Bố mẹ cần ghi nhớ lịch tiêm và đưa trẻ đi tiêm đầy đủ các mũi theo đúng thời gian quy định nhằm nâng cao tối đa hiệu quả phòng bệnh của vắc xin, đảm bảo trẻ được tốt nhất khỏi các bệnh truyền nhiễm nguy hiểm. Tiêm vắc xin đúng lịch được hiểu là đúng thời gian và đủ mũi theo khuyến cáo của nhà sản xuất và lịch hẹn của bác sĩ tiêm chủng. Lịch tiêm có thể không chính xác đến từng ngày giờ, nhưng không được sớm hơn thời hạn tối thiểu quy định (khuyến cáo).</p><p>Nếu bỏ lỡ một mũi tiêm, bố mẹ cần liên hệ ngay với bác sĩ để được tư vấn và sắp xếp lịch tiêm bổ sung.</p><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/tiem-ngua-cho-be-so-sinh.jpg"><em>Một số loại vắc xin yêu cầu phải tiêm nhắc lại để củng cố và duy trì hệ miễn dịch hiệu quả cho trẻ. Bỏ lỡ “giai đoạn vàng” của một số vắc xin như Rotavirus, 6 trong 1, Lao có thể khiến trẻ không còn cơ hội tiêm phòng và bảo vệ toàn diện, dẫn đến nguy cơ mắc bệnh cao hơn.</em></p><h3><strong>3. Theo dõi và chăm sóc trẻ sau tiêm</strong></h3><p>Sau khi tiêm vắc xin, bố mẹ cần cho trẻ ở lại cơ sở tiêm chủng khoảng 30 phút để được nhân viên y tế tại cơ sở tiêm chủng theo dõi và xử trí phản ứng phụ sau tiêm trong các tình huống phát sinh không mong muốn.</p><p>Sau khi về nhà, bố mẹ cần tiếp tục theo dõi sát sao tình trạng của trẻ theo hướng dẫn của nhân viên y tế trong vòng ít nhất 48 giờ tiếp theo. Một số phản ứng nhẹ như sốt, đau, sưng tại chỗ tiêm sẽ có thể xảy ra trong thời gian này, tuy nhiên đây là những phản ứng bình thường và sẽ tự hết trong vài ngày. Tuy nhiên, nếu trẻ có các dấu hiệu bất thường như phát ban, khó thở, co giật, tím tái, thở rít, thở rút lõm lồng ngực, sốt cao không hạ…, bố mẹ cần liên hệ ngay với bác sĩ để được hướng dẫn xử lý kịp thời và đưa trẻ đến ngay các cơ sở y tế địa phương hoặc bệnh viện gần nhất để được bác sĩ thăm khám, chẩn đoán và xử trí đúng cách.</p><p>Ngoài ra, việc chăm sóc trẻ chu đáo, đúng cách sẽ giúp trẻ hồi phục nhanh chóng, an toàn và giảm thiểu các tác dụng phụ có thể xảy ra. Để giảm đau và sưng tại chỗ tiêm, có thể chườm lạnh nhẹ nhàng bằng khăn mềm sạch và nước đá sạch nhưng tránh chườm quá lâu. Trẻ có thể bị sốt nhẹ sau khi tiêm, nên đo nhiệt độ thường xuyên, đảm bảo dinh dưỡng lành mạnh, đầy đủ, cho trẻ uống đủ nước, cho trẻ mặc trang phục thoáng mát để giúp hạ nhiệt cơ thể, nếu trẻ sốt cao trên 38,5°C, có thể cho trẻ dùng thuốc hạ sốt theo hướng dẫn của bác sĩ. Đảm bảo trẻ được nghỉ ngơi đầy đủ và không vận động quá sức. Nếu trẻ cảm thấy khó chịu hoặc quấy khóc, bố mẹ cần kiên nhẫn vỗ về và an ủi trẻ bằng cách bế ẵm và nói chuyện nhẹ nhàng…</p><p><img src="https://vnvc.vn/wp-content/uploads/2024/06/theo-doi-nhiet-do-tre-sau-tiem-phong.jpg"><em>Theo dõi đúng cách và chăm sóc tốt sau tiêm phòng sẽ giúp tình trạng sức khỏe của trẻ nhanh chóng ổn định và giảm thiểu các tác dụng phụ</em></p><p>Bài viết trên đây, chuyên gia VNVC đã giải đáp chi tiết thắc mắc “<strong>Vì sao phải tiêm chủng cho trẻ</strong>”. Có thể thấy, tiêm chủng vắc xin mang lại rất nhiều lợi ích cho sức khỏe và sự phát triển bền vững của trẻ trong suốt hành trình khôn lớn, giúp tăng cường hệ miễn dịch, bảo vệ trẻ khỏi các bệnh nguy hiểm, tiết kiệm chi phí chăm sóc y tế khi mắc bệnh và góp phần vào việc hình thành “miễn dịch cộng đồng”.</p><p>Đối với những trẻ lớn hơn, việc tiêm chủng vắc xin còn đáp ứng nhu cầu của thời đại, củng cố miễn dịch đang dần suy giảm và ngăn chặn các bệnh lây truyền qua đường tình dục. Chính vì thế, phụ huynh cần ý thức rõ tầm quan trọng của việc tiêm vắc xin và chủ động cho trẻ tiêm ngừa đầy đủ, đúng lịch tất cả các loại vắc xin quan trọng trong từng giai đoạn phát triển, giúp trẻ thuận lợi hơn trong quá trình khôn lớn và phát triển toàn diện trong tương lai.</p>', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-28T10:10:35.3730383+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:10:17.5833134+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'94b1c8d1-11ea-403e-ae9d-0197711f0d83', N'Vaccine giúp ích như thế nào cho trẻ em?', N'Các vaccine tiêm trước khi vào mẫu giáo bảo vệ trẻ khỏi các bệnh nghiêm trọng và có thể gây nhập viện hoặc thậm chí tử vong:

Bạch hầu, một bệnh hô hấp nghiêm trọng
Viêm gan B và viêm gan A, cả hai đều là bệnh nhiễm trùng gan. Viêm gan B có thể mãn tính và dẫn đến tổn thương gan.
Pneumococcus và Haemophilus Influenzae, hai loại vi khuẩn có thể gây nhiễm trùng nghiêm trọng
Sởi, có thể gây viêm phổi và các vấn đề thần kinh
Quai bị, gây sưng tuyến mang tai và đôi khi có thể dẫn đến các biến chứng
Ho gà (pertussis), có thể gây tử vong ở trẻ sơ sinh
Bại liệt, có thể gây tê liệt và dẫn đến tử vong
Rota virus, gây tiêu chảy có thể dẫn đến mất nước nghiêm trọng ở trẻ sơ sinh
Rubella (sởi Đức). Nếu phụ nữ mang thai nhiễm phải, có thể dẫn đến sẩy thai hoặc dị tật bẩm sinh.
Thủy đậu (chickenpox). Mặc dù hầu hết các ca nhiễm là nhẹ, nhưng phát ban do thủy đậu có thể bị nhiễm trùng và virus này có thể ảnh hưởng đến phổi hoặc não.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a4d51d59-8bc6-4f90-8680-17180ced0b2a', N'Lợi ích và Rủi ro', N'Vaccine là một loại thuốc. Giống như bất kỳ loại thuốc nào, vaccine có lợi ích và rủi ro, và mặc dù rất hiệu quả, không có vaccine nào đạt hiệu quả 100% trong việc phòng ngừa bệnh hoặc 100% an toàn cho mọi cá nhân. Hầu hết các tác dụng phụ của vaccine thường nhẹ và ngắn hạn. Ví dụ, một người có thể cảm thấy đau tại chỗ tiêm hoặc bị sốt nhẹ. Các phản ứng nghiêm trọng từ vaccine rất hiếm, nhưng chúng vẫn có thể xảy ra.

"Phụ huynh cần biết rằng rủi ro bị tổn thương bởi vaccine nhỏ hơn rất nhiều so với rủi ro mắc các bệnh nghiêm trọng do các bệnh truyền nhiễm," bác sĩ David Kaslow, Giám đốc Văn phòng Nghiên cứu và Đánh giá Vaccine tại CBER cho biết. "Tiêm chủng là một bước rất quan trọng để giúp trẻ có một khởi đầu khỏe mạnh."

Quy trình phát triển vaccine và đánh giá của FDA là rất nghiêm ngặt và toàn diện, và vaccine được giám sát chặt chẽ sau khi FDA phê duyệt thông qua các hệ thống giám sát khác nhau để phát hiện các phản ứng phụ hiếm gặp hoặc các biến chứng lâu dài có thể xảy ra.

Để biết thêm thông tin về các phản ứng phụ có thể xảy ra, hãy trao đổi với nhà cung cấp dịch vụ chăm sóc sức khỏe của bạn, và một số vaccine cũng có nhãn phê duyệt của FDA dành riêng cho người nhận vaccine, có thể là nguồn thông tin hữu ích. Điều quan trọng là thảo luận với nhà cung cấp dịch vụ chăm sóc sức khỏe về bất kỳ phản ứng nào trước đây với vaccine và bất kỳ tác dụng phụ nào sau khi tiêm vaccine.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a6aa86a5-b6f1-4851-9939-d35059b737dd', N'Lo lắng về tác dụng phụ?', N'Các bậc phụ huynh cũng lo lắng về tác dụng phụ của vaccine và các rủi ro khác, thường là do thông tin họ nhận được từ mạng xã hội. Không phải ai mắc các bệnh này đều có trường hợp nghiêm trọng hoặc biến chứng. Nhưng rủi ro từ biến chứng của bệnh luôn cao hơn so với rủi ro từ vaccine, một sự thật quan trọng đôi khi bị bỏ qua trong cuộc thảo luận về vaccine.

Khi trẻ bị trễ trong việc tiêm vaccine, chúng có khả năng mắc các bệnh có thể phòng ngừa bằng vaccine cao hơn — điều này không chỉ nguy hiểm đối với chúng mà còn đối với những người xung quanh chưa tiêm chủng, như chúng ta đã thấy trong các đợt bùng phát bệnh sởi. Không chỉ có những trẻ mà phụ huynh chọn không tiêm chủng mới có nguy cơ, mà còn có những trẻ không thể tiêm chủng, chẳng hạn như trẻ sơ sinh hoặc những trẻ đang sử dụng thuốc làm suy yếu hệ miễn dịch. Người lớn có hệ miễn dịch suy yếu cũng có thể gặp rủi ro. Phụ huynh thường quên rằng quyết định của họ về tiêm chủng ảnh hưởng đến nhiều người chứ không chỉ con của họ.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e9d0aabf-2ece-4d87-921c-4312fdbc4751', N'Làm thế nào để bạn có thể tìm hiểu thêm về vaccine?', N'Việc các bậc phụ huynh có câu hỏi và lo lắng về các phương pháp điều trị y tế cho con cái là điều bình thường. Sau cùng, đó là công việc của phụ huynh khi phải lo lắng. Tuy nhiên, khi các bậc phụ huynh có câu hỏi và lo lắng, rất quan trọng là họ phải tìm được thông tin y tế đáng tin cậy từ các nguồn chuyên gia. Trung tâm Kiểm soát và Phòng ngừa Dịch bệnh (CDC), cũng như Immunize.org và Học viện Nhi khoa Mỹ, có rất nhiều thông tin chính xác và hữu ích, và phụ huynh nên luôn trao đổi với bác sĩ của con nếu họ có bất kỳ mối quan tâm nào.', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-14T02:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0F1C7E24-277A-4D0F-9B87-9AAD28F01E14', N'Các bệnh khác', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1221E47C-47EA-4438-B66C-870EB840E64C', N'Vaccine phòng các bệnh do virus HPV', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1FDC0077-2A52-4FEF-A216-148DF7798ADC', N'Sởi', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2C08DE0D-6D4D-45A6-9EEF-F1B69326689C', N'Bạch hầu', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3FAFDE04-79B4-438C-B93B-D2AF3F06588D', N'Huyết thanh kháng uốn ván', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'49CE081B-8509-44FF-B409-7A4FDFB78C86', N'Viêm màng não mô cầu nhóm A, C, Y và W-135', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5FF20CDF-C58B-46DD-9DE3-67FB721015B7', N'string', N'', N'', N'', CAST(N'2025-03-12T08:44:28.7187958+07:00' AS DateTimeOffset), CAST(N'2025-03-12T08:45:06.7581745+07:00' AS DateTimeOffset), CAST(N'2025-03-12T08:45:06.7580958+07:00' AS DateTimeOffset))
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6ECE2D79-491A-4CCC-BD98-694D0D1E74F5', N'Sởi, quai bị và Rubella', N'', N'', NULL, CAST(N'2025-03-12T11:06:33.5141706+07:00' AS DateTimeOffset), CAST(N'2025-03-12T11:06:33.5141706+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6FA875C0-6ABA-49F3-AD56-D9A8E7C34381', N'Ho gà', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'75321B80-40EC-48F1-BCA6-F04F79C51EC0', N'Bạch hầu, Ho gà, Uốn ván, Bại liệt, Các bệnh  do HIB , Viêm gan B  (6 in 1)', N'', N'', NULL, CAST(N'2025-03-12T10:48:22.3426964+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:48:22.3426964+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'78B1FA06-8EC8-49DF-B626-96836F808C98', N'Vaccine phòng covid 19', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7A23DEB4-479A-4629-B2D8-15D134D6C8B0', N'Cúm', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'888D59EC-173E-4EEF-B606-58AFA3328433', N'Viêm phổi', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8FB4F36F-5871-4ABA-B3D6-B02823557B72', N'Viêm màng não do HIB', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'924ED742-5CFD-4D94-81EB-857EBFB6321E', N'Tiêu chảy do ROTA VIRUS', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9580C3DE-3BAA-45DD-97AA-48F72147EFC2', N'Viêm màng não', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'95D1D46B-CA9A-4EFB-AC0D-4F26BA7AC60D', N'Thương hàn', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9A049686-A1AB-465A-99E2-036D20AF35E5', N'Uốn ván', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9BABB4F8-A6D4-4166-80D3-B4A277D15FE8', N'Lao', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'A0D2C65B-182F-4FF5-BAA7-74BAAD578755', N'Tả', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'A3484E7D-6B24-410B-9984-C60B6EFA46ED', N'Viêm gan A', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'B9C13F02-9380-4FFC-B586-AC82C0BDBAC7', N'Bại liệt', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'BC3F03C3-BCC5-4459-87EF-8EBB41E7BB8B', N'Nhiễm khuẩn do phế cầu', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'DA8DB12F-9A6D-4ED8-8BFF-BED7D4290BD4', N'Rubella', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'E1D0CE49-91FC-40E0-83B5-5339E2D42C19', N'Viêm gan B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'EAB5F41E-5DB6-417A-846A-F136C6C8E78F', N'Thủy đậu', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'EDDB1A2F-9E89-4B28-A0B0-43FE6FA83C6B', N'Viêm màng não mô cầu nhóm B và C', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'F5F35035-1C04-46FD-BCED-CB0F74486852', N'Viêm não Nhật Bản', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'F85518BB-9D74-4617-A812-412A8142F6FB', N'Viêm gan A,B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T09:58:22.3385664+07:00' AS DateTimeOffset), CAST(N'2025-03-12T09:58:22.3385664+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'F87EE72E-BE06-456B-BC66-0135006DCC73', N'Quai bị', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'FC5A023F-9E74-462A-86F5-63E2372495BD', N'Uốn ván', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:30:13.3120906+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'08F3A565-93C4-4F27-BAFA-76F7F2C92BCA', N'Trần Minh A', N'C-000006', CAST(N'2025-03-29' AS Date), 120, 120, 1, N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', N'7CF4B1B0-1330-44AF-8698-49C590C6DE67', N'D6E644D6-5143-49C9-98E2-BE387BA2BAC7', NULL, CAST(N'2025-03-29T06:05:50.8351759+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:42:38.9783617+07:00' AS DateTimeOffset), NULL, N'Binh thuong ')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'0AAE17BC-79E4-4792-9E38-8B0E597DA1E9', N'Lê Hoàng Nam', N'C0003', CAST(N'2014-09-10' AS Date), 130.7, 32.1, 1, N'305E9E3B-6FA2-4BFC-90E1-406523A8C804', N'Hệ thống', NULL, NULL, CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), NULL, N'Tiêm phòng đầy đủ')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'0E59C60E-BB89-458D-BECA-7BC1F319CE5D', N'Đinh Tuấn Kiệt', N'C0007', CAST(N'2014-12-05' AS Date), 132.3, 34.5, 1, N'305E9E3B-6FA2-4BFC-90E1-406523A8C804', N'Hệ thống', NULL, NULL, CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), NULL, N'Không có vấn đề y tế')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'10FF3D03-6D3B-4A0F-86A2-26BAC6BFF03D', N'Phạm Minh Châu', N'C0004', CAST(N'2017-05-30' AS Date), 110.5, 22.8, 0, N'1DB643E0-3AB8-4E94-A318-AB54878AE273', N'Hệ thống', NULL, NULL, CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), NULL, N'Bệnh hen suyễn nhẹ')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'17914216-86F5-4A1A-83B5-6E6832B58FCA', N'Trần Minh An', N'C-000002', CAST(N'2025-03-26' AS Date), 20, 2, 0, N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', NULL, CAST(N'2025-03-27T23:03:57.4186709+07:00' AS DateTimeOffset), CAST(N'2025-03-27T23:03:57.4186709+07:00' AS DateTimeOffset), NULL, N'')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'6C43544D-F1B0-4B79-895A-F4442002A1C1', N'Trần Thị Bích', N'C0002', CAST(N'2016-02-20' AS Date), 118.2, 25.3, 0, N'7A6F3E08-C2C1-4B70-B5EA-241C1E4B24D6', N'Hệ thống', NULL, NULL, CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), NULL, N'Dị ứng nhẹ với sữa')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'A00772E1-F8B7-469A-950C-2CCE357F56ED', N'Hoàng Gia Bảo', N'C0005', CAST(N'2015-11-25' AS Date), 126.9, 30.2, 1, N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', N'Hệ thống', NULL, NULL, CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), NULL, N'Không có vấn đề y tế')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'B1285959-E5D6-4A4E-81E8-7BE1044D3771', N'Lê Thanh Phong', N'C-000005', CAST(N'2025-03-28' AS Date), 10, 4, 0, N'1DB643E0-3AB8-4E94-A318-AB54878AE273', N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', NULL, CAST(N'2025-03-28T22:20:26.7046585+07:00' AS DateTimeOffset), CAST(N'2025-03-28T22:20:26.7046585+07:00' AS DateTimeOffset), NULL, N'')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'B273136D-28D4-48BF-9AB4-0CAA10931C0A', N'Vũ Thanh Hằng', N'C0006', CAST(N'2016-08-12' AS Date), 119.8, 26.7, 0, N'7A6F3E08-C2C1-4B70-B5EA-241C1E4B24D6', N'Hệ thống', NULL, NULL, CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), NULL, N'Dị ứng phấn hoa')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', N'Phạm Bắc', N'C-000004', CAST(N'2025-03-01' AS Date), NULL, NULL, 1, N'7a6f3e08-c2c1-4b70-b5ea-241c1e4b24d6', N'7A6F3E08-C2C1-4B70-B5EA-241C1E4B24D6', N'7A6F3E08-C2C1-4B70-B5EA-241C1E4B24D6', NULL, CAST(N'2025-03-28T17:25:25.3375952+07:00' AS DateTimeOffset), CAST(N'2025-03-28T17:25:25.3375952+07:00' AS DateTimeOffset), NULL, N'')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'DBF8A8B1-E49D-4A76-A8B2-B402BA224FE9', N'Tran Minh Anh', N'C-000007', CAST(N'2025-03-08' AS Date), 3000, 4000, 1, N'8F5232F0-21DB-460C-807A-E9595A0B9261', N'7CF4B1B0-1330-44AF-8698-49C590C6DE67', N'7CF4B1B0-1330-44AF-8698-49C590C6DE67', NULL, CAST(N'2025-03-29T07:50:42.2398029+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:51:31.5860020+07:00' AS DateTimeOffset), NULL, N'')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'E81ACD7E-6B8C-4A74-8E8E-8F6713F822C1', N'Nguyễn Văn An', N'C0001', CAST(N'2015-06-15' AS Date), 125.4, 28.5, 1, N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', N'Hệ thống', NULL, NULL, CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), CAST(N'2025-03-28T22:57:31.5303511+00:00' AS DateTimeOffset), NULL, N'Không có vấn đề y tế')
GO
INSERT [dbo].[Children] ([Id], [Name], [ChildCode], [DateOfBirth], [Height], [Weight], [Gender], [AccountId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [MedicalNote]) VALUES (N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', N'Nguyễn Văn Sáu', N'C-000001', CAST(N'2025-03-12' AS Date), 3, 6, 1, N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', N'7A40CEB1-0710-4632-B0EA-037A750A2D6E', N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', NULL, CAST(N'2025-03-12T10:43:09.1912782+07:00' AS DateTimeOffset), CAST(N'2025-03-15T12:53:18.7094888+07:00' AS DateTimeOffset), NULL, N'')
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0006c22a-24b3-47ed-ab8d-94e7e128e4db', N'RWA', N'Ruanda', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040987+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040988+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0446708f-9c54-4ae3-8b9e-e514f5475c7c', N'TCD', N'Chad', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039671+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039672+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'050c78b2-6c59-425b-ac17-6f4519f7fbd3', N'DMA', N'Dominica', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039832+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039833+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'074b8073-8c8e-4361-9285-dce688f8d897', N'CZE', N'Cộng hòa Séc', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039813+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039814+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'07758319-b29c-4aea-896a-81eadcd1cdee', N'CPV', N'Cabo Verde', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039531+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039533+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0a67096e-2874-4d10-8798-c4f60d2244e5', N'MDG', N'Madagascar', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040432+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040433+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0d1b7248-f26c-4cfd-a636-353c62110457', N'AGO', N'Angola', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039084+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039085+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0d5e6b4f-9ac2-485f-9d73-791eb4a22865', N'MDA', N'Moldova', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040588+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040589+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0e4fc17b-f34b-460e-a6d5-c0a85fcabad1', N'LAO', N'Lào', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040358+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040359+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0ecac69d-e17a-46e5-90a4-53f945847e2c', N'KWT', N'Kuwait', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040344+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040344+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0f3d1505-70fa-46a0-bb1b-ca26d07e486a', N'ERI', N'Eritrea', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039914+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039915+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'118360de-d3eb-419c-bb36-4da28f993a7d', N'ETH', N'Ethiopia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039927+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039928+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'11e5f3fd-5565-42dc-ab45-dd09def412c0', N'SVK', N'Slovakia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041145+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041146+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1252b2e9-6b76-4760-a291-7f3a5ee1b0ac', N'TZA', N'Tanzania', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041327+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041328+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'15a71a9a-347c-482b-a207-926a5f1a243e', N'GBR', N'Vương quốc Anh', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041480+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041483+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'162bab81-0c1d-4cca-85ae-a638f392895b', N'BWA', N'Botswana', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039474+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039475+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'18f7a3ac-656b-4eb1-ba1e-892592ffa767', N'OMN', N'Oman', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040832+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040833+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'1a834a1e-a5a5-4ad3-92f4-f6a8f267c7dd', N'NRU', N'Nauru', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040696+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040698+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'225847ad-60f7-43b2-81c1-de77a01a18ef', N'CHE', N'Thụy Sĩ', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041302+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041303+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'235cf74f-8a0d-4269-acd6-17d49760192b', N'ITA', N'Ý', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040245+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040246+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2708e85d-1e4b-4c06-a697-6a0bd9d55821', N'DNK', N'Đan Mạch', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039821+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039821+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'270e5853-d34c-4927-8d68-d6e556a5e34e', N'CHL', N'Chile', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039681+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039683+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'27e97504-5ac2-450b-b51d-018ff33c5561', N'JPN', N'Nhật Bản', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040257+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040258+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2a561577-d764-44c0-aa03-55dd358f4b24', N'YEM', N'Yemen', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041566+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041568+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2c09dd52-38ea-4680-ad4a-4f528c94708b', N'SDN', N'Sudan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041265+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041267+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2ce3561a-906b-4d9d-b3c9-0e97ca3a4597', N'COG', N'Cộng hòa Congo (Congo-Brazzaville)', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039730+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039731+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2d444ad0-594f-4530-90cc-47c0570ce79f', N'LCA', N'Saint Lucia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041008+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041009+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2d4e3ae1-8585-416e-93eb-8d4b79d9bcef', N'BEL', N'Bỉ', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039446+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039446+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2d822e3b-0282-4320-ad84-dc2ca299f630', N'JOR', N'Jordan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040263+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040264+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'2fde6848-523d-41c3-ab55-b6526ecc2c30', N'NOR', N'Na Uy', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040792+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040793+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'307a3948-54a6-4831-8165-379a62b00407', N'PRY', N'Paraguay', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040876+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040877+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3109e66d-bd3c-4665-aaa7-71fe922d0531', N'QAT', N'Qatar', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040908+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040909+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'31c74499-0be1-4485-9115-6d97dcfeecf1', N'MEX', N'Mexico', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040566+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040567+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'32a84655-8726-4f02-ba5d-d54102137a5f', N'VEN', N'Venezuela', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041546+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041547+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'32dd86c8-7be9-41e0-aed3-d469f73389ce', N'GTM', N'Guatemala', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040040+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040041+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'357ee31f-3b86-4e2e-b840-dafa9e961a13', N'MCO', N'Monaco', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040598+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040599+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'367a459d-f233-4f7d-8f8d-1c13cb874969', N'FSM', N'Liên bang Micronesia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040578+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040579+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3be1c1f7-e4e4-4af7-accd-38d829c1c942', N'COD', N'Cộng hòa Congo (Congo-Kinshasa)', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039740+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039742+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3c3185ca-fa40-48ec-8278-5461e17fa7af', N'ZAF', N'Nam Phi', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041183+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041184+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3c967e35-eb6c-4c01-a924-a4378212820e', N'PNG', N'Papua New Guinea', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040865+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040866+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3ea5e7e9-eb54-4060-9164-059ce3c0d128', N'KIR', N'Kiribati', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040337+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040337+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3edc004b-8d59-444d-bd84-473a7ebe0e9b', N'AND', N'Andorra', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039072+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039073+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'40977fe4-c030-4cd5-a591-3b1ec2da6c1b', N'VUT', N'Vanuatu', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041524+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041525+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'44d77602-9163-4b58-8916-9df6328e0654', N'NGA', N'Nigeria', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040759+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040762+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'45520d04-48af-41ce-b753-43ff750d274c', N'MMR', N'Myanmar (Burma)', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040674+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040675+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'48e3e1db-e46c-4b68-bc94-4386348fbae1', N'HND', N'Honduras', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040161+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040162+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'49584516-f4ce-4de4-9cd8-874a25c7fc73', N'MKD', N'Bắc Macedonia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040771+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040786+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4af88896-e6e6-41eb-a37a-30f710c62c6d', N'TUN', N'Tunisia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041368+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041368+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4b09a740-c810-41fb-b205-f80586edcad1', N'CYP', N'Síp', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039783+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039785+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4b54bcae-02fa-451b-a875-7e0d881c1cdf', N'FJI', N'Fiji', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039934+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039935+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4c23af25-6807-4f5f-885d-12207de7bdee', N'GNB', N'Guinea-Bissau', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040112+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040113+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4c624a26-1554-422d-82e0-b898ebb4fee9', N'ISL', N'Iceland', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040184+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040186+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4d617a77-633a-46cf-8fda-0781fbea57bf', N'NER', N'Niger', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040750+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040752+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4ef1621e-2d54-47f0-995f-9e2965d35028', N'MRT', N'Mauritania', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040497+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040498+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4f4b752e-5b99-4cf9-8fcc-c3341d6106b1', N'GNQ', N'Guinea Xích đạo', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039908+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039909+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4f4c26a5-0a2e-4083-87ac-0a123c9eacf0', N'BEN', N'Benin', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039461+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039462+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4f7656e1-a1d2-4500-96e9-4fe70d7638a8', N'IRQ', N'Iraq', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040226+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040226+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4f9e8097-8a65-4389-84d4-620c0c58c6b7', N'SSD', N'Nam Sudan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041245+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041246+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'511a194e-3389-4a60-9b62-2a5f472de4c0', N'BRN', N'Brunei', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039488+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039488+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'51269c7f-e654-42c0-ac5d-87df4ef014c9', N'AUS', N'Úc', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039131+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039132+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5334d982-7f47-40af-a58e-a013b0769b67', N'IDN', N'Indonesia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040205+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040207+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'543258db-1024-4851-9e9d-e8b5d6492813', N'PSE', N'Palestine', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040853+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040854+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'54b90315-afa4-4c9e-9446-af6dd1911407', N'TWN', N'Ðài Loan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041314+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041315+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5562e106-7238-46bb-b2cd-c0a955b7b45b', N'HTI', N'Haiti', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040131+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040132+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'56328846-b39c-401e-be09-967c44f6f6a8', N'LVA', N'Latvia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040364+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040365+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'59eac3ca-c9f3-435a-9f91-6fca4a64a3ba', N'PRT', N'Bồ Đào Nha', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040902+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040903+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'59fcdb08-efd0-435c-bd20-eb9213a0a2d1', N'NPL', N'Nepal', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040706+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040708+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5d543ea3-0fbb-4c02-9fda-d3f44074c604', N'MNG', N'Mông Cổ', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040630+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040632+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'5e408c50-87b3-4805-8367-a949d348b4e8', N'KNA', N'Saint Kitts và Nevis', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040996+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040998+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'62513dad-459f-4b9c-93ac-d9c873388d99', N'GAB', N'Gabon', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039969+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039970+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'62569a1b-d8bf-457a-ae92-b95e3b9055ad', N'AZE', N'Azerbaijan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039306+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039307+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'671af5c8-63fb-4497-b529-0e2d97c69a29', N'WSM', N'Samoa', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041029+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041031+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'67237f3f-c371-4909-a303-2e73a0951ba2', N'DZA', N'Algeria', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039058+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039058+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'676d432e-0bad-467c-9fd1-10d33a0cb735', N'ROU', N'Romania', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040932+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040933+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6886b372-4256-45f4-bb7b-d635357da7b3', N'POL', N'Ba Lan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040894+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040895+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'692e318d-ec22-457c-83ef-ed5ad4ad37e2', N'BRA', N'Brazil', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039482+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039482+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6a1eea51-d2fd-4098-b084-c9fe8972c58e', N'LBY', N'Libya', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040390+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040391+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6a8de81e-49e0-4dd0-ad0f-3c98ac7a36a7', N'JAM', N'Jamaica', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040252+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040252+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6ba2f306-c541-4a4d-bee1-58aac4684781', N'FIN', N'Phần Lan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039940+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039957+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6f4ff809-0c05-40c3-bb67-f55ba1ac796d', N'ECU', N'Ecuador', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039887+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039888+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'71d717ec-8933-429b-bb12-7f9b718dcce7', N'UGA', N'Uganda', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041459+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041460+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'73d24e15-1606-4946-b9d2-1197743a1bd9', N'BLZ', N'Belize', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039455+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039456+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'74beebe1-b629-4585-a48b-2d6b57b5a754', N'CAN', N'Canada', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039659+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039661+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'77bc2e01-6044-4fd5-ae70-46e9740ad5d9', N'PAN', N'Panama', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040859+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040860+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7e28a24a-aa87-4725-af6a-8fafd84e8099', N'PHL', N'Philippines', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040888+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040888+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7f277e1b-ef40-416d-af69-f55c6d3ffbb2', N'MDV', N'Maldives', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040453+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040456+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'808e75b4-af07-4ded-ae51-a1f5c450dd07', N'GHA', N'Ghana', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040009+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040010+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'80b16f9c-02c1-4a54-ab93-99a8970589ee', N'GEO', N'Gruzia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039989+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039990+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'815ab070-3805-4c4c-961b-7a6af78367e7', N'GRC', N'Hy Lạp', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040021+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040022+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'817fff3d-fc92-460b-b0b8-67d0536a4ee0', N'BRB', N'Barbados', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039433+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039434+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8381fffa-b26d-45ac-8778-010a3d6acd1f', N'BOL', N'Bolivia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039468+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039469+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'84805659-488b-497a-9302-643ab3b243d1', N'MLI', N'Mali', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040465+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040466+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'86122fee-b1ec-4717-990a-001451eabcc5', N'GIN', N'Guinea', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040050+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040051+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'865a203d-bc3f-4900-a069-cd6dff253c73', N'BGD', N'Bangladesh', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039372+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039373+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'86792298-375E-427A-899A-B7878C9C30BE', N'CMM', N'Triều Tiên', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040987+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040987+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'871ed699-19b2-4996-801b-dbd0df7c6543', N'CHN', N'Trung Quốc', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039692+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039693+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'89e043a9-dd0a-482a-af84-2c3428ec5d65', N'BGR', N'Bulgaria', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039498+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039499+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8b8d417c-3d1b-4816-a1b9-69c023f3b943', N'GRD', N'Grenada', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040031+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040032+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8d3bdb1c-8ab3-415b-8142-35266827b79f', N'LUX', N'Luxembourg', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040412+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040412+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8d47452f-098c-48bb-8e2a-c6b801108aba', N'UZB', N'Uzbekistan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041514+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041516+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8e603e5f-586e-4808-873f-f72852dfdfbe', N'MAR', N'Ma-rốc', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040653+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040655+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8ecb1503-9635-4a73-8c3e-e9c24106ee66', N'NAM', N'Namibia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040686+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040688+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'8f4a4b39-a58b-4938-84a6-a7637e2ed749', N'EGY', N'Ai Cập', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039894+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039895+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9118fde6-c0b3-4221-b79c-740c1b379af2', N'LBR', N'Liberia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040385+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040385+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'93d15eea-5ba7-4999-9eb3-4384855a4f03', N'SYR', N'Syria', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041308+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041309+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9451c146-3960-4e9d-8c75-8e5a4a15b458', N'MLT', N'Malta', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040474+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040476+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'95c25aff-53c8-4fb3-a894-44b5e82f8b48', N'HUN', N'Hungary', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040174+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040175+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'96f41be4-fe53-4a4b-bdb1-54e38432c555', N'SMR', N'San Marino', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041039+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041041+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'975f843a-d2b6-413d-ade1-567ccea6da95', N'ARE', N'Các Tiểu vương quốc Ả Rập Thống nhất', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041473+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041474+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'989cde8d-e19a-45bb-9cee-65781d44eeaa', N'BFA', N'Burkina Faso', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039508+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039510+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'98b29fac-fba6-4200-8866-5fc7e33cbde6', N'SLE', N'Sierra Leone', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041121+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041123+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'99ed9318-65cc-405c-81b2-83d1f162ece5', N'BHR', N'Bahrain', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039359+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039360+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9aa6beb1-7aad-49ca-8208-aef2c743a9ce', N'KGZ', N'Kyrgyzstan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040352+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040353+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9ada10e1-a940-494e-b7d3-c834a5117980', N'CRI', N'Costa Rica', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039753+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039755+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9c7b79f4-a7e0-44a3-82b8-3d581a84471c', N'DJI', N'Djibouti', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039827+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039827+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9cae6bd4-6bf1-4e54-b0b6-509e0b5e3485', N'TJK', N'Tajikistan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041321+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041322+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9fa9901e-2f5b-4d63-980e-635155dde431', N'KOR', N'Hàn Quốc', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041189+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041190+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a2d6910d-9be8-4507-898f-39b310f74aa3', N'LKA', N'Sri Lanka', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041260+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041260+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a3c6d12a-c3c1-4c2c-8e43-2c74006e66b7', N'MOZ', N'Mozambique', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040663+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040665+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a4c9315a-e526-4ac7-b42f-31f2752eae8e', N'TUV', N'Tuvalu', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041409+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041409+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a82ea396-6c25-440b-bd98-d336e9e9ef4d', N'TGO', N'Togo', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041347+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041348+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a87a1e2f-c102-47f8-9ba6-8ac7fb72fa94', N'ALB', N'Albania', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039024+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039025+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a9c3d8df-1b97-47c7-8d05-93595da5abe7', N'IRN', N'Iran', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040219+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040220+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ac0120fa-356d-487f-bf39-60191ad4bb6d', N'ZMB', N'Zambia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041576+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041579+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ac036e30-6227-4780-9f13-86ac8a4610b6', N'TON', N'Tonga', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041356+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041357+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'accd01e1-50e5-4c3e-b2df-d0f03b204c23', N'DEU', N'Đức', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039999+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ad7b9f0a-3aa5-4e72-bac8-7c89d0ce1752', N'VNM', N'Việt Nam', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041556+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041557+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ae331830-2ef6-4c00-8825-b000efcf8c41', N'URY', N'Uruguay', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041504+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041505+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ae485a6d-e466-4f57-a9b6-ea1ac7deb217', N'MWI', N'Malawi', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040438+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040439+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ae9821b4-ecef-4535-ad72-a640d9c9fa69', N'TTO', N'Trinidad và Tobago', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041362+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041363+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'af38b4a3-a6d5-4102-83e7-2bb9979bde09', N'STP', N'Sao Tome và Principe', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041049+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041050+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'affbe36d-779f-498f-8b2e-efb4a1fd8278', N'TKM', N'Turkmenistan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041381+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041382+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b0119242-eb70-460d-b2a2-c10498a5a1b7', N'BDI', N'Burundi', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039521+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039522+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b60d3437-dd6a-47c4-b365-ac2ce75feb32', N'SYC', N'Seychelles', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041091+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041092+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b6edbe83-dca8-4554-80d5-98ae69555f13', N'NIC', N'Nicaragua', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040741+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040743+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b8417e2c-0a56-4542-b8b6-aba0442cd933', N'DOM', N'Cộng hòa Dominica', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039840+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039841+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'bc1af80e-a29c-4e48-88ee-625c3cab3adc', N'VAT', N'Thành Vatican', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041534+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041535+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'bcb3c7c7-9582-4d5b-91a8-d7b8856543b9', N'SGP', N'Singapore', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041135+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041136+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c21e6fb1-a0ad-455a-83f9-7fba5e45f5d1', N'UKR', N'Ukraine', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041467+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041468+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c2b740eb-918e-44de-a8f8-878d88439166', N'HRV', N'Croatia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039764+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039765+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c2d90a86-d458-46c0-adb2-cc08e9986ef8', N'ISR', N'Israel', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040238+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040238+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c2e70db8-f777-4522-98e3-b36d07b7bd81', N'SLB', N'Quần đảo Solomon', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041164+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041165+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c43031f2-33e1-434c-bf73-f4d58a5950be', N'USA', N'Hoa Kỳ', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041492+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041494+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c5a6a4ca-20fc-4f9f-9997-49a0ba3a0cf9', N'MUS', N'Mauritius', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040555+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040556+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c5aeb3f3-edc9-44d3-8d85-9789b3287917', N'KAZ', N'Kazakhstan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040289+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040289+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c6341c36-4a20-4d13-8cc3-ed5cd3e08035', N'SLV', N'El Salvador', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039900+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039901+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c8b85c8f-9377-481e-ae91-1348b573a5cb', N'ZWE', N'Zimbabwe', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041590+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041591+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cb40ca50-93a4-4a5a-8767-921c4d343b18', N'MHL', N'Quần đảo Marshall', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040487+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040488+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cb67e5c7-7425-4470-adf8-7a6e817f69f5', N'TLS', N'Đông Timor', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041339+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041340+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cc84ea6a-ddfd-4405-ac9c-ea20a0239bd5', N'SAU', N'Ả Rập Xê Út', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041059+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041061+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cd8712ca-12fa-4d39-a5a1-3cf9d80433b3', N'PER', N'Peru', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040882+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040883+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cda34de2-af2b-4fcf-ba04-2cca0d9bf257', N'SRB', N'Serbia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041081+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041082+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cee333b4-dee9-42c1-a711-a624d14de9ab', N'IRL', N'Ireland', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040232+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040232+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cf2fa535-bba2-4239-adca-d80aa05dde3a', N'VCT', N'Saint Vincent và Grenadines', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041017+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041019+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'cf4d589e-6a5c-4bd1-b203-aa56aec3ecd6', N'ARG', N'Argentina', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039117+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039117+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd26d4d37-5a5c-4b9d-b76e-8b1a28d78239', N'RUS', N'Nga', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040938+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040939+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd2a7214f-b637-4773-bfc3-99ca681e6935', N'MYS', N'Malaysia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040446+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040447+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd324e595-f807-4811-bd26-cacf3d5d62ec', N'SWE', N'Thụy Điển', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041280+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041281+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd38e2cf1-b187-4fb0-b5cd-7acd1944c5cb', N'MNE', N'Montenegro', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040643+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040645+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd4245b62-8937-4996-a6fc-1603cb32213d', N'EST', N'Estonia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039920+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039921+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd4981dd8-a9bb-4c8c-94f6-41fb719befca', N'LSO', N'Lesotho', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040379+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040380+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd7e2e966-c1ab-46ca-853c-488b2d259856', N'PLW', N'Palau', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040847+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040847+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'da5b6130-73c7-41f7-998f-5fb4b753edfb', N'COL', N'Colombia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039709+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039711+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'da9e82b8-16c3-4fd3-874c-d5a8409a379d', N'AUT', N'Áo', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039273+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039290+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e18c65d2-d047-44e5-8888-085c1942bad9', N'LBN', N'Liban', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040371+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040371+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e212c1c3-48a4-4936-8c3a-92ec838e5bb2', N'GMB', N'Gambia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039979+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039981+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e3c074c8-abd1-4466-adcb-1dcd16b93a7a', N'CUB', N'Cuba', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039774+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039775+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e3d08e60-7908-497e-8a2a-59c89a96372c', N'TUR', N'Thổ Nhĩ Kỳ', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041376+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041376+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e3ddbca2-7e42-4037-b6cd-984582220760', N'SVN', N'Slovenia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041155+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041156+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e5197057-1864-4077-9cd5-e05980f7da86', N'AFG', N'Afghanistan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7038760+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7038782+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e528072d-04cf-45c7-b85f-8a48e59f8c1d', N'CMR', N'Cameroon', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039646+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039647+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e7c12ae7-7e06-43c2-9180-efc882b66d3e', N'KEN', N'Kenya', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040295+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040296+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ea65e506-9a9c-4197-83bb-56999e9eb540', N'SEN', N'Senegal', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041071+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041072+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'eaa3c035-d989-4c4b-a23c-630f92103cbd', N'ARM', N'Armenia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039124+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039124+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'eb6acaa5-c67b-4d47-a852-83e3fc9527d4', N'NZL', N'New Zealand', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040731+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040732+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ed008386-9987-4f08-a248-9c4f298c52d0', N'GUY', N'Guyana', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040121+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040122+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ed5b4bcf-ab99-4ea9-b12b-1af1adef86d6', N'LTU', N'Lithuania', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040405+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040405+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ee885333-9aeb-410a-8a50-02c3010bf037', N'ESP', N'Tây Ban Nha', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041254+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041254+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ee89b945-c462-4499-b88f-6353db7a667d', N'SUR', N'Suriname', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041272+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041273+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'ef6ce92b-3e89-418d-bff4-ee86a706a66c', N'LIE', N'Liechtenstein', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040396+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040397+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f0eb1f88-8d5c-4802-955a-74527900327d', N'KHM', N'Campuchia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039542+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039543+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f1605e8c-8b74-471e-a4b7-0eb1ba0eae00', N'ATG', N'Antigua và Barbuda', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039109+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039110+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f24920d8-7b1b-4467-a8b4-b54e53a90273', N'COM', N'Comoros', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039719+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039721+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f68168b9-6276-48e4-93f0-2d6fb7634b1a', N'THA', N'Thái Lan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041333+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041334+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f845aad3-a626-40ec-b637-c0380636e237', N'IND', N'Ấn Độ', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040195+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040197+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f8b51c47-fff9-4713-89c3-7078f436c79f', N'PAK', N'Pakistan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040839+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040839+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'faedb1ab-f4ea-471b-9614-b9141d795673', N'BLR', N'Belarus', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039440+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039440+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fc623b46-b4b5-4e75-8be0-d352d92dfd94', N'FRA', N'Pháp', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039963+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039963+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fd12e790-0aa1-4128-9063-e15e4b369468', N'NLD', N'Hà Lan', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7040717+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7040719+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fe0930ff-414e-4039-bb19-d2a4148236ef', N'BHS', N'Bahamas', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7039338+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7039339+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Countries] ([Id], [Code], [Name], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'fff472f1-d513-4bec-809e-226dea123e48', N'SOM', N'Somalia', NULL, NULL, NULL, CAST(N'2025-01-28T23:53:17.7041177+07:00' AS DateTimeOffset), CAST(N'2025-01-28T23:53:17.7041177+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Facilities] ([Id], [Name], [Address], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'Kids Vaccine Hà Nội', N'1 Nguyễn Chí Thanh, Ba Đình, Hà Nội', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), CAST(N'2025-03-26T16:07:30.7797440+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Facilities] ([Id], [Name], [Address], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'Kids Vaccine Quận 1', N'120 Lý Tự Trọng, Quận 1, TP. Hồ Chí Minh', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Facilities] ([Id], [Name], [Address], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'Kids Vaccine Bệnh viện Nhi Trung ương', N'18/879 La Thành, Đống Đa, Hà Nội', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Facilities] ([Id], [Name], [Address], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'D4E5F678-9012-3456-789A-BCDEF0123456', N'Kids Vaccine CarePlus', N'107 Tôn Dật Tiên, Quận 7, TP. Hồ Chí Minh', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Facilities] ([Id], [Name], [Address], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'E5F67890-1234-5678-9ABC-DEF012345678', N'Kids Vaccine Đà Nẵng', N'315 Phan Châu Trinh, Hải Châu, Đà Nẵng', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), CAST(N'2025-03-08T02:41:14.0710328+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Rotarix.jpg', NULL, N'E6891E88-8719-4C5B-9803-65AAA4F9B51C')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'DPT-VGB-Hib.jpg', NULL, N'95944A37-90FF-4FC4-9B04-328DB34DB876')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'VaxigripTetra.jpg', NULL, N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Bexsero.jpg', NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'DPT.jpg', NULL, N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'HepatitisB.jpg', NULL, N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Hexaxim.jpg', NULL, N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Imojev.jpg', NULL, N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'InfanrixHexa.jpg', NULL, N'0DAEF86C-5389-4772-A37B-5C7EB4F64629')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Menactra.jpg', NULL, N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'MMR-II.jpg', NULL, N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'mORCVAX.jpg', NULL, N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'MVVAC.jpg', NULL, N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'PentaximInjection.jpg', NULL, N'97064922-7BCB-4200-8824-BBB7BA963F0A')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'PolioOPV.jpg', NULL, N'06003E99-23E1-4A10-A098-30FD3C5316C2')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Rotateq.jpg', NULL, N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Rotavac.jpeg', NULL, N'73AC9D25-0437-4597-8AD4-75BEB084FB35')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Synflorix.jpg', NULL, N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Tetravac.jpg', NULL, N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Twinrix.jpg', NULL, N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'TyphoidVi.jpg', NULL, N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Varivax.jpg', NULL, N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog1.jpeg', N'15477f5a-26a0-49e9-a2ee-f4e8bf626a18', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog2.jpeg', N'22e99f5d-59d0-4671-a2a2-fadc1791d823', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog3.jpeg', N'80345ba8-f4ca-4d29-b41f-ed85467c3b34', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog4.jpeg', N'444a5dd5-48c1-430e-a777-175aef24a881', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog5.jpeg', N'94b1c8d1-11ea-403e-ae9d-0197711f0d83', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog6.jpeg', N'a6aa86a5-b6f1-4851-9939-d35059b737dd', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog7.jpeg', N'e9d0aabf-2ece-4d87-921c-4312fdbc4751', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog8.jpeg', N'582f4c36-db3b-4b56-b18e-761afdb1bde0', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog9.jpeg', N'a4d51d59-8bc6-4f90-8680-17180ced0b2a', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Blog10.jpeg', N'28866930-3da7-4f66-b4ce-4ba0e6f2cbdf', NULL)
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'HepatitisA.png', NULL, N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'BCG.png', NULL, N'C670B11B-DCE6-41C5-9068-9D897FFF53ED')
GO
INSERT [dbo].[Images] ([ImageSource], [BlogId], [VaccineId]) VALUES (N'Varilrix.png', NULL, N'824a1cf3-3a89-41e3-816e-21045f21c136')
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'05608947-6DBA-40C6-9E62-76690D1FE3E8', N'Merck', N'c43031f2-33e1-434c-bf73-f4d58a5950be', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T14:07:23.8487732+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'0586EEC3-E1B9-43A2-A61F-39C708C67F72', N'Moderna', N'c43031f2-33e1-434c-bf73-f4d58a5950be', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:23:02.1396585+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'113093AB-0A08-4AE5-BBF3-39E6C1A0305B', N'Sinovac', N'871ed699-19b2-4996-801b-dbd0df7c6543', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:25:47.8022925+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'13826925-4656-4db6-a14f-d9f3add7aa49', N'GSK Italy', N'235cf74f-8a0d-4269-acd6-17d49760192b', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'139becd5-62bc-4546-8b72-1f3e5d733f68', N'MSD', N'c43031f2-33e1-434c-bf73-f4d58a5950be', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'28566A25-147A-4BAF-B134-0C638EDDBB05', N'Daiichi Sankyo', N'27e97504-5ac2-450b-b51d-018ff33c5561', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:35:01.5869551+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3a57a595-057c-488c-bdb3-69c0b592fa6f', N'USA', N'c43031f2-33e1-434c-bf73-f4d58a5950be', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'3c9854dc-163a-4d1a-a686-cc6cf53f829c', N'Sanofi Thailand', N'f68168b9-6276-48e4-93f0-2d6fb7634b1a', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'40EBA7C9-A50E-455E-932D-5111FE22F7E0', N'Sinopharm', N'871ed699-19b2-4996-801b-dbd0df7c6543', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:37:16.3648644+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'4e0ebc60-b964-47bd-98ce-35b6a03cf117', N'Hexaxim', N'fc623b46-b4b5-4e75-8be0-d352d92dfd94', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'50AFA630-2396-427E-84E1-75D7061B0CD4', N'Serum Institute of India', N'f845aad3-a626-40ec-b637-c0380636e237', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:37:32.6412115+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'66bee7d1-2204-49ca-8422-d3feb376ba39', N'Sanofi USA', N'c43031f2-33e1-434c-bf73-f4d58a5950be', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'67A1707D-2BB2-462C-8062-EC39297D5ACE', N'Shantha Biotech', N'f845aad3-a626-40ec-b637-c0380636e237', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:37:51.4847944+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'67d91491-0258-47d2-9895-af09eefd36a6', N'Davac', N'ad7b9f0a-3aa5-4e72-bac8-7c89d0ce1752', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6812AC67-9479-4A9D-A059-278B43BA6BC4', N'Vaxigrip Tetra', N'0006c22a-24b3-47ed-ab8d-94e7e128e4db', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T08:46:11.5619929+07:00' AS DateTimeOffset), CAST(N'2025-03-12T08:46:44.2292950+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'6d95c460-3719-4992-92ec-87d29f10c960', N'Abott', N'fd12e790-0aa1-4128-9063-e15e4b369468', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'70B6E2D8-3482-4EEE-BBF2-6689CC5F3F0F', N'GSK Belgium', N'15a71a9a-347c-482b-a207-926a5f1a243e', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:38:13.6258901+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'7A57154C-EC69-47BD-B131-57BD1C3AADAF', N'Chumakov Institute', N'd26d4d37-5a5c-4b9d-b76e-8b1a28d78239', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:39:58.1087883+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'94ac09e5-bd19-467c-aeb7-0f53f91fdb27', N'Vabiotech', N'ad7b9f0a-3aa5-4e72-bac8-7c89d0ce1752', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'9E7C9F30-4CDF-43DA-AB9B-A7E276E224AE', N'Bharat Biotech', N'f845aad3-a626-40ec-b637-c0380636e237', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:40:16.6728777+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'a1b2c3d4-e5f6-789a-1b2c-3d4e5f6789a1', N'Green Cross Corporation', N'9fa9901e-2f5b-4d63-980e-635155dde431', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'A47E412C-A834-4A34-8DD4-774749EC8632', N'AstraZeneca', N'15a71a9a-347c-482b-a207-926a5f1a243e', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:40:34.9197390+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'aaa5f678-9a1b-2c3d-4e5f-6789a1b2c3d4', N'Valneva', N'fc623b46-b4b5-4e75-8be0-d352d92dfd94', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b2c3d4e5-f678-9a1b-2c3d-4e5f6789a1b2', N'Haffkine Bio-Pharmaceutical', N'f845aad3-a626-40ec-b637-c0380636e237', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b5a1b2c3-d4e5-4f67-89a1-bc2d3e4f5678', N'Bio Farma', N'f845aad3-a626-40ec-b637-c0380636e237', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'b6b1648e-be4d-4a67-994e-cfe62d30558b', N'Synflorix', N'2d4e3ae1-8585-416e-93eb-8d4b79d9bcef', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c3d4e5f6-789a-1b2c-3d4e-5f6789a1b2c3', N'Rostec', N'd26d4d37-5a5c-4b9d-b76e-8b1a28d78239', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'c6d7e8f9-a1b2-4c3d-e5f6-789a1b2c3d4e', N'Mitsubishi Tanabe Pharma', N'27e97504-5ac2-450b-b51d-018ff33c5561', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'CDE94190-9783-4F2B-83A8-54D495484786', N'Pfizer', N'c43031f2-33e1-434c-bf73-f4d58a5950be', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:40:51.5448593+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'CF034A0A-93A4-439E-A16B-DD62F1C764D0', N'Pfizer-BioNTech', N'c43031f2-33e1-434c-bf73-f4d58a5950be', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:41:17.8037180+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'd4e5f678-9a1b-2c3d-4e5f-6789a1b2c3d4', N'Eubiologics', N'871ed699-19b2-4996-801b-dbd0df7c6543', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'df0de235-168d-4b4e-ace1-678342c8a7a4', N'Polyvac', N'ad7b9f0a-3aa5-4e72-bac8-7c89d0ce1752', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'e5f6789a-1b2c-3d4e-5f67-89a1b2c3d4e5', N'Medigen Vaccine Biologics', N'54b90315-afa4-4c9e-9446-af6dd1911407', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'E967D6F7-3098-41D1-AAC5-19438FED0B52', N'Sanofi Pasteur', N'fc623b46-b4b5-4e75-8be0-d352d92dfd94', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:41:35.8773348+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'f6789a1b-2c3d-4e5f-6789-a1b2c3d4e5f6', N'Biokangtai', N'871ed699-19b2-4996-801b-dbd0df7c6543', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [CountryId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime]) VALUES (N'FA309EBF-3B7D-45A0-A607-3CDC31EBBB1B', N'Biken Institute', N'27e97504-5ac2-450b-b51d-018ff33c5561', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T02:47:00.7462356+00:00' AS DateTimeOffset), CAST(N'2025-03-10T22:41:55.1124492+07:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'21860987-6706-4fd1-9871-6a9216671cb8', N'06003E99-23E1-4A10-A098-30FD3C5316C2')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'57e0ce82-20be-424f-9994-f17f3159f832', N'06003E99-23E1-4A10-A098-30FD3C5316C2')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'a56f358f-55f4-4406-a70d-5a1e317736d5', N'06003E99-23E1-4A10-A098-30FD3C5316C2')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'e99f5870-5561-41de-bf9d-b11698af7e74', N'06003E99-23E1-4A10-A098-30FD3C5316C2')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'1542f328-3bdf-4679-9d34-3d64b038f85f')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'291a563c-a27c-4cf4-9d9a-8828de396a63')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'21860987-6706-4fd1-9871-6a9216671cb8', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'57e0ce82-20be-424f-9994-f17f3159f832', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'a56f358f-55f4-4406-a70d-5a1e317736d5', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'e99f5870-5561-41de-bf9d-b11698af7e74', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'4b0c6d67-754e-4248-9a1a-5411e2133127')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'21860987-6706-4fd1-9871-6a9216671cb8', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'21860987-6706-4fd1-9871-6a9216671cb8', N'73AC9D25-0437-4597-8AD4-75BEB084FB35')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'57e0ce82-20be-424f-9994-f17f3159f832', N'73AC9D25-0437-4597-8AD4-75BEB084FB35')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'e99f5870-5561-41de-bf9d-b11698af7e74', N'73AC9D25-0437-4597-8AD4-75BEB084FB35')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'824a1cf3-3a89-41e3-816e-21045f21c136')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'824a1cf3-3a89-41e3-816e-21045f21c136')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'824a1cf3-3a89-41e3-816e-21045f21c136')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'824a1cf3-3a89-41e3-816e-21045f21c136')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'21860987-6706-4fd1-9871-6a9216671cb8', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'57e0ce82-20be-424f-9994-f17f3159f832', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'966e2a67-fc91-40d7-9ed5-1785767e35bc')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'21860987-6706-4fd1-9871-6a9216671cb8', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'57e0ce82-20be-424f-9994-f17f3159f832', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'a56f358f-55f4-4406-a70d-5a1e317736d5', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'e99f5870-5561-41de-bf9d-b11698af7e74', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'21860987-6706-4fd1-9871-6a9216671cb8', N'C670B11B-DCE6-41C5-9068-9D897FFF53ED')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'57e0ce82-20be-424f-9994-f17f3159f832', N'C670B11B-DCE6-41C5-9068-9D897FFF53ED')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'a56f358f-55f4-4406-a70d-5a1e317736d5', N'C670B11B-DCE6-41C5-9068-9D897FFF53ED')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'e99f5870-5561-41de-bf9d-b11698af7e74', N'C670B11B-DCE6-41C5-9068-9D897FFF53ED')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'E6891E88-8719-4C5B-9803-65AAA4F9B51C')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'E6891E88-8719-4C5B-9803-65AAA4F9B51C')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'E6891E88-8719-4C5B-9803-65AAA4F9B51C')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'E6891E88-8719-4C5B-9803-65AAA4F9B51C')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'ec604181-97c7-4955-8f83-993dcc1f6efb')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[PackageItems] ([PackageId], [VaccineId]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'fda9985a-7fea-487d-9e54-1bac6c598574')
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'07dbce61-80f2-4a1c-81a6-53ae24286b6c', N'Gói 7: Hexaxim – Rotateq – Varivax', 16959400, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:43:26.9471773+07:00' AS DateTimeOffset), NULL, 7)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'21860987-6706-4fd1-9871-6a9216671cb8', N'Gói 12: Bảo vệ trẻ sơ sinh cao cấp', 4003650, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:47:35.3555422+07:00' AS DateTimeOffset), NULL, 12)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'4b424aea-7e55-49a3-ad1e-0b4e6314eacd', N'Gói 1: Hexaxim – Rotarix – Varilrix', 17941780, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-27T11:18:16.1728414+07:00' AS DateTimeOffset), NULL, 1)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'4f309117-0f9c-42cc-bd53-db514cb2fcd7', N'Gói 2: Hexaxim – Rotateq – Varilrix', 16854900, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:24:12.9542552+07:00' AS DateTimeOffset), NULL, 2)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'57e0ce82-20be-424f-9994-f17f3159f832', N'Gói 11: Tiêm chủng thiết yếu cho trẻ mới biết đi', 2949750, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:47:09.6164823+07:00' AS DateTimeOffset), NULL, 11)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'7ee69ca0-05b6-424b-a3c3-07bec0e37301', N'Gói 6: Infanrix Hexa – Rotateq – Varivax', 18430000, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:39:46.5587864+07:00' AS DateTimeOffset), NULL, 6)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'8a8a5c1e-ae25-4939-9bbe-1876d8ae59e1', N'Gói 3: Infanrix Hexa – Rotateq – Varilrix', 18667500, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:30:36.9833985+07:00' AS DateTimeOffset), NULL, 3)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'a56f358f-55f4-4406-a70d-5a1e317736d5', N'Gói 9: Tiêm chủng cơ bản cho trẻ sơ sinh', 1944000, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:45:46.5528078+07:00' AS DateTimeOffset), NULL, 9)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'aaceebcc-af5c-4eae-bbed-644d1ccda8a1', N'Gói 4: Infanrix Hexa – Rotarix – Varilrix', 19396900, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:35:34.2995401+07:00' AS DateTimeOffset), NULL, 4)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'b573a268-e08f-4c4a-8388-c4444c21e701', N'Gói 8: Hexaxim – Rotarix – Varivax', 17895150, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:44:59.0741659+07:00' AS DateTimeOffset), NULL, 8)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'd4e4eb17-58e2-47c1-825e-5ee0d0ede5dc', N'Gói 5: Infanrix Hexa – Rotarix – Varivax', 19569600, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:37:39.1698519+07:00' AS DateTimeOffset), NULL, 5)
GO
INSERT [dbo].[Packages] ([Id], [Name], [Price], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Order]) VALUES (N'e99f5870-5561-41de-bf9d-b11698af7e74', N'Gói 10: Tiêm chủng thiết yếu cho trẻ mới biết đi', 2737000, N'', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-27T13:46:20.2367016+07:00' AS DateTimeOffset), NULL, 10)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'0CCC762A-B2C9-49ED-990E-D12D670D0768', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:43.2810378+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:43.2810378+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'824a1cf3-3a89-41e3-816e-21045f21c136', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'16808031-54C8-4F73-B70F-E066D4981D5A', 2900000, CAST(N'2025-03-31' AS Date), N'', 0, N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', N'0dcc3e1e-5856-42c9-93a1-969a6fc3f4d9', NULL, NULL, N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', NULL, CAST(N'2025-03-25T00:00:49.9333053+07:00' AS DateTimeOffset), CAST(N'2025-03-26T17:49:18.8135590+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'1D214E43-0A6A-49E1-904E-CBEAA0A9F2B7', 140000, CAST(N'2025-02-14' AS Date), N'', 6, N'B273136D-28D4-48BF-9AB4-0CAA10931C0A', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-14T15:57:38.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-14T15:57:38.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'95944A37-90FF-4FC4-9B04-328DB34DB876', N'E5F67890-1234-5678-9ABC-DEF012345678', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'23EE0F7E-81AE-4B6E-9607-15C16FEB503B', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:45.3392560+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:45.3392560+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'2770AD36-78F7-4081-9DCC-8137F67EFDAE', 3000000, CAST(N'2025-03-26' AS Date), N'', 6, N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', N'0dcc3e1e-5856-42c9-93a1-969a6fc3f4d9', NULL, NULL, N'59FDBB20-83C4-4C64-A47C-0A85B9BE7348', NULL, CAST(N'2025-03-23T21:37:27.7174140+07:00' AS DateTimeOffset), CAST(N'2025-03-25T23:31:35.6621246+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'2913A7B9-1A3D-43DA-8229-1081EE0638AF', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:44.5181343+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:44.5181343+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'29D996E3-8C62-4C92-9259-764BB3AE201A', 3000000, CAST(N'2025-03-22' AS Date), N'', 0, N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', NULL, NULL, NULL, N'A912E964-7C09-443F-BE85-47D73F9A8A87', NULL, CAST(N'2025-03-22T17:37:38.7052252+07:00' AS DateTimeOffset), CAST(N'2025-03-25T23:41:30.0847850+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'2E5AFC7F-B8E6-49EC-B69F-974E7B1BBA75', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:45.3392588+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:45.3392588+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'316B468F-7AC2-458E-879E-856DB81E5BFB', 0, CAST(N'2025-09-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:45.3392595+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:45.3392595+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', NULL, 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'33960BC6-F7B7-4873-B175-55AA9A36DFEA', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:43.6969117+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:43.6969117+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'966e2a67-fc91-40d7-9ed5-1785767e35bc', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'34CB2C5F-8A00-4DD1-8C3F-A19CB6F6FC54', 1750000, CAST(N'2025-03-30' AS Date), N'', 1, N'DBF8A8B1-E49D-4A76-A8B2-B402BA224FE9', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T07:53:04.7745042+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:53:04.7745042+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'3E163D7D-E2BC-42D2-BB8F-B52EED503FF4', 1750000, CAST(N'2025-03-28' AS Date), N'', 4, N'B1285959-E5D6-4A4E-81E8-7BE1044D3771', N'0dcc3e1e-5856-42c9-93a1-969a6fc3f4d9', NULL, NULL, N'53E587D1-0932-426C-A3AA-2D88B5546862', NULL, CAST(N'2025-03-28T22:36:06.5786152+07:00' AS DateTimeOffset), CAST(N'2025-03-28T23:53:45.6681337+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'473B2377-636C-4938-B8D4-B9B9C54D51BB', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:41.2285781+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:41.2285781+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'1542f328-3bdf-4679-9d34-3d64b038f85f', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'4E07532B-33E5-431F-8D7B-FD5D2D012380', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:44.9287490+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:44.9287490+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'51F575AD-2B3A-4DBB-85BA-0F9CE295CFE9', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:42.4598875+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:42.4598875+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'5249153C-E356-4A93-A711-93940197149A', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:41.2285811+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:41.2285811+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'1542f328-3bdf-4679-9d34-3d64b038f85f', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'58A8D74F-2A8F-4AE3-98ED-82D166524C64', 160000, CAST(N'2024-11-10' AS Date), N'', 6, N'6C43544D-F1B0-4B79-895A-F4442002A1C1', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-11-10T14:12:09.0000000+00:00' AS DateTimeOffset), CAST(N'2024-11-10T14:12:09.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'60F2AC58-EE71-4BBE-8150-21F16355502D', 0, CAST(N'2025-09-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:43.6969123+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:43.6969123+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'966e2a67-fc91-40d7-9ed5-1785767e35bc', NULL, 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'6139DC17-3E59-49DB-A302-57C3A8748F7B', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:42.8706303+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:42.8706303+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'64968D12-54BF-4656-9D66-57B28A6E3473', 3000000, CAST(N'2025-10-01' AS Date), N'', 1, N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-22T17:37:38.7055033+07:00' AS DateTimeOffset), CAST(N'2025-03-22T17:37:38.7055033+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', NULL, 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'666AACD1-74A2-4D32-BFF4-30CD9869963A', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:44.5181315+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:44.5181315+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'68E4742C-0A0A-4625-BC2D-C97FF262141A', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:41.6389045+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:41.6389045+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'291a563c-a27c-4cf4-9d9a-8828de396a63', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'7079E5FE-2D9A-48F1-933F-B446B4E09EB3', 1750000, CAST(N'2025-06-30' AS Date), N'', 1, N'08F3A565-93C4-4F27-BAFA-76F7F2C92BCA', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T07:34:47.2053187+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:34:47.2053187+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'7169CB04-93E6-4E07-BABA-FFE0DB747096', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:43.6969089+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:43.6969089+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'966e2a67-fc91-40d7-9ed5-1785767e35bc', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'71C89B8C-8B1D-4B40-AC2F-01F73BB6F614', 1045000, CAST(N'2024-12-24' AS Date), N'', 6, N'10FF3D03-6D3B-4A0F-86A2-26BAC6BFF03D', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-12-24T11:55:37.0000000+00:00' AS DateTimeOffset), CAST(N'2024-12-24T11:55:37.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'966e2a67-fc91-40d7-9ed5-1785767e35bc', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'734B5A02-B15E-4A43-BF3B-84F24C7D15D3', 900000, CAST(N'2024-07-30' AS Date), N'', 6, N'0AAE17BC-79E4-4792-9E38-8B0E597DA1E9', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-07-30T12:22:45.0000000+00:00' AS DateTimeOffset), CAST(N'2024-07-30T12:22:45.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'7A2B08E7-C3F5-42D9-825B-C256990A91C7', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:42.4598903+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:42.4598903+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'7E6C3A32-2D9A-4B98-9294-B2F184F690EC', 285000, CAST(N'2024-08-29' AS Date), N'', 6, N'E81ACD7E-6B8C-4A74-8E8E-8F6713F822C1', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-08-29T09:42:58.0000000+00:00' AS DateTimeOffset), CAST(N'2024-08-29T09:42:58.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'824a1cf3-3a89-41e3-816e-21045f21c136', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'804AAD74-ADFA-4271-A30B-971413B3B874', 3000000, CAST(N'2025-03-31' AS Date), N'', 9, N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', NULL, NULL, NULL, N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', NULL, CAST(N'2025-03-23T23:31:43.5959305+07:00' AS DateTimeOffset), CAST(N'2025-03-26T17:52:08.4407823+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'841E3851-769C-4983-8532-B21D549FC8B1', 1750000, CAST(N'2025-09-30' AS Date), N'', 1, N'08F3A565-93C4-4F27-BAFA-76F7F2C92BCA', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T07:34:47.2053194+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:34:47.2053194+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', NULL, 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'87F4A48E-4E53-4FC2-A3D1-8EBA4A0B70D8', 1750000, CAST(N'2025-03-28' AS Date), N'', 3, N'B1285959-E5D6-4A4E-81E8-7BE1044D3771', N'0dcc3e1e-5856-42c9-93a1-969a6fc3f4d9', NULL, NULL, N'0DCC3E1E-5856-42C9-93A1-969A6FC3F4D9', NULL, CAST(N'2025-03-28T22:36:06.5786158+07:00' AS DateTimeOffset), CAST(N'2025-03-28T23:59:36.2625331+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'8EDBE286-49F6-4277-B81D-6447C35FFADC', 1750000, CAST(N'2025-03-28' AS Date), N'', 6, N'B1285959-E5D6-4A4E-81E8-7BE1044D3771', N'0dcc3e1e-5856-42c9-93a1-969a6fc3f4d9', NULL, NULL, N'D3C7798A-3087-43F2-B6AE-AC338F45ADD4', NULL, CAST(N'2025-03-28T22:36:06.5786121+07:00' AS DateTimeOffset), CAST(N'2025-03-28T22:45:06.9085777+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'906E2361-9D44-4EEE-9A49-E0F4F2BE32BC', 1750000, CAST(N'2025-06-30' AS Date), N'', 0, N'DBF8A8B1-E49D-4A76-A8B2-B402BA224FE9', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T07:53:04.7745067+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:53:04.7745067+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'92BF92D3-AD12-47F0-BD6D-918B99C7B3C5', 1045000, CAST(N'2025-01-25' AS Date), N'', 6, N'E81ACD7E-6B8C-4A74-8E8E-8F6713F822C1', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-01-25T10:30:55.0000000+00:00' AS DateTimeOffset), CAST(N'2025-01-25T10:30:55.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'966e2a67-fc91-40d7-9ed5-1785767e35bc', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'97AA0761-DA61-4634-9D5E-67C28276E6D2', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:41.6389015+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:41.6389015+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'291a563c-a27c-4cf4-9d9a-8828de396a63', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'99DC4994-D71D-4556-AD1E-5D83AB217885', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:44.1075845+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:44.1075845+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'9B82F65E-763D-4E4D-B4D2-7B0C5A6E9B43', 365000, CAST(N'2024-08-05' AS Date), NULL, 6, N'10FF3D03-6D3B-4A0F-86A2-26BAC6BFF03D', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-08-05T14:45:00.0000000+00:00' AS DateTimeOffset), CAST(N'2024-08-05T14:45:00.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'1542f328-3bdf-4679-9d34-3d64b038f85f', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'9E59FB37-8EE8-4AAD-A629-52BAA5484B2F', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:42.0495644+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:42.0495644+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'4b0c6d67-754e-4248-9a1a-5411e2133127', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'9F04F457-7418-4DBF-9031-2F0B02C22AAE', 0, CAST(N'2025-12-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:43.6969129+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:43.6969129+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'966e2a67-fc91-40d7-9ed5-1785767e35bc', NULL, 4)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'A67C5C45-917B-4A3E-9017-2B1A2A72E62C', 360000, CAST(N'2025-02-05' AS Date), N'', 6, N'10FF3D03-6D3B-4A0F-86A2-26BAC6BFF03D', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-08-12T09:55:34.0000000+00:00' AS DateTimeOffset), CAST(N'2024-08-12T09:55:34.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'fda9985a-7fea-487d-9e54-1bac6c598574', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'AB61E0D3-4F72-4D97-84E7-B8C921FECF74', 825000, CAST(N'2024-09-20' AS Date), NULL, 6, N'6C43544D-F1B0-4B79-895A-F4442002A1C1', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-20T09:20:00.0000000+00:00' AS DateTimeOffset), CAST(N'2024-09-20T09:20:00.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', N'D4E5F678-9012-3456-789A-BCDEF0123456', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'B18E8F54-50A6-4A0D-B276-AB562C9CF331', 140000, CAST(N'2025-02-07' AS Date), N'', 6, N'6C43544D-F1B0-4B79-895A-F4442002A1C1', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-07T17:18:45.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-07T17:18:45.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'95944A37-90FF-4FC4-9B04-328DB34DB876', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'B289D561-745C-45BC-86E4-C38D5C7F85B4', 875000, CAST(N'2024-11-20' AS Date), N'', 6, N'6C43544D-F1B0-4B79-895A-F4442002A1C1', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-08-13T11:30:45.0000000+00:00' AS DateTimeOffset), CAST(N'2024-08-13T11:30:45.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'291a563c-a27c-4cf4-9d9a-8828de396a63', N'D4E5F678-9012-3456-789A-BCDEF0123456', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'B3DE6B83-0021-4D74-9F78-5F8DAB140E53', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:43.2810420+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:43.2810420+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'824a1cf3-3a89-41e3-816e-21045f21c136', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'B6B264E6-432E-4425-A261-4E8B8EB9471B', 0, CAST(N'2026-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:40.8176320+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:40.8176320+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'BA3F96D0-338E-487F-A97E-6E73B4BEC068', 0, CAST(N'2025-12-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:42.4598924+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:42.4598924+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', NULL, 4)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'BC278D5E-2358-4E8B-AC48-468E0D9D9AAC', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:44.1075923+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:44.1075923+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'C1629F34-4400-4C0A-B380-225A3FDC6772', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:44.9287520+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:44.9287520+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'C6D382A7-728A-41A4-A9E5-3F4E9C2D65FA', 900000, CAST(N'2024-10-12' AS Date), NULL, 6, N'A00772E1-F8B7-469A-950C-2CCE357F56ED', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-10-12T16:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2024-10-12T16:00:00.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', N'E5F67890-1234-5678-9ABC-DEF012345678', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'C791F24A-3B79-4B41-8D4C-8F40C16C6B4B', 1045000, CAST(N'2024-09-29' AS Date), N'', 6, N'A00772E1-F8B7-469A-950C-2CCE357F56ED', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-08-14T07:15:12.0000000+00:00' AS DateTimeOffset), CAST(N'2024-08-14T07:15:12.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'966e2a67-fc91-40d7-9ed5-1785767e35bc', N'E5F67890-1234-5678-9ABC-DEF012345678', 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'C9784169-2727-45B6-AE7E-EF3AA3997DBB', 3000000, CAST(N'2025-03-26' AS Date), N'', 6, N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', NULL, NULL, NULL, N'59FDBB20-83C4-4C64-A47C-0A85B9BE7348', NULL, CAST(N'2025-03-23T23:31:43.5959322+07:00' AS DateTimeOffset), CAST(N'2025-03-26T07:39:36.9194086+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'CDF46AF7-AF5D-40B4-9283-078A5450EA8C', 0, CAST(N'2025-09-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:42.4598919+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:42.4598919+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', NULL, 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'CF706B3A-F8C5-4203-891F-79F4A22700AC', 3000000, CAST(N'2025-07-01' AS Date), N'', 6, N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-22T17:37:38.7054987+07:00' AS DateTimeOffset), CAST(N'2025-03-22T17:37:38.7054987+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'D56E4071-29FE-45F1-8AC2-A5378B3629E2', 1750000, CAST(N'2025-03-29' AS Date), N'', 6, N'08F3A565-93C4-4F27-BAFA-76F7F2C92BCA', N'd6e644d6-5143-49c9-98e2-be387ba2bac7', N'ed81a1b5-fd8a-434b-85a0-b81985a09418', NULL, N'7CF4B1B0-1330-44AF-8698-49C590C6DE67', NULL, CAST(N'2025-03-29T07:34:47.2053161+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:46:09.3274549+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'DD0046A0-D96F-46BA-B148-0A9E819C7713', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:45.7497886+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:45.7497886+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'fda9985a-7fea-487d-9e54-1bac6c598574', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'E079EF87-AC50-4FBA-816F-6758910BCB65', 0, CAST(N'2025-03-31' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:40.8176226+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:40.8176226+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', NULL, 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'E0B52A97-4F7D-4F3F-9A32-3E2C56B3F799', 110000, CAST(N'2024-06-15' AS Date), NULL, 6, N'0AAE17BC-79E4-4792-9E38-8B0E597DA1E9', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-15T08:30:00.0000000+00:00' AS DateTimeOffset), CAST(N'2024-06-15T08:30:00.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'E11688D6-20F8-4B96-9DD6-F4F3C3B8E3D4', 365000, CAST(N'2024-12-20' AS Date), N'', 6, N'A00772E1-F8B7-469A-950C-2CCE357F56ED', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-12-20T08:46:21.0000000+00:00' AS DateTimeOffset), CAST(N'2024-12-20T08:46:21.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'1542f328-3bdf-4679-9d34-3d64b038f85f', N'D4E5F678-9012-3456-789A-BCDEF0123456', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'E315C20E-217B-4BDE-840F-630497A46B0E', 3000000, CAST(N'2025-03-25' AS Date), N'', 6, N'F7DA4F66-67A0-41FB-899B-79E677B95AD0', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-23T23:31:43.5959279+07:00' AS DateTimeOffset), CAST(N'2025-03-23T23:31:43.5959279+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'E4EE9594-D407-480A-8CCB-D036BF0C9EC6', 1750000, CAST(N'2025-09-30' AS Date), N'', 0, N'DBF8A8B1-E49D-4A76-A8B2-B402BA224FE9', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T07:53:04.7745073+07:00' AS DateTimeOffset), CAST(N'2025-03-29T07:53:04.7745073+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'ec604181-97c7-4955-8f83-993dcc1f6efb', NULL, 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'E6B601D1-5727-4709-BEE1-493D514B15D2', 900000, CAST(N'2024-12-10' AS Date), N'', 6, N'0AAE17BC-79E4-4792-9E38-8B0E597DA1E9', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-08-10T08:43:21.0000000+00:00' AS DateTimeOffset), CAST(N'2024-08-10T08:43:21.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'E9247C99-6699-4A5E-BB6A-6B72DA2872BB', 825000, CAST(N'2024-11-15' AS Date), N'', 6, N'B273136D-28D4-48BF-9AB4-0CAA10931C0A', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-11-15T08:34:22.0000000+00:00' AS DateTimeOffset), CAST(N'2024-11-15T08:34:22.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', N'D4E5F678-9012-3456-789A-BCDEF0123456', 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'EC1D8C42-82BE-4E6B-9316-4E5C2B4F4168', 360000, CAST(N'2024-09-09' AS Date), N'', 6, N'0AAE17BC-79E4-4792-9E38-8B0E597DA1E9', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-09T14:22:09.0000000+00:00' AS DateTimeOffset), CAST(N'2024-09-09T14:22:09.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'fda9985a-7fea-487d-9e54-1bac6c598574', N'E5F67890-1234-5678-9ABC-DEF012345678', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'F49B329C-EE0E-4C8C-BE3E-ED763B87D5B3', 160000, CAST(N'2025-01-15' AS Date), N'', 6, N'0E59C60E-BB89-458D-BECA-7BC1F319CE5D', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-08-11T14:22:10.0000000+00:00' AS DateTimeOffset), CAST(N'2024-08-11T14:22:10.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'97064922-7BCB-4200-8824-BBB7BA963F0A', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', 3)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'F74A9201-1D62-4C38-8E8A-6A1F3E8C5A7E', 140000, CAST(N'2024-07-10' AS Date), NULL, 6, N'0E59C60E-BB89-458D-BECA-7BC1F319CE5D', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-07-10T10:15:00.0000000+00:00' AS DateTimeOffset), CAST(N'2024-07-10T10:15:00.0000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'95944A37-90FF-4FC4-9B04-328DB34DB876', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', 1)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'FD49EE43-0C79-48A5-873D-73DC1EAB44AA', 0, CAST(N'2025-06-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:42.0495674+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:42.0495674+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'4b0c6d67-754e-4248-9a1a-5411e2133127', NULL, 2)
GO
INSERT [dbo].[Vaccinations] ([Id], [Price], [Schedule], [Note], [Status], [ChildId], [DoctorId], [VaccinatorId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [PaymentType], [PaymentLocation], [PaymentMethod], [VaccineId], [FacilityId], [CurrentSequence]) VALUES (N'FE52076C-8BFF-4336-B79E-242F57CE84F7', 0, CAST(N'2025-09-30' AS Date), N'', 1, N'BA1AC94D-1DFF-4320-9A38-CE6A885E1FE3', NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-29T00:51:42.0495680+07:00' AS DateTimeOffset), CAST(N'2025-03-29T00:51:42.0495680+07:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, N'4b0c6d67-754e-4248-9a1a-5411e2133127', NULL, 3)
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B0652248', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 300, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B184119', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 12, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5519600', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 123, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 9, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B0652248', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 300, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B0652251', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 10, CAST(N'2025-03-08' AS Date), CAST(N'2025-03-08' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B184119', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 47, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B184119', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 42, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 9, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B184119', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 35, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B3148521', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 20, CAST(N'2025-03-08' AS Date), CAST(N'2025-03-08' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B184119', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 26, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 9, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B184119', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 39, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B184119', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 42, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B184119', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 39, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5319340', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 50, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'824a1cf3-3a89-41e3-816e-21045f21c136', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5319340', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', 49, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d', 9, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5319340', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'95944A37-90FF-4FC4-9B04-328DB34DB876', 50, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'95944A37-90FF-4FC4-9B04-328DB34DB876', 9, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'966e2a67-fc91-40d7-9ed5-1785767e35bc', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'97064922-7BCB-4200-8824-BBB7BA963F0A', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5319340', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC', 49, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC', 9, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5319340', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'C670B11B-DCE6-41C5-9068-9D897FFF53ED', 50, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', 9, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B0652248', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'ec604181-97c7-4955-8f83-993dcc1f6efb', 296, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5912321', N'A1B2C3D4-E5F6-7890-1234-56789ABCDEF0', N'fda9985a-7fea-487d-9e54-1bac6c598574', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B1148872', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 50, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 7, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 9, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 12, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 49, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B0136144', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 50, CAST(N'2025-03-24' AS Date), CAST(N'2026-03-24' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 30, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 43, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 8, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 5, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 15, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 46, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 11, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'824a1cf3-3a89-41e3-816e-21045f21c136', 41, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', 32, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d', 50, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'95944A37-90FF-4FC4-9B04-328DB34DB876', 8, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'966e2a67-fc91-40d7-9ed5-1785767e35bc', 24, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'97064922-7BCB-4200-8824-BBB7BA963F0A', 36, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9', 25, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', 9, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B094121', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC', 45, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B1148872', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'C670B11B-DCE6-41C5-9068-9D897FFF53ED', 50, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B1920631', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', 10, CAST(N'2025-03-22' AS Date), CAST(N'2026-03-22' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B1148872', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'ec604181-97c7-4955-8f83-993dcc1f6efb', 49, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B1148872', N'B2C3D4E5-F678-9012-3456-789ABCDEF012', N'fda9985a-7fea-487d-9e54-1bac6c598574', 50, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 10, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 36, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 24, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 31, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 21, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 24, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 38, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 48, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 14, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 33, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 47, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 20, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 36, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 19, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 32, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 33, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 3, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224121', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 9, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 44, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 26, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 2, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'824a1cf3-3a89-41e3-816e-21045f21c136', 38, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'824a1cf3-3a89-41e3-816e-21045f21c136', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', 27, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d', 26, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B224122', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'95944A37-90FF-4FC4-9B04-328DB34DB876', 19, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'95944A37-90FF-4FC4-9B04-328DB34DB876', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'966e2a67-fc91-40d7-9ed5-1785767e35bc', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'97064922-7BCB-4200-8824-BBB7BA963F0A', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'C670B11B-DCE6-41C5-9068-9D897FFF53ED', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'ec604181-97c7-4955-8f83-993dcc1f6efb', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5600874', N'C3D4E5F6-7890-1234-5678-9ABCDEF01234', N'fda9985a-7fea-487d-9e54-1bac6c598574', 10, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 1, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 4, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 9, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 33, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 8, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 50, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 26, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 3, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 21, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 18, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 46, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 37, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 20, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 2, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'824a1cf3-3a89-41e3-816e-21045f21c136', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'824a1cf3-3a89-41e3-816e-21045f21c136', 1, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'824a1cf3-3a89-41e3-816e-21045f21c136', 3, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', 34, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794122', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', 37, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d', 50, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'95944A37-90FF-4FC4-9B04-328DB34DB876', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'95944A37-90FF-4FC4-9B04-328DB34DB876', 47, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'966e2a67-fc91-40d7-9ed5-1785767e35bc', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'966e2a67-fc91-40d7-9ed5-1785767e35bc', 9, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'97064922-7BCB-4200-8824-BBB7BA963F0A', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'97064922-7BCB-4200-8824-BBB7BA963F0A', 49, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9', 18, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B794121', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', 27, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'C670B11B-DCE6-41C5-9068-9D897FFF53ED', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'ec604181-97c7-4955-8f83-993dcc1f6efb', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B5828184', N'D4E5F678-9012-3456-789A-BCDEF0123456', N'fda9985a-7fea-487d-9e54-1bac6c598574', 11, CAST(N'2025-03-28' AS Date), CAST(N'2026-03-28' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 16, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'06003E99-23E1-4A10-A098-30FD3C5316C2', 42, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 45, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', 28, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 19, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', 19, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 36, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'1542f328-3bdf-4679-9d34-3d64b038f85f', 28, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 1, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', 1, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 48, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'291a563c-a27c-4cf4-9d9a-8828de396a63', 34, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 40, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', 26, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 4, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'4b0c6d67-754e-4248-9a1a-5411e2133127', 7, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 49, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', 38, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 40, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', 39, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 45, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', 28, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 47, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'73AC9D25-0437-4597-8AD4-75BEB084FB35', 43, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68670', N'E5F67890-1234-5678-9ABC-DEF012345678', N'824a1cf3-3a89-41e3-816e-21045f21c136', 46, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'824a1cf3-3a89-41e3-816e-21045f21c136', 31, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[VaccineInventory] ([BatchNumber], [FacilityId], [VaccineId], [Stock], [ImportedDate], [ExpiryDate]) VALUES (N'B68696', N'E5F67890-1234-5678-9ABC-DEF012345678', N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC', 10, CAST(N'2025-03-26' AS Date), CAST(N'2026-03-26' AS Date))
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'06003E99-23E1-4A10-A098-30FD3C5316C2', N'Polio OPV', 115000, N'Vaccine bại liệt OPV', 0, 6, 2, N'1221E47C-47EA-4438-B66C-870EB840E64C', N'28566A25-147A-4BAF-B134-0C638EDDBB05', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-15T21:28:11.2513988+07:00' AS DateTimeOffset), NULL, 1, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'0DAEF86C-5389-4772-A37B-5C7EB4F64629', N'Infanrix Hexa', 996000, N'Vaccine phối hợp 6 bệnh Infanrix Hexa', 1, 6, 3, N'75321B80-40EC-48F1-BCA6-F04F79C51EC0', N'70B6E2D8-3482-4EEE-BBF2-6689CC5F3F0F', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-09T22:35:25.8837193+07:00' AS DateTimeOffset), CAST(N'2025-03-12T09:16:03.6068526+07:00' AS DateTimeOffset), NULL, 0.5, 3)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'0de120c4-50ef-4a43-bd79-ffee9d2e67fc', N'MMR-II', 150000, N'Vaccine phòng bệnh sởi, quai bị, rubella', 2, 24, 12, N'6ECE2D79-491A-4CCC-BD98-694D0D1E74F5', N'3a57a595-057c-488c-bdb3-69c0b592fa6f', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'1542f328-3bdf-4679-9d34-3d64b038f85f', N'Twinrix', 365000, N'Vaccine phòng viêm gan A và B', 1, 6, 3, N'A3484E7D-6B24-410B-9984-C60B6EFA46ED', N'70B6E2D8-3482-4EEE-BBF2-6689CC5F3F0F', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 1, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'1b106a81-dc0c-4ce6-b45f-61ef29a4e062', N'Varivax', 160000, N'Vaccine phòng bệnh thủy đậu', 2, 72, 3, N'EAB5F41E-5DB6-417A-846A-F136C6C8E78F', N'3a57a595-057c-488c-bdb3-69c0b592fa6f', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'291a563c-a27c-4cf4-9d9a-8828de396a63', N'Imojev', 875000, N'Vaccine phòng viêm não Nhật Bản', 1, 6, 3, N'F5F35035-1C04-46FD-BCED-CB0F74486852', N'3c9854dc-163a-4d1a-a686-cc6cf53f829c', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'2B74A887-2FC7-4FB6-BC1F-7D6A2C55B6EA', N'DPT', 900000, N'Vaccine phối hợp phòng bệnh DPT', 2, 6, 2, N'2C08DE0D-6D4D-45A6-9EEF-F1B69326689C', N'df0de235-168d-4b4e-ace1-678342c8a7a4', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL, 0.5, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'4b0c6d67-754e-4248-9a1a-5411e2133127', N'Vaxigrip tetra', 360000, N'Vaccine cúm Vaxigrip tetra', 1, 6, 3, N'7A23DEB4-479A-4629-B2D8-15D134D6C8B0', N'6d95c460-3719-4992-92ec-87d29f10c960', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 3)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'55d6ca76-624b-4cec-9d1a-bbec1ed23da3', N'Hexaxim', 360000, N'Vaccine Hexaxim', 1, 6, 3, N'9A049686-A1AB-465A-99E2-036D20AF35E5', N'4e0ebc60-b964-47bd-98ce-35b6a03cf117', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 4)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'56EFB158-3F50-48B0-8D4D-1E6942D7DD3C', N'Tetravac', 1200000, N'Vaccine Tetravac', 2, 6, 2, N'75321B80-40EC-48F1-BCA6-F04F79C51EC0', N'E967D6F7-3098-41D1-AAC5-19438FED0B52', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL, 0.5, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'67131211-ae5e-45ea-9c60-7b0ed93e2fad', N'Typhoid Vi', 345000, N'Vaccine phòng thương hàn Typhoid Vi', 1, 6, 3, N'F85518BB-9D74-4617-A812-412A8142F6FB', N'67d91491-0258-47d2-9895-af09eefd36a6', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'73AC9D25-0437-4597-8AD4-75BEB084FB35', N'Rotavac', 950000, N'Vaccine phòng tiêu chảy do rota Rotavac', 2, 6, 2, N'924ED742-5CFD-4D94-81EB-857EBFB6321E', N'9E7C9F30-4CDF-43DA-AB9B-A7E276E224AE', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL, 5, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'824a1cf3-3a89-41e3-816e-21045f21c136', N'Varilrix', 285000, N'Vaccine phòng bệnh thủy đậu Varilrix', 1, 6, 3, N'EAB5F41E-5DB6-417A-846A-F136C6C8E78F', N'139becd5-62bc-4546-8b72-1f3e5d733f68', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'8BF7E70D-B5C2-4868-A2AE-60DCF021737B', N'Hepatitis A', 130000, N'Vaccine viêm gan A', 1, 6, 12, N'A3484E7D-6B24-410B-9984-C60B6EFA46ED', N'FA309EBF-3B7D-45A0-A607-3CDC31EBBB1B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL, 1, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'92a85998-a5fc-4f7c-ad80-6d1d7376c21d', N'Rotateq', 665000, N'Vaccine Rotateq', 2, 18, 3, N'924ED742-5CFD-4D94-81EB-857EBFB6321E', N'3a57a595-057c-488c-bdb3-69c0b592fa6f', N'
5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 2, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'95944A37-90FF-4FC4-9B04-328DB34DB876', N'DPT-VGB-Hib', 140000, N'Vaccine DPT-VGB-Hib', 2, 6, 2, N'75321B80-40EC-48F1-BCA6-F04F79C51EC0', N'df0de235-168d-4b4e-ace1-678342c8a7a4', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL, 0.5, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'966e2a67-fc91-40d7-9ed5-1785767e35bc', N'Synflorix', 1045000, N'Vaccine phòng viêm phổi Synflorix', 1, 6, 3, N'BC3F03C3-BCC5-4459-87EF-8EBB41E7BB8B', N'b6b1648e-be4d-4a67-994e-cfe62d30558b', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 4)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'97064922-7BCB-4200-8824-BBB7BA963F0A', N'Pentaxim', 160000, N'Vaccine Pentaxim', 2, 6, 2, N'75321B80-40EC-48F1-BCA6-F04F79C51EC0', N'E967D6F7-3098-41D1-AAC5-19438FED0B52', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL, 0.5, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'a615bcaf-fd9e-4742-8ce0-4b26bd1f41f9', N'mOrcvax', 376000, N'Vaccine mOrcvax', 1, 6, 3, N'A0D2C65B-182F-4FF5-BAA7-74BAAD578755', N'94ac09e5-bd19-467c-aeb7-0f53f91fdb27', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'acf9c3df-3b36-48b3-bd2e-07769e08e1b8', N'Menactra', 340000, N'Vaccine Menactra', 1, 6, 3, N'49CE081B-8509-44FF-B409-7A4FDFB78C86', N'66bee7d1-2204-49ca-8422-d3feb376ba39', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'C0045F59-3968-4369-AE5C-B6AA3FE5E4DC', N'Hepatitis B', 110000, N'Vaccine viêm gan B', 0, 6, 12, N'E1D0CE49-91FC-40E0-83B5-5339E2D42C19', N'df0de235-168d-4b4e-ace1-678342c8a7a4', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), NULL, 1, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'C670B11B-DCE6-41C5-9068-9D897FFF53ED', N'BCG', 900000, N'Vaccine phòng lao BCG', 0, 1, 0, N'9BABB4F8-A6D4-4166-80D3-B4A277D15FE8', N'FA309EBF-3B7D-45A0-A607-3CDC31EBBB1B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', NULL, CAST(N'2025-03-12T10:47:00.7462356+07:00' AS DateTimeOffset), CAST(N'2025-03-27T21:47:55.8106599+07:00' AS DateTimeOffset), NULL, 0.05, 1)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'E6891E88-8719-4C5B-9803-65AAA4F9B51C', N'Rotarix', 825000, N'Vaccine phòng tiêu chảy do rota', 1, 6, 3, N'924ED742-5CFD-4D94-81EB-857EBFB6321E', N'70B6E2D8-3482-4EEE-BBF2-6689CC5F3F0F', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-08T12:39:26.3815102+07:00' AS DateTimeOffset), CAST(N'2025-03-12T09:16:11.4845508+07:00' AS DateTimeOffset), NULL, 1.5, 2)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'ec604181-97c7-4955-8f83-993dcc1f6efb', N'Bexsero', 1750000, N'Vaccine Bexsero', 1, 6, 3, N'EDDB1A2F-9E89-4B28-A0B0-43FE6FA83C6B', N'13826925-4656-4db6-a14f-d9f3add7aa49', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 3)
GO
INSERT [dbo].[Vaccines] ([Id], [Name], [Price], [Description], [StartRecommendedAge], [EndRecommendedAge], [DosageInterval], [CategoryId], [ManufacturerId], [CreatedBy], [LastUpdatedBy], [DeletedBy], [CreatedTime], [LastUpdatedTime], [DeletedTime], [Dosage], [Sequence]) VALUES (N'fda9985a-7fea-487d-9e54-1bac6c598574', N'Mvvac', 360000, N'Vaccine Mvvac', 1, 6, 3, N'1FDC0077-2A52-4FEF-A216-148DF7798ADC', N'df0de235-168d-4b4e-ace1-678342c8a7a4', N'5670F5B9-D2D3-4425-8EF2-2A176F9B425B', N'', NULL, CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), CAST(N'2025-03-12T00:00:00.0000000+07:00' AS DateTimeOffset), NULL, 0.5, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_Images]    Script Date: 3/29/2025 5:53:10 PM ******/
ALTER TABLE [dbo].[Images] ADD  CONSTRAINT [PK_Images] PRIMARY KEY NONCLUSTERED 
(
	[ImageSource] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH NOCHECK ADD  CONSTRAINT [Accounts_Facilities_Id_fk] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [Accounts_Facilities_Id_fk]
GO
ALTER TABLE [dbo].[Children]  WITH CHECK ADD  CONSTRAINT [FK_Children_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Children] CHECK CONSTRAINT [FK_Children_Accounts_AccountId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Blogs_BlogId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Vaccines_VaccineId] FOREIGN KEY([VaccineId])
REFERENCES [dbo].[Vaccines] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Vaccines_VaccineId]
GO
ALTER TABLE [dbo].[Manufacturers]  WITH CHECK ADD  CONSTRAINT [FK_Manufacturers_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Manufacturers] CHECK CONSTRAINT [FK_Manufacturers_Countries_CountryId]
GO
ALTER TABLE [dbo].[PackageItems]  WITH CHECK ADD  CONSTRAINT [FK_PackageItems_Packages_PackageId] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Packages] ([Id])
GO
ALTER TABLE [dbo].[PackageItems] CHECK CONSTRAINT [FK_PackageItems_Packages_PackageId]
GO
ALTER TABLE [dbo].[PackageItems]  WITH CHECK ADD  CONSTRAINT [FK_PackageItems_Vaccines_VaccineId] FOREIGN KEY([VaccineId])
REFERENCES [dbo].[Vaccines] ([Id])
GO
ALTER TABLE [dbo].[PackageItems] CHECK CONSTRAINT [FK_PackageItems_Vaccines_VaccineId]
GO
ALTER TABLE [dbo].[Vaccinations]  WITH CHECK ADD  CONSTRAINT [FK_Vaccinations_Accounts_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Vaccinations] CHECK CONSTRAINT [FK_Vaccinations_Accounts_DoctorId]
GO
ALTER TABLE [dbo].[Vaccinations]  WITH CHECK ADD  CONSTRAINT [FK_Vaccinations_Accounts_VaccinatorId] FOREIGN KEY([VaccinatorId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Vaccinations] CHECK CONSTRAINT [FK_Vaccinations_Accounts_VaccinatorId]
GO
ALTER TABLE [dbo].[Vaccinations]  WITH CHECK ADD  CONSTRAINT [FK_Vaccinations_Children_ChildId] FOREIGN KEY([ChildId])
REFERENCES [dbo].[Children] ([Id])
GO
ALTER TABLE [dbo].[Vaccinations] CHECK CONSTRAINT [FK_Vaccinations_Children_ChildId]
GO
ALTER TABLE [dbo].[Vaccinations]  WITH CHECK ADD  CONSTRAINT [FK_Vaccinations_Facilities_FacilityId] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[Vaccinations] CHECK CONSTRAINT [FK_Vaccinations_Facilities_FacilityId]
GO
ALTER TABLE [dbo].[Vaccinations]  WITH CHECK ADD  CONSTRAINT [Vaccinations_Vaccines_Id_fk] FOREIGN KEY([VaccineId])
REFERENCES [dbo].[Vaccines] ([Id])
GO
ALTER TABLE [dbo].[Vaccinations] CHECK CONSTRAINT [Vaccinations_Vaccines_Id_fk]
GO
ALTER TABLE [dbo].[VaccineInventory]  WITH CHECK ADD  CONSTRAINT [FK_VaccineInventory_Facilities_FacilityId] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[VaccineInventory] CHECK CONSTRAINT [FK_VaccineInventory_Facilities_FacilityId]
GO
ALTER TABLE [dbo].[VaccineInventory]  WITH CHECK ADD  CONSTRAINT [FK_VaccineInventory_Vaccines_VaccineId] FOREIGN KEY([VaccineId])
REFERENCES [dbo].[Vaccines] ([Id])
GO
ALTER TABLE [dbo].[VaccineInventory] CHECK CONSTRAINT [FK_VaccineInventory_Vaccines_VaccineId]
GO
ALTER TABLE [dbo].[Vaccines]  WITH CHECK ADD  CONSTRAINT [FK_Vaccines_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Vaccines] CHECK CONSTRAINT [FK_Vaccines_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Vaccines]  WITH CHECK ADD  CONSTRAINT [FK_Vaccines_Manufacturers_ManufacturerId] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturers] ([Id])
GO
ALTER TABLE [dbo].[Vaccines] CHECK CONSTRAINT [FK_Vaccines_Manufacturers_ManufacturerId]
GO
