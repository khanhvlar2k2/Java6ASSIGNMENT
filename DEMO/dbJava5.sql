USE [master]
GO
/****** Object:  Database [Java5_ShopPT]    Script Date: 22/06/22 1:14:28 AM ******/
CREATE DATABASE [Java5_ShopPT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Java5_ShopPT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Java5_ShopPT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Java5_ShopPT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Java5_ShopPT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Java5_ShopPT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Java5_ShopPT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Java5_ShopPT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET ARITHABORT OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Java5_ShopPT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Java5_ShopPT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Java5_ShopPT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Java5_ShopPT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET RECOVERY FULL 
GO
ALTER DATABASE [Java5_ShopPT] SET  MULTI_USER 
GO
ALTER DATABASE [Java5_ShopPT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Java5_ShopPT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Java5_ShopPT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Java5_ShopPT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Java5_ShopPT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Java5_ShopPT', N'ON'
GO
ALTER DATABASE [Java5_ShopPT] SET QUERY_STORE = OFF
GO
USE [Java5_ShopPT]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Java5_ShopPT]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 22/06/22 1:14:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NULL,
	[avatar] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[fullname] [nvarchar](255) NULL,
	[is_admin] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[password] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[gender] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 22/06/22 1:14:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[is_male] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 22/06/22 1:14:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[total_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 22/06/22 1:14:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[create_date] [date] NULL,
	[phone] [nvarchar](255) NULL,
	[status] [int] NULL,
	[username] [nvarchar](255) NULL,
	[total_price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 22/06/22 1:14:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[color_hex] [nvarchar](255) NULL,
	[color_name] [nvarchar](255) NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_image]    Script Date: 22/06/22 1:14:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](255) NULL,
	[color_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 22/06/22 1:14:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [date] NULL,
	[description] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[slug] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [address], [avatar], [email], [fullname], [is_admin], [is_deleted], [password], [phone], [gender]) VALUES (N'demo', N'29/8 Tan Quy, Tan Phu', N'demo.jpg', N'thangnncps145792@gmail.com', N'Nguyễn  Nhật Cao Thăng', 0, 0, N'123', N'+84949006346', 1)
INSERT [dbo].[accounts] ([username], [address], [avatar], [email], [fullname], [is_admin], [is_deleted], [password], [phone], [gender]) VALUES (N'demojava5', N'29/8 Tan Quy, Tan Phu', N'demojava5.jpg', N'thangnncps14579123@gmail.com', N'Nguyễn  Nhật Cao Thăng', 0, 0, N'123', N'+84949006346', 1)
INSERT [dbo].[accounts] ([username], [address], [avatar], [email], [fullname], [is_admin], [is_deleted], [password], [phone], [gender]) VALUES (N'thangnnc', N'Hồ Chí Minh', N'thangnnc.jpg', N'thangnncps14579@gmail.com', N'Thăng Nguyễn', 1, 0, N'835046691', N'0949006346', 1)
INSERT [dbo].[accounts] ([username], [address], [avatar], [email], [fullname], [is_admin], [is_deleted], [password], [phone], [gender]) VALUES (N'truongpnd', N'Hồ Chí Minh', N'truongpnd.jpg', N'truongpnd@gmail.com', N'Phan Trường', 0, 0, N'123', N'0123456789', 1)
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [is_male], [name]) VALUES (1, 1, N'Áo Nam')
INSERT [dbo].[categories] ([id], [is_male], [name]) VALUES (2, 1, N'Quần Nam')
INSERT [dbo].[categories] ([id], [is_male], [name]) VALUES (3, 1, N'Phụ Kiện Nam')
INSERT [dbo].[categories] ([id], [is_male], [name]) VALUES (4, 0, N'Áo Nữ')
INSERT [dbo].[categories] ([id], [is_male], [name]) VALUES (5, 0, N'Quần Nữ')
INSERT [dbo].[categories] ([id], [is_male], [name]) VALUES (6, 0, N'Phụ Kiện Nữ')
SET IDENTITY_INSERT [dbo].[categories] OFF
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (2, 18, 1, 110000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (2, 1017, 1, 150000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (3, 15, 1, 120000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (3, 18, 1, 110000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (3, 1017, 1, 150000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (3, 2007, 1, 150000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (4, 4, 1, 90000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (4, 8, 1, 100000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (4, 1017, 1, 150000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (5, 9, 1, 120000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (5, 18, 1, 110000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (6, 1017, 1, 150000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (7, 9, 12, 1440000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (8, 10, 5, 600000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (9, 8, 1, 100000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (10, 9, 4, 480000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (10, 18, 3, 330000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (11, 1017, 3, 450000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (11, 2007, 1, 150000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (12, 9, 3, 360000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (12, 18, 3, 330000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (13, 3009, 1, 150000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (14, 9, 1, 120000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [total_price]) VALUES (14, 18, 1, 110000)
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (2, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 3, N'thangnnc', 260000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (3, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 2, N'thangnnc', 530000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (4, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 3, N'thangnnc', 340000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (5, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 0, N'thangnnc', 230000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (6, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0123456789', 3, N'truongpnd', 150000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (7, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0123456789', 3, N'truongpnd', 1440000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (8, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0123456789', 2, N'truongpnd', 600000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (9, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 3, N'thangnnc', 100000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (10, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 2, N'thangnnc', 810000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (11, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 1, N'thangnnc', 600000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (12, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 3, N'thangnnc', 690000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (13, N'Hồ Chí Minh', CAST(N'2022-06-18' AS Date), N'0949006346', 1, N'thangnnc', 150000)
INSERT [dbo].[orders] ([id], [address], [create_date], [phone], [status], [username], [total_price]) VALUES (14, N'Hồ Chí Minh 123', CAST(N'2022-06-18' AS Date), N'0949006346', 1, N'thangnnc', 230000)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[product_color] ON 

INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (10, N'#3366ff', N'Lam', 4)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (11, N'#79a488', N'Lục', 4)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (12, N'#f7f7f7', N'Lam', 4)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (22, N'#3366FF', N'Lam', 8)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (23, N'#33CC00', N'Lục', 8)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (24, N'#CC6600', N'Nâu', 8)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (25, N'#252525', N'Đen', 9)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (26, N'#3366FF', N'Lam', 9)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (27, N'#33CC00', N'Lục', 9)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (28, N'#252525', N'Đen', 10)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (29, N'#FF3300', N'Đỏ', 10)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (30, N'#0066FF', N'Lam', 10)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (34, N'#252525', N'Đen', 12)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (35, N'#EEEEEE', N'Xám', 12)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (36, N'#33FF33', N'Xanh', 12)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (37, N'#252525', N'Đen', 13)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (38, N'#FFFFFF', N'Trắng', 13)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (39, N'#DDDDDD', N'Xám', 13)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (40, N'#003366', N'Lam', 14)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (41, N'#006600', N'Lục', 14)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (42, N'#FFFFFF', N'Trắng', 14)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (43, N'#FFCC66', N'Da', 15)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (44, N'#252525', N'Đen', 15)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (45, N'#DDDDDD', N'Xám', 15)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (46, N'#0033CC', N'Biển', 16)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (47, N'#CC9933', N'Da', 16)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (48, N'#CC6633', N'Nâu', 16)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (49, N'#CC9933', N'Da', 17)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (50, N'#252525', N'Đen', 17)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (51, N'#999900', N'Lục', 17)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (52, N'#EEEEEE', N'Ghi', 18)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (53, N'#FF9999', N'Hồng', 18)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (54, N'#999999', N'Xám', 18)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (1024, N'#000000', N'Đen', 1015)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (1025, N'#ff0000', N'Đỏ', 1015)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (1026, N'#0008f5', N'Lam', 1015)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (1030, N'#e5bdd4', N'Hồng', 1017)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (1031, N'#f1c4fd', N'Tím', 1017)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (1032, N'#ffffff', N'Trắng', 1017)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (2004, N'#ff0000', N'Đỏ', 2007)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (2005, N'#000000', N'Đen', 2007)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (2006, N'#ffffff', N'Trắng', 2007)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (3004, N'#000000', N'Đen', 3007)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (3005, N'#b3e8ff', N'Lam', 3007)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (3007, N'#474747', N'Đen', 3009)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (3008, N'#b5b5b5', N'Xám', 3009)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (4009, N'#3b3b3b', N'Đen', 4009)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (4010, N'#546949', N'Lục', 4009)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (4011, N'#7a5d1f', N'Nâu', 4009)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (4012, N'#70d369', N'Lam', 4010)
INSERT [dbo].[product_color] ([id], [color_hex], [color_name], [product_id]) VALUES (4013, N'#4c92dc', N'Xanh Dương', 4010)
SET IDENTITY_INSERT [dbo].[product_color] OFF
SET IDENTITY_INSERT [dbo].[product_image] ON 

INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (19, N'aobalo_lam.jpg', 10)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (20, N'aobalo_lam1.jpg', 10)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (21, N'aobalo_lam2.jpg', 10)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (22, N'aobalo_lam3.jpg', 10)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (23, N'aobalo_luc.jpg', 11)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (24, N'aobalo_luc1.jpg', 11)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (25, N'aobalo_luc2.jpg', 11)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (26, N'aobalo_luc3.jpg', 11)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (27, N'aobalo_trang.jpg', 12)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (28, N'aobalo_trang1.jpg', 12)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (29, N'aobalo_trang2.jpg', 12)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (30, N'aobalo_trang3.jpg', 12)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (67, N'aosomihoa_lam.jpg', 22)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (68, N'aosomihoa_lam1.jpg', 22)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (69, N'aosomihoa_lam2.jpg', 22)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (70, N'aosomihoa_lam3.jpg', 22)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (71, N'aosomihoa_luc.jpg', 23)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (72, N'aosomihoa_luc1.jpg', 23)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (73, N'aosomihoa_luc2.jpg', 23)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (74, N'aosomihoa_luc3.jpg', 23)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (75, N'aosomihoa_nau.jpg', 24)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (76, N'aosomihoa_nau1.jpg', 24)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (77, N'aosomihoa_nau2.jpg', 24)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (78, N'aosomihoa_nau3.jpg', 24)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (79, N'aothethao_den.jpg', 25)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (80, N'aothethao_den1.jpg', 25)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (81, N'aothethao_den2.jpg', 25)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (82, N'aothethao_den3.jpg', 25)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (83, N'aothethao_lam.jpg', 26)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (84, N'aothethao_lam1.jpg', 26)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (85, N'aothethao_lam2.jpg', 26)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (86, N'aothethao_lam3.jpg', 26)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (87, N'aothethao_luc.jpg', 27)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (88, N'aothethao_luc1.jpg', 27)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (89, N'aothethao_luc2.jpg', 27)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (90, N'aothethao_luc3.jpg', 27)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (91, N'aothun_den.jpg', 28)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (92, N'aothun_den1.jpg', 28)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (93, N'aothun_den2.jpg', 28)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (94, N'aothun_den3.jpg', 28)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (95, N'aothun_do.jpg', 29)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (96, N'aothun_do1.jpg', 29)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (97, N'aothun_do2.jpg', 29)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (98, N'aothun_do3.jpg', 29)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (99, N'aothun_lam.jpg', 30)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (100, N'aothun_lam1.jpg', 30)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (101, N'aothun_lam2.jpg', 30)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (102, N'aothun_lam3.jpg', 30)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (115, N'quanbong_den.jpg', 34)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (116, N'quanbong_den1.jpg', 34)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (117, N'quanbong_den2.jpg', 34)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (118, N'quanbong_den3.jpg', 34)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (119, N'quanbong_xam.jpg', 35)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (120, N'quanbong_xam1.jpg', 35)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (121, N'quanbong_xam2.jpg', 35)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (122, N'quanbong_xam3.jpg', 35)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (123, N'quanbong_xanh.jpg', 36)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (124, N'quanbong_xanh1.jpg', 36)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (125, N'quanbong_xanh2.jpg', 36)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (126, N'quanbong_xanh3.jpg', 36)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (127, N'quandai_den.jpg', 37)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (128, N'quandai_den1.jpg', 37)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (129, N'quandai_den2.jpg', 37)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (130, N'quandai_den3.jpg', 37)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (131, N'quandai_trang.jpg', 38)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (132, N'quandai_trang1.jpg', 38)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (133, N'quandai_trang2.jpg', 38)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (134, N'quandai_trang3.jpg', 38)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (135, N'quandai_xam.jpg', 39)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (136, N'quandai_xam1.jpg', 39)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (137, N'quandai_xam2.jpg', 39)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (138, N'quandai_xam3.jpg', 39)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (139, N'quandu_bien.jpg', 40)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (140, N'quandu_bien1.jpg', 40)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (141, N'quandu_bien2.jpg', 40)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (142, N'quandu_bien3.jpg', 40)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (143, N'quandu_luc.jpg', 41)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (144, N'quandu_luc1.jpg', 41)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (145, N'quandu_luc2.jpg', 41)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (146, N'quandu_luc3.jpg', 41)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (147, N'quandu_trang.jpg', 42)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (148, N'quandu_trang1.jpg', 42)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (149, N'quandu_trang2.jpg', 42)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (150, N'quandu_trang3.jpg', 42)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (151, N'quandui_da.jpg', 43)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (152, N'quandui_da1.jpg', 43)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (153, N'quandui_da2.jpg', 43)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (154, N'quandui_da3.jpg', 43)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (155, N'quandui_den.jpg', 44)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (156, N'quandui_den1.jpg', 44)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (157, N'quandui_den2.jpg', 44)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (158, N'quandui_den3.jpg', 44)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (159, N'quandui_xam.jpg', 45)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (160, N'quandui_xam1.jpg', 45)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (161, N'quandui_xam2.jpg', 45)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (162, N'quandui_xam3.jpg', 45)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (163, N'quanjoker_bien.jpg', 46)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (164, N'quanjoker_bien1.jpg', 46)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (165, N'quanjoker_bien2.jpg', 46)
GO
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (166, N'quanjoker_bien3.jpg', 46)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (167, N'quanjoker_da.jpg', 47)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (168, N'quanjoker_da1.jpg', 47)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (169, N'quanjoker_da2.jpg', 47)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (170, N'quanjoker_da3.jpg', 47)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (171, N'quanjoker_nau.jpg', 48)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (172, N'quanjoker_nau1.jpg', 48)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (173, N'quanjoker_nau2.jpg', 48)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (174, N'quanjoker_nau3.jpg', 48)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (175, N'quankaki_da.jpg', 49)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (176, N'quankaki_da1.jpg', 49)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (177, N'quankaki_da2.jpg', 49)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (178, N'quankaki_da3.jpg', 49)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (179, N'quankaki_den.jpg', 50)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (180, N'quankaki_den1.jpg', 50)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (181, N'quankaki_den2.jpg', 50)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (182, N'quankaki_den3.jpg', 50)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (183, N'quankaki_luc.jpg', 51)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (184, N'quankaki_luc1.jpg', 51)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (185, N'quankaki_luc2.jpg', 51)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (186, N'quankaki_luc3.jpg', 51)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (187, N'aosomivai_ghi.jpg', 52)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (188, N'aosomivai_ghi1.jpg', 52)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (189, N'aosomivai_ghi2.jpg', 52)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (190, N'aosomivai_ghi3.jpg', 52)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (191, N'aosomivai_hong.jpg', 53)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (192, N'aosomivai_hong1.jpg', 53)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (193, N'aosomivai_hong2.jpg', 53)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (194, N'aosomivai_hong3.jpg', 53)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (195, N'aosomivai_xam.jpg', 54)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (196, N'aosomivai_xam1.jpg', 54)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (197, N'aosomivai_xam2.jpg', 54)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (198, N'aosomivai_xam3.jpg', 54)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1034, N'PK-KinhRam-PT1203102435514.jpg', 1024)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1035, N'PK-KinhRam-PT1203102458473.jpg', 1024)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1036, N'PK-KinhRam-PT1203102469309.jpg', 1024)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1037, N'PK-KinhRam-PT1203102474370.jpg', 1024)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1038, N'PK-KinhRam-PT1203102540803.jpg', 1025)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1039, N'PK-KinhRam-PT1203102548510.jpg', 1025)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1040, N'PK-KinhRam-PT1203102512479.jpg', 1025)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1041, N'PK-KinhRam-PT1203102571947.jpg', 1025)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1042, N'PK-KinhRam-PT1203102610427.jpg', 1026)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1043, N'PK-KinhRam-PT1203102643359.jpg', 1026)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1044, N'PK-KinhRam-PT1203102616314.jpg', 1026)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1045, N'PK-KinhRam-PT1203102641283.jpg', 1026)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1058, N'Ao-ThuThoangMat-PT1203103037847.jpg', 1030)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1059, N'Ao-ThuThoangMat-PT1203103057085.jpg', 1030)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1060, N'Ao-ThuThoangMat-PT1203103071689.jpg', 1030)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1061, N'Ao-ThuThoangMat-PT1203103035041.jpg', 1030)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1062, N'Ao-ThuThoangMat-PT1203103189041.jpg', 1031)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1063, N'Ao-ThuThoangMat-PT1203103146505.jpg', 1031)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1064, N'Ao-ThuThoangMat-PT1203103189533.jpg', 1031)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1065, N'Ao-ThuThoangMat-PT1203103144833.jpg', 1031)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1066, N'Ao-ThuThoangMat-PT1203103267318.jpg', 1032)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1067, N'Ao-ThuThoangMat-PT1203103275579.jpg', 1032)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1068, N'Ao-ThuThoangMat-PT1203103279732.jpg', 1032)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (1069, N'Ao-ThuThoangMat-PT1203103233570.jpg', 1032)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2002, N'Ao-ChuThap-PT1203200443500.jpg', 2004)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2003, N'Ao-ChuThap-PT1203200446968.jpg', 2004)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2004, N'Ao-ChuThap-PT1203200463540.jpg', 2004)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2005, N'Ao-ChuThap-PT1203200495267.jpg', 2004)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2006, N'Ao-ChuThap-PT1203200576810.jpg', 2005)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2007, N'Ao-ChuThap-PT1203200512905.jpg', 2005)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2008, N'Ao-ChuThap-PT1203200514299.jpg', 2005)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2009, N'Ao-ChuThap-PT1203200535117.jpg', 2005)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2010, N'Ao-ChuThap-PT1203200697032.jpg', 2006)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2011, N'Ao-ChuThap-PT1203200615761.jpg', 2006)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2012, N'Ao-ChuThap-PT1203200689538.jpg', 2006)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (2013, N'Ao-ChuThap-PT1203200697255.jpg', 2006)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3002, N'Ao-SoMiTron_PT1203300446001.jpg', 3004)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3003, N'Ao-SoMiTron_PT1203300472718.jpg', 3004)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3004, N'Ao-SoMiTron_PT1203300414394.jpg', 3004)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3005, N'Ao-SoMiTron_PT1203300458855.jpg', 3004)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3006, N'Ao-SoMiTron_PT1203300565726.jpg', 3005)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3007, N'Ao-SoMiTron_PT1203300532238.jpg', 3005)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3008, N'Ao-SoMiTron_PT1203300566187.jpg', 3005)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3009, N'Ao-SoMiTron_PT1203300530358.jpg', 3005)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3014, N'Quan-OngXuong-PT1203300798723.jpg', 3007)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3015, N'Quan-OngXuong-PT1203300765415.jpg', 3007)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3016, N'Quan-OngXuong-PT1203300760359.jpg', 3007)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3017, N'Quan-OngXuong-PT1203300760985.jpg', 3007)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3018, N'Quan-OngXuong-PT1203300874087.jpg', 3008)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3019, N'Quan-OngXuong-PT1203300896089.jpg', 3008)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3020, N'Quan-OngXuong-PT1203300835894.jpg', 3008)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (3021, N'Quan-OngXuong-PT1203300885987.jpg', 3008)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4022, N'Ao-SoMi-PT120340091.jpg', 4009)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4023, N'Ao-SoMi-PT120340092.jpg', 4009)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4024, N'Ao-SoMi-PT120340093.jpg', 4009)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4025, N'Ao-SoMi-PT120340094.jpg', 4009)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4026, N'Ao-SoMi-PT120340101.jpg', 4010)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4027, N'Ao-SoMi-PT120340102.jpg', 4010)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4028, N'Ao-SoMi-PT120340103.jpg', 4010)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4029, N'Ao-SoMi-PT120340104.jpg', 4010)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4030, N'Ao-SoMi-PT120340111.jpg', 4011)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4031, N'Ao-SoMi-PT120340112.jpg', 4011)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4032, N'Ao-SoMi-PT120340113.jpg', 4011)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4033, N'Ao-SoMi-PT120340114.jpg', 4011)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4034, N'Quan-BoOngLV-PT120340121.jpg', 4012)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4035, N'Quan-BoOngLV-PT120340122.jpg', 4012)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4036, N'Quan-BoOngLV-PT120340123.jpg', 4012)
GO
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4037, N'Quan-BoOngLV-PT120340124.jpg', 4012)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4038, N'Quan-BoOngLV-PT120340131.jpg', 4013)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4039, N'Quan-BoOngLV-PT120340132.jpg', 4013)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4040, N'Quan-BoOngLV-PT120340133.jpg', 4013)
INSERT [dbo].[product_image] ([id], [image], [color_id]) VALUES (4041, N'Quan-BoOngLV-PT120340134.jpg', 4013)
SET IDENTITY_INSERT [dbo].[product_image] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (4, CAST(N'2022-06-16' AS Date), N'Sản phẩm áo thun nam siêu thoáng mát', N'Áo Balo', 90000, 500, N'Ao-BaLo-PT1203', N'aobalo_luc.jpg', 1)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (8, CAST(N'2022-06-16' AS Date), N'Áo sơ mi cá tính. Thể hiện sự năng động của người mặc', N'Áo Sơ Mi Hoa', 100000, 899, N'Ao-SoMiHoa-PT1203', N'aosomihoa_lam.jpg', 1)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (9, CAST(N'2022-06-16' AS Date), N'Sản phẩm áo the thao nam siêu thoáng mát', N'Áo Thể Thao', 120000, 881, N'Ao-TheThao-PT1203', N'aothethao_den.jpg', 1)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (10, CAST(N'2022-06-16' AS Date), N'Áo chính hảng, Siêu xịn, Giá siêu rẻ.', N'Áo Thun', 120000, 895, N'Ao-Thun-PT1203', N'aothun_den.jpg', 1)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (12, CAST(N'2022-06-16' AS Date), N'Quần thun bó đẹp, siêu rẻ và chất lượng cao.', N'Quần Thun Bó ', 200000, 900, N'Quan-ThunBo-PT12032604', N'quanbong_den.jpg', 2)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (13, CAST(N'2022-06-16' AS Date), N'Quần thun cao cấp, chất lượng cao.', N'Quần Thun Cao cấp', 250000, 900, N'Quan-ThunCaoCap-PT12032604', N'quandai_den.jpg', 2)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (14, CAST(N'2022-06-16' AS Date), N'Quần vải dù thoáng mát, chất lượng cao và không thấm nước.', N'Quần Dù', 250000, 900, N'Quan-Du-PT12032604', N'quandu_bien.jpg', 2)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (15, CAST(N'2022-06-16' AS Date), N'Quần đùi chất lượng cao.', N'Quần Đùi', 120000, 898, N'Quan-DuiDa-PT12032604', N'quandui_da.jpg', 2)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (16, CAST(N'2022-06-16' AS Date), N'Quần Joker phù hợp với giới trẻ, mặt hàng chất lượng cao.', N'Quần Joker', 250000, 900, N'Quan-Joker-PT12032604', N'quanjoker_bien.jpg', 2)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (17, CAST(N'2022-06-16' AS Date), N'Quần kaki thoáng mát, đẹp và hợp thời trang với giới trẻ hiện nay.', N'Quần Kaki', 150000, 900, N'Quan-Kaki-PT12032604', N'quankaki_da.jpg', 2)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (18, CAST(N'2022-06-16' AS Date), N'Áo sơ mi thoáng mát, mỏng nhẹ, đẹp và chất lượng cao.', N'Áo Sơ Mi Vải', 110000, 890, N'Ao-SoMiVai-PT1203', N'aosomivai_ghi.jpg', 1)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (1015, CAST(N'2022-06-18' AS Date), N'Kính Mát Irma Chính Hãng Phân Phối Bởi Hato. Chiết Khấu Hấp Dẫn Cho Cửa Hàng. Thiết Kế Thời Trang Mỏng Nhẹ. Web Cập Nhật Mẫu Mới Liên Tục. Ship Hàng Toàn Quốc', N'Kính Mát Irma', 200000, 900, N'PK-KinhRam-PT1203', N'PK-KinhRam-PT120388738.jpg', 3)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (1017, CAST(N'2022-06-18' AS Date), N'Với thiết kế này, chiếc sơ mi hàng hiệu mang lại sự mềm mại, tinh khôi và duyên dáng cho những quý cô nữ tính, dịu dàng. ', N'Áo Thun Nữ Thoáng Mát', 150000, 296, N'Ao-ThuThoangMat-PT1203', N'Ao-ThuThoangMat-PT120341645.jpg', 4)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (2007, CAST(N'2022-06-18' AS Date), N'Áo chữ thập siêu gợi cảm', N'Áo Nữ Chữ Thập', 150000, 498, N'Ao-ChuThap-PT1203', N'Ao-ChuThap-PT120392138.jpg', 4)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (3007, CAST(N'2022-06-18' AS Date), N'Áo sơ mi trơn phong cách, phù hợp cho các bạn nữ', N'Áo Sơ Mi Trơn', 300000, 200, N'Ao-SoMiTron_PT1203', N'Ao-SoMiTron_PT120394290.jpg', 4)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (3009, CAST(N'2022-06-18' AS Date), N'Quần ống xuông dành cho nữ', N'Quần Ống Xuông', 150000, 300, N'Quan-OngXuong-PT1203', N'Quan-OngXuong-PT120395126.jpg', 5)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (4009, CAST(N'2022-06-21' AS Date), N'Áo sơ mi thoáng mát. Giúp các bạn nam tự tin trong những ngày hè nóng bức', N'Áo Sơ Mi', 200000, 900, N'Ao-SoMi-PT1203', N'Ao-SoMi-PT120387359.jpg', 1)
INSERT [dbo].[products] ([id], [create_date], [description], [name], [price], [quantity], [slug], [thumbnail], [category_id]) VALUES (4010, CAST(N'2022-06-21' AS Date), N'Quần bo ống cho nữ', N'Quần Bo Ống LV', 200000, 900, N'Quan-BoOngLV-PT1203', N'Quan-BoOngLV-PT120368583.jpg', 5)
SET IDENTITY_INSERT [dbo].[products] OFF
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FKjs0ht7btbgt5u0jpossmgvfk5] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FKjs0ht7btbgt5u0jpossmgvfk5]
GO
ALTER TABLE [dbo].[product_image]  WITH CHECK ADD  CONSTRAINT [FKyapmpajnfpv35ohg5sv1up3m] FOREIGN KEY([color_id])
REFERENCES [dbo].[product_color] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product_image] CHECK CONSTRAINT [FKyapmpajnfpv35ohg5sv1up3m]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
USE [master]
GO
ALTER DATABASE [Java5_ShopPT] SET  READ_WRITE 
GO
