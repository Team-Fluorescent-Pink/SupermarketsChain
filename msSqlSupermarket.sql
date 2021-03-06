USE [master]
GO
/****** Object:  Database [supermarket]    Script Date: 18-Jul-15 17:11:16 ******/
CREATE DATABASE [supermarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'supermarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\supermarket.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'supermarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\supermarket_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [supermarket] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [supermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [supermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [supermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [supermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [supermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [supermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [supermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [supermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [supermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [supermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [supermarket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [supermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [supermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [supermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [supermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [supermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [supermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [supermarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [supermarket] SET  MULTI_USER 
GO
ALTER DATABASE [supermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [supermarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [supermarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [supermarket] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [supermarket] SET DELAYED_DURABILITY = DISABLED 
GO
USE [supermarket]
GO
/****** Object:  Schema [o2ss]    Script Date: 18-Jul-15 17:11:16 ******/
CREATE SCHEMA [o2ss]
GO
USE [supermarket]
GO
/****** Object:  Sequence [dbo].[CATEGORY_SEQ]    Script Date: 18-Jul-15 17:11:16 ******/
CREATE SEQUENCE [dbo].[CATEGORY_SEQ] 
 AS [numeric](28, 0)
 START WITH 41
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 CACHE  20 
GO
USE [supermarket]
GO
/****** Object:  Sequence [dbo].[MEASURES_SEQ]    Script Date: 18-Jul-15 17:11:16 ******/
CREATE SEQUENCE [dbo].[MEASURES_SEQ] 
 AS [numeric](28, 0)
 START WITH 21
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 CACHE  20 
GO
USE [supermarket]
GO
/****** Object:  Sequence [dbo].[PRODUCTS_SEQ]    Script Date: 18-Jul-15 17:11:16 ******/
CREATE SEQUENCE [dbo].[PRODUCTS_SEQ] 
 AS [numeric](28, 0)
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 CACHE  20 
GO
USE [supermarket]
GO
/****** Object:  Sequence [dbo].[PRODUCTS_SEQ1]    Script Date: 18-Jul-15 17:11:16 ******/
CREATE SEQUENCE [dbo].[PRODUCTS_SEQ1] 
 AS [numeric](28, 0)
 START WITH 21
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 CACHE  20 
GO
USE [supermarket]
GO
/****** Object:  Sequence [dbo].[VENDORS_SEQ]    Script Date: 18-Jul-15 17:11:16 ******/
CREATE SEQUENCE [dbo].[VENDORS_SEQ] 
 AS [numeric](28, 0)
 START WITH 21
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 CACHE  20 
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 18-Jul-15 17:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [numeric](38, 0) NOT NULL,
	[NAME] [nvarchar](100) NOT NULL,
 CONSTRAINT [CATEGORY_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MEASURES]    Script Date: 18-Jul-15 17:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEASURES](
	[ID] [numeric](38, 0) NOT NULL,
	[MEASURE_NAME] [nvarchar](100) NOT NULL,
 CONSTRAINT [MEASURES_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 18-Jul-15 17:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[ID] [numeric](38, 0) NOT NULL,
	[NAME] [nvarchar](100) NOT NULL,
	[VENDOR_ID] [numeric](38, 0) NOT NULL,
	[MEASURE_ID] [numeric](38, 0) NOT NULL,
	[CATEGORY_ID] [numeric](38, 0) NOT NULL,
	[PRICE] [numeric](19, 4) NOT NULL,
 CONSTRAINT [PRODUCTS_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VENDORS]    Script Date: 18-Jul-15 17:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDORS](
	[ID] [numeric](38, 0) NOT NULL,
	[VENDOR_NAME] [nvarchar](200) NOT NULL,
 CONSTRAINT [VENDORS_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(1 AS Numeric(38, 0)), N'Beer')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(2 AS Numeric(38, 0)), N'Wine')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(3 AS Numeric(38, 0)), N'Whiskey')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(4 AS Numeric(38, 0)), N'Chocolate')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(5 AS Numeric(38, 0)), N'Biscuits')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(6 AS Numeric(38, 0)), N'Soft Drink')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(7 AS Numeric(38, 0)), N'Coffe')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(8 AS Numeric(38, 0)), N'Cereals')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(9 AS Numeric(38, 0)), N'Ice Cream')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(10 AS Numeric(38, 0)), N'Ciders')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(11 AS Numeric(38, 0)), N'Sweet Foods')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(12 AS Numeric(38, 0)), N'Vodka')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(13 AS Numeric(38, 0)), N'Rum')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(14 AS Numeric(38, 0)), N'Mineral Water')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(15 AS Numeric(38, 0)), N'Sparkling Water')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(16 AS Numeric(38, 0)), N'Brandy')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(17 AS Numeric(38, 0)), N'Rakia')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(18 AS Numeric(38, 0)), N'Fruits')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(19 AS Numeric(38, 0)), N'Nuts')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(20 AS Numeric(38, 0)), N'Chips')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(21 AS Numeric(38, 0)), N'Energy Drink')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (CAST(22 AS Numeric(38, 0)), N'Meat')
INSERT [dbo].[MEASURES] ([ID], [MEASURE_NAME]) VALUES (CAST(1 AS Numeric(38, 0)), N'liters')
INSERT [dbo].[MEASURES] ([ID], [MEASURE_NAME]) VALUES (CAST(2 AS Numeric(38, 0)), N'pieces')
INSERT [dbo].[MEASURES] ([ID], [MEASURE_NAME]) VALUES (CAST(3 AS Numeric(38, 0)), N'kg')
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(1 AS Numeric(38, 0)), N'Nestea iced tea ', CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(6 AS Numeric(38, 0)), CAST(1.4500 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(2 AS Numeric(38, 0)), N'Nescafe Normal 100 gr', CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(7 AS Numeric(38, 0)), CAST(4.2000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(3 AS Numeric(38, 0)), N'Nescafe 3in1', CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(7 AS Numeric(38, 0)), CAST(0.3000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(4 AS Numeric(38, 0)), N'Fitness', CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(8 AS Numeric(38, 0)), CAST(3.8000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(5 AS Numeric(38, 0)), N'Nesquik', CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(8 AS Numeric(38, 0)), CAST(2.7000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(6 AS Numeric(38, 0)), N'Cookie Crisp', CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(8 AS Numeric(38, 0)), CAST(3.4000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(7 AS Numeric(38, 0)), N'Corn Flakes ', CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(8 AS Numeric(38, 0)), CAST(3.0000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(8 AS Numeric(38, 0)), N'Zagorka Retro', CAST(2 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(0.9600 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(9 AS Numeric(38, 0)), N'Zagorka', CAST(2 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(0.9500 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(10 AS Numeric(38, 0)), N'Heineken', CAST(2 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1.2500 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(11 AS Numeric(38, 0)), N'Strongbow', CAST(2 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(10 AS Numeric(38, 0)), CAST(1.1900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(12 AS Numeric(38, 0)), N'Kamenitza', CAST(3 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1.0000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(13 AS Numeric(38, 0)), N'Staropramen', CAST(3 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1.1000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(14 AS Numeric(38, 0)), N'Carling', CAST(3 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(10 AS Numeric(38, 0)), CAST(1.5000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(15 AS Numeric(38, 0)), N'Belvita', CAST(4 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(5 AS Numeric(38, 0)), CAST(0.9900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(16 AS Numeric(38, 0)), N'Milka', CAST(4 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(4 AS Numeric(38, 0)), CAST(1.4300 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(17 AS Numeric(38, 0)), N'Oreo', CAST(4 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(5 AS Numeric(38, 0)), CAST(2.6500 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(18 AS Numeric(38, 0)), N'Toblerone', CAST(4 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(4 AS Numeric(38, 0)), CAST(2.1900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(19 AS Numeric(38, 0)), N'Johny Walker Red Label', CAST(5 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(22.7000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(20 AS Numeric(38, 0)), N'Captain Morgan', CAST(5 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(13 AS Numeric(38, 0)), CAST(18.7900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(21 AS Numeric(38, 0)), N'Guinness', CAST(5 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(3.0900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(22 AS Numeric(38, 0)), N'Smirnoff', CAST(5 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(12 AS Numeric(38, 0)), CAST(16.4900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(23 AS Numeric(38, 0)), N'4 Friends', CAST(6 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(6.9500 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(24 AS Numeric(38, 0)), N'Gallery Mavrud', CAST(6 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(13.0000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(25 AS Numeric(38, 0)), N'Gallery Muscat', CAST(6 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(11.9000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(26 AS Numeric(38, 0)), N'Cycle Syrah', CAST(7 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(6.9000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(27 AS Numeric(38, 0)), N'Cycle Pinot Noir', CAST(7 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(6.9000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(28 AS Numeric(38, 0)), N'Devin ', CAST(8 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(14 AS Numeric(38, 0)), CAST(0.7600 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(29 AS Numeric(38, 0)), N'Devin', CAST(8 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(15 AS Numeric(38, 0)), CAST(0.7900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(30 AS Numeric(38, 0)), N'Coca-cola', CAST(9 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(6 AS Numeric(38, 0)), CAST(2.4900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(31 AS Numeric(38, 0)), N'Monster', CAST(9 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(21 AS Numeric(38, 0)), CAST(2.5000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(32 AS Numeric(38, 0)), N'Bankia', CAST(9 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(14 AS Numeric(38, 0)), CAST(0.7000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(33 AS Numeric(38, 0)), N'Pepsi', CAST(10 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(6 AS Numeric(38, 0)), CAST(2.3500 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(34 AS Numeric(38, 0)), N'Sugar Cubes', CAST(11 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(11 AS Numeric(38, 0)), CAST(1.5000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(35 AS Numeric(38, 0)), N'Chaika', CAST(11 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(11 AS Numeric(38, 0)), CAST(1.0000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(36 AS Numeric(38, 0)), N'White Bear', CAST(12 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(12 AS Numeric(38, 0)), CAST(7.8800 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(37 AS Numeric(38, 0)), N'Classic', CAST(12 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(17 AS Numeric(38, 0)), CAST(7.9800 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(38 AS Numeric(38, 0)), N'Old', CAST(12 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(17 AS Numeric(38, 0)), CAST(8.8200 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(39 AS Numeric(38, 0)), N'Karnobatska Grape', CAST(13 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(17 AS Numeric(38, 0)), CAST(7.2200 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(40 AS Numeric(38, 0)), N'Karnobatska Special', CAST(13 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(17 AS Numeric(38, 0)), CAST(8.6800 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(41 AS Numeric(38, 0)), N'Savoy', CAST(13 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(7.7800 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(42 AS Numeric(38, 0)), N'MarryJane', CAST(13 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(12 AS Numeric(38, 0)), CAST(7.2700 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(43 AS Numeric(38, 0)), N'Karnobat', CAST(13 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(16 AS Numeric(38, 0)), CAST(6.2000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(44 AS Numeric(38, 0)), N'BlackRam', CAST(14 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(8.2600 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(45 AS Numeric(38, 0)), N'Flirt', CAST(14 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(12 AS Numeric(38, 0)), CAST(7.4400 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(46 AS Numeric(38, 0)), N'Captain Fred', CAST(14 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(13 AS Numeric(38, 0)), CAST(7.2800 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(47 AS Numeric(38, 0)), N'Almonds', CAST(15 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(19 AS Numeric(38, 0)), CAST(29.0000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(48 AS Numeric(38, 0)), N'Pistachios', CAST(15 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(19 AS Numeric(38, 0)), CAST(32.0000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(49 AS Numeric(38, 0)), N'Peanuts', CAST(15 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(19 AS Numeric(38, 0)), CAST(7.5500 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(50 AS Numeric(38, 0)), N'Cherrys', CAST(16 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(18 AS Numeric(38, 0)), CAST(2.0000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(51 AS Numeric(38, 0)), N'Apples', CAST(16 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(18 AS Numeric(38, 0)), CAST(1.5000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(52 AS Numeric(38, 0)), N'Watermelons', CAST(16 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(18 AS Numeric(38, 0)), CAST(0.4500 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(53 AS Numeric(38, 0)), N'Peaches', CAST(16 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(18 AS Numeric(38, 0)), CAST(1.1000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(54 AS Numeric(38, 0)), N'Ruffles', CAST(17 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(20 AS Numeric(38, 0)), CAST(2.3900 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(55 AS Numeric(38, 0)), N'Lays', CAST(17 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(20 AS Numeric(38, 0)), CAST(3.1000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(56 AS Numeric(38, 0)), N'Chicken', CAST(18 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(22 AS Numeric(38, 0)), CAST(5.1000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(57 AS Numeric(38, 0)), N'Porky', CAST(18 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(22 AS Numeric(38, 0)), CAST(7.8000 AS Numeric(19, 4)))
INSERT [dbo].[PRODUCTS] ([ID], [NAME], [VENDOR_ID], [MEASURE_ID], [CATEGORY_ID], [PRICE]) VALUES (CAST(58 AS Numeric(38, 0)), N'Beef', CAST(18 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(22 AS Numeric(38, 0)), CAST(12.0000 AS Numeric(19, 4)))
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(1 AS Numeric(38, 0)), N'Nestle Sofia Corp.')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(2 AS Numeric(38, 0)), N'Zagorka Corp.')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(3 AS Numeric(38, 0)), N'Kamenitza Corp.')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(4 AS Numeric(38, 0)), N'Mondelez International')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(5 AS Numeric(38, 0)), N'Diageo')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(6 AS Numeric(38, 0)), N'Todoroff Wines')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(7 AS Numeric(38, 0)), N'Minkov Brothers Wines')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(8 AS Numeric(38, 0)), N'DEVIN JSC ')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(9 AS Numeric(38, 0)), N'Coca-Cola Bulgaria')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(10 AS Numeric(38, 0)), N'Pepsi Bulgaria')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(11 AS Numeric(38, 0)), N'Zaharni Zavodi AD')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(12 AS Numeric(38, 0)), N'LVK-Vinprom AD')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(13 AS Numeric(38, 0)), N'Karnobat Winery')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(14 AS Numeric(38, 0)), N'Vinprom Peshtera SA')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(15 AS Numeric(38, 0)), N'Intersnack Bulgaria')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(16 AS Numeric(38, 0)), N'Delivery Fruit')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(17 AS Numeric(38, 0)), N'Vista Awt')
INSERT [dbo].[VENDORS] ([ID], [VENDOR_NAME]) VALUES (CAST(18 AS Numeric(38, 0)), N'VIVECTA BG')
ALTER TABLE [dbo].[PRODUCTS]  WITH NOCHECK ADD  CONSTRAINT [FK_PRODUCT_CATEGORY] FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[PRODUCTS] CHECK CONSTRAINT [FK_PRODUCT_CATEGORY]
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH NOCHECK ADD  CONSTRAINT [FK_PRODUCT_MEASURE] FOREIGN KEY([MEASURE_ID])
REFERENCES [dbo].[MEASURES] ([ID])
GO
ALTER TABLE [dbo].[PRODUCTS] CHECK CONSTRAINT [FK_PRODUCT_MEASURE]
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH NOCHECK ADD  CONSTRAINT [FK_PRODUCT_VENDOR] FOREIGN KEY([VENDOR_ID])
REFERENCES [dbo].[VENDORS] ([ID])
GO
ALTER TABLE [dbo].[PRODUCTS] CHECK CONSTRAINT [FK_PRODUCT_VENDOR]
GO
/****** Object:  StoredProcedure [o2ss].[sp_MSSsmaDmDisableConstraints]    Script Date: 18-Jul-15 17:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Summary: This procedure is used to drop/disable constraints and indexes before BCP data migration.
Based on key_type,parallel_load and minimal logging flags, 
	it inserts the constraint info into tracking tables and drop/disable the constraints.
*/
CREATE PROCEDURE [o2ss].[sp_MSSsmaDmDisableConstraints]
	@key_type char(2), @mode int ,@parallel_load int ,@minimal_logging int, @error_log nvarchar(4000) OUTPUT
AS
declare 
@schema_id				   int,
@table_id				   int,
@constraint				   sysname,
@column_id				   int,
@index_column_id		   int,
@column					   sysname,
@columns				   nvarchar(4000),
@ref_table                 sysname,
@ref_column				   sysname,
@ref_columns               nvarchar(4000), 
@constraint_type           sysname,
@cmd                       nvarchar(4000),
@is_disabled               bit,
@mode_action               sysname,
@parent_column_id          int,
@constraint_column_id      int,
@referenced_object_id      int,
@delete_referential_action int,
@update_referential_action int,
@referenced_column_id      int,
@index_name                sysname,
@index_id                  int,
@index_type                varchar(2),
@temp_key_type             varchar(2)

BEGIN
	SET @error_log = N''
	SET @mode_action = 
		CASE (@mode) 
			WHEN 0 THEN N' NOCHECK ' 
			WHEN 1 THEN N' CHECK ' 
			WHEN 2 THEN N' DROP ' 
			WHEN 3 THEN N' ADD ' 
			WHEN 4 THEN N' DISABLE ' 
			WHEN 5 THEN N' REBUILD ' 
		END
	IF(@key_type = N'PK' or @key_type = N'UQ' )
	BEGIN
		--DROP PRIMARY AND UNIQUE KEYS
		DECLARE #keycol_cur CURSOR STATIC FOR
		SELECT pk_un.parent_object_id, pk_un.name, pk_un.type, ic.column_id, ic.index_column_id, pk_un.schema_id
			FROM sys.key_constraints pk_un 
				JOIN sys.index_columns ic ON pk_un.unique_index_id = ic.index_id AND pk_un.parent_object_id = ic.object_id
				JOIN sys.indexes idx ON idx.object_id = pk_un.parent_object_id AND idx.index_id = ic.index_id
				JOIN  [o2ss].[MSSsmaDmTables] t ON t.object_id = pk_un.parent_object_id
			WHERE (@minimal_logging = 1) AND (idx.index_id <> 1) AND pk_un.type = @key_type
			ORDER BY object_name(ic.object_id), ic.index_column_id 
		OPEN #keycol_cur
		FETCH #keycol_cur INTO @table_id, @constraint, @constraint_type, @column_id, @index_column_id, @schema_id
		WHILE (@@FETCH_STATUS <> -1)
		BEGIN
			INSERT [o2ss].[MSSsmaDmNCKeyColumns] (
				object_id
				, key_name
				, key_type
				, key_column_id
				, index_column_id
			) VALUES (@table_id, @constraint, @constraint_type, @column_id, @index_column_id)
		
			IF EXISTS (SELECT * FROM sys.key_constraints WHERE name = @constraint AND schema_id = @schema_id) 
			BEGIN
				SET @cmd = N'ALTER TABLE ' + quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id)) + @mode_action + N' CONSTRAINT ' + quotename(@constraint)		
				BEGIN TRY
					EXEC(@cmd)
				END TRY
				BEGIN CATCH
					SET @error_log = @error_log + 'Unable to drop key '+quotename(@constraint)+' to the table '+	quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id))+ char(10) + char(13)
					SET @error_log = @error_log + @cmd + char(10) + char(13)
					SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL ErrorMessage:'+ERROR_MESSAGE()+ char(10) + char(13)
				END CATCH
			END
				
			FETCH #keycol_cur INTO @table_id, @constraint, @constraint_type, @column_id, @index_column_id, @schema_id
		END
		CLOSE #keycol_cur
		DEALLOCATE #keycol_cur
	END
	ELSE IF(@key_type = 'NF')
	BEGIN
		-- DROP FOREIGNKEY REFERENCES ON NON CLUSTERED PK OR UK
		SET @temp_key_type= 'NF'
		DECLARE #fk_col_cur CURSOR STATIC FOR
		SELECT 
			fk.parent_object_id, fk.schema_id, fk.name, fk.type, fkc.parent_column_id, fkc.constraint_column_id, fk.is_disabled,
			fk.referenced_object_id, fk.delete_referential_action, fk.update_referential_action, fkc.referenced_column_id
		FROM sys.foreign_keys fk 
			JOIN sys.foreign_key_columns fkc ON 
					fk.object_id = fkc.constraint_object_id 
				AND fk.parent_object_id = fkc.parent_object_id 
				AND fk.referenced_object_id = fkc.referenced_object_id
			JOIN sys.key_constraints pk ON pk.parent_object_id = fk.referenced_object_id
			JOIN  [o2ss].[MSSsmaDmTables] t ON t.object_id = pk.parent_object_id
		WHERE (pk.type IN (N'PK', N'UQ') AND ((@minimal_logging = 1) AND (fk.key_index_id <> 1)))
		ORDER BY object_name(fkc.constraint_object_id), fkc.constraint_column_id 
		
		OPEN #fk_col_cur
		FETCH #fk_col_cur INTO 
			@table_id, @schema_id, @constraint, @constraint_type, @column_id, @constraint_column_id, @is_disabled, 
			@referenced_object_id, @delete_referential_action, @update_referential_action, @referenced_column_id
		WHILE(@@FETCH_STATUS <> -1)
		BEGIN
			INSERT [o2ss].[MSSsmaDmNCKeyColumns] (
				object_id
				,key_name
				,key_type
				,key_column_id
				,index_column_id
				,is_disabled
				,referenced_object_id
				,delete_referential_action
				,update_referential_action
				,referenced_column_id
			) 
			values (
				@table_id, @constraint, @temp_key_type, @column_id, @constraint_column_id, @is_disabled,@referenced_object_id,
				@delete_referential_action, @update_referential_action, @referenced_column_id
			)
			
			IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = @constraint AND schema_id = @schema_id)
			BEGIN		
				SET @cmd = N'ALTER TABLE ' + quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id)) + @mode_action + N' CONSTRAINT ' + quotename(@constraint)
				BEGIN TRY
					EXEC(@cmd)
				END TRY
				BEGIN CATCH
					SET @error_log = @error_log + 'Unable to drop foreign key '+quotename(@constraint)+' to the table '+	quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id))+ char(10) + char(13)
					SET @error_log = @error_log + @cmd + char(10) + char(13)
					SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL ErrorMessage:'+ERROR_MESSAGE()+ char(10) + char(13)
				END CATCH
			END
			FETCH #fk_col_cur INTO 
				@table_id, @schema_id, @constraint, @constraint_type, @column_id, @constraint_column_id, @is_disabled,@referenced_object_id,
				@delete_referential_action, @update_referential_action,@referenced_column_id
			END
			CLOSE #fk_col_cur
			DEALLOCATE #fk_col_cur
		END
	ELSE IF(@key_type = N'FK' AND @parallel_load = 1)
	BEGIN
		-- DROP FOREIGNKEY REFERENCES ON CLUSTERED PK OR UK WITH PARALLEL DM
		SET @temp_key_type = 'FK'
		DECLARE #fk_col_cur CURSOR STATIC FOR
		SELECT 
			fk.parent_object_id, fk.schema_id, fk.name, fk.type, fkc.parent_column_id, fkc.constraint_column_id, fk.is_disabled,
			fk.referenced_object_id, fk.delete_referential_action, fk.update_referential_action, fkc.referenced_column_id
		FROM sys.foreign_keys fk 
			JOIN sys.foreign_key_columns fkc ON 
					fk.object_id = fkc.constraint_object_id 
				AND fk.parent_object_id = fkc.parent_object_id 
				AND fk.referenced_object_id = fkc.referenced_object_id
			JOIN  [o2ss].[MSSsmaDmTables] t ON t.object_id = fk.referenced_object_id
		ORDER BY object_name(fkc.constraint_object_id), fkc.constraint_column_id 
	
		OPEN #fk_col_cur
		FETCH #fk_col_cur INTO 
			@table_id, @schema_id, @constraint, @constraint_type, @column_id, @constraint_column_id, 
			@is_disabled,@referenced_object_id, @delete_referential_action,@update_referential_action,@referenced_column_id
		WHILE(@@FETCH_STATUS <> -1)
		BEGIN
			INSERT [o2ss].[MSSsmaDmNCKeyColumns] (
				object_id
				,key_name
				,key_type
				,key_column_id
				,index_column_id
				,is_disabled
				,referenced_object_id
				,delete_referential_action
				,update_referential_action
				,referenced_column_id
			) 
			values (
				@table_id, @constraint, @temp_key_type, @column_id, @constraint_column_id, @is_disabled,@referenced_object_id,
				@delete_referential_action, @update_referential_action, @referenced_column_id
			)
			
			IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = @constraint AND schema_id = @schema_id)
			BEGIN
				SET @cmd = N'ALTER TABLE ' + quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id)) + @mode_action + N' CONSTRAINT ' + quotename(@constraint)
				BEGIN TRY
						EXEC(@cmd)
				END TRY
				BEGIN CATCH
					SET @error_log = @error_log + 'Unable to drop foreign key '+quotename(@constraint)+' to the table '+	quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id))+ char(10) + char(13)
					SET @error_log = @error_log + @cmd + char(10) + char(13)
					SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL ErrorMessage:'+ERROR_MESSAGE()+ char(10) + char(13)
				END CATCH
			END
			FETCH #fk_col_cur INTO 
				@table_id, @schema_id, @constraint, @constraint_type, @column_id, @constraint_column_id, @is_disabled, 
				@referenced_object_id, @delete_referential_action, @update_referential_action, @referenced_column_id
		END
		CLOSE #fk_col_cur
		DEALLOCATE #fk_col_cur			
	END
	ELSE IF (@key_type = N'NC')
	BEGIN
		-- DISABLE NON CLUSTERED INDEXES WITH BULK LOAD OPTIMIZATION
		DECLARE #index_col_cur CURSOR FORWARD_ONLY FOR
		SELECT t.object_id AS TableID, t.schema_id,Idxs.[name],Idxs.object_id,'NC',Idxs.index_id 
			FROM  [sys].[indexes] Idxs JOIN [o2ss].[MSSsmaDmTables] t on t.object_id = Idxs.object_id
			WHERE Idxs.[type] = 2 AND Idxs.[is_disabled] = 0 
			
		OPEN #index_col_cur
		FETCH #index_col_cur INTO @table_id, @schema_id, @index_name, @index_id, @index_type,@index_id
		WHILE(@@FETCH_STATUS <> -1)
		BEGIN
			INSERT [o2ss].[MSSsmaDmNCKeyColumns] (
				object_id,
				key_name,
				key_type,
				key_column_id
			) VALUES (@table_id, @index_name, @index_type,@index_id)			
			
			SET @cmd = N'ALTER INDEX ' +quotename(@index_name)+ ' ON '+ quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id)) + @mode_action
			BEGIN TRY
					EXEC(@cmd)
			END TRY
			BEGIN CATCH
				SET @error_log = @error_log + 'Unable to disable non-clustered index '+quotename(@index_name)+' to the table '+	quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id))+ char(10) + char(13)
				SET @error_log = @error_log + @cmd + char(10) + char(13)
				SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL ErrorMessage:'+ERROR_MESSAGE()+ char(10) + char(13)	
			END CATCH
			
			FETCH #index_col_cur INTO @table_id, @schema_id, @index_name, @index_id, @index_type,@index_id
		END
	END
END


GO
/****** Object:  StoredProcedure [o2ss].[sp_MSSsmaDmFixConstraints]    Script Date: 18-Jul-15 17:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Summary: This procedure is used to create/enable constraints after BCP data migration.
Based on key_type,parallel_load and minimal logging flags, 
	it reads the constraint info from tracking tables and create/enable the constraint.
*/
CREATE PROCEDURE [o2ss].[sp_MSSsmaDmFixConstraints] 
	@key_type char(2), @mode int ,@parallel_load int ,@minimal_logging int, @error_log nvarchar(4000) OUTPUT
AS 
DECLARE 
@table						sysname, 
@object_id					int,
@constraint					sysname,
@column						sysname,
@columns					nvarchar(4000),
@ref_table					sysname,
@ref_column					sysname,
@ref_columns				nvarchar(4000), 
@mode_action				sysname,
@constraint_type			sysname,
@cmd						nvarchar(4000),
@is_disabled			    bit,
@schema						sysname,
@fkschema					sysname,
@cascade_update_clause		nvarchar(100),
@cascade_delete_clause		nvarchar(100),
@delete_referential_action  int,
@update_referential_action  int

SET @error_log = N''
SET @key_type = UPPER(@key_type)
SET @mode_action = 
	CASE (@mode) 
		WHEN 0 THEN N' NOCHECK ' 
		WHEN 1 THEN N' CHECK ' 
		WHEN 2 THEN N' DROP ' 
		WHEN 3 THEN N' ADD ' 
		WHEN 4 THEN N' DISABLE ' 
		WHEN 5 THEN N' REBUILD ' 
	END
SET @constraint_type = 
	CASE (@key_type) 
		WHEN 'PK' THEN N' PRIMARY KEY NONCLUSTERED '
		WHEN 'UQ' THEN N' UNIQUE NONCLUSTERED ' 
		WHEN 'NF' THEN N' FOREIGN KEY ' 
		WHEN 'FK' THEN N' FOREIGN KEY ' 
	END
	
DECLARE #key_cur CURSOR FORWARD_ONLY FOR
	SELECT DISTINCT object_name(k.object_id), k.object_id, schema_name(o.schema_id), key_name, object_name(referenced_object_id), OBJECT_SCHEMA_NAME(referenced_object_id), is_disabled, update_referential_action, delete_referential_action  
		FROM [o2ss].[MSSsmaDmNCKeyColumns] k JOIN sys.objects o on k.object_id = o.object_id 
		WHERE key_type = @key_type
OPEN #key_cur
FETCH #key_cur INTO @table, @object_id, @schema, @constraint, @ref_table, @fkschema, @is_disabled, @update_referential_action, @delete_referential_action
WHILE (@@FETCH_STATUS <> -1)
BEGIN
	IF (@key_type = 'NC')
	BEGIN
		SET @cmd = N'ALTER INDEX ' + quotename(@constraint) + ' ON ' + quotename(@schema) + N'.' + quotename(@table) + ' REBUILD WITH (MAXDOP=0)'
	END
	ELSE IF (@mode <> 3) -- anything other than add is simple
	BEGIN
		SET @cmd = N'ALTER TABLE ' + quotename(@schema) + N'.' + quotename(@table) + @mode_action + N' CONSTRAINT ' + quotename(@constraint)
	END
	ELSE
	BEGIN 
		SET @columns  = N''
		SET @ref_columns = N''
		SET @cmd 
			= N'ALTER TABLE ' + quotename(@schema) + N'.' + quotename(@table)
			+ N' WITH NOCHECK' -- adding constriant with NOCHECK always as CHECK constraints is set to false in project settings.
			+ N' ADD CONSTRAINT ' +  quotename(@constraint) + @constraint_type
		DECLARE #keycol_cur CURSOR FORWARD_ONLY FOR
		SELECT c.name, rc.name 
			FROM [o2ss].[MSSsmaDmNCKeyColumns] k 
				JOIN sys.columns c ON k.object_id = c.object_id and k.key_column_id = c.column_id 
				LEFT JOIN sys.columns rc ON k.referenced_object_id = rc.object_id and k.referenced_column_id = rc.column_id 
			WHERE k.object_id = @object_id and key_name = @constraint and k.key_type=@key_type
			ORDER BY k.index_column_id

		OPEN #keycol_cur
		FETCH #keycol_cur INTO @column, @ref_column
		WHILE (@@FETCH_STATUS <> -1)
		BEGIN
			SET @columns = @columns + @column + N',' 
			SET @ref_columns = @ref_columns + @ref_column + N',' 
			FETCH #keycol_cur INTO @column, @ref_column
		END	
		CLOSE #keycol_cur
		DEALLOCATE #keycol_cur
		IF (@key_type = 'NF' or @key_type = 'FK')
		BEGIN
			SET @cascade_update_clause  = N''
			SET @cascade_delete_clause = N''
			SET @cascade_update_clause = 
				CASE (@update_referential_action) 
					WHEN 0 THEN N' ON UPDATE NO ACTION ' 
					WHEN 1 THEN N' ON UPDATE CASCADE ' 
					WHEN 2 THEN N' ON UPDATE SET NULL ' 
					WHEN 3 THEN N' ON UPDATE SET DEFAULT ' 
				END
			SET @cascade_delete_clause = 
				CASE (@delete_referential_action) 
					WHEN 0 THEN N' ON DELETE NO ACTION ' 
					WHEN 1 THEN N' ON DELETE CASCADE ' 
					WHEN 2 THEN N' ON DELETE SET NULL ' 
					WHEN 3 THEN N' ON DELETE SET DEFAULT ' 
				END

			SET @cmd = @cmd + N'(' + LEFT(@columns, LEN(@columns) - 1 ) + N') REFERENCES ' + quotename(@fkschema) + '.' + quotename(@ref_table) + N'(' + LEFT(@ref_columns, LEN(@ref_columns) - 1 ) + N')' + @cascade_update_clause+ @cascade_delete_clause
			IF (@is_disabled = 1)
				SET @cmd = @cmd + N' ALTER TABLE ' + quotename(@schema) + N'.' + quotename(@table) + N' NOCHECK' + N' CONSTRAINT ' + quotename(@constraint)
		END
		ELSE
		BEGIN
			SET @cmd = @cmd + N'(' + LEFT(@columns, LEN(@columns) - 1 ) + N')'
		END
		
	END
		BEGIN TRY
				EXEC(@cmd)
		END TRY
		BEGIN CATCH
			SET @error_log = @error_log + 'Unable to add constraint '+quotename(@constraint)+' to the table '+	quotename(@schema) + N'.' + quotename(@table)+ char(10) + char(13)
			SET @error_log = @error_log + @cmd + char(10) + char(13)
			SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL Error Message:'+ERROR_MESSAGE()+ char(10) + char(13)
		END CATCH
	FETCH #key_cur INTO @table, @object_id, @schema, @constraint, @ref_table, @fkschema, @is_disabled, @update_referential_action, @delete_referential_action
END
CLOSE #key_cur
DEALLOCATE #key_cur


GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.CATEGORY_SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'SEQUENCE',@level1name=N'CATEGORY_SEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.MEASURES_SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'SEQUENCE',@level1name=N'MEASURES_SEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS_SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'SEQUENCE',@level1name=N'PRODUCTS_SEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS_SEQ1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'SEQUENCE',@level1name=N'PRODUCTS_SEQ1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.VENDORS_SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'SEQUENCE',@level1name=N'VENDORS_SEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.CATEGORY.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CATEGORY', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.CATEGORY."NAME"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CATEGORY', @level2type=N'COLUMN',@level2name=N'NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.CATEGORY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CATEGORY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.CATEGORY.CATEGORY_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CATEGORY', @level2type=N'CONSTRAINT',@level2name=N'CATEGORY_PK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.MEASURES.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEASURES', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.MEASURES.MEASURE_NAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEASURES', @level2type=N'COLUMN',@level2name=N'MEASURE_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.MEASURES' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEASURES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.MEASURES.MEASURES_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEASURES', @level2type=N'CONSTRAINT',@level2name=N'MEASURES_PK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRODUCTS', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS."NAME"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRODUCTS', @level2type=N'COLUMN',@level2name=N'NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS.VENDOR_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRODUCTS', @level2type=N'COLUMN',@level2name=N'VENDOR_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS.MEASURE_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRODUCTS', @level2type=N'COLUMN',@level2name=N'MEASURE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS.CATEGORY_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRODUCTS', @level2type=N'COLUMN',@level2name=N'CATEGORY_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS.PRICE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRODUCTS', @level2type=N'COLUMN',@level2name=N'PRICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRODUCTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.PRODUCTS.PRODUCTS_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRODUCTS', @level2type=N'CONSTRAINT',@level2name=N'PRODUCTS_PK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.VENDORS.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VENDORS', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.VENDORS.VENDOR_NAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VENDORS', @level2type=N'COLUMN',@level2name=N'VENDOR_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.VENDORS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VENDORS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SUPERMARKET.VENDORS.VENDORS_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VENDORS', @level2type=N'CONSTRAINT',@level2name=N'VENDORS_PK'
GO
USE [master]
GO
ALTER DATABASE [supermarket] SET  READ_WRITE 
GO
