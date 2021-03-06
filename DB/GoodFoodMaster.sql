USE [master]
GO
/****** Object:  Database [GoodFoodMaster]    Script Date: 08.01.2020 17:28:50 ******/
CREATE DATABASE [GoodFoodMaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GoodFoodMaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.NODE0\MSSQL\DATA\GoodFoodMaster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GoodFoodMaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.NODE0\MSSQL\DATA\GoodFoodMaster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GoodFoodMaster] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GoodFoodMaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GoodFoodMaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GoodFoodMaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GoodFoodMaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GoodFoodMaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GoodFoodMaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET RECOVERY FULL 
GO
ALTER DATABASE [GoodFoodMaster] SET  MULTI_USER 
GO
ALTER DATABASE [GoodFoodMaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GoodFoodMaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GoodFoodMaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GoodFoodMaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GoodFoodMaster] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GoodFoodMaster', N'ON'
GO
ALTER DATABASE [GoodFoodMaster] SET QUERY_STORE = OFF
GO
USE [GoodFoodMaster]
GO
/****** Object:  User [DESKTOP-JIDDNB4\repl_snapshot]    Script Date: 08.01.2020 17:28:51 ******/
CREATE USER [DESKTOP-JIDDNB4\repl_snapshot] FOR LOGIN [DESKTOP-JIDDNB4\repl_snapshot] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESKTOP-JIDDNB4\repl_merge]    Script Date: 08.01.2020 17:28:51 ******/
CREATE USER [DESKTOP-JIDDNB4\repl_merge] FOR LOGIN [DESKTOP-JIDDNB4\repl_merge] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESKTOP-JIDDNB4\repl_logreader]    Script Date: 08.01.2020 17:28:51 ******/
CREATE USER [DESKTOP-JIDDNB4\repl_logreader] FOR LOGIN [DESKTOP-JIDDNB4\repl_logreader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESKTOP-JIDDNB4\repl_distribution]    Script Date: 08.01.2020 17:28:51 ******/
CREATE USER [DESKTOP-JIDDNB4\repl_distribution] FOR LOGIN [DESKTOP-JIDDNB4\repl_distribution] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DESKTOP-JIDDNB4\repl_snapshot]
GO
ALTER ROLE [db_owner] ADD MEMBER [DESKTOP-JIDDNB4\repl_merge]
GO
ALTER ROLE [db_owner] ADD MEMBER [DESKTOP-JIDDNB4\repl_logreader]
GO
ALTER ROLE [db_owner] ADD MEMBER [DESKTOP-JIDDNB4\repl_distribution]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 08.01.2020 17:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NULL,
	[Value] [numeric](4, 3) NULL,
	[ResteurantId] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 08.01.2020 17:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[Price] [money] NULL,
	[Kcal] [numeric](8, 2) NULL,
	[Picture] [varchar](200) NULL,
	[MenuId] [int] NULL,
 CONSTRAINT [PK_Dishes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 08.01.2020 17:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](100) NULL,
	[Number] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[PostCode] [varchar](10) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 08.01.2020 17:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NULL,
	[ResteurantId] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 08.01.2020 17:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_Discount_Restaurant] FOREIGN KEY([ResteurantId])
REFERENCES [dbo].[Restaurant] ([Id])
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_Discount_Restaurant]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Restaurant] FOREIGN KEY([ResteurantId])
REFERENCES [dbo].[Restaurant] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Restaurant]
GO
ALTER TABLE [dbo].[Restaurant]  WITH CHECK ADD  CONSTRAINT [FK_Restaurant_Location] FOREIGN KEY([Id])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Restaurant] CHECK CONSTRAINT [FK_Restaurant_Location]
GO
USE [master]
GO
ALTER DATABASE [GoodFoodMaster] SET  READ_WRITE 
GO
