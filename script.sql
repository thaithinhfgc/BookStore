USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 8/2/2021 11:59:06 AM ******/
CREATE DATABASE [BookManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BookManagement]
GO
/****** Object:  Table [dbo].[tblBooks]    Script Date: 8/2/2021 11:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooks](
	[bookID] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
	[categoryID] [nvarchar](50) NOT NULL,
	[decs] [nvarchar](1000) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[image] [nvarchar](100) NOT NULL,
	[statusID] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_tblBooks] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCarts]    Script Date: 8/2/2021 11:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCarts](
	[userID] [nvarchar](50) NOT NULL,
	[bookID] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[cartID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblCarts] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 8/2/2021 11:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 8/2/2021 11:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[bookID] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 8/2/2021 11:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[totalMoney] [int] NOT NULL,
	[orderDate] [nvarchar](50) NOT NULL,
	[paymentStatus] [nvarchar](20) NOT NULL,
	[orderConfirm] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 8/2/2021 11:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](2) NOT NULL,
	[roleName] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 8/2/2021 11:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [nvarchar](1) NOT NULL,
	[statusName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 8/2/2021 11:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](2) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[statusID] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uniqueEmail] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__tblUsers__AB6E6164A0E7529F] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblBooks]  WITH CHECK ADD  CONSTRAINT [FK_tblBooks_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblBooks] CHECK CONSTRAINT [FK_tblBooks_tblCategories]
GO
ALTER TABLE [dbo].[tblBooks]  WITH CHECK ADD  CONSTRAINT [FK_tblBooks_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblBooks] CHECK CONSTRAINT [FK_tblBooks_tblStatus]
GO
ALTER TABLE [dbo].[tblCarts]  WITH CHECK ADD  CONSTRAINT [FK_tblCarts_tblBooks] FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBooks] ([bookID])
GO
ALTER TABLE [dbo].[tblCarts] CHECK CONSTRAINT [FK_tblCarts_tblBooks]
GO
ALTER TABLE [dbo].[tblCarts]  WITH CHECK ADD  CONSTRAINT [FK_tblCarts_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblCarts] CHECK CONSTRAINT [FK_tblCarts_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblBooks] FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBooks] ([bookID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblBooks]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [BookManagement] SET  READ_WRITE 
GO
