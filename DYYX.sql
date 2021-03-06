USE [master]
GO
/****** Object:  Database [DaYuYiXiaoDB]    Script Date: 2017/9/6 17:14:03 ******/
CREATE DATABASE [DaYuYiXiaoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DaYuYiXiaoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DaYuYiXiaoDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DaYuYiXiaoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DaYuYiXiaoDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DaYuYiXiaoDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DaYuYiXiaoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DaYuYiXiaoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET  MULTI_USER 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DaYuYiXiaoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DaYuYiXiaoDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DaYuYiXiaoDB]
GO
/****** Object:  Table [dbo].[Advertising]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertising](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MenuId] [int] NOT NULL,
	[CreativeHTML] [nvarchar](max) NULL,
	[IsDelete] [tinyint] NOT NULL,
	[CreateTime] [smalldatetime] NOT NULL,
	[Creator] [nvarchar](50) NULL,
	[ClickNum] [bigint] NULL CONSTRAINT [DF_Advertising_ClickNum]  DEFAULT ((0)),
	[ImageUrl] [nvarchar](max) NULL,
	[ModelType] [int] NULL CONSTRAINT [DF_Advertising_ModelType]  DEFAULT ((0)),
	[FileName] [nvarchar](300) NULL,
	[FilePath] [nvarchar](max) NULL,
	[SortId] [bigint] NULL,
	[isPush] [tinyint] NULL,
 CONSTRAINT [PK_Advertising] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PortalTreeData]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortalTreeData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Display] [tinyint] NOT NULL,
	[IsDelete] [tinyint] NOT NULL,
	[CreateTime] [smalldatetime] NULL,
	[Creator] [nvarchar](50) NOT NULL,
	[PId] [int] NOT NULL,
	[BeforeUrl] [nvarchar](100) NULL,
	[BeforeAfter] [int] NOT NULL,
	[AfterUrl] [nvarchar](100) NULL,
	[SortId] [int] NULL,
	[EnName] [nvarchar](50) NULL,
	[DisplayCount] [int] NULL,
	[DisplayType] [nvarchar](50) NULL,
	[MenuLevelIndex] [int] NULL,
	[IsShowIndex] [int] NULL,
	[ShowIndexSort] [int] NULL,
 CONSTRAINT [PK_PortalTreeData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleInfo]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_RoleInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleOfMenu]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleOfMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
 CONSTRAINT [PK_RoleOfMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolStyle]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolStyle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[IsDelete] [tinyint] NULL,
	[Creator] [nvarchar](50) NULL,
	[CreateTime] [smalldatetime] NULL,
	[MenuId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[SortId] [int] NULL,
	[FileName] [nvarchar](50) NULL,
	[FilePath] [nvarchar](450) NULL,
	[ClickNum] [bigint] NULL CONSTRAINT [DF_SchoolStyle_ClickNum]  DEFAULT ((0)),
	[ModelType] [int] NULL CONSTRAINT [DF_SchoolStyle_ModelType]  DEFAULT ((0)),
 CONSTRAINT [PK_SchoolStyle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[System_Link]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Link](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[SortId] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Href] [nvarchar](300) NULL,
	[IsDelete] [int] NULL,
	[CreateTime] [datetime] NULL,
	[LinkType] [int] NULL,
 CONSTRAINT [PK_System_Link] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[System_Notice]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Notice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Contents] [nvarchar](max) NULL,
	[Hot] [int] NULL,
	[SortId] [int] NULL,
	[ClickNum] [int] NULL,
	[IsDelete] [tinyint] NOT NULL,
	[Creator] [nvarchar](50) NULL,
	[CreateTime] [smalldatetime] NOT NULL,
	[ShowImgUrl] [nvarchar](300) NULL,
	[FilePath] [nvarchar](450) NULL,
	[FileName] [nvarchar](50) NULL,
	[isPush] [int] NULL,
	[MenuId] [int] NULL,
 CONSTRAINT [PK_System_Notice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[System_Vote]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Vote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[CreateTime] [datetime] NULL,
	[isPush] [tinyint] NULL,
	[SortId] [bigint] NULL,
	[IsDelete] [tinyint] NULL,
 CONSTRAINT [PK_System_Vote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[System_VoteDetails]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_VoteDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[VoteId] [int] NULL,
 CONSTRAINT [PK_System_VoteDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[System_VoteRecord]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_VoteRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DetailsId] [int] NULL,
	[IP] [nvarchar](50) NULL,
	[Count] [int] NULL,
 CONSTRAINT [PK_System_VoteRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2017/9/6 17:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](50) NULL,
	[LoginPassword] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[IsDelete] [tinyint] NULL,
	[CreateTime] [datetime] NULL CONSTRAINT [DF_UserInfo_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[System_Vote] ADD  CONSTRAINT [DF_System_Vote_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
USE [master]
GO
ALTER DATABASE [DaYuYiXiaoDB] SET  READ_WRITE 
GO
