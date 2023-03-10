USE [master]
GO
/****** Object:  Database [webbalo]    Script Date: 6/6/2021 3:53:10 AM ******/
CREATE DATABASE [webbalo]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webbalo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webbalo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webbalo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webbalo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webbalo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webbalo] SET ARITHABORT OFF 
GO
ALTER DATABASE [webbalo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webbalo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webbalo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webbalo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webbalo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webbalo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webbalo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webbalo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webbalo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webbalo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [webbalo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webbalo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webbalo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webbalo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webbalo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webbalo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webbalo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webbalo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [webbalo] SET  MULTI_USER 
GO
ALTER DATABASE [webbalo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webbalo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webbalo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webbalo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webbalo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [webbalo] SET QUERY_STORE = OFF
GO
USE [webbalo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [webbalo]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[maxc]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[maxc]
as
select sum(Quantity)as sum, ProductID from OrderDetails group by ProductID
GO
/****** Object:  Table [dbo].[Card]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Date] [nvarchar](50) NULL,
	[Sum] [int] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[Note] [text] NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[OrderDate] [nvarchar](60) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrdersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[CategoryID] [int] NOT NULL,
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Image] [text] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServicesID] [int] IDENTITY(1,1) NOT NULL,
	[Img] [text] NULL,
	[NameServices] [nvarchar](50) NULL,
	[Note] [text] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServicesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCategory]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCategory](
	[UserCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserCategory] PRIMARY KEY CLUSTERED 
(
	[UserCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/6/2021 3:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserCategoryID] [int] NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([CardID], [ProductID], [Quantity], [Date], [Sum]) VALUES (1, 4, 2, N'6/6/2021', 900)
INSERT [dbo].[Card] ([CardID], [ProductID], [Quantity], [Date], [Sum]) VALUES (2, 7, 2, N'6/6/2021', 1400)
INSERT [dbo].[Card] ([CardID], [ProductID], [Quantity], [Date], [Sum]) VALUES (3, 8, 2, N'6/6/2021', 600)
INSERT [dbo].[Card] ([CardID], [ProductID], [Quantity], [Date], [Sum]) VALUES (4, 6, 7, N'6/6/2021', 3500)
SET IDENTITY_INSERT [dbo].[Card] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Travel Backpack', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Student Backpack', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Office Backpack', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [Note], [Name], [Email]) VALUES (9, N'1', N'da', N'2')
INSERT [dbo].[Feedback] ([FeedbackID], [Note], [Name], [Email]) VALUES (10, N'c', N'a', N'b')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (20, 33, 1, 9)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (20, 36, 4, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (20, 37, 13, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (20, 38, 15, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (20, 39, 14, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (20, 40, 16, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (20, 43, 36, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (21, 47, 6, 7)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (21, 51, 15, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (21, 53, 36, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [DetailID], [ProductID], [Quantity]) VALUES (23, 58, 6, 2)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrdersID], [UserID], [StatusID], [OrderDate]) VALUES (20, 40, 1, N'5/31/2021')
INSERT [dbo].[Orders] ([OrdersID], [UserID], [StatusID], [OrderDate]) VALUES (21, 43, 1, N'5/31/2021')
INSERT [dbo].[Orders] ([OrdersID], [UserID], [StatusID], [OrderDate]) VALUES (22, 43, 1, N'6/1/2021')
INSERT [dbo].[Orders] ([OrdersID], [UserID], [StatusID], [OrderDate]) VALUES (23, 44, 1, N'6/1/2021')
INSERT [dbo].[Orders] ([OrdersID], [UserID], [StatusID], [OrderDate]) VALUES (24, 40, 1, N'6/2/2021')
INSERT [dbo].[Orders] ([OrdersID], [UserID], [StatusID], [OrderDate]) VALUES (25, 40, 1, N'6/5/2021')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (1, 1, N'Bigbug Backpack Red', 199, N'img/1.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (1, 3, N'Camo Backpack', 250, N'img/2.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (1, 4, N'Vans Playing Backpack', 450, N'img/5.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (1, 6, N'Hads Backpack', 500, N'img/3.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (1, 7, N'Puma Backpack', 700, N'img/4.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (1, 8, N'Vans ZZ Backpack', 300, N'img/6.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (1, 9, N'Vans Playing Backpack', 450, N'img/7.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (2, 12, N'Black Backpack', 230, N'img/8.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (2, 13, N'Blue Backpack', 200, N'img/9.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (2, 14, N'Elodie Backpack', 320, N'img/10.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (2, 15, N'Louis Vuitton', 2000, N'img/11.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (3, 16, N'DeGrey Backpack', 200, N'img/12.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (3, 17, N'Calgeyry Backpack', 199, N'img/13.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (3, 18, N'Grinje Backpack', 199, N'img/14.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (2, 19, N'Hechal Backpack', 199, N'img/15.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (3, 20, N'Bring Backpack', 199, N'img/16.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (3, 31, N'Ozuko Backpack', 200, N'img/17.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (3, 32, N'Kauyxa Backpack', 300, N'img/18.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (3, 34, N'Packing Backpack', 300, N'img/19.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (3, 35, N'JanSpost Backpack', 200, N'img/20.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
INSERT [dbo].[Products] ([CategoryID], [ProductID], [ProductName], [Price], [Image], [Description]) VALUES (2, 36, N'Gucci Backpack', 2100, N'img/21.jpg', N'The perfect choice for those who want to use branded goods, soft materials, rainproof')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServicesID], [Img], [NameServices], [Note]) VALUES (1, N'icon/icons8_backpack_96px.png', N'Selling Backpack', N'Selling a variety of backpacks: big, small, branded, travel... Customers can freely choose the ones they like.')
INSERT [dbo].[Services] ([ServicesID], [Img], [NameServices], [Note]) VALUES (2, N'icon/icons8_user_menu_male_96px.png', N'User', N'Manage user accounts, users log in to purchase and log out when exiting the site')
INSERT [dbo].[Services] ([ServicesID], [Img], [NameServices], [Note]) VALUES (3, N'icon/icons8-tim-100.png', N'Filter Backpack', N'Filter the types of backpacks for customers to easily buy, find products that customers like')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [NameStatus]) VALUES (1, N'Chưa Thành Công')
INSERT [dbo].[Status] ([StatusID], [NameStatus]) VALUES (2, N'Thành Công')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[UserCategory] ON 

INSERT [dbo].[UserCategory] ([UserCategoryID], [NameCategory]) VALUES (1, N'Admin')
INSERT [dbo].[UserCategory] ([UserCategoryID], [NameCategory]) VALUES (2, N'Users\')
SET IDENTITY_INSERT [dbo].[UserCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserCategoryID], [UserName], [Email], [Password]) VALUES (40, 2, N'nhat', N'a@gmail.com', N'202CB962AC59075B964B07152D234B70')
INSERT [dbo].[Users] ([UserID], [UserCategoryID], [UserName], [Email], [Password]) VALUES (41, 2, N'tin', N'tin@gmail.com', N'202CB962AC59075B964B07152D234B70')
INSERT [dbo].[Users] ([UserID], [UserCategoryID], [UserName], [Email], [Password]) VALUES (42, 2, N'tin1', N'tin@gmail.com', N'202CB962AC59075B964B07152D234B70')
INSERT [dbo].[Users] ([UserID], [UserCategoryID], [UserName], [Email], [Password]) VALUES (43, 2, N'sa', N'tin', N'202CB962AC59075B964B07152D234B70')
INSERT [dbo].[Users] ([UserID], [UserCategoryID], [UserName], [Email], [Password]) VALUES (44, 2, N'abc', N'nhat@gmail.com', N'202CB962AC59075B964B07152D234B70')
INSERT [dbo].[Users] ([UserID], [UserCategoryID], [UserName], [Email], [Password]) VALUES (45, 1, N'admin', N'admin@gmail.com', N'202CB962AC59075B964B07152D234B70')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrdersID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserCategory] FOREIGN KEY([UserCategoryID])
REFERENCES [dbo].[UserCategory] ([UserCategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserCategory]
GO
USE [master]
GO
ALTER DATABASE [webbalo] SET  READ_WRITE 
GO
