USE [master]
GO
/****** Object:  Database [AkropolMaistrova]    Script Date: 13.03.2023 10:31:03 ******/
CREATE DATABASE [AkropolMaistrova]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AkropolMaistrova', FILENAME = N'D:\User\AkropolMaistrova.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'AkropolMaistrova_log', FILENAME = N'D:\User\AkropolMaistrova_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AkropolMaistrova] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AkropolMaistrova].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AkropolMaistrova] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET ARITHABORT OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AkropolMaistrova] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AkropolMaistrova] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AkropolMaistrova] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AkropolMaistrova] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AkropolMaistrova] SET  MULTI_USER 
GO
ALTER DATABASE [AkropolMaistrova] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AkropolMaistrova] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AkropolMaistrova] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AkropolMaistrova] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AkropolMaistrova] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AkropolMaistrova', N'ON'
GO
ALTER DATABASE [AkropolMaistrova] SET QUERY_STORE = OFF
GO
USE [AkropolMaistrova]
GO
/****** Object:  Table [dbo].[Bathrooms]    Script Date: 13.03.2023 10:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bathrooms](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bathrooms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HousingStock]    Script Date: 13.03.2023 10:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HousingStock](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FloorsBuilding] [nvarchar](50) NOT NULL,
	[OccupiedFloor] [int] NOT NULL,
	[YearConstruction] [date] NOT NULL,
	[IDLocation] [int] NOT NULL,
	[NumberRooms] [int] NOT NULL,
	[IDNumberBathrooms] [int] NOT NULL,
	[Conditioners] [bit] NOT NULL,
	[SummaObjectCadastre] [decimal](18, 2) NOT NULL,
	[MarketValueObject] [numeric](18, 2) NOT NULL,
	[RentalCost] [numeric](18, 2) NOT NULL,
	[IDRentalBuildings] [int] NOT NULL,
	[Adress] [nvarchar](50) NULL,
 CONSTRAINT [PK_HousingStock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 13.03.2023 10:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 13.03.2023 10:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IDHousingStock] [int] NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalBuildings]    Script Date: 13.03.2023 10:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalBuildings](
	[ID] [int] NOT NULL,
	[Vid] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RentalBuildings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 13.03.2023 10:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bathrooms] ([ID], [Name]) VALUES (1, N'Раздельный санузел')
INSERT [dbo].[Bathrooms] ([ID], [Name]) VALUES (2, N'Совместный санузел')
SET IDENTITY_INSERT [dbo].[HousingStock] ON 

INSERT [dbo].[HousingStock] ([ID], [FloorsBuilding], [OccupiedFloor], [YearConstruction], [IDLocation], [NumberRooms], [IDNumberBathrooms], [Conditioners], [SummaObjectCadastre], [MarketValueObject], [RentalCost], [IDRentalBuildings], [Adress]) VALUES (0, N'12', 7, CAST(N'1990-12-01' AS Date), 3, 5, 2, 1, CAST(2.00 AS Decimal(18, 2)), CAST(15000.00 AS Numeric(18, 2)), CAST(30000.00 AS Numeric(18, 2)), 1, N'г. Москва, ул. Южная, д. 10')
INSERT [dbo].[HousingStock] ([ID], [FloorsBuilding], [OccupiedFloor], [YearConstruction], [IDLocation], [NumberRooms], [IDNumberBathrooms], [Conditioners], [SummaObjectCadastre], [MarketValueObject], [RentalCost], [IDRentalBuildings], [Adress]) VALUES (1, N'20', 15, CAST(N'2000-10-10' AS Date), 1, 3, 1, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(15000.00 AS Numeric(18, 2)), CAST(20000.00 AS Numeric(18, 2)), 1, N'г. Владимир, ул. Гагарина, д. 16')
INSERT [dbo].[HousingStock] ([ID], [FloorsBuilding], [OccupiedFloor], [YearConstruction], [IDLocation], [NumberRooms], [IDNumberBathrooms], [Conditioners], [SummaObjectCadastre], [MarketValueObject], [RentalCost], [IDRentalBuildings], [Adress]) VALUES (2, N'50', 10, CAST(N'1990-01-25' AS Date), 2, 5, 2, 0, CAST(20000.00 AS Decimal(18, 2)), CAST(15000.00 AS Numeric(18, 2)), CAST(30000.00 AS Numeric(18, 2)), 2, N'г. Киров, ул. Морозова, д. 7')
INSERT [dbo].[HousingStock] ([ID], [FloorsBuilding], [OccupiedFloor], [YearConstruction], [IDLocation], [NumberRooms], [IDNumberBathrooms], [Conditioners], [SummaObjectCadastre], [MarketValueObject], [RentalCost], [IDRentalBuildings], [Adress]) VALUES (3, N'50', 20, CAST(N'2000-10-10' AS Date), 1, 3, 2, 1, CAST(1.00 AS Decimal(18, 2)), CAST(30000.00 AS Numeric(18, 2)), CAST(50.00 AS Numeric(18, 2)), 1, N'г. Красногорск, ул. Мира, д. 10')
SET IDENTITY_INSERT [dbo].[HousingStock] OFF
INSERT [dbo].[Location] ([ID], [Name]) VALUES (1, N'Окна выходят на дорогу')
INSERT [dbo].[Location] ([ID], [Name]) VALUES (2, N'Окна выходят во двор')
INSERT [dbo].[Location] ([ID], [Name]) VALUES (3, N'Окна выходят во двор и на дорогу')
INSERT [dbo].[Manager] ([ID], [Name], [IDRole], [Login], [Password], [IDHousingStock]) VALUES (1, N'Менеджер по аренде', 1, N'1', N'1', 1)
INSERT [dbo].[Manager] ([ID], [Name], [IDRole], [Login], [Password], [IDHousingStock]) VALUES (2, N'Менеджер по продажам', 2, N'2', N'2', 2)
INSERT [dbo].[RentalBuildings] ([ID], [Vid]) VALUES (1, N'В аренде')
INSERT [dbo].[RentalBuildings] ([ID], [Vid]) VALUES (2, N'Не в аренде')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Менеджер по аренде')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Менеджер по продажам')
ALTER TABLE [dbo].[HousingStock]  WITH CHECK ADD  CONSTRAINT [FK_HousingStock_Bathrooms] FOREIGN KEY([IDNumberBathrooms])
REFERENCES [dbo].[Bathrooms] ([ID])
GO
ALTER TABLE [dbo].[HousingStock] CHECK CONSTRAINT [FK_HousingStock_Bathrooms]
GO
ALTER TABLE [dbo].[HousingStock]  WITH CHECK ADD  CONSTRAINT [FK_HousingStock_Location] FOREIGN KEY([IDLocation])
REFERENCES [dbo].[Location] ([ID])
GO
ALTER TABLE [dbo].[HousingStock] CHECK CONSTRAINT [FK_HousingStock_Location]
GO
ALTER TABLE [dbo].[HousingStock]  WITH CHECK ADD  CONSTRAINT [FK_HousingStock_RentalBuildings] FOREIGN KEY([IDRentalBuildings])
REFERENCES [dbo].[RentalBuildings] ([ID])
GO
ALTER TABLE [dbo].[HousingStock] CHECK CONSTRAINT [FK_HousingStock_RentalBuildings]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HousingStock] FOREIGN KEY([IDHousingStock])
REFERENCES [dbo].[HousingStock] ([ID])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_HousingStock]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Role]
GO
USE [master]
GO
ALTER DATABASE [AkropolMaistrova] SET  READ_WRITE 
GO
