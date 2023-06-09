USE [master]
GO
/****** Object:  Database [ShoeShop]    Script Date: 17.3.2023 г. 16:10:27 ******/
CREATE DATABASE [ShoeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoeShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVERWOR\MSSQL\DATA\ShoeShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoeShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVERWOR\MSSQL\DATA\ShoeShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShoeShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeShop] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoeShop] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoeShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoeShop', N'ON'
GO
ALTER DATABASE [ShoeShop] SET QUERY_STORE = OFF
GO
USE [ShoeShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF;
GO
USE [ShoeShop]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17.3.2023 г. 16:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 17.3.2023 г. 16:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.3.2023 г. 16:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShoeId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shoe]    Script Date: 17.3.2023 г. 16:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Sneakers')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Boots')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Sandals')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (1, N'Ivan Ivanov', N'ivanivanov@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (2, N'Petar Petrov', N'petarpetrov@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (3, N'Maria Georgieva', N'mariageorgieva@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (4, N'Dimitar Nikolov', N'dimitarnikolov@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (5, N'Tanya Ivanova', N'tanyaivanova@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (6, N'Nikolay Petrov', N'nikolaypetrov@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (7, N'Svetlana Dimitrova', N'svetlanadimitrova@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (8, N'Georgi Ivanov', N'georgiivanov@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (9, N'Stoyan Georgiev', N'stoyangeorgiev@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (10, N'Elena Hristova', N'elenahristova@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (11, N'Ivanka Dimitrova', N'ivankadimitrova@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (12, N'Viktor Todorov', N'viktortodorov@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (13, N'Nina Stoyanova', N'ninastoyanova@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (14, N'Ivo Vasilev', N'ivovasilev@mail.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (15, N'Petia Ivanova', N'petiaivanova@mail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (1, CAST(N'2023-03-01T09:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (2, CAST(N'2023-03-02T10:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (3, CAST(N'2023-03-02T11:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (4, CAST(N'2023-03-03T12:00:00.000' AS DateTime), 4, 3)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (5, CAST(N'2023-03-04T21:30:00.000' AS DateTime), 6, 10)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (6, CAST(N'2023-03-02T19:32:00.000' AS DateTime), 9, 14)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (7, CAST(N'2023-03-02T08:21:00.000' AS DateTime), 3, 12)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (8, CAST(N'2023-03-02T12:54:00.000' AS DateTime), 7, 9)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (9, CAST(N'2023-03-02T13:31:00.000' AS DateTime), 16, 8)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (10, CAST(N'2023-03-02T15:32:00.000' AS DateTime), 3, 7)
INSERT [dbo].[Order] ([Id], [OrderDate], [ShoeId], [CustomerId]) VALUES (11, CAST(N'2023-03-02T20:21:00.000' AS DateTime), 10, 6)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Shoe] ON 

INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (1, N'Air Max', N'Nike', CAST(129.99 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (2, N'Chuck Taylor All Star', N'Converse', CAST(59.99 AS Decimal(10, 2)), 75, 1)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (3, N'Classic Tall', N'UGG', CAST(199.99 AS Decimal(10, 2)), 25, 2)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (4, N'Desert Boot', N'Clarks', CAST(99.99 AS Decimal(10, 2)), 30, 2)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (5, N'Flip Flops', N'Havaianas', CAST(24.99 AS Decimal(10, 2)), 100, 3)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (6, N'Ultra Boost', N'Adidas', CAST(149.99 AS Decimal(10, 2)), 60, 1)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (7, N'Old Skool', N'Vans', CAST(69.99 AS Decimal(10, 2)), 80, 1)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (8, N'Timberland Boot', N'Timberland', CAST(149.99 AS Decimal(10, 2)), 40, 2)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (9, N'Slip-On', N'TOMS', CAST(49.99 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (10, N'Reef Sandals', N'Reef', CAST(34.99 AS Decimal(10, 2)), 120, 3)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (11, N'Air Force 1', N'Nike', CAST(99.99 AS Decimal(10, 2)), 70, 1)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (12, N'Doc Martens', N'Dr. Martens', CAST(139.99 AS Decimal(10, 2)), 35, 2)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (13, N'Rain Boots', N'Hunter', CAST(99.99 AS Decimal(10, 2)), 25, 2)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (14, N'Hiking Boots', N'Merrell', CAST(119.99 AS Decimal(10, 2)), 30, 2)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (15, N'Espadrilles', N'Soludos', CAST(49.99 AS Decimal(10, 2)), 60, 3)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (16, N'Penny Loafer', N'G.H. Bass', CAST(89.99 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (17, N'Boat Shoe', N'Sperry', CAST(79.99 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (18, N'Chelsea Boot', N'Steve Madden', CAST(119.99 AS Decimal(10, 2)), 30, 2)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (19, N'Birkenstock', N'Birkenstock', CAST(99.99 AS Decimal(10, 2)), 55, 3)
INSERT [dbo].[Shoe] ([Id], [Name], [Brand], [Price], [Quantity], [CategoryId]) VALUES (20, N'Crocs', N'Crocs', CAST(34.99 AS Decimal(10, 2)), 150, 3)
SET IDENTITY_INSERT [dbo].[Shoe] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shoe] FOREIGN KEY([ShoeId])
REFERENCES [dbo].[Shoe] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shoe]
GO
ALTER TABLE [dbo].[Shoe]  WITH CHECK ADD  CONSTRAINT [FK_Shoe_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Shoe] CHECK CONSTRAINT [FK_Shoe_Category]
GO
USE [master]
GO
ALTER DATABASE [ShoeShop] SET  READ_WRITE 
GO
