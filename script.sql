USE [EBBBBStore123C]
GO
/****** Object:  Database [BBStore1]    Script Date: 12/8/2023 3:22:34 PM ******/
CREATE DATABASE [EBBBBStore123C]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EBBBBStore123C].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [EBBBBStore123C] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET ARITHABORT OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EBBBBStore123C] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EBBBBStore123C] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EBBBBStore123C] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EBBBBStore123C] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EBBBBStore123C] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EBBBBStore123C] SET  MULTI_USER 
GO
ALTER DATABASE [EBBBBStore123C] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EBBBBStore123C] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EBBBBStore123C] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EBBBBStore123C] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EBBBBStore123C] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EBBBBStore123C] SET QUERY_STORE = OFF
GO
USE [EBBBBStore123C]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/8/2023 3:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[resetToken] [varchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 12/8/2023 3:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/8/2023 3:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/8/2023 3:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/8/2023 3:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	    [PhoneNumber] [nvarchar](20) NULL, -- Thêm trường số điện thoại

	Status Integer default 0
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/8/2023 3:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[NXB] [nvarchar](50) NOT NULL,
	[TG] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
	[HeadImage] [nvarchar](50) NULL,
	[GioiThieu] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/8/2023 3:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'', N'', N'', N'', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ALFKI', N'alfki', N'Maria Anders', N'alfki@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ANATR', N'anatr', N'Ana Trujillo', N'anatr@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ANTON', N'anton', N'Antonio Moreno', N'anton@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'AROUT', N'arout', N'Thomas Hardy', N'arout@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BERGS', N'bergs', N'Christina Berglund', N'bergs@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BLAUS', N'blaus', N'Hanna Moos', N'blaus@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BLONP', N'blonp', N'Frédérique Citeaux', N'blonp@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BOLID', N'bolid', N'Martín Sommer', N'bolid@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BONAP', N'bonap', N'Laurence Lebihan', N'bonap@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BOTTM', N'bottm', N'Elizabeth Lincoln', N'bottm@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BSBEV', N'bsbev', N'Victoria Ashworth', N'bsbev@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'CACTU', N'cactu', N'Patricio Simpson', N'cactu@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'CENTC', N'centc', N'Francisco Chang', N'centc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'CHOPS', N'chops', N'Yang Wang', N'chops@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'COMMI', N'commi', N'Pedro Afonso', N'commi@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'CONSH', N'consh', N'Elizabeth Brown', N'consh@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'customer', N'123', N'Nguyễn Văn Tèo', N'teonv@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'dat', N'2', N'Tran Tuan Dat', N'dat9a13@gmail.com', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'dat1', N'123', N'Tran Tuan Datsad', N'datt8843@gmail.com', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'dat12', N'1', N'Tran Tuan Dat', N'dat@phptravels.com', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'director', N'123', N'Nguyễn Chí Phèo', N'pheonc@fpt.edu.vn', N'-1407968806.jpg', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'DRACD', N'dracd', N'Sven Ottlieb', N'dracd@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'DUMON', N'dumon', N'Janine Labrune', N'dumon@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'EASTC', N'eastc', N'Ann Devon', N'eastc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ERNSH', N'ernsh', N'Roland Mendel', N'ernsh@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FAMIA', N'famia', N'Aria Cruz', N'famia@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FISSA', N'fissa', N'Diego Roel', N'fissa@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FOLIG', N'folig', N'Martine Rancé', N'folig@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FOLKO', N'folko', N'Maria Larsson', N'folko@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FRANK', N'frank', N'Peter Franken', N'frank@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FRANR', N'franr', N'Carine Schmitt', N'franr@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FRANS', N'frans', N'Paolo Accorti', N'frans@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FURIB', N'furib', N'Lino Rodriguez', N'furib@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GALED', N'galed', N'Eduardo Saavedra', N'galed@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GODOS', N'godos', N'José Pedro Freyre', N'godos@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GOURL', N'gourl', N'André Fonseca', N'gourl@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GREAL', N'greal', N'Howard Snyder', N'greal@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GROSR', N'grosr', N'Manuel Pereira', N'grosr@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'HANAR', N'hanar', N'Mario Pontes', N'hanar@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'HILAA', N'hilaa', N'Carlos Hernández', N'hilaa@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'HUNGC', N'hungc', N'Yoshi Latimer', N'hungc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'HUNGO', N'hungo', N'Patricia McKenna', N'hungo@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ISLAT', N'islat', N'Helen Bennett', N'islat@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'KOENE', N'koene', N'Philip Cramer', N'koene@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LACOR', N'lacor', N'Daniel Tonini', N'lacor@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LAMAI', N'lamai', N'Annette Roulet', N'lamai@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LAUGB', N'laugb', N'Yoshi Tannamuri', N'laugb@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LAZYK', N'lazyk', N'John Steel', N'lazyk@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LEHMS', N'lehms', N'Renate Messner', N'lehms@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LETSS', N'letss', N'Jaime Yorres', N'letss@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LILAS', N'lilas', N'Carlos González', N'lilas@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LINOD', N'linod', N'Felipe Izquierdo', N'linod@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LONEP', N'lonep', N'Fran Wilson', N'lonep@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'MAGAA', N'magaa', N'Giovanni Rovelli', N'magaa@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'MAISD', N'maisd', N'Catherine Dewey', N'maisd@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'MEREP', N'merep', N'Jean Fresnière', N'merep@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'MORGK', N'morgk', N'Alexander Feuer', N'morgk@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'NORTS', N'norts', N'Simon Crowther', N'norts@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'OCEAN', N'ocean', N'Yvonne Moncada', N'ocean@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'OLDWO', N'oldwo', N'Rene Phillips', N'oldwo@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'OTTIK', N'ottik', N'Henriette Pfalzheim', N'ottik@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'PARIS', N'paris', N'Marie Bertrand', N'paris@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'PERIC', N'peric', N'Guillermo Fernández', N'peric@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'PICCO', N'picco', N'Georg Pipps', N'picco@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'PRINI', N'prini', N'Isabel de Castro', N'prini@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'QUEDE', N'quede', N'Bernardo Batista', N'quede@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'QUEEN', N'queen', N'Lúcia Carvalho', N'queen@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'QUICK', N'quick', N'Horst Kloss', N'quick@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'RANCH', N'ranch', N'Sergio Gutiérrez', N'ranch@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'RATTC', N'rattc', N'Paula Wilson', N'rattc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'REGGC', N'reggc', N'Maurizio Moroni', N'reggc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'RICAR', N'ricar', N'Janete Limeira', N'ricar@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'RICSU', N'ricsu', N'Michael Holz', N'ricsu@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ROMEY', N'romey', N'Alejandra Camino', N'romey@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SANTG', N'santg', N'Jonas Bergulfsen', N'santg@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SAVEA', N'savea', N'Jose Pavarotti', N'savea@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SEVES', N'seves', N'Hari Kumar', N'seves@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SIMOB', N'simob', N'Jytte Petersen', N'simob@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SPECD', N'specd', N'Dominique Perrier', N'specd@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SPLIR', N'splir', N'Art Braunschweiger', N'splir@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'staff', N'123', N'Phạm Thị Nở1', N'nopt@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SUPRD', N'suprd', N'Pascale Cartrain', N'suprd@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'thdch', N'123', N'Tran Tuan Dat', N'dattt8843@gmail.com', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'thdch11', N'2', N'datcute', N'dattt8843@gmail.com', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'thdch11111', N'123', N'Tran Tuan Dat', N'dattt8843@gmail.com', N'fpoly1.jpg', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'THEBI', N'thebi', N'Liz Nixon', N'thebi@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'THECR', N'thecr', N'Liu Wong', N'thecr@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'TOMSP', N'tomsp', N'Karin Josephs', N'tomsp@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'TORTU', N'tortu', N'Miguel Angel Paolino', N'tortu@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'TRADH', N'tradh', N'Anabela Domingues', N'tradh@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'TRAIH', N'traih', N'Helvetius Nagy', N'traih@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'VAFFE', N'vaffe', N'Palle Ibsen', N'vaffe@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'VICTE', N'victe', N'Mary Saveley', N'victe@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'VINET', N'vinet', N'Paul Henriot', N'vinet@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WANDK', N'wandk', N'Rita Müller', N'wandk@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WARTH', N'warth', N'Pirkko Koskitalo', N'warth@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WELLI', N'welli', N'Paula Parente', N'welli@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WHITC', N'whitc', N'Karl Jablonski', N'whitc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WILMK', N'wilmk', N'Matti Karttunen', N'wilmk@gmail.com', N'user.png', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WOLZA', N'wolza', N'Zbyszek Piestrzeniewicz', N'wolza@gmail.com', N'user.png', NULL)
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'ALFKI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'ANATR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (4, N'ANTON', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'AROUT', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (6, N'BERGS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7, N'BLAUS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (8, N'BLONP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (9, N'BOLID', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (10, N'BONAP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (11, N'BOTTM', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (12, N'BSBEV', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (13, N'CACTU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (14, N'CENTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (15, N'CHOPS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (16, N'COMMI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (17, N'CONSH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (18, N'DRACD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (19, N'DUMON', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (20, N'EASTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (21, N'ERNSH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (22, N'FAMIA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (23, N'FISSA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (24, N'FOLIG', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (25, N'FOLKO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (26, N'FRANK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (27, N'FRANR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (28, N'FRANS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (29, N'FURIB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (30, N'GALED', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (31, N'GODOS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (32, N'GOURL', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (33, N'GREAL', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (34, N'GROSR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (35, N'HANAR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (36, N'HILAA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (37, N'HUNGC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (38, N'HUNGO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (39, N'ISLAT', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (40, N'KOENE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (41, N'LACOR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (42, N'LAMAI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (43, N'LAUGB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (44, N'LAZYK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (45, N'LEHMS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (46, N'LETSS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (47, N'LILAS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (48, N'LINOD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (49, N'LONEP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (50, N'MAGAA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (51, N'MAISD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (52, N'MEREP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (53, N'MORGK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (55, N'NORTS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (56, N'OCEAN', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (57, N'OLDWO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (58, N'OTTIK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (59, N'PARIS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (60, N'PERIC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (61, N'PICCO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (62, N'PRINI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (63, N'QUEDE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (64, N'QUEEN', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (65, N'QUICK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (66, N'RANCH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (67, N'RATTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (68, N'REGGC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (69, N'RICAR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (70, N'RICSU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (71, N'ROMEY', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (72, N'SANTG', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (74, N'SAVEA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (75, N'SEVES', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (76, N'SIMOB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (77, N'SPECD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (78, N'SPLIR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (79, N'SUPRD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (80, N'customer', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (82, N'THEBI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (83, N'THECR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (84, N'TOMSP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (85, N'TORTU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (86, N'TRADH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (87, N'TRAIH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (89, N'VAFFE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (90, N'VICTE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (91, N'VINET', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (92, N'WANDK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (93, N'WARTH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (94, N'WELLI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (95, N'WHITC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (96, N'WILMK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (97, N'WOLZA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (98, N'director', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (100, N'staff', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2103, N'director', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7103, N'staff', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1000', N'Văn Học', N'1.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1001', N'Sách kinh tế', N'2.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1002', N'Sách tâm lý – Kỹ năng sống', N'3.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1003', N'Sách thiếu nhi', N'4.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1004', N'Ngôn tình', N'5.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1005', N'Tiểu sử hồi ký', N'6.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1006', N'Sách Giáo Khoa', N'7.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1007', N'Sách nuôi dạy con', N'8.png')
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100005, 10249, 1051, 42.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100006, 10250, 1041, 7.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100007, 10251, 1051, 42.4, 35)

SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [PhoneNumber], [Status]) VALUES (10249, N'TOMSP', CAST(N'1996-07-05T00:00:00.000' AS DateTime), N'Luisenstr. 48', '0123456789', 2)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [PhoneNumber], [Status]) VALUES (10250, N'HANAR', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'Rua do Paço, 67', '0987654321', 2)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [PhoneNumber], [Status]) VALUES (10251, N'VICTE', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'2, rue du Commerce', '0123456789', 1)

SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1001, N'Uống Cafe Trên Đường Của Vũ', N'1001.jpg', N'NXB Hội Nhà Văn', N'Trần Tuấn', 78000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1001_1.jpg', N'Cuốn sách tựa những hành trình dài của tác giả Trần Tuấn trên mọi miền đất nước, và cả nước ngoài.  Ấy là những miền đất mà ông đã đi qua, đã cảm, đã ngấm cái chất của vùng. Con người nơi miền đất ấy, câu chuyện nơi những mảnh đất ấy ngấm vào lời văn của ông một cách tự nhiên, bình dị. Và rồi chúng trở thành những miền tâm tưởng.
Một chuyến hành trình tưởng như bất tận. Để rồi đến cuối cùng Trần Tuấn, hay thậm chí cả người đọc mới vỡ ra.
', 17)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1002, N'Hạt Nắng Bồ Đề', N'1002.jpg', N'NXB Lao Động', N'Văn Công Tuấn', 89000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1002_1.jpg', N'Tôi luôn tin tưởng sâu sắc vào lý nhân duyên. Mười lăm bài tản văn trong tập sách này có được là nhờ những duyên lành sau một chuyến hành hương huân tu tại Ấn Độ. Cũng có thể gọi là du ký hay ký sự hành hương.
Số là trong một khóa tu Phật thất ở chùa Bảo Quang Hamburg, khi đang niệm Phật và lạy sám hối, tôi chợt nảy ra ý tưởng rằng, kỳ nghỉ năm tới sẽ không đi du lịch mà phải đi đến Bồ Đề Đạo Tràng. Giờ nghỉ trưa, tôi gọi điện cho người bạn đời và cắt nghĩa là chúng tôi cần một không gian như thế để tập trung tâm ý vào việc tu tập. Tuy bất ngờ nhưng ý kiến được hoan nghênh ngay. Tôi cũng mừng là mọi việc trôi chảy nhanh chóng.
', 35)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1003, N'Hoàng Đế', N'1003.jpg', N'NXB Lao Động', N'Ryszard Kapuściński', 79000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1003_1.jpg', N'Hoàng ĐếHoàng đế là cuốn sách không chỉ mở đầu sự nghiệp quốc tế của phóng sự gia tầm cỡ nhất Ba Lan, mà còn đưa thể loại phóng sự lên ngang tầm văn học cao cấp.Thể loại văn học rất đặc thù, hay gọi cách khác là viết theo văn phong báo chí, hoặc phóng sự, đã trở thành dấu hiệu nhận biết nhà thơ, nhà văn và nhà du hành Ba Lan Ryszard Kapuściński. Chắc hẳn bản thân Ryszard Kapuściński cũng không hề nghĩ rằng chính phóng sự đã cho ông cơ hội đi đến hầu như khắp nơi trên thế giới, đem lại cho ông danh tiếng quốc tế và một vị thế rất uy tín đối với các thế hệ nhà văn, nhà báo kế tiếp ông. Đã mười năm trôi qua kể từ ngày Ryszard Kapuściński ra đi, nhưng ông vẫn là nhà văn có tác phẩm được dịch và xuất bản ra nhiều ngôn ngữ khác nhau trên thế giới. Những phóng sự viết từ những năm 60 hay 70 của thế kỷ XX không hề mất đi tính thời sự của chúng, còn ngôn ngữ dùng để sáng tạo ra chúng thì vẫn rất hấp dẫn, thôi miên và kích thích trí tưởng tượng của đông đảo bạn đọc.', 47)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1004, N'Mang San Hà Đổi Lấy Duy Nhất Một Người Thương', N'1004.jpg', N'NXB Lao Động', N'Nồng Nàn Phố', 99000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1004_1.jpg', N'Trở lại sau Anh ngủ thêm đi em phải dậy lấy chồng và Yêu lần nào cũng đau; Mang san hà đổi lấy duy nhất một người thương là tập thơ thứ ba của Nồng Nàn Phố ra mắt bạn đọc sau một thời gian dài vắng bóng.
Vẫn là những câu thơ giản dị đi vào lòng người, không câu chữ thừa, không gò ép vần vèo, không theo một quy luật cấu tứ phức tạp nào cả… thơ Phố nhẹ nhàng như một bài viết tâm tình kể chuyện. Mạnh dạn trong cách sử dụng hình ảnh bình dị đời thường, Phố viết những câu chuyện xảy ra xung quanhmình bằng một cái nhìn rất mới, rất táo bạo nhưng cũng rất sống động, gần gũi. Thơ Phố đọc như không đọc, cảm như không cảm nhưng lại chạm đến tim gan của tất cả mọi người.
Phố viết thơ từ những câu chuyện của những người xung quanh cô vì thế tình yêu trong thơ Phố cũng chân phương, ngọt ngào, tha thiết dốc hết gan ruột như bất kỳ người phụ nữ nào trên cõi đời này. Mang san hà đổi lấy lấy duy nhất một người thương, nhìn tiêu đề, có người sẽ bảo sao giống Mỵ Châu, tình yêu mù quáng để trên đầu vậy, nhưng không, phụ nữ là vậy, đôi khi chỉ cần một người quan tâm mình, yêu thương mình là đủ đổi hết cả san hà, và với người phụ nữ trong tình yêu, luôn si mê đến khờ dại như vậy đó?
Với một giọng thơ dạn dĩ nồng nàn nhưng luôn trăn trở, suy tư,  Thơ của Phố là thơ của người đàn bà viết thơ, trong thơ không chỉ có tình mà có cả ngọt, đắng cùng tâm tình phụ nữ.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1005, N'Uống Dòng Suối Núi', N'1005.jpg', N'NXB Thế Giới', N'Lama Kunga Rinpoche, Brian Cutillo', 89000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1005_1.jpg', N'Lời nói đầu của LAMA KUNGA RINPOCHE trước kia là Thartse Shabthung của Tu Viện Ngor, Tây Tạng.
“Milarepa là một trong những đạo sư tâm linh nổi tiếng nhất của mọi thời. Ngài không những là một nhà lãnh đạo kiệt xuất của dòng phái Kagyu, mà cũng là một đạo sư rất quan trọng đối với mọi trường phái của Phật giáo Tây Tạng. Ngài là một ngôi sao của Phật giáo sơ thời Tây Tạng, và là một ngôi sao sáng chói của Thiền, soi sáng con đường Phật pháp ngày nay. Chắc chắn ngài không phải là một người hoang tưởng bỏ xã hội và ẩn tu nơi thâm sơn cùng cốc. Thật ra, ngài là một người phiêu lưu đã đạt đến chót đỉnh của ngọn núi cao với một cái nhìn toàn cuộc về sanh tử. Ngài là một chiến sĩ đích thực đã thành công trong việc chiến thắng kẻ thù thật sự, như thế trở thành một người cứu độ cho chúng sanh.
Ngài là người có ba năng lực. Thân ngài là thân của Vajrapani (Bồ tát Kim Cương Thủ), ngữ của ngài là ngữ của Manjusri (Bồ tát Văn Thù Sư Lợi), và sự lắng nghe của ngài là sự lắng nghe của Avalokitesvara (Bồ tát Quán Thế Âm). Milarepa là một con người khỏe mạnh, đầy sức sống với một sự kiên định bất thối chuyển trong cuộc tìm kiếm giải thoát. Ngữ của ngài đẹp đẽ và có thể diễn đạt bất cứ sự gì thành bài ca ứng khẩu, với ngôn ngữ đó ngài đã thể hiện tinh túy của Phật pháp theo những cách có thể hiểu cho tất cả mọi loại người nghe. Sự lắng nghe của ngài thông thấu như của Quán Thế Âm - vị Bồ tát Đại bi mà người Tây Tạng gọi là Chenrezi, người nghe thấu tiếng nói của tất cả chúng sanh.
', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1006, N'Chuyện Tình Kẻ Sĩ Việt Nam', N'1006.jpg', N'NXB Phụ Nữ', N'Đinh Công Vĩ', 86400, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1006_1.jpg', N'Chuyện tình kẻ sĩ Việt Nam tập trung đi sâu vào kể 134 chuyện tình của 134 nhân vật lịch sử, văn hóa của nước nhà. Cuốn sách được chia làm 4 phần. Phần 1 - Thời Cổ đại kể về chuyện tình của 5 nhân vật lịch sử. Phần 2 - Thời Trung đại có 34 nhân vật được kể.', 41)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1007, N'Vệ Sĩ Vô Hình', N'1007.jpg', N'NXB Phụ Nữ', N'Dolores Redondo', 61250, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1007_1.jpg', N'Thi thể các thiếu nữ được tìm thấy ở thung lũng Baztán trong tình trạng bị siết cổ, quần áo rách toạc, khuôn mặt biến dạng. Trên vùng kín của mỗi nạn nhân còn được đặt một chiếc txatxingorri - một loại bánh ngọt đặc trưng của vùng. Ngoài ra, người ta còn phát hiện lông động vật ở trên người các nạn nhân. Ngay lập tức, mọi mối nghi ngờ đều hướng đến basajaun - còn được biết đến dưới tên gọi “quý ông trong rừng” một sinh vật có thật trong truyền thuyết.', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1008, N'Từ Tân Thế Giới - Quyển Thượng', N'1008.jpg', N'NXB Hà Nội', N'Yusuke Kishi', 65000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1008_1.jpg', N'Từ tân thế giới – quyển thượng là cuốn đầu tiên trong series truyện dài gồm 3 tập của tác giả Yusuke Kishi, một kiệt tác văn học giả tưởng và khoa học viễn tưởng Nhật Bản đã xuất sắc giành Grand Prize tại Lễ trao giải khoa học viễn tưởng Nhật Bản lần thứ 29 Nihon SF Taisou 29th do Hiệp hội các nhà văn giả tưởng và khoa học viễn tưởng Nhật Bản bình chọn. Từ tân thế giới cũng được chuyển thể TV series anime do A-1 Pictures studio thực hiện năm 2012 cũng một chuyển thể truyện tranh phát hành bởi Kodansha Comics năm 2012. Bản chuyển thể anime nhận được tiếng vang lớn và được đánh giá là một trong những TV series anime xuất sắc nhất thế kỷ 21', 53)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1009, N'Những Chàng Trai Baltimore', N'1009.jpg', N'NXB Phụ Nữ Việt Nam', N'Joel Dicker', 96390, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1009_1.jpg', N'Bốn năm sau vụ án Harry Quebert hay Chuyện nàng Nola, Marcus Goldman đến Floride để tìm cảm hứng cho cuốn tiểu thuyết tiếp theo. Anh tình cờ gặp lại Alexandra Neville, mối tình thời niên thiếu mà anh từng đánh mất và giờ đây nàng đã trở thành ca sĩ nổi tiếng.  Marcus vẫn còn yêu say đắm Alexandra và ngay lập tức anh cố gắng tìm ra nguyên do vì sao anh lại từ bỏ nàng. Đắm chìm trong dòng hồi tưởng về những kỉ niệm tuổi thơ và thời niên thiếu, Marcus đã vẽ nên một bức tranh về những thành viên gia đình Goldman ở Baltimore mà anh một lòng ngưỡng mộ và cũng là cơ duyên dẫn Marcus quen biết Alexandra.
Marcus Goldman, thuộc tầng lớp trung lưu, sinh sống trong một căn nhà nhỏ ở thị trấn Montclair. Cứ tới kì nghỉ hè hằng năm, Marcus đều đến căn biệt thự nghỉ dưỡng xa hoa của bác Saul Goldman ở Baltimore và sống những ngày tháng hạnh phúc nhất với hai người anh họ của mình là Woody và Hillel. Họ tạo thành Những chàng trai Baltimore hay Hội Goldman. Họ là những con người tài năng, nhiệt huyết, là trung tâm chú ý ở bất cứ nơi nào họ xuất hiện. Nhưng tương lai rực rỡ và vinh quang chói lóa lẽ ra thuộc về họ bỗng chốc sụp đổ chỉ  vì một phút đố kị, lý trí đã bị lòng ghen tuông và sự phản bội hạ gục, khiến cả gia đình rơi vào Thảm kịch.
', 23)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1010, N'Đã Biết Sẽ Có Ngày Hôm Qua', N'1010.jpg', N'NXB Phụ Nữ Việt Nam', N'Huy Hải', 69000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1010_1.jpg', N'Đi qua tháng năm, ai cũng phải trả giá cho sự trưởng thành của mình. Cái giá đó không đong đếm được bằng đắt rẻ, cũng chẳng ai biết đã đong đếm được bằng bao nhiêu vụng dại, thơ ngây.
Đi qua tháng năm, có ai mà không tiếc nuối, có ai mà không mong được trở lại ngày xưa? Chúng ta dù chỉ sống một lần, thế nhưng có những hoài niệm là mãi mãi.
Tuổi trẻ - thanh xuân luôn là những vùng trời tươi đẹp mà con người muốn níu giữ. Bằng lối viết nhẹ nhàng, sâu lắng tác giả Huy Hải dẫn dắt người đọc đi qua các cung bậc khác nhau trong tập 17 truyện ngắn Đã biết sẽ có ngày hôm qua, để rồi thông qua đó gợi nhắc độc giả hãy trân trọng ngày hôm qua, sống hết mình vì ngày hôm nay và cố gắng không ngừng để vẽ nên ngày mai tươi sáng.
Nhà xuất bản Phụ nữ Việt Nam tin rằng khi cầm cuốn sách này trên tay, các bạn cũng sẽ thấy mình của những năm tháng về trước trong đó. Hoặc ít ra những câu chuyện Huy Hải kể, cũng sẽ gợi nhớ hoặc đánh thức một phần kí ức nào đó của riêng bạn, mà bạn ngỡ đã quên...
“Một ngày... Một tháng... Một năm… Hay nhiều hơn thế. Cứ gặp lại là vui rồi. Chuyện cũ đã qua, nên cất nó cẩn thận trong ngăn kéo kí ức. Chúng ta phải sống cho hiện tại, cho những ngày còn chưa xảy đến, phải không. Còn làm gì ai sống được trong quá khứ đâu? Tuổi trẻ cũng chúng ta sẽ xanh mãi, nên đừng vì điều-gì-đó mà làm chúng héo đi, thật chẳng đáng.”
', 57)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1011, N'Ân Sủng Của Đời', N'1011.jpg', N'NXB Phụ Nữ', N'Daniel Glattauer', 105000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1011_1.jpg', N'Daniel Glattauer tiếp tục gây ấn tượng với lối viết vừa hài hước vừa ý nhị, duyên dáng. Câu chuyện vô cùng dí dỏm xoay quanh Geri, một nhà báo hạng... Z bỗng chốc bị cuốn vào cuộc điều tra những món tiền từ thiện bí ẩn cùng cậu con rơi vô cùng cá tính. Thông qua câu chuyện, tác giả viết về tình cảm cha - con, thể hiện trách nhiệm của Geri với cậu con trai 14 tuổi của mình, cũng như bàn về vai trò của người làm báo trong thế giới đương đại vô vàn áp lực. Mượn góc nhìn của Geri, những vấn đề xã hội như: nhập cư trái phép, tị nạn, thất nghiệp, đói nghèo... được tác giả đề cập tới bằng ngòi bút gây cười, cái cười giúp người ta hiểu có thể tiếp cận những vấn đề nóng trong xã hội theo nhiều cách khác nhau.', 24)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1012, N'Đáp Án Của Thanh Xuân', N'1012.jpg', N'NXB Phụ Nữ Việt Nam', N'Tiểu Châu', 70000, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1012_1.jpg', N'Đáp án của thanh xuân là lời hồi đáp cho những tâm hồn trẻ cảm thấy mệt nhoài giữa xã hội ngày một khắc nghiệt và xô bồ. Những người trẻ khi nhìn thấy đích đến của cuộc đời nhưng quãng chạy ngày một dông dài, lúc bước từng bước vững chắc thì lại tự vấn về ý nghĩa sự tồn tại của bản thân, tình cảm con người với con người, cách sống sao cho được là chính mình. Những người trẻ tuổi hiện lên qua giọng kể của tác giả Tiểu Châu rất đỗi bình dị, một cô gái trầm lặng ở một khu thị trấn nhỏ ven biển, anh bạn trong câu lạc bộ trường đại học, vài cô nàng son phấn chốn công sở, đôi khi còn là một vài người trẻ thành công nhưng không mang cái bóng quá lớn, không tự ôm vào mình quá nhiều trách nhiệm lớn lao. Tất cả chỉ để nói với chúng ta rằng: Trưởng thành chưa bao giờ là điều dễ dàng. Có đi qua những năm tháng thanh xuân ghập ghềnh, con người ta mới có thể thấu hiểu mình nhất. Thanh xuân luôn là một câu hỏi lớn, đáp án của mỗi người mỗi khác, nhưng tất cả giao nhau ở một ý nghĩa cuối cùng: trải qua thanh xuân, ai cũng muốn một cuộc đời bình an, một cuộc sống có thể nhẹ mình suy ngẫm, làm điều mình thích và được là chính mình.', 41)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1013, N'Bánh Mì Cô Đơn', N'1013.jpg', N'NXB Phụ Nữ', N'Judith Ryan Hendricks', 72240, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1013_1.jpg', N'Cuốn tiểu thuyết Bánh Mì Cô Đơn của tác giả Judith Ryan Hendricks viết về những thân phận phụ nữ hết sức đời thương. Là Wyn Morrison, biết rất nhiều nhưng không rõ mình muốn gì? Là Christine Mayle, yêu sàn diễn đến cháy bỏng, nhưng không dễ gì tìm được người đàn ông của đời mình. Là người mẹ hoàn hảo của Wyn, sau nhiều năm trời im lặng đã mở ra những tâm sự chân thành cùng con gái. Là những phụ nữ vừa bình dị vừa độc đáo ở hiệu bánh Quen Srteet. Tất cả ít nhiều đã giúp Wyn nhìn lại chính mình sau khi mải sống cuộc đời nhung lụa của một cô vợ được cưới về chỉ cốt để làm sang cho chồng.
Và rồi Wyn nhận ra rằng thứ công việc cầm cự mưu sinh ở tiệm bánh mì đã an ủi lòng cô một cách kỳ diệu và bất ngờ giúp cô một lần nữa hiểu được rằng chẳng có gì giống như trước nữa... Bánh mì nở ra, những nỗi đau dịu lại, trái tim được hàn gắn, và cánh cửa tương lai hé mở.
', 53)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1014, N'Bạo Lực', N'1014.jpg', N'NXB Phụ Nữ', N'Karine GIÉBEL', 87320, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1014_1.jpg', N'Câu chuyện xoay quanh gia đình vị giáo sư Reynier giàu có sinh sống tại một biệt thự trong một thành phố nhỏ gần Nice. Ông bố là bác sĩ phẫu thuật tài giỏi, điều hành một bệnh viên tư nổi tiếng. Bà mẹ kế là một phu nhân xinh đẹp quyến rũ. Cô con gái là sinh viên văn khoa đẹp rạng rỡ.
Bề ngoài, quả thực đó là một gia đình lí tưởng, nhưng bên trong có thực sự lí tưởng như người ta hằng mơ ước không?
Một câu chuyện dồn dập khiến người đọc không thể dứt ra được. Cốt truyện không rối rắm nhưng những tình tiết khi khép khi mở khiến bạn hồi hộp như sắp bắt được tội phạm mà không biết rằng đó chỉ là báo động giả, để rồi lại khiến bạn chạy theo từng trang truyện để khám phá. Qua mạch truyện, những mảnh đời cay đắng chua chát cứ dần dần hiện ra.
Armand Reynier có đúng là “lương y như từ mẫu”? Tình yêu mê muội mà ông ta dành cho con gái Maud đã đúng cách chưa. Tiền bạc và danh vọng đã khiến ông mờ mắt đến mức độ nào?...
Cô vợ trẻ Charlotte phải chăng là người đàn bà chỉ thích quyến rũ đàn ông? Ẩn sau hành động có vẻ trăng hoa ấy, là một nỗi đau đớn vô hạn vì không nhận được tình yêu của chồng, chấp nhận bị bạo hành tinh thần để đổi lại sự chăm sóc y tế tại một bệnh viện sang trọng cho cho đứa con riêng sống thực vật.
Maud, một tiểu thư lá ngọc cành vàng, nhưng mang hơi hướng của sự nổi loạn. Tâm tư cô gái mới lớn, những ghen tuông hờn giận vô cớ, những suy nghĩ nông nổi khiến cô gái trẻ trườn sâu vào ma túy đến nỗi suýt mất mạng…
Tất cả cuộc sống giả tạo cùng những bi kịch gia đình ấy chỉ dần dần lộ diện khi Luc Garnier bước chân vào trong gia đình họ và là người bọn họ tin cậy tâm sự mọi nỗi niềm thầm kín. Luc là người đã kịp thời cứu giúp Maud khỏi tay một kẻ hành hung toan cưỡng bức cô và từ đó Luc bắt đầu thâm nhập vào gia đình Reynier với tư cách vệ sĩ. Đây có phải là một sự vô tình, hay đã được sắp đặt. Kể từ khi Luc xuất hiện, gia đình Reynier luôn xảy ra chuyện. Armand Reynier cứ uổng công bật đèn báo động, cài kỹ cửa, nhưng tên trộm vẫn lẻn được vào nhà, thậm chí đến tận giường ngủ của vợ chồng ông và để lại những lời nhắn khủng khiếp, bạo hành tinh thần ông. Vậy thực chất Luc Garnier là ai? Động cơ của Luc là gì ?
Tất cả các nhân vật đều chịu một “bạo lực” tinh thần. Mỗi người  tưởng như có cuộc sống phù hoa, nhưng bản chất tâm hồn họ đều bị một thứ bạo hành gặm nhấm đến độ mục ruỗng, họ chán ghét nhau nhưng vẫn sống bên nhau.
Rất nhiều tình tiết đan xen, những nút thắt kịch tính, những cái bẫy giăng mắc như mạng nhện cuối cùng đã được tháo gỡ một cách bất ngờ ở đoạn kết của câu chuyện
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1015, N'Hối Hận', N'1015.jpg', N'NXB Phụ Nữ', N'Đông Tây', 712500, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1015_1.jpg', N'Những tưởng chỉ có nói dối mới làm tổn hại đến những người xung quanh, nhưng với Tăng Quảng Hiền, lời nói chân chất của cậu lại là nguồn cơn bi kịch cho cả gia đình. Bố bị hãm hại, mẹ tự sát, em gái bỏ đi. Chỉ trong phút chốc, cậu đã trở thành tội đồ trong mắt mọi người.
Trải qua thời thơ ấu tủi nhục, sóng gió cuộc đời một lần nữa lại ập đến khi Tăng Quảng Hiền phải đối mặt với bản án mười năm tù chỉ vì chút nhục cảm bồng bột của tuổi trẻ.
Mười năm gian lao trong tù, bên ngoài song sắt là một tình yêu trung trinh đang chờ đợi cậu. Nhưng đến khi mãn hạn, điều đón chờ Tăng Quảng Hiền lại là hoa trong bóng kính, trăng nơi đáy sông, khiến cậu không ngừng sai lầm càng thêm sai lầm, hối hận lại càng hối hận...
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1016, N'Người Ruồi', N'1016.jpg', N'NXB Phụ Nữ', N'Hans Olav Lahlum', 70210, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1016_1.jpg', N'Từng người trong bọn họ lần lượt bị giết hại. Tôi tin rằng chúng ta đang tìm một người ruồi… Oslo một ngày tháng Tư năm 1968: Thanh tra cảnh sát trẻ tuổi Kolbjørn Kristiansen (gọi tắt là K2) nhận được thông báo về một vụ án mạng ''rất không bình thường'' tại lầu trên lầu 2 của một chung cư nhỏ gồm 6 căn hộ và 1 tầng hầm. Những người hàng xóm sau khi nghe tiếng súng nổ đã lập tức chạy lên căn hộ...', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1017, N'Người Vệ Tinh', N'1017.jpg', N'NXB Phụ Nữ', N'Hans Olav Lahlum', 81920, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1017_1.jpg', N'Oslo, năm 1969.
Khi thanh tra cảnh sát trẻ tuổi Kolbjørn Kristiansen (còn gọi là K2) nhận được thông báo một tỉ phú đã gục chết trong bữa tiệc tối, anh vô cùng bàng hoàng. Bởi nạn nhân chính là Magdalon Schelderup, doanh nhân giàu có và là cựu chiến binh Kháng chiến, chỉ mới liên lạc với anh trước đó một ngày vì lo sợ mạng sống của mình đang bị đe dọa.
Đây là cuốn tiểu thuyết thứ hai nằm trong xêri về bộ đôi K2 và Patricia của tác giả Hans Olav Lahlum dành tặng cho nữ hoàng trinh thám cổ điển AgathaChristie. 
Sau khi nổi tiếng nhờ phá thành công vụ án Người ruồi (với sự trợ giúp đắc lực từ Patricia Borchmann, cô gái 19 tuổi ngồi xe lăn nhưng có trí óc phán đoán siêu phàm), thanh tra cảnh sát trẻ tuổi Kolbjørn Kristiansen (gọi tắt là K2) nhận được cú điện thoại bất ngờ của tỷ phú Magdalon Schelderup muốn hẹn gặp anh vì ông ta cam đoan một trong những người gần gũi và thân thiết nhất của mình âm mưu sát hại ông vào tuần tới!
Ngày hôm sau, K2 nhận được cuộc gọi thông báo Magdalon đã bị đầu độc chết trong bữa tiệc tại nhà riêng của chính ngài tỷ phú. Mười thực khách trong bữa tối đó gồm những người thân thiết của nạn nhân: người vợ hiện tại và con gái của bà, người vợ cũ, hai người con trai, cô thư ký riêng, em gái nạn nhân, giám đốc điều hành và cặp vợ chồng là đồng đội cũ từng cùng tham gia Kháng chiến với nạn nhân.
K2 ngay lập tức thẩm vấn các nghi phạm và anh vô cùng bối rối trước sự dối trá trong lời khai của tất cả mười nhân chứng. Trong khi vụ án vẫn chưa được điều tra làm rõ thì hai người khác trong bữa tiệc lần lượt bị giết chết khiến vụ án càng đi vào ngõ cụt.
Viên thanh tra buộc phải nhờ đến sự trợ giúp của cô gái 19 tuổi ngồi xe lăn Patricia để làm sáng tỏ nhiều bí ẩn về Magdalon và những người vệ tinh quanh ông ta, luôn chịu sự ảnh hưởng và chi phối của ông ta dù nạn nhân đã chết.
', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1018, N'Verity - Bí Mật Bị Chôn Vùi', N'1018.jpg', N'Thanh Niên', N'Colleen Hoover', 130650, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1018_1.jpg', N'Lowen Ashleigh là một nhà văn đang gặp khó khăn và đang trên bờ vực phá sản thì nhận được một đề nghị công việc có một không hai trên đời. Jeremy Crawford, chồng của tác giả nổi tiếng Verity Crawford, đã thuê Lowen hoàn thành những cuốn sách còn lại trong một loạt truyện thành công mà người vợ gặp tai nạn của anh không thể hoàn thành.
Lowen đến nhà Crawford, sẵn sàng sắp xếp lại các ghi chú và phác thảo trong nhiều năm của Verity, với hy vọng tìm đủ tài liệu để giúp cô ấy có thể bắt đầu công việc của mình. Trong phòng làm việc hỗn loạn, Lowen ngoài ý muốn phát hiện ra một cuốn tự truyện chưa hoàn thành mà Verity có lẽ sẽ không bao giờ cho ai đọc. Từng trang, từng trang của cuốn tự truyện ngập tràn những lời thú tội lạnh thấu tâm can, bao gồm cả hồi ức của Verity về cái đêm mà gia đình cô mãi mãi thay đổi.
Lowen quyết định giấu bản thảo vì cô biết rằng nội dung của nó có thể sẽ đánh gục Jeremy, người chồng, người cha đã phải chịu vô vàn đau đớn trong suốt nhiều tháng qua. Nhưng khi tình cảm của Lowen dành cho Jeremy lớn dần, cô nhận ra từng lời trong cuốn tự truyện này đều có thể khiến cô trở thành người hưởng lợi. Suy cho cùng, dù cho Jeremy có chung thủy với người vợ gặp tai nạn của mình đến thế nào, thì sự thật kinh hoàng này chắc chắn sẽ khiến anh không thể tiếp tục yêu cô ta vô điều kiện nữa.
Nhưng đến cuối cùng, ai mới là kẻ nói dối, còn sự thật thuộc về ai?
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1019, N'Con Cừu Thứ Ngàn Lẻ Một Đêm Qua', N'1019.jpg', N'Thanh Niên', N'Marina Benjamin', 86430, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1019_1.jpg', N'Rối loạn giấc ngủ - từ KẺ THÙ cướp đi năng lượng và sự tập trung đến ĐỒNG MINH cho sự sáng tạo vô biênTrong thế giới ngày nay, chứng mất ngủ hay rối loạn mất ngủ đang ngày càng trở nên phổ biến. Mất ngủ đã ảnh hưởng đến khoảng một phần ba dân số toàn cầu – tới nay vẫn chưa có cách trị dứt điểm. Nó là kẻ thù cướp đi năng lượng, sự tập trung và cả những giây phút thư giãn ít ỏi của chúng ta, gây phiền nhiễu đến cuộc sống của nhiều người. Mất ngủ có thể gây tình trạng mệt mỏi khó chịu ảnh hưởng nghiêm trọng đến hiệu suất làm việc và chất lượng cuộc sống.
Con người sẽ ra sao khi mất ngủ cứ ngày một tiếp diễn và gây ảnh hưởng đến đời sống sức khỏe tinh thần?
Liệu ta có thể biến mất ngủ thành đồng minh, thành chứng nhân cho hiện tại, cho cái nhìn sắc sảo và biến nó thành sự sáng tạo vô biên không?
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1020, N'Nhà Tù Shawshank', N'1020.jpg', N'Thanh Niên', N'Stephen King', 240530, CAST(N'1980-03-29' AS Date), 1, N'1000', N'1020_1.jpg', N'Cuốn sách được chia thành 4 phần: Hy vọng tựa nhựa Xuân, Mùa Hè vụn vỡ, Thu tàn thơ ngây, và Câu chuyện mùa Đông, mỗi phần là một câu chuyện. Trong đó:
Nhà tù Shawshank là phần nổi bật nhất, tương ứng với phần Hy vọng tựa nhựa Xuân. Bộ phim cùng tên (Shawshank Redemption) cũng đã được đề cử cho giải Oscar năm 1994 cho hạng mục Phim chuyển thể hay nhất.
Truyện nói về Andy Dufresne một chủ ngân hàng bị kết án oan giết vợ phải ngồi tù chung thân tại nhà tù khét tiếng nhất bang là Shawshank. Khác hẳn với những con người đầu hàng số phận và sống buông xuôi tại những buồng giam, song sắt – Andy vẫn nuôi dưỡng kế hoạch vượt ngục trong mình. Trong suốt quá trình ở Shawshank, Andy chứng kiến sự tàn ác của cai ngục, của sự mất nhân tính và sự tha hóa của giám đốc nhà tù khi nhúng tay vào tham nhũng, bóc lột và giết chóc tù nhân. Tuy nhiên giữa những mặt tối ấy, tình bạn cao đẹp cũng như niềm tin vào số phận của Andy dành cho những con người anh yêu mến như Red, Tommy bật lên như ngọn lửa le lói trong giông bão nhưng vô cùng mạnh mẽ đưa con người vực dậy từ cõi chết. Có thể đây là một tác phẩm ít máu me và cảm động nhất của Stephen King.
', 14)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1021, N'Nghệ Thuật Tư Duy Chiến Lược', N'1021.jpg', N'NXB Lao Động', N'Avinash K Dixit, Barry J Nalebuff', 239000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1021_1.jpg', N'Thông qua Nghệ thuật tư duy chiến lược, bạn sẽ thấy "những người thành công" trong mọi lĩnh vực từ giải trí đến chính trị, từ giáo dục đến thể thao, v.v... đạt thành công vang dội là nhờ luôn nắm vững lý thuyết trò chơi hay nghệ thuật tư duy chiến lược, với khả năng dự đoán những động thái tiếp theo của người cùng chơi, trong khi biết rõ rằng đối thủ đang cố gắng làm điều tương tự với mình.
Ngoài ra, bạn cũng sẽ nắm được những bí kíp vô cùng giản đơn để có thể áp dụng lý thuyết trò chơi vào cuộc sống lẫn công việc, từ đó sở hữu một cuộc đời đáng sống.
', 41)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1022, N'Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', N'1022.jpg', N'NXB Tổng Hợp TPHCM', N'Napoleon Hill', 88000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1022_1.jpg', N'Think and Grow Rich - Nghĩ giàu và làm giàu là một trong những cuốn sách bán chạy nhất mọi thời đại. Đã hơn 60 triệu bản được phát hành với gần trăm ngôn ngữ trên toàn thế giới và được công nhận là cuốn sách tạo ra nhiều triệu phú, một cuốn sách truyền cảm hứng thành công nhiều hơn bất cứ cuốn sách kinh doanh nào trong lịch sử.
Tác phẩm này đã giúp tác giả của nó, Napoleon Hill, được tôn vinh bằng danh hiệu “người tạo ra những nhà triệu phú”. Đây cũng là cuốn sách hiếm hoi được đứng trong top của rất nhiều bình chọn theo nhiều tiêu chí khác nhau - bình chọn của độc giả, của giới chuyên môn, của báo chí. Lý do để Think and Grow Rich - Nghĩ giàu và làm giàu có được vinh quang này thật hiển nhiên và dễ hiểu: Bằng việc đọc và áp dụng những phương pháp đơn giản, cô đọng này vào đời sống của mỗi cá nhân mà đã có hàng ngàn người trên thế giới trở thành triệu phú và thành công bền vững.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1023, N'Nguyên Lý Marketing', N'1023.jpg', N'NXB Đại Học Kinh Tế Quốc Dân', N'Philip Kotler, Gary Armstrong', 599400, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1023_1.jpg', N'Cuốn sách xoay quanh năm chủ đề lớn về giá trị khách hàng và sự gắn kết khách hàng, tìm hiểu cách thức mà giá trị khách hàng và sự gắn kết khách hàng thúc đẩy mọi chiến lược marketing chất lượng hơn, đặc biệt là trong thị trường mà mạng xã hội và kỹ thuật số bùng nổ, thay đổi mỗi ngày', 47)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1024, N'Tiktok Marketing', N'1024.jpg', N'NXB Thanh Niên', N'Markus Rach', 111200, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1024_1.png', N'TikTok đang bùng nổ ở mọi nơi và đã trở thành một trong những ứng dụng được tải xuống nhiều nhất thế giới. Không có gì ngạc nhiên khi các nhà tiếp thị đã bắt đầu nhìn thấy tiềm năng của nền tảng này. Kinh doanh đi cùng với xu hướng thì mới có thể phát triển và tiếp cận gần hơn với nhiều tập khách hàng. TikTok đã thu hút được sự chú ý lớn từ nhiều nhà kinh doanh khi mạng xã hội này có thể tạo ra những content vô cùng đặc sắc, đồng thời còn là một kênh marketing hiệu quả.
Cuốn sách này là một hướng dẫn TikTok marketing, trả lời những câu hỏi của các nhà marketing khi nghĩ về TikTok, gợi ý những cách thức khả thi mà các thương hiệu có thể tận dụng tối đa TikTok. Nhiều thương hiệu kết hợp việc điều hành các kênh riêng của họ và làm việc với những người có ảnh hưởng để truyền bá nội dung đến đối tượng rộng hơn. Các thương hiệu cũng có thể thực hiện chiến dịch TikTok marketing của mình bằng cách khuyến khích các thử thách kèm hashtag trên TikTok. Khi thử thách #hashtag được đưa ra trên TikTok, mọi người có thể tham gia chỉ bằng vài lần nhấp chuột. 
', 24)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1025, N'Chiến Tranh Tiền Tệ - Phần 1 - Ai Thực Sự Là Người Giàu Nhất Thế Giới? (Tái bản 2022)', N'1025.jpg', N'NXB Lao Động', N'Song Hong Bing', 165000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1025_1.jpg', N'Là một cuốn sách làm sửng sốt những ai muốn tìm hiểu về bản chất của tiền tệ, để từ đó nhận ra những hiểm họa tài chính tiềm ẩn nhằm chuẩn bị tâm lý cho một cuộc chiến tiền tệ “không đổ máu”, “Chiến tranh tiền tệ - Ai thật sự là người giàu nhất thế giới” còn phơi bày những âm mưu của các nhà tài phiệt thế giới trong việc tạo ra những cơn “hạn hán”, “bão lũ” về tiền tệ để thu lợi nhuận. Cuốn sách cũng đề cập đến sự phát triển của các định chế tài chính – những cơ cấu được xây dựng nhằm đáp ứng nhu cầu phát triển vũ bão của nền kinh tế toàn cầu.', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1026, N'Tiền Đẻ Ra Tiền - Đầu Tư Tài Chính Thông Minh (Tái Bản)', N'1026.jpg', N'Hồng Đức', N'Duncan Bannatyne', 83400, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1026_1.jpg', N'Sau sự thành công của hai cuốn sách “Thức tỉnh và thay đổi cuộc đời bạn: Bí quyết thành công của triệu phú Anh” và “Quản lý thời gian thông minh của người thành đạt: Bí quyết thành công của triệu phú Anh” là những câu chuyện, những lời khuyên dựa trên những kinh nghiệm phong phú của cuộc đời mình và nhằm mục đích truyền cảm hứng động lực làm giàu cho mọi công dân đều có thể trở thành triệu phú, thì triệu phú người Anh và tác giả của nhiều đầu sách nổi tiếng Duncan Bannatyne đã cho ra mắt cuốn sách “ Tiền Đẻ Ra Tiền – Đầu Tư Tài Chính Thông Minh”.', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1027, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube', N'1027.jpg', N'NXB Lao Động', N'Benji Travis, Sean Canell', 179000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1027_1.jpg', N'YouTube đã thay đổi hoàn toàn thế giới hiện đại – từ cách chúng ta xem video, kết nối, cho đến cách chúng ta mở rộng thị trường với những cơ hội mới dành cho những cá nhân giàu tham vọng. Ngày nay trên thế giới, hàng nghìn người đang kiếm được những thu nhập triệu đô từ video trực tuyến, nhưng họ làm điều đó bằng cách nào?
Với cuốn sách “Youtube Secrets – Hướng dẫn cách căn bản về kiếm tiền từ Youtube” hai chuyên gia về video trực tuyến Sean Cannel và Benji Travis sẽ mang tới cho các bạn những bí quyết đạt được thành công trên Youtube, đúc kết từ hàng trăm cuộc phỏng vấn với những Youtuber nổi tiếng, cũng như từ chính kinh nghiệm hơn 10 năm hoạt động trên Youtube của họ. Cho dù bạn là người mới hay là những Youtuber kỳ cựu, cuốn sách này sẽ giúp bạn xây dựng được một lực lượng người theo dõi lớn mạnh kiếm được những thu nhập triệu đô và tạo nen những tác động to lớn đến cuộc sống của mọi người.
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1028, N'Trải Nghiệm Khách Hàng Xuất Sắc', N'1028.jpg', N'NXB Thế Giới', N'Nguyễn Dương', 150000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1028_1.jpg', N'Bạn đang cầm trên tay cuốn sách Trải nghiệm khách hàng xuất sắc được viết từ hơn 22 năm kinh nghiệm, qua nhiều vị trí, môi trường khác nhau của ông Nguyễn Dương, một chuyên gia cấp quốc tế, một trong những người nhiệt huyết và chuyên sâu nhất về trải nghiệm khách hàng.

Ngoài kinh nghiệm thực tế và kiến thức về quản trị nói chung và quản trị trải nghiệm khách hàng nói riêng, trong quá trình hoàn thành cuốn sách này, tác giả Nguyễn Dương đã thực hiện những đợt đi nghiên cứu nhiều công ty, bao gồm những chuyến đi, những cuộc nói chuyện, phỏng vấn, trao đổi, tìm hiểu và cập nhật cách mà nhiều công ty đã thực hiện để có thể cung cấp những trải nghiệm khách hàng tuyệt vời và tăng trưởng vượt bậc.
Bên cạnh đó, tác giả nghiên cứu cả những lý do và rào cản khiến các chiến lược trải nghiệm khách hàng thất bại. Những nguyên lý và phương pháp đã phát huy hiệu quả và trường tồn theo thời gian, được đúc kết từ nhiều trải nghiệm, bối cảnh, quy mô và môi trường khác nhau, trong và ngoài nước.
', 111)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1029, N'Tài Chính Cá Nhân Dành Cho Người Việt Nam', N'1029.jpg', N'NXB Phụ Nữ Việt Nam', N'Lâm Minh Chánh', 12000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1029_1.jpg', N'Cuốn sách “Tài chính cá nhân dành cho người Việt Nam” và bộ bài giảng trực tuyến tặng kèm, gồm tất cả những nội dung về tài chính cá nhân.
Kiếm tiền: Khi còn thể làm việc, chúng ta cần kiếm tiền, tạo ra thu nhập với "công suất" lớn nhất.
Tiết kiệm tiền, sử dụng tiền: Chúng ta phải quản lý tiền hiệu quá, sử dụng tiền khôn ngoan. Đặc biệt, chúng ta phải tiết kiệm trước khi sử dụng.
Bảo vệ tiền: Chúng ta phải biết bảo vệ tiền sự mất mát của tiền trước những rủi ro.
Đầu tư tiền: Tiền phải sinh ra tiền. Chúng ta phải đầu tư để tiền tăng trưởng và đạt được mục tiêu tài chính cá nhân.
Mục tiêu tài chính cá nhân: An toàn, Đảm bảo, Độc lập, và Tự do tài chính
', 42)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1030, N'Nhà Đầu Tư Thông Minh', N'1030.jpg', N'NXB Thế Giới', N'Benjamin Graham', 159200, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1030_1.jpg', N'Là nhà tư vấn đầu tư vĩ đại nhất của thế kỷ 20, Benjamin Graham đã giảng dạy và truyền cảm hứng cho nhiều người trên khắp thế giới. Triết lý “đầu tư theo giá trị“ của Graham, bảo vệ nhà đầu tư khỏi những sai lầm lớn và dạy anh ta phát triển các chiến lược dài hạn, đã khiến Nhà đầu tư thông minh trở thành cẩm nang của thị trường chứng khoán kể từ lần xuất bản đầu tiên vào năm 1949.
Trải qua năm tháng, diễn biến thị trường đã chứng minh tính sáng suốt trong các chiến lược của Graham. Trong khi vẫn giữ lại toàn vẹn văn bản ban đầu của Graham, ấn phẩm tái bản này bổ sung thêm bình luận cập nhật của ký giả chuyên về tài chính nổi tiếng Jason Zweig. Cái nhìn của Zweig bao quát hiện thực của thị trường ngày nay, vạch ra sự tương tự giữa những ví dụ của Graham và các tít báo về tài chính hiện nay, giúp bạn đọc có sự hiểu biết kỹ lưỡng hơn về cách thức áp dụng các nguyên tắc của Graham.
Sống động và cần thiết, Nhà đầu tư thông minh là cuốn sách quan trọng nhất mà bạn có dịp đọc về cách thức đạt được các mục tiêu tài chính của mình.
', 111)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1031, N'Cơn Lốc Quản Trị - Ba Trụ Cột Của Văn Hóa Doanh Nghiệp Hận', N'1031.jpg', N'NXB trẻ', N'Phan Văn Trường', 126000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1031_1.jpg', N'Doanh nghiệp nào cũng có lúc gặp phải những vấn đề không nhất thiết mang tính kỹ thuật, như sự thiếu vắng động lực, hoặc tinh thần tương tác và làm việc nhóm thấp, thậm chí là mâu thuẫn giữa các thành viên, trong đó có cả các lãnh đạo cấp trung và cấp cao. Chẳng công cụ quản lý nào cho phép giải quyết được những vấn đề bắt nguồn từ sự ganh tị, đố kị, thiên vị, hoặc tệ hơn nữa là nạn bè đảng hay tham nhũng nội bộ.
Các mô hình quản lý chỉ mang lý luận kỹ thuật cục bộ hạn hẹp và những giải pháp cấu trúc có sẵn cho doanh nghiệp. Chỉ văn hóa mới có khả năng vào sâu một cách uyển chuyển các vấn đề trong mối quan hệ giữa người với người. Và đây chính là những vấn đề mà các doanh nghiệp Việt Nam thường gặp phải.
Trong tác phẩm mới nhất về văn hóa doanh nghiệp, tác giả Phan Văn Trường phát triển và đi sâu hơn nữa về chủ đề khá trừu tượng này. Vẫn giữ nguyên phong cách tiếp cận dựa trên những câu chuyện từ thực tế trải nghiệm của mình, ông dẫn dắt độc giả trên con đường tìm hiểu vai trò của văn hóa doanh nghiệp, đồng thời đi sâu giải thích ba phong cách văn hóa mà chính ông đã tiên phong áp dụng cho những doanh nghiệp mình từng tham gia quản trị.
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1032, N'Biến Mọi Thứ Thành Tiền - Make Money', N'1032.jpg', N'NXB Thế Giới', N'Nguyễn Anh Dũng', 100800, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1032_1.jpg', N'Bí quyết giúp bạn thoát nghèo để đạt được thành công và giàu có thực sự “Biến mọi thứ thành tiền” là cuốn sách xoay quanh chủ đề tài chính cá nhân. Đây là vấn đề đang được nhiều người, trong đó có các bạn trẻ đặc biệt quan tâm. Cuốn sách định hướng người đọc về cách kiếm tiền, tư duy làm giàu, cách áp dụng những phương pháp làm giàu vào cuộc sống và phát triển bản thân. Bí quyết giúp bạn thoát nghèo để đạt được thành công và giàu có thực sự ở đây không phải là công thức cho tất cả mọi người.
Cuốn sách chỉ ra cho bạn phương thức, công cụ phù hợp đạt được cơ hội chiến thắng là hiểu chính bản thân mình.
', 113)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1033, N'AI Chứ Không Phải Thế Nào?', N'1033.jpg', N'NXB Thế giới', N'Dan Sullivan', 239000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1033_1.jpg', N'Cuốn sách này sẽ dạy bạn cách thực hiện sự thay đổi mô hình thiết yếu này để bạn có thể:
- Xây dựng 1 doanh nghiệp thành công một cách hiệu quả trong khi không giết chết chính mình
- Không bao giờ bị giới hạn mục tiêu và tham vọng của bạn một lần nữa
- Mở rộng sự giàu có , đổi mới , các mối quan hệ và niềm vui của bạn
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1034, N'Thấu Hiểu Hành Vi Giá Thị Trường Tài Chính - Understanding Price Action', N'1034.jpg', N'NXB Thanh Niên', N'Bob Volman', 367000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1034_1.jpg', N'Phương pháp Price Action được mô tả trong Thấu hiểu Hành vi giá Thị trường Tài chính - Understanding Price Action chỉ dựa vào một Đường trung bình động (Moving Average - MA) và cấu trúc thị trường - hành vi giá để giao dịch (trading). Rất đơn giản nhưng cực kỳ hiệu quả.
Understanding Price Action đến từ Bob Volman, một nhà giao dịch chuyên nghiệp, thực hiện việc giao dịch để kiếm sống. Bob Volman viết quyển sách này để chia sẻ lại phương pháp giao dịch Price Action đặc biệt riêng của chính bản thân mình, vốn là điểm cốt yếu đã giúp ông thành công trong việc thấu hiểu hành vi của giá cả trên thị trường.
Understanding Price Action với khoảng 400 biểu đồ ví dụ được ghi chú cẩn thận đã trở thành một nguồn tài liệu về phương pháp Price Action bổ ích cho cộng đồng nhà giao dịch toàn cầu. Hiếm có quyển sách trading nào có được số lượng biểu đồ ví dụ sinh động và trực quan như Understanding Price Action.
Nếu bạn cần một cẩm nang về phương pháp Price Action đặc biệt hơn so với những phương pháp thông thường khác, Understanding Price Action là một lựa chọn không thể bỏ qua
', 59)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1035, N'Trading In The Zone - Thực Hành Kiểm Soát Cảm Xúc Bằng Tâm Lý Học Hành Vi Trong Đầu Tư Và Giao Dịch', N'1035.jpg', N'NXB Thanh Niên', N'Mark Douglas', 295000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1035_1.png', N'Trading In The Zone là quyển sách Top 1 kinh điển Thế giới trong việc giúp độc giả xây dựng phương thức quản trị cảm xúc đúng đắn, vững vàng tâm lý và củng cố kỷ luật trong quá trình đầu tư dài hạn hoặc đầu cơ lướt sóng trên thị trường tài chính.
Một chuyên gia nổi tiếng đã nhận xét rằng: “Bạn không thể trở thành người có lợi nhuận ổn định trên thị trường tài chính nếu chưa đọc và thực hành theo Trading In The Zone”. Thật vậy, Trading in The Zone vẫn đang là quyển sách TOP 1 KINH ĐIỂN về đầu tư tài chính trong nhiều chục năm qua, được các nhà đầu tư/ nhà giao dịch chuyên nghiệp, kể cả các phù thủy thị trường chứng khoán khuyến nghị PHẢI ĐỌC nếu muốn thành công bền vững. Và thực sự Trading In The Zone đã giúp độc giả xây dựng phương thức quản trị cảm xúc đúng đắn, vững vàng tâm lý và củng cố kỷ luật trong quá trình đầu tư dài hạn hoặc đầu cơ lướt sóng trên thị trường tài chính.
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1036, N'Nhà Lãnh Đạo Không Chức Danh', N'1036.jpg', N'NXB Trẻ', N'Robin Sharma', 84000, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1036_1.jpg', N'Suốt hơn 15 năm, Robin Sharma đã thầm lặng chia sẻ với những công ty trong danh sách Fortune 500 và nhiều người siêu giàu khác một công thức thành công đã giúp ông trở thành một trong những nhà cố vấn lãnh đạo được theo đuổi nhiều nhất thế giới. Đây là lần đầu tiên Sharma công bố công thức độc quyền này với bạn, để bạn có thể đạt được những gì tốt nhất, đồng thời giúp tổ chức của bạn có thể có những bước đột phá đến một cấp độ thành công mới trong thời đại thiên biến vạn hóa như hiện nay.', 66)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1037, N'Phân Tích Chứng Khoán (Security Analysis)', N'1037.jpg', N'NXB Lao Động', N'Benjamin Graham - David L Dodd', 424150, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1037_1.jpg', N'“Phiên bản thứ 6 của cuốn sách kinh điển Phân tích chứng khoán đã phủ nhận cách ngôn rằng ‘cái gì tốt rồi thì đừng sửa nó’. Một nhóm những nhà bình luận xuất sắc, dẫn đầu là Seth Klarman và James Grant, đã bắc chiếc cầu nối giữa thế giới tài chính đơn giản của thập niên 1930 với đấu trường đầu tư phức tạp của thiên niên kỷ mới. Độc giả sẽ hưởng lợi từ kinh nghiệm và sự thông thái của các chuyên gia thực hành xuất sắc nhất trong thế giới tài chính và các nhà quan sát thị trường thạo tin nhất. Phiên bản mới này là cuốn sách mà tất cả sinh viên tài chính nghiêm túc cần phải đọc.”', 8)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1038, N'Làm Chủ Business Analytics - Phân Tích Dữ Liệu Để Đi Đến Quyết Định Thông Minh', N'1038.jpg', N'Dân Trí', N'Trần Hùng Thiện, Tăng Thúy Nga', 242100, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1038_1.png', N'Business Analytics hiện đang được nhiều doanh nghiệp săn đón bởi vai trò quan trọng mà vị trí này mang lại cho tổ chức. Nhưng trong thời điểm mà mọi người đổ xô đi học BA, không phải ai cũng hiểu:
- BA thực sự là gì? BA khác gì DA, BI?
- Học BA bắt đầu từ đâu?
- Tình hình thực tế của BA tại các doanh nghiệp Việt Nam như thế nào?
Từ những kiến thức trong suốt 20 năm nghiên cứu thị trường, đi cùng kinh nghiệm tư vấn, thực chiến với các doanh nghiệp hàng đầu, tác giả đã chắt lọc ra những kiến thức đắt giá về BA, phù hợp với phần lớn nhu cầu của doanh nghiệp Việt Nam hiện tại và tình trạng của họ.
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1039, N'The Book Of Leadership - Dẫn Dắt Bản Thân, Đội Nhóm Và Tổ Chức Vươn Xa', N'1039.jpg', N'NXB Hồng Đức', N'Anthony Gell', 135160, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1039_1.jpg', N'Cuốn sách này dành cho những con người giàu khát vọng, mong muốn tạo ra sự khác biệt to lớn trong thế giới tuyệt vời mà chúng ta đang sống - những người muốn truyền cảm hứng và giúp đỡ mọi người xung quanh. Cho những người muốn sống một cuộc sống đam mê và đạt được những kết quả lớn lao trên chặng đường đi. Cho những người muốn tách khỏi đám đông và vươn đến đỉnh cao cuộc chơi. Cho những người đã chán ngấy những vị lãnh đạo yếu kém, chuyên quyền, vị kỉ hay đơn giản những lãnh đạo tầm thường, và thay vào đó những người muốn nâng cao tiêu chuẩn và nâng tầm bản thân.
Cuốn sách này dành cho cả những lãnh đạo dày dạn kinh nghiệm, đủ thông minh để biết rằng học tập không bao giờ ngừng nghỉ - rằng theo đuổi sự xuất chúng trong lãnh đạo là một hoạt động cả đời - và cho những lãnh đạo mới bổ nhiệm, ham học hỏi thói quen lãnh đạo tốt ngay từ đầu. Dành cho những người muốn đội nhóm của họ đạt kết quả phi thường, không phải bình thường, và cho lãnh đạo của những công ty lớn cũng như những công ty nhỏ (nhưng có hoài bão).
Về cơ bản, cuốn sách này dành cho những ai đang thèm khát (tôi không nói về nỗi thèm bánh nhé), đang tìm cách khai thác sức mạnh tuyệt vời mà lãnh đạo giỏi mang lại.
Nếu đó là bạn, thì tôi rất vinh hạnh khi có một người thực sự tuyệt vời trên thế giới đang cầm cuốn sách này, ngay lúc này, và tôi sẽ làm hết sức.
', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1040, N'Tư Duy Ngược Dịch Chuyển Thế Giới - Originals: How Non-Conformists Move The World', N'1040.jpg', N'NXB Tổng Hợp TPHCM', N'Adam Grant', 142200, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1040_1.jpg', N'Tư Duy Ngược Dịch Chuyển Thế Giới - Originals: How Non-Conformists Move The World
Adam Grant là tác giả cuốn Give and take (tựa tiếng Việt là “Cho và nhận), tác phẩm được The New York Times bình chọn là sách bán chạy nhất. Trong Give and take, Adam đã chỉ cho mọi người cách thức để bảo vệ thành công những ý tưởng mới, cũng như phương pháp để các nhà lãnh đạo có thể khuyến khích sự đa dạng và khác biệt trong suy nghĩ và hành động của tổ chức mình.
Với Tư duy ngược dịch chuyển thế giới, một lần nữa, Adam Grant lại giải quyết vấn đề làm sao để cải thiện thế giới, nhưng từ góc nhìn mới “trở nên khác biệt”: Chọn đi “ngược dòng”, đấu tranh với tính tuân thủ cứng nhắc và đập tan các truyền thống lỗi thời.
', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1041, N'Bản Đồ Về Dòng Tiền - Hiểu Và Áp Dụng Sơ Đồ Kế Toán Trong Doanh Nghiệp Và Đời Sống', N'1041.jpg', N'Hồng Đức', N'Tetsuro Kondo, Mokoto Okiyama', 97150, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1041_1.jpg', N'Bản Đồ Về Dòng Tiền - Hiểu Và Áp Dụng Sơ Đồ Kế Toán Trong Doanh Nghiệp Và Đời Sống
Qua từng phần của cuốn sách Bản đồ về dòng tiền: Hiểu và áp dụng sơ đồ kế toán trong doanh nghiệp và đời sống sẽ gửi tới bạn đọc từ những khái niệm cơ bản nhất về kế toán. Với quá khứ của tác giả - một người chưa hề biết tới kế toán là gì lại được dẫn lối chỉ đường từ chính những nội dung đơn giản trong cuốn sách này thì quả thật nó rất tuyệt vời!
', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1042, N'Quy Tắc Làm Việc Của Google', N'1042.jpg', N'NXB Công Thương', N'Laszlo Bock', 186150, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1042_1.jpg', N'Trong cuốn sách Quy Tắc Làm Việc Của Google, Laszlo Bock - Phó chủ tịch cấp cao phụ trách nhân sự của Google đã đưa ra một số lời khuyên hữu ích giúp các nhà quản lý thực hiện hiệu quả việc tuyển dụng nhân sự.
“Tất cả những gì bạn cần là tin tưởng rằng con người về cơ bản đều tốt, và có đủ can đảm để đối xử với nhân viên của bạn như những người chủ, thay vì những cỗ máy. Cỗ máy chỉ làm công việc của nó; còn người chủ có thể làm bất kỳ điều gì để công ty và nhóm của họ thành công.
Con người dành hầu hết thời gian ở công sở, nhưng công việc là một trải nghiệm không hề dễ chịu đối với hầu hết mọi người – một công cụ để đi đến kết thúc. Không nhất thiết phải như vậy.
Chúng ta không có mọi câu trả lời, nhưng chúng ta đã tìm ra vài điều thú vị về cách thức tốt nhất để tìm kiếm, phát triển và giữ chân nhân viên trong một môi trường tự do, sáng tạo và vui vẻ.
', 44)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1043, N'Phát Triển Kỹ Năng Lãnh Đạo', N'1043.jpg', N'NXB Lao Động', N'John C.Maxwell', 152150, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1043_1.jpg', N'Định nghĩa đúng đắn về lãnh đạo – Lãnh đạo là sự ảnh hưởng, không hơn, không kém…
Phẩm chất của nhà lãnh đạo – Lãnh đạo không phải là một câu lạc bộ dành riêng cho những người sinh ra để chỉ huy. Muốn làm một nhà lãnh đạo, bạn phải có những phẩm chất được lĩnh hội và trau dồi qua thời gian. Kết hợp những phẩm chất đó với khát vọng và quyết tâm, thì không điều gì có thể ngăn bạn trở thành một nhà lãnh đạo.

Sự khác nhau giữa quản lý và nhà lãnh đạo – Đảm bảo tất cả mọi người đều hoàn thành công việc là tài năng của nhà quản lý. Khích lệ người khác làm việc tốt hơn là tài năng của nhà lãnh đạo.
Dù bạn đang ở nấc thang lãnh đạo nào, cuốn sách bạn đang cầm trên tay cũng sẽ khích lệ bạn truyền cảm hứng cho người khác bằng sự tận tâm và tầm nhìn xa trông rộng của nhà lãnh đạo.
', 42)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1044, N'Bán Hàng, Quảng Cáo Và Kiếm Tiền Trên Facebook', N'1044.jpg', N'NXB Thông Tin và Truyền Thông', N'MBA, Nguyễn Phan Anh', 143840, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1044_1.jpg', N'Trong các hình thức kinh doanh trực tuyến thì bán hàng trên Facebook đang được xem là phương thức kinh doanh vô cùng hiệu quả trong thời đại số bên cạnh việc bán hàng thông qua một website bán hàng chuyên nghiệp. Sức lan tỏa nhanh chóng cùng với khả năng tiếp cận khách hàng tiềm năng hiệu quả, quản lý và bán hàng thuận tiện chính là điểm mạnh của hoạt động bán hàng online trên Facebook. Tuy nhiên, để có thể tăng trưởng doanh số tốt cùng với thúc đẩy hoạt động bán hàng đòi hỏi bạn cần có một chiến lược kinh doanh và cách bán hàng trên Facebook hợp lý.', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1045, N'Nghệ Thuật Quản Lý Tài Chính Cá Nhân', N'1045.jpg', N'NXB Lao Động', N'Brian Tracy, Dan Strutzel', 95400, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1045_1.jpg', N'TIỀN BẠC là niềm đam mê bất tận và nỗi khổ đau cùng cực của nhân loại, là chủ đề cực độ nhạy cảm nhưng tột cùng cuốn hút trong xã hội loài người. Người ta kiếm tiền, tiêu tiền, lại lo lắng nghĩ cách kiếm tiền, rồi tự hỏi tại sao cuộc đời mình khó khăn đến thế.
Ai cũng muốn đạt được một cuộc đời tự do về tài chính, nhưng bạn thực sự dành ra bao nhiêu tâm huyết và sức lực để giành lấy nó? Bạn có nghiêm túc suy nghĩ cải thiện năng lực kiếm tiền của bản thân, thận trọng tính toán khi chi tiêu, và khôn khéo cân nhắc lúc đầu tư? Hay nói trắng ra, bạn đã chú ý quản lý tài chính cá nhân đến mức nào để trở nên tự do tài chính?
Bất chấp vô số công trình nghiên cứu vi mô và vĩ mô, hiểu biết của cộng đồng về tiền bạc vẫn còn rất mơ hồ, và thái độ của mọi người về quản lý tài chính cá nhân vẫn còn rất mông lung.
', 7)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1046, N'Economix - Các Nền Kinh Tế Vận Hành (Và Không Vận Hành) Thế Nào Và Tại Sao?', N'1046.jpg', N'NXB Dân Trí', N'Michael Goodwin', 129200, CAST(N'1980-03-29' AS Date), 1, N'1001', N'1046_1.jpg', N'Nếu các bạn từng tìm cách hiểu những khái niệm kinh tế qua việc đọc vô số giáo trình kinh tế học, nhưng vẫn thấy thật khó hình dung được bức tranh toàn cảnh về bộ môn này, thì cuốn sách sẽ cung cấp cho các bạn một mảnh ghép hoàn chỉnh cho những mảnh nho nhỏ mà các bạn đã đọc qua.
Chúng ta sẽ hiểu rõ hơn về những khái niệm kinh tế cơ bản cùng những học thuyết kinh tế lớn còn ảnh hưởng tới ngày nay, qua tư tưởng của các nhà kinh tế học lớn như: Adam Smith, John Keynes...
Có thể coi đây là một cuốn sử về lịch sử kinh tế thế giới kể từ khi nền kinh tế hàng hóa ra đời. Chúng ta sẽ lướt qua vài thế kỷ với vô số học thuyết về kinh tế học cùng những vụ khủng hoảng kinh tế lớn như thể đang đọc một cuốn truyện tranh, cả bi lẫn hài, căng thẳng mà không kém phần sảng khoái.
', 43)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1047, N'Nghệ Thuật Kết Nối - Cách Tạo Ấn Tượng Để Kết Giao Khéo Léo', N'1047.jpg', N'NXB Hồng Đức', N'Patrick King', 138000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1047_1.jpg', N'Mọi người có thể thấy không phải vì công việc chúng ta mới cần quan hệ và mới cần để kết nối, kết giao với nhau mà hãy kết giao để tạo ra nhiều mối quan hệ trong công việc và cuộc sống. Có bao giờ bạn nghĩ đến các nguyên nhân khiến kết nối bị gián đoạn chưa? Kết nối bị gián đoạn làm mất thời gian, gián đoạn mạch thông tin cũng như ảnh hưởng đến chất lượng cuộc trò chuyện. Như vậy, kết nối là mạch nguồn của giao tiếp. Cuốn sách Nghệ thuật kết nối – Cách tạo ấn tượng để kết giao khéo léo sẽ chỉ ra rằng chất lượng các tương tác thực sự quan trọng chứ không chỉ là số lượng hay sự hiện diện của những người xung quanh chúng ta.', 13)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1048, N'Đọc Suy Nghĩ - Thấu Tâm Can', N'1048.jpg', N'Hồng Đức', N'Lư Văn Kiện', 156000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1048_1.jpg', N'Cuốn sách Đọc suy nghĩ, thấu tâm can tóm tắt chín kỹ năng đọc tâm trí biến bạn trở thành người đọc hiểu được suy nghĩ của người xung quanh mình trong vài giây, học được chiến lược tâm lý để không bị bối rối bởi đối phương.
Trong cuốn sách này, bạn sẽ học được cách nhanh chóng chiếm được lòng tin của người lạ; hiểu nhu cầu của người khác thông qua tâm lý học biểu hiện nhỏ; kỹ năng đàm phán và giao tiếp giành chiến thắng 100%; sử dụng tâm lý ám thị để kích thích tiềm năng bản thân; sử dụng "trái tim" để nhìn thế giới, để cuộc sống không ngừng được cải thiện.
', 7)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1049, N'Lập Trình Não Bộ - Làm Chủ Trí Nhớ, Sự Tập Trung, Cảm Xúc Và Giải Phóng Thiên Tài Bên Trong Bạn', N'1049.jpg', N'NXB Hồng Đức', N'Dave Farrow', 188000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1049_1.jpg', N'Người ta chỉ thường nghĩ đến tác động của não bộ là nó ảnh hưởng đến tâm trí, tư duy, cách suy nghĩ, cách quyết định hành động. Nhưng tâm trí, tư duy, hành động lại tác động đến cảm xúc, sức khỏe, dạ dày, một cơn thèm ăn, cơ bắp, giấc ngủ, và thậm chí là vận may…? Hay nói cách khác, não bộ điều khiển toàn bộ con người bạn, bất cứ điều gì diễn ra và cuộc đời bạn. Cách bạn làm, là hệ quả của não bộ. Vậy làm thế nào để có một “hệ quả tốt” như :giúp bạn có được sức khỏe cường tráng, học tập tiến bộ, sự nghiệp thăng tiến, cuộc đời thăng hoa... thay vì một “hệ lụy” với những quyết định sai lầm, ảo não, một tư duy yếu đuối và một cuộc đời tầm thường.', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1050, N'Lắng Nghe Tiếng Nói Bên Trong Bạn', N'1050.jpg', N'NXB Hồng Đức', N'Micheal Hyatt, Megan Hyatt Miller', 176000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1050_1.jpg', N'Lắng Nghe Tiếng Nói Bên Trong Bạn
Nhiều người vẫn thường khuyên rằng “Đừng đi tìm kiếm một câu trả lời ở bất kì đâu cả. Hãy lắng nghe tiếng nói bên trong của bạn!” Vậy tiếng nói bên trong bạn là gì và làm thế nào để lắng nghe nó?
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1051, N'Nguyên Tắc Bất Biến Khiến Sự Nghiệp Thăng Tiến Cuộc Đời Thăng Hoa', N'1051.jpg', N'NXB Hồng Đức', N'Joseph Murphy', 150000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1051_1.jpg', N'Rất nhiều người dù đang ở độ tuổi 20, 40 hay 60 đều mong muốn một ngày cuộc đời mình sẽ khác với hiện tại, song lại bị dòng đời cuốn trôi vùi dập. Họ bị hiện thực đánh bại, lặng lẽ sống một cuộc sống bình thường đến cuối đời. Nhưng Kazuo Inamori - Người được mệnh danh là một trong bốn huyền thoại kinh doanh của Nhật Bản thì không như vậy. Ông từng sống một tuổi trẻ bình thường, một gia cảnh bình thường, học một trường đại học bình thường, nhưng ông không để bản thân gục ngã trước cuộc đời mà tin rằng chỉ cần mình nỗ lực hơn nữa thì sẽ được đền đáp xứng đáng.', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1052, N'Are You Really Ok? - Để Trở Thành Bác Sĩ Tâm Lý Của Chính Mình', N'1052.jpg', N'NXB Hồng Đức', N'Debra Fileta', 176000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1052_1.jpg', N'Bạn có nghĩ rằng mình tự hiểu hết bản thân, không có bất kỳ một vết thương nào sâu bên trong tâm hồn. Đôi lúc tôi có những suy nghĩ tiêu cực và hành động sai trái đến khi bình tĩnh lại tôi mới kiểm soát được bản thân. Để tìm ra giải pháp giúp bạn hiểu về sự thực đó "Are You Really OK?" sẽ là cuốn sách bào chữa vết thương và trở thành bác sĩ tâm lý của chính mình cho bạn. Bởi trong chúng ta ai cũng sẽ có lúc bế tắc hay khoảnh khắc đẹp, trước khi cuộc sống trải lụa hồng thì phải đi qua mảnh đất đầy gai góc, điều quan trọng phải vượt qua chúng như thế nào?', 55)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1053, N'Từ Đơn Giản Đến Trường Tồn	', N'1053.jpg', N'Hồng Đức', N'Jin Kang Moller', 188000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1053_1.jpg', N'Con người ngày nay khao khát sự đơn giản. Khi ta sống trong thời đại nhiễu loạn của quá nhiều thông tin, tính năng và sự lựa chọn. Người ta vô cùng khao khát những giải pháp giúp đơn giản hoá và nâng cao chất lượng cuộc sống. Cứ tưởng tượng mà xem, giữa hai sản phẩm có cùng công dụng, chúng ta ưu tiên lựa chọn sản phẩm nào dễ dàng sử dụng; khi phân vân giữa hai việc, chúng ta thường chọn những việc ít quy trình và ít rườm rà hơn.
Nhưng đừng nghĩ đơn giản là một thứ dễ dàng. Tạo ra một thứ phức tạp, nhiều quy trình, cồng kềnh không hề là một điều khó. Biến những thứ phức tạp trở nên đơn giản nhưng mang lại trải nghiệm đỉnh cao mới là điều khó. Làm thế nào để ta đơn giản hoá mọi thứ, làm thế nào để tạo ra các sản phẩm và hệ thống chỉ lấy con người làm trung tâm thay vì nhiều thứ thừa thãi? Làm thế nào để thật sự đổi mới? Đây quả thật là một bài toán khó.
Sự đơn giản được định nghĩa là tính chất dễ hiểu, dễ thực hiện. Nhưng tính chất của sự đơn giản không phải chỉ biến mọi thứ trở nên dễ dàng. Đó là chắt lọc những yếu tố cần thiết, hiểu được điều gì quan trọng nhất và giảm tải phần còn lại. Sự đơn giản là một trải nghiệm giúp mọi thứ trở nên dễ dàng đối với người dùng và mang lại hiệu ứng cảm xúc tích cực.
', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1054, N'Manifest - 7 Bước Để Thay Đổi Cuộc Đời Bạn Mãi Mãi', N'1054.jpg', N'NXB Thế Giới', N'Roxie Nafousi', 80100, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1054_1.jpg', N'Tôi ở đây để nói với bạn rằng bạn có thể.”
_ Roxie Nafousi _
Mở ra cánh cửa Manifest và giải phóng tiềm năng vô hạn của chính mình cùng cuốn sách MANIFEST – 7 bước để thay đổi cuộc đời bạn mãi mãi.
Cuốn sách này là một chỉ dẫn cần thiết cho bất kỳ ai muốn tự làm chủ cuộc đời mình. Chỉ với 7 bước cơ bản, bạn có thể hoàn toàn hiểu được Manifest thực sự là gì và tạo ra một cuộc sống mà bạn hằng mong ước.
Là một sự giao thoa giữa khoa học và sự thông thái, Manifest là một dạng rèn luyện phát triển bản thân, học cách yêu bản thân, giúp bạn vươn tới mục tiêu và sống một cuộc sống viên mãn nhất.
', 35)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1055, N'Giả Vờ Là Người Hướng Ngoại', N'1055.jpg', N'NXB Dân Trí', N'Dương Tư Viễn', 107100, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1055_1.jpg', N'Đã bao giờ bạn tự thấy mình có những biểu hiện này chưa?
- Trong giao tiếp hằng ngày, bạn luôn để lại ấn tượng yêu đời và vui vẻ trước mặt mọi người, nhưng vẻ ngoài càng lạc quan thì trong lòng càng cô đơn.
- Luôn đeo lên chiếc mặt nạ của người trưởng thành, thường giúp đỡ người khác giải quyết vấn đề, nhưng vấn đề của bản thân lại chẳng ai quan tâm, chỉ có thể tự mình chầm chậm giải quyết.
- Hay tổn thương vì một lời nói của người khác, nhưng không muốn bị phát hiện.
- Khao khát gặp được một người thực sự hiểu mình, nhưng khi gặp được lại tránh né theo bản năng.
…
', 43)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1056, N'Sống Khai Vấn - Sống Tỉnh Thức', N'1056.jpg', N'NXB Dân Trí', N'Brianna Wiest', 188100, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1056_1.jpg', N'Gốc rễ của việc làm người là học cách suy nghĩ. Từ điều đó, chúng ta biết học cách để yêu, chia sẻ, khoan dung và cho đi. Nhiệm vụ trước tiên và quan trọng nhất của con người ngay từ khi sinh ra là hiện thực hóa tiềm năng cho cả bản thân và cho thế giới.
Sống khai vấn – Sống tỉnh thức là tuyển tập các bài viết của tác giả Brianna Wiest đưa ra lý do tại sao bạn nên theo đuổi mục đích hơn là đam mê, chấp nhận suy nghĩ tiêu cực, thấu triệt sự sáng suốt trong thói quen hàng ngày và nhận thức được những thành kiến đang tạo ra cách bạn nhìn nhận cuộc sống của mình.
Mỗi bài luận được đề cập trong cuốn sách là nơi dừng chân để chúng ta suy nghĩ và chiêm nghiệm, đưa ra các ý tưởng để thay đổi cuộc đời. Cuốn sách đã giúp hàng triệu người trên thế giới nhìn nhận và phát triển bản thân trong hành trình sống ở hiện tại.
SỐNG KHAI VẤN – SỐNG TỈNH THỨC là một trong số những cuốn sách bán chạy nhất toàn cầu và trở thành một hiện tượng truyền thông xã hội ngay từ khi ra mắt bạn đọc.
', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1057, N'Phần Đời Còn Lại, Hãy Làm Một Người Phụ Nữ Tự Tỏa Hào Quang', N'1057.jpg', N'NXb Thế Giới', N'Cách Thư', 98000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1057_1.jpg', N'“Không quấy nhiễu khoảng lặng của người khác, chính là khoan dung; không tổn thương lòng tự trọng của người khác, chính là lương thiện.”
Những người phụ nữ đáng ngưỡng mộ luôn mang theo ánh hào quang của riêng mình – không hề chói lòa hay khiến người ta khó chịu, mà lại giống như ánh nắng ngày đông, ôn hòa và ấm áp. Người phụ nữ tự tỏa sáng rạng ngời như thế, vừa dịu dàng vừa mạnh mẽ, cho dù có rơi vào nghịch cảnh tăm tối, trong nội tâm vẫn sẽ đong đầy tình yêu và ngọn lửa ấm nóng, làm rung động lòng người, khiến người khác vô thức mà muốn thân quen.
Mong bạn sẽ trở thành một phụ nữ như vậy, tự có hào quang của riêng mình, không làm khó người khác, càng không làm khó chính mình.
Chúc cho bạn, phần đời còn lại, thong dong tự tại, trong tim có nắng, trong thẻ có tiền, bình yên vui vẻ!
', 74)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1058, N'The Power Of Your Subconscious Mind - Sức Mạnh Tiềm Thức', N'1058.jpg', N'NXB Hồng Đức', N'Joseph Murphy', 151200, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1058_1.jpg', N'Cuốn sách Sức mạnh tiềm thức: The Power of Your Subconscious Mind sẽ hướng dẫn bạn đạt đến vị trí thực sự của mình, giải quyết những khó khăn, cắt đứt ràng buộc về cảm xúc và thể xác để đặt bạn trên con đường vương giả dẫn đến tự do, hạnh phúc và bình yên trong tâm hồn!
Điều kỳ diệu của sức mạnh tiềm thức
Có một điều bạn nên biết, đó chính là bạn hoàn toàn không cần phải tìm kiếm sức mạnh này ở đâu cả bởi vì vốn dĩ bạn đã sở hữu nó rồi. Tận sâu bên trong tiềm thức của bạn là sự thông thái vô hạn, quyền năng vô hạn và nguồn cung vô hạn cho tất cả những điều cần thiết đang chờ được phát triển và bộc lộ.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1059, N'Mặt Lợi Của Góc Tối', N'1059.jpg', N'NXB Thế Giới', N'Todd B. Kashdan, Robert Biswas-Diener', 117900, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1059_1.jpg', N'Ai cũng có một mặt tối muốn giữ cho riêng mình. Đó có thể là sự ghen tị, nỗi sợ, lo âu, chần chừ, kiêu ngạo hay tự ti… Góc tối đó có phải nguồn gốc của nỗi đau mà ta cần làm mọi cách để loại bỏ hay che đậy? Thực chất, trải nghiệm cảm xúc tiêu cực là quyền và phẩm chất bẩm sinh của chúng ta, mang đến nhiều ý nghĩa như: sợ hãi khiến bạn biết tránh xa nguy hiểm, tức giận sản sinh adrenaline để chuẩn bị cho cơ chế chống trả kẻ thù, cảm giác tội lỗi giúp chúng ta nhìn nhận lại và học hỏi tốt hơn từ kinh nghiệm bản thân.
Vậy bạn có sẵn sàng đi tìm Mặt lợi của góc tối bên trong bản thân mình? Hành trình này hẳn là không dễ dàng, nhưng một khi đã sẵn sàng nhìn nhận những góc sâu nhất bên trong và ôm ấp chúng, bạn sẽ thấy được một vẻ đẹp toàn vẹn nhất.
', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1060, N'Nghệ Thuật Kaizen Tuyệt Vời Của Toyota', N'1060.jpg', N'NXB Phụ Nữ Việt Nam', N'Yoshihito Wakamatsu', 112500, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1060_1.jpg', N'Kaizen là hệ thống phát huy trí tuệ con người
Thu được thành quả lớn từ việc thực hiện những việc nhỏ
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1061, N'Tôi Ghét Thứ Gọi Là Lo Lắng', N'1061.jpg', N'NXB Thế Giới', N'Sarah Knight', 81000, CAST(N'1980-03-29' AS Date), 1, N'1002', N'1061_1.jpg', N'Mỗi sáng thức dậy, chúng ta loạng choạng bước đi trên một quả bom hẹn giờ đang xoay được gọi là Trái Đất, mục tiêu cơ bản của mỗi người là vượt qua một ngày trước mắt. Một vài người cố gắng kiếm tìm những thứ khác như thành công, sự thảnh thơi hay những lời yêu thương từ ai đó. Phần còn lại thì luôn trong trạng thái lo lắng và chỉ mong rằng mình không phải đối mặt với điều gì quá khủng khiếp. Trong đầu họ dường như lúc nào cũng tồn tại những câu hỏi đại loại là “Nếu như… thì sao?”.
Trong tất cả những nỗi lo đó sẽ có những điều là vô lý nhưng cũng sẽ có những điều thật sự có thể xảy ra. Rắc rối có thể ập đến bất kỳ lúc nào, đó chính là quy luật của cuộc sống.
Vậy, nếu vấn đề đó thật sự xảy ra, bạn sẽ phản ứng thế nào? Là sững sờ hay sợ sệt? Là khóa cửa phòng tắm lại và khóc hay ngửa cổ lên trời và hét to? Hay bạn sẽ cố để vờ như mọi chuyện chưa từng xảy ra?
Khi gặp khó khăn và rơi vào trạng thái lo lắng, bình tĩnh là điều mà chúng ta cần làm để có thể đối mặt và giải quyết vấn đề. Nhưng việc tự hét lên với bản thân rằng “Bình tĩnh lại!” chính là điều vô nghĩa nhất. Hay gặp gỡ và nhận những lời an ủi “Đừng lo, mọi chuyện rồi sẽ ổn thôi” từ những người xung quanh cũng sẽ chẳng giúp những rắc rối được tháo gỡ mà chỉ khiến bạn khó chịu, làm mất đi mối quan hệ tốt đẹp trước đó.
Thay vào đó, hãy để “TÔI GHÉT THỨ GỌI LÀ LO LẮNG” hướng dẫn bạn giải quyết triệt để những vấn đề trên. Cuốn sách sẽ cung cấp cho bạn bộ công cụ hiệu quả, giúp bạn vượt qua hội chứng lo âu bao gồm những lời khuyên vượt qua nỗi sợ, mẹo nhỏ rũ bỏ rắc rối và cả những phương pháp xử lý “mớ rác” tiêu cực để mỗi ngày bạn sống đều là những ngày vui vẻ.
', 4)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1062, N'Hoàng Tử Bé', N'1062.jpg', N'NXB Kim Đồng', N'Antoine De Saint-Exupéry', 33250, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1062_1.jpg', N'Trong hơn nửa thế kỷ qua, " Hoàng Tử Bé - Le Petit Prince " của tác giả Antoine de Saint - Exupéry vẫn là cuốn sách tiếng Pháp được yêu thích nhất và được chuyển ngữ nhiều nhất trên thế giới. Thật kỳ lạ, bởi hàm ý, mục đích và chủ đề của cuốn sách ngụ ngôn này có vẻ xa vời với nhiều độc giả, thậm chí gần tám mươi năm sau lần xuất hiện đầu tiên.
Nhưng theo thời gian, sự chọn lựa và yêu thích của độc giả chính là thước đo gí trị chân thực nhất chứng minh cho vị trí đặc biệt của tác phẩm. Và " Hoàng Tử Bé " với câu truyện về chàng hoàng tử nhỏ cô đơn rời tiểu tinh cầu bé nhỏ của mình, du hành khắp vũ trụ, viếng thăm rồi lại lìa xa Trái Đất vẫn được xem là một trong những tác phẩm thơ mộng nhất của mọi thời đại. Cuốn sách kinh điển của Saint - Exupéry nay được Nhà sách Minh Thắng tái bản với những hình vẽ minh họa của họa sĩ Việt Đỗ, một bản dịch được rất nhiều độc giả yêu thích bởi ngôn từ giàu tình cảm, trong sáng và hình ảnh thú vị.
', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1063, N'Chuyện Con Mèo Dạy Hải Âu Bay', N'1063.jpg', N'NXB Hội Nhà Văn', N'Luis Sepúlveda', 39200, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1063_1.jpg', N'Chuyện con mèo dạy hải âu bay là kiệt tác dành cho thiếu nhi của nhà văn Chi Lê nổi tiếng Luis Sepúlveda – tác giả của cuốn Lão già mê đọc truyện tình đã bán được 18 triệu bản khắp thế giới. Tác phẩm không chỉ là một câu chuyện ấm áp, trong sáng, dễ thương về loài vật mà còn chuyển tải thông điệp về trách nhiệm với môi trường, về sự sẻ chia và yêu thương cũng như ý nghĩa của những nỗ lực – “Chỉ những kẻ dám mới có thể bay”.
Cuốn sách mở đầu cho mùa hè với minh họa dễ thương, hài hước là món quà dành cho mọi trẻ em và người lớn.
', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1064, N'Tôi Vẽ - Phương Pháp Tự Học Vẽ Truyện Tranh', N'1064.jpg', N'NXb Đông A', N'Nhiều tác giả', 85000, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1064_1.jpg', N'“Tôi vẽ với 300 trang sách bao gồm những kỹ năng cơ bản cần có của một họa sĩ truyện tranh, từ tạo hình nhân vật, thiết kế bối cảnh, biểu cảm, các kỹ thuật diễn họa cho đến luật phối cảnh. Đây là một cuốn cẩm nang tuyệt vời dành cho các bạn đang bắt đầu học vẽ truyện tranh. Những kiến thức này có thể không giúp các bạn vẽ đẹp ngay lập tức nhưng sẽ là nền tảng vững chắc giúp bạn hình thành các tiêu chuẩn chuyên nghiệp trong nghề và không mất thời gian tự mò mẫm. Phần minh họa cho các bài học cũng rất hấp dẫn và sáng tạo. Các tác giả đã sử dụng chính nhân vật và trang truyện của mình để làm rõ sự liên quan giữa lý thuyết và thực tế, tính ứng dụng rõ ràng của các kỹ thuật và quy trình sáng tác.
 Trên thị trường hiện tại không thiếu những quyển sách dạy vẽ truyện tranh được dịch và biên tập lại từ nhiều nguồn nhưng đa số là kiểu sách “cầm tay chỉ việc”, không thật sữ hữu ích với các bạn trẻ Việt Nam – những bạn không theo học chuyên ngành mỹ thuật, thiếu kiến thức nền tảng về hội họa… Ngược lại, trong quyển Tôi vẽ, mọi phần kiến thức từ lớn đến nhỏ đều được lý giải và phân tích khá kỹ kèm ảnh minh họa rõ ràng, giúp người xem hiểu được gốc rễ vấn đề đồng thời áp dụng áp dụng vào nhiều “ngữ cảnh” khác nhau trong lúc sáng tác. Hệ thống kiến thức trong sách cũng được sắp xếp hợp lý từ thấp đến cao, xen kẽ là những trang truyện và hình minh họa vui nhộn làm giảm áp lực cho phần lý thuyết hơi khô cứng như phần phối cảnh và anatony (giải phẫu)”
', 4)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1065, N'Chú Thuật Hồi Chiến: Trường Chuyên Chú Thuật Tokyo - Tập 0 ', N'1065.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1065_1.jpg', N'Chú Thuật Hồi Chiến: Trường Chuyên Chú Thuật Tokyo - Tập 0 - Bản Thường
Như vậy là sau thời gian dài "trong ngóng ngoài trông", cuối cùng thì dự án JUJUTSU KAISEN - Manga đình đám nhất tại Nhật Bản năm 2021, với tổng số lượng sách bán ra lên đến gần 40 triệu bản in (cho 17 tập) - sẽ chính thức có một cú nổ lớn tại Việt Nam, với tập truyện mang tính khởi đầu, đó chính là Vol.0: Trường chuyên chú thuật Tokyo!
Khốn khổ vì bị oán linh Rika ám, cậu học sinh trung học Yuta Okkotsu định kết liễu đời mình. Đúng lúc đó, Gojo Satoru - giáo viên của trường chuyên chú thuật, một nơi dạy cách giải trừ “lời nguyền” - đã yêu cầu Okkotsu chuyển tới ngôi trường này…!?
', 75)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1066, N'Chú Thuật Hồi Chiến: Tập 1', N'1066.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1066_1.jpg', N'Itadori Yuji là một học sinh cấp Ba sở hữu năng lực thể chất phi thường. Hằng ngày cậu thường tới bệnh viện chăm người ông đang ốm liệt giường. Nhưng một ngày nọ, phong ấn của “chú vật” vốn ngủ yên trong trường bị phá giải, quái vật xuất hiện. Để cứu hai anh chị khóa trên đang gặp nguy hiểm, Itadori đã xông vào trường và...', 88)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1067, N'Chú Thuật Hồi Chiến - Tập 2', N'1067.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1067_1.jpg', N'Chú thai bất ngờ xuất hiện tại trại cải tạo thanh thiếu niên. Nhóm Itadori, học sinh năm Nhất trường chuyên chú thuật, được cử đi cứu những người đang mắc kẹt bên trong. Nhưng chú thai sau khi hóa thành chú linh đã tấn công cả nhóm. Trước tình thế hiểm nghèo, Itadori đã trao quyền kiểm soát cơ thể cho Sukuna với hi vọng sẽ hạ gục chú linh, song...!? ', 55)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1068, N'Chú Thuật Hồi Chiến - Tập 3', N'1068.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1068_1.jpg', N'Todo Aoi và Zen’in Mai của trường chuyên chú thuật Kyoto xuất hiện trước mặt Fushiguro và Kugisaki! Todo hỏi Fushiguro thích kiểu con gái như thế nào và câu trả lời của cậu là...
Mặt khác, Itadori vẫn đang trong quá trình rèn luyện, để nâng cao kĩ năng thực chiến, cậu đã đến hiện trường án mạng do chú linh gây ra...
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1069, N'Chú Thuật Hồi Chiến: Tập 4', N'1069.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1069_1.jpg', N'Tại hiện trường án mạng do chú linh gây ra, Itadori đã gặp gỡ Junpei, cả hai tâm đầu ý hợp. Nhưng Junpei lại tôn sùng chú linh Mahito, thủ phạm của vụ án. Mahito lợi dụng Junpei, hòng li gián cậu và Itadori. Junpei rơi vào cạm bẫy của hắn và...', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1070, N'Chú Thuật Hồi Chiến - Tập 5', N'1070.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1070_1.jpg', N'Giao lưu trường kết nghĩa Kyoto đã bắt đầu. Trong trận chiến đội ở ngày thứ nhất, bên nào thanh tẩy được chú linh cấp 2 trong khu vực thi đấu trước sẽ thắng. Với bản tính hiếu chiến, Todo đã lập tức tấn công bên Tokyo nhưng bị Itadori phục kích. Những thành viên khác của đội Kyoto cũng tham chiến hòng ám sát Itadori, khiến cậu rơi vào tình thế tiến thoái lưỡng nan!!', 212)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1071, N'Chú Thuật Hồi Chiến - Tập 6', N'1071.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1071_1.jpg', N'Phía Kyoto lợi dụng cơ hội giao lưu để trừ khử Itadori. Trong lúc đó, chú nguyền sư và chú linh do Mahito cầm đầu đã đột nhập vào khu vực diễn ra buổi giao lưu. Nhóm giáo viên định tới ứng cứu học sinh nhưng lại bị “màn” của phe địch cản bước...!? Bị chú linh đặc cấp Hanami tấn công, liệu Fushiguro và Inumaki có thoát khỏi vòng nguy hiểm!?', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1072, N'Chú Thuật Hồi Chiến: Tập 7', N'1072.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1072_1.jpg', N'Chú linh đặc cấp Hanami và đồng bọn đã rút lui khỏi trường chuyên chú thuật, nhưng các ngón tay của Sukuna và chú vật đặc cấp “Chú thai cửu tương đồ” đã bị đánh cắp. Cửu tương đồ có được thực thể và trở thành mối nguy mới. Song nhóm Itadori lại chẳng hay biết gì về hiểm họa đó, vẫn lên đường làm nhiệm vụ tiêu diệt “Chú linh xuất hiện ở cánh cửa”...!?', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1073, N'Chú Thuật Hồi Chiến - Tập 8', N'1073.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1073_1.jpg', N'Nhóm Itadori đã đánh bại anh hai và anh ba trong “Chú thai cửu tương đồ” và thu hồi ngón tay Sukuna. Nhờ đó họ đã được đề cử lên làm thuật sư cấp 1. Ý đồ của Gojo khi chọn cách đi đường vòng là gì…!?
Trong tập này, câu chuyện sẽ lội ngược dòng thời gian về sự kiện khi Gojo và Geto còn là học sinh năm Hai của trường chuyên chú thuật!!
', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1074, N'Doraemon Movie Story Màu - Nobita Và Vùng Đất Lý Tưởng Trên Bầu Trời', N'1074.jpg', N'NXB Kim Đồng', N'Fujiko F Fujio', 33250, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1074_1.jpg', N'Câu chuyện bắt đầu khi Nobita tìm thấy một hòn đảo hình lưỡi liềm trên trời mây. Ở nơi đó, tất cả đều hoàn hảo… đến mức cậu nhóc mê ngủ ngày như Nobita cũng có thể trở thành một thần đồng toán học, một siêu sao thể thao! Doraemon và nhóm bạn đã cùng sử dụng một món bảo bối độc đáo chưa từng xuất hiện trước đây để đến với vương quốc tuyệt vời này. Cùng với những người bạn ở đây, đặc biệt là chàng robot mèo Sonya, cả hội đã có chuyến hành trình tới vương quốc trên mây tuyệt vời… cho đến khi những bí mật đằng sau vùng đất lý tưởng này được hé lộ!', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1075, N'Doraemon Movie Story: Nobita Và Người Khổng Lồ Xanh', N'1075.jpg', N'NXB Kim Đồng', N'Fujiko F Fujio', 33250, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1075_1.jpg', N'Nobita đã dùng bảo bối "dung dịch giúp cây tự phát triển" để biến cái cây cậu nhặt về trên núi thành một cái cây có linh hồn biết cử động. Cái cây đó được Nobita đặt tên là Kibou. Bỗng một ngày, đang chơi trên ngọn núi sau nhà, Nobita và Kibou đã bị người thực vật đưa đến hành tinh xanh - Green. Và nhóm bạn biết được kế hoạch làm sống lại người khổng lồ xanh để cướp hết các loài thực vật và thôn tính Trái đất. Doraemon ơi, hãy cứu lấy Kibou và tương lai của Trái Đất nhé!', 34)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1076, N'Doraemon Movie Story: Nobita Và Những Hiệp Sĩ Không Gian - Vũ Trụ Anh Hùng Kí', N'1076.jpg', N'NXB Kim Đồng', N'Fujiko F Fujio', 33250, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1076_1.jpg', N'Nhóm bạn Nobita vì ngưỡng mộ bộ phim “Vệ binh dải ngân hà” chiếu trên ti vi nên đã quyết định tự thực hiện một bộ phim về đề tài anh hùng. Nhờ bảo bối “Đạo diễn Burger”, bộ phim đã chính thức bấm máy! Nhóm bạn trở thành những siêu anh hùng sở hữu tuyệt chiêu riêng của từng người. Để giúp đỡ cậu bạn Aron tới Trái Đất nhằm tìm kiếm cứu tinh, cả nhóm đã đáp xuống hành tinh Pokkuru. Một tập phim tuyệt tác với những pha hành động gay cấn đến thót tim của 5 người bạn nhỏ!', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1077, N'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn', N'1077.jpg', N'NXB Dân Trí', N'HUỲNH THÁI NGỌC', 79200, CAST(N'1980-03-29' AS Date), 1, N'1003', N'1077_1.jpg', N'Thỏ Bảy Màu là fanpage sở hữu hơn 2,6tr lượt thích trên mạng xã hội. Với hình tượng nhân vật thú vị cùng phong cách sáng tạo độc đáo, Thỏ bảy màu vẫn luôn là thu hút được số lượng lớn người quan tâm thể hiện qua nhiều bài viết với hàng chục nghìn lượt like và share.
Thỏ Bảy Màu là một nhân vật hư cấu chẳng còn xa lạ gì với anh em dùng mạng xã hội với slogan “Nghe lời Thỏ, kiếp này coi như bỏ!”.
Thỏ Bảy Màu đơn giản chỉ là một con thỏ trắng với sự dở hơi, ngang ngược nhưng đáng yêu vô cùng tận. Nó luôn nghĩ rằng mình không có cuộc sống và không có bạn bè. Tuy nhiên, Thỏ lại chẳng bao giờ thấy cô đơn vì đến cô đơn cũng bỏ nó mà đi.
Cuốn sách là những mẩu chuyện nhỏ được ghi lại bằng tranh xoay quanh Thỏ Bảy Màu và những người nghĩ nó là bạn. Những mẩu chuyện được truyền tải rất “teen” đậm chất hài hước, châm biếm qua sự sáng tạo không kém phần “mặn mà” của tác giả càng trở nên độc đáo và thu hút.
', 55)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1078, N'Thất Tịch Không Mưa', N'1078.jpg', N'NXB Phụ Nữ', N'Lâu Vũ Tình', 73100, CAST(N'1980-03-29' AS Date), 1, N'1004', N'1078_1.jpg', N'Từ nhỏ cô đã thầm yêu anh, như số kiếp không thể thay đổi Tình yêu trong sáng ấy, như lần đầu được nếm mùi vị của quả khế mới chín. Sau đó cô và anh xa nhau, gặp lại đều cách nhau ba năm.
Tình yêu, giống như lần đầu được nếm thử quả khế mới chín.
Chua chua, chát chát, nhưng không kìm được, vẫn muốn nếm thêm lần nữa.
Trong quả khế chát xanh xanh, nụ cười ngốc nghếch, ngọt ngào của anh, tình đầu thơ ngây, trong sáng của em lặng lẽ nảy mầm.
', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1079, N'Mãi Mãi Là Bao Xa', N'1079.jpg', N'NXB Thanh Niên', N'Diệp Lạc Vô Tâm', 114750, CAST(N'1980-03-29' AS Date), 1, N'1004', N'1079_1.jpg', N'Bạch Lăng Lăng, nữ sinh khoa Điện khí, trẻ trung, xinh đẹp và rất tự hào khi quen được một người bạn lý tưởng qua mạng, chàng du học sinh của một trường nổi tiếng của Mỹ, người mang biệt danh “nhà khoa học”: Mãi Mãi Là Bao Xa. Qua những cuộc chuyện trò trên QQ, Lăng Lăng đã gắn bó với chàng trai đó lúc nào cô cũng không hay, cảm xúc lớn dần, sự chia sẻ lớn dần và đến một ngày cô phát hiện ra mình đã yêu người con trai “tài giỏi” và không một chút khuyết điểm ấy.
Nhưng sự tỉnh táo giúp cô ý thức được rằng, thế giới mạng chỉ là ảo, họ ở cách nhau cả một đại dương mênh mông, anh lại quá xuất sắc và ưu tú, mối quan hệ của họ sẽ không có kết quả gì. Nhất là khi anh thông báo, nếu anh tiếp tục sự nghiệp nghiên cứu lần này, rất có thể anh phải định cư bên Mỹ, mãi mãi không trở về. Khi nghe tin đó, cô đã gục xuống trước màn hình máy tính và khóc. Tất cả như sụp đổ, tia hy vọng cuối cùng dập tắt, anh sẽ không về nước nữa, khoảng cách giữa họ là mãi mãi… Cô cay đắng nói với anh lời từ biệt và đưa nick của anh vào danh sách đen, không bao giờ xuất hiện khi cô đăng nhập QQ nữa…
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1080, N'Vẽ Em Bằng Màu Nỗi Nhớ', N'1080.jpg', N'NXB Dân Trí', N'Tâm Phạm', 108800, CAST(N'1980-03-29' AS Date), 1, N'1004', N'1080_1.jpg', N'Vẽ em bằng màu nỗi nhớ là một câu chuyện tình yêu có thật, đã làm thổn thức biết bao trái tim người đọc. Câu chuyện là hồi ký của nhân vật Khanh trong khoảng thời gian quay trở lại Việt Nam, đan xen cùng những ký ức của 6 năm trước đó. Khanh trở về quê hương khi có biết bao điều đã đổi thay, chỉ duy tình cảm của bà con, của những người bạn cũ là vẫn không thay đổi. Tại Sài Gòn, Khanh đã gặp lại Linh - người con gái của miền ký ức xưa, và Miu - cô gái tưởng như xa lạ mà lại rất đỗi thân thuộc. Liệu anh có quên được Linh - người con gái năm xưa anh từng yêu say đắm? Và liệu anh có nhận ra Miu - cô gái bé nhỏ với tình cách buồn vui thất thường? Câu chuyện xoay quanh cuộc sống thường ngày của những thanh niên trẻ trung và năng động, ở đó không chỉ có tình yêu đôi lứa, mà còn có cả tình bạn, tình thầy cô, tình cảm gia đình, tình đồng bào của những người con xa xứ… Tất cả mang đến thật nhiều cung bậc cảm xúc, từ hài hước cho đến tò mò, đôi khi là cả những giọt nước mắt đầy xúc động.', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1081, N'Em Vốn Thích Cô Độc, Cho Đến Khi Có Anh', N'1081.jpg', N'NXB Văn Học', N'Diệp Lạc Vô Tâm', 91800, CAST(N'1980-03-29' AS Date), 1, N'1004', N'1081_1.jpg', N'Một hôm, tôi đi làm lại quên mang điện thoại. Tôi muốn về nhà lấy, nhưng lại bận không dứt ra được, đang lúc băn khoăn thì nhìn thấy Kẻ phiền phức bước thẳng vào phòng, điềm đạm đặt chiếc di động mà tôi đang cần lên bàn.
“Yêu anh quá đi!” Tôi vội vàng thì thầm vào tai hắn, rồi lập tức lấy điện thoại xem.
“Rốt cuộc thì có chuyện gì em mới không quên đây hả?” Kẻ phiền phức chán nản nói.
Tôi lặng lẽ liếc nhìn hắn một cái, nói nhỏ: “… Yêu anh!”
Mặt hắn đang hầm hầm bỗng trở nên rạng rỡ.
Lúc rời khỏi văn phòng tôi, khóe mắt hắn còn mang ý cười.
', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1082, N'Anh Giả Vờ Sẽ Không Yêu Em', N'1082.jpg', N'NXB Thanh Niên', N'Bánh Donut Của Trẫm', 129200, CAST(N'1980-03-29' AS Date), 1, N'1004', N'1082_1.jpg', N'Từ Tri Châu – thiếu gia nhà họ Từ, đồng thời cũng là một ca sĩ ẩn danh nổi tiếng trên mạng. Cậu chủ Từ vì muốn trải qua một cuộc sống đại học bình thường nên đã cố tình che giấu thân phận thực sự của mình, trở thành một chàng sinh viên “nghèo” điển trai, học giỏi, có nghị lực sống và được bạn bè hết lòng yêu quý.
Lý Dao Nguyệt – đàn em cùng trường của Từ Tri Châu, một cô gái luôn bị các bạn học xa lánh, coi thường vì nghĩ rằng cô là kẻ ham tiền tài vật chất, chim sẻ muốn hóa phượng hoàng.
Duyên phận trêu ngươi khiến Từ Tri Châu và Lý Dao Nguyệt vô tình quen biết rồi dần dần rơi vào lưới tình. Chỉ có điều, câu chuyện tình yêu giữa hai người họ vốn bắt đầu bằng những lời nói dối, những ngốc nghếch và bồng bột của tuổi trẻ, thế nên khi sự thật được phơi bày, trái tim họ cũng không tránh khỏi phải đối mặt với những đắn đo. Liệu rằng sau tất cả, họ có thể tha thứ cho đối phương, chấp nhận thân phận thật của nhau để viết nốt câu chuyện tình yêu còn đang dang dở hay không?
', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1083, N'Người Là Biển Rộng, Kẻ Là Mặt Trời', N'1083.jpg', N'NXB Hà Nội', N'Hạ Chí', 126650, CAST(N'1980-03-29' AS Date), 1, N'1004', N'1083_1.jpg', N'Hạ Sơ Nhất – một cô gái bình thường đến không thể nào bình thường hơn. Suốt những năm tháng cấp 3, cô hoàn toàn chẳng nổi bật, cũng chẳng có một sở trường gì đặc biệt, chỉ biết ngày ngày cố gắng không ngừng. Có lẽ điều duy nhất cô hơn người, chính là tính cách lạc quan của cô. Ấy vậy mà chỉ vài năm sau khi tốt nghiệp, cô đã trưởng thành hơn, chin chắn hơn, là cánh tay đắc lực của Chủ tịch. Sức mạnh để cô thay đổi bản thân chính là Lục Phỉ Nhiên.
Lục Phỉ Nhiên, ngay từ ban đầu, anh đã là một ánh mặt trời sáng chói. Là học bá của trường, là học sinh ưu tú của các thầy cô, lúc nào cũng xếp hạng nhất, anh còn nổi tiếng với vẻ đẹp trai của mình. Những tưởng Thanh Hoa sẽ là đích đến cho vị học bá toàn năng này, vậy mà cuối cùng lại lựa chọn học lại một năm. Hóa ra, anh cũng đã đem lòng yêu Sơ Nhất, muốn bảo vệ cô cả đời.
Mối tình của Hạ Sơ Nhất và Lục Phỉ Nhiên trôi qua một cách bình dị trong một thời gian dài, không có cãi vã, cùng chẳng hề phai nhạt, kể cả khi phải yêu xa. Có những ngày gọi điện cho nhau cả tiếng đồng hồ chỉ vì nỗi nhớ không hề vơi đi. Có những ngày đặc biệt cần ở bên nhau, cũng chỉ có thể nghe thấy tiếng nói của đối phương qua điện thoại.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1084, N'Tịch Mịch', N'1084.jpg', N'NXB Văn Học', N'Phỉ Ngã Tư Tồn', 92650, CAST(N'1980-03-29' AS Date), 1, N'1004', N'1084_1.jpg', N'Ngày quanh quẩn sắp tối, quyết định quay người về. Cắn tay, xé vạt váy, gửi gắm một bức thư. Một tấc lụa đáng thương, từng chữ thẫm màu máu. Chữ chữ ý xót xa, một lòng luôn không đổi. Phu quân nếu nhận thiếp, thiếp cam chịu trăm roi. Nếu không, xin nguyện chết, để chôn trên đất quân. Hóa thành đoạn trường hoa, cũng sẽ mọc đất này.', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1085, N'Ngày Nào Đi Học Cũng Bị Cà Khịa', N'1085.jpg', N'NXB Hà Nội', N'Chước Dạ', 118150, CAST(N'1980-03-29' AS Date), 1, N'1004', N'1085_1.jpg', N'Cả lớp A2 đều biết, lớp phó môn Toán Tiết Diệm và lớp phó môn Văn Thẩm Tịch là hai kẻ thù không đội trời chung, kỵ nhau như nước với lửa.
Một Thẩm Tịch hoạt bát, năng nổ, đôi lúc lại ngốc nghếch đến đáng yêu. Khi bị trêu chọc chỉ biết khó chịu mà lại không dám làm gì người ta cả.
Một Tiết Diệm độc miệng, rất cợt nhả lại vô cùng lạnh nhạt, ấy thế mà lại vừa mắt cô bạn cùng bàn kiêm hàng xóm ngốc nghếch.
Tưởng như chẳng có một điểm chung nào, bỗng dung một ngày, có người vô tình bắt gặp cặp đôi đến chết cũng không qua lại với nhau trong truyền thuyết ấy đang ngồi ôm nhau trong cánh rừng nhỏ, một người cười như kẻ ngốc, một người cười như kẻ khờ.
Tưởng như là kẻ thù không đội trời chung, ấy vậy mà khi yêu nhau lại có thể ngọt ngào đến vậy. Một người đắm chìm trong mật ngọt tình yêu, một người lại chiều chuộng đến mức vô pháp vô thiên.
', 13)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1086, N'Gánh Gánh Gồng Gồng', N'1086.jpg', N'NXB Tổng Hợp Thành Phố Hồ Chí Minh', N'Nguyễn Thị Xuân Phượng', 144000, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1086_1.jpg', N'Cuốn hồi ký gồm những câu chuyện về những thăng trầm cuộc đời của bà Nguyễn Thị Xuân Phượng từ năm 1945. Vào những năm 1967, khi đang là bác sĩ công tác tại Ủy ban Liên lạc văn hóa với người nước ngoài, do giỏi tiếng Pháp, bà Nguyễn Thị Xuân Phượng được Chủ tịch Hồ Chí Minh giao trọng trách chăm sóc sức khỏe cho vợ chồng đạo diễn người Hà Lan Joris Ivens và Marceline Loridan khi họ làm phim tại Vĩnh Linh. Cơ duyên này đã tạo nên bước ngoặt, khiến bà quyết định trở thành nữ đạo diễn phim tài liệu. Năm 1968, bà trở thành nữ đạo diễn, phóng viên chiến trường duy nhất ở Việt Nam làm việc tại Phòng Truyền hình, tiền thân của Đài truyền hình Việt Nam bây giờ. Bà đã thực hiện hàng loạt phim tài liệu mang tính thời sự, phản ánh những sự kiện chiến sự tại chiến trường Campuchia, biên giới phía bắc, và là một trong những phóng viên đầu tiên vào Dinh Độc lập theo trung đoàn xe tăng vào ngày 30.4.1975…', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1087, N'Khi Hơi Thở Hóa Thinh Không', N'1087.jpg', N'NXB Thanh Niên', N'Bánh Donut Của Trẫm', 129200, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1087_1.jpg', N'Khi hơi thở hóa thinh không là tự truyện của một bác sĩ bị mắc bệnh ung thư phổi. Trong cuốn sách này, tác giả đã chia sẻ những trải nghiệm từ khi mới bắt đầu học ngành y, tiếp xúc với bệnh nhân cho tới khi phát hiện ra mình bị ung thư và phải điều trị lâu dài.
Kalanithi rất yêu thích văn chương nên câu chuyện của anh đã được thuật lại theo một phong cách mượt mà, dung dị và đầy cảm xúc. Độc giả cũng được hiểu thêm về triết lý sống, triết lý nghề y của Kalanithi, thông qua ký ức về những ngày anh còn là sinh viên, rồi thực tập, cho đến khi chính thức hành nghề phẫu thuật thần kinh. “Đối với bệnh nhân và gia đình, phẫu thuật não là sự kiện bi thảm nhất mà họ từng phải đối mặt và nó có tác động như bất kỳ một biến cố lớn lao trong đời. Trong những thời điểm nguy cấp đó, câu hỏi không chỉ đơn thuần là sống hay chết mà còn là cuộc sống nào đáng sống.” – Kalanithi luôn biết cách đưa vào câu chuyện những suy nghĩ sâu sắc và đầy sự đồng cảm như thế.
Bạn bè và gia đình đã dành tặng những lời trìu mến nhất cho con người đáng kính trọng cả về tài năng lẫn nhân cách này. Dù không thể vượt qua cơn bệnh nan y, nhưng thông điệp của tác giả sẽ còn khiến người đọc nhớ mãi.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1088, N'Điệp Viên Hoàn Hảo X6 - Phạm Xuân Ẩn', N'1088.jpg', N'NXB Dân Trí', N'Larry Berman', 142400, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1088_1.jpg', N'Ấn bản mới này có bổ sung Lời giới thiệu của tác giả cho lần tái bản 2013 “Sáu năm sau: hồi tưởng về sách Điệp Viên Hoàn Hảo”. Larry Berman viết: “…cuộc đời của Ẩn không chỉ là một câu chuyện chiến tranh mà còn là câu chuyện về hàn gắn, về lòng trung thành với đất nước và bạn bè.
Trong ấn bản mới, tôi đã thêm vào những câu chuyện và tình tiết mới mà hồi năm 2007 chưa thể kể ra. Tôi cũng phản ánh lại việc một số độc giả dân sự và quân sự Mỹ đã phản ứng về cuốn sách của tôi cũng như về nhân vật/con người Phạm Xuân Ẩn như thế nào. Tuy nhiên, điều làm cho ấn bản mới này trở nên rất quan trọng đó là bản dịch mới. Độc giả Việt Nam sẽ lần đầu tiên được đọc câu chuyện về cuộc đời phi thường của Phạm Xuân Ẩn như chính những gì mà ông đã kể với tôi, một người Mỹ viết hồi ký cho ông. Điều này làm cho ấn bản của First News - Trí Việt vừa rất đặc biệt, vừa là một cuốn sách mới chứa đựng rất nhiều thông tin lần đầu tiên công bố…”.
Đặc biệt trong lần in mới này công bố bức thư xúc động của bà Thu Nhàn, vợ thiếu tướng Phạm Xuân Ẩn, gửi tác giả Larry Berman: “Do mắt kém, tôi phải đọc cuốn sách của ông ba lần trong suốt ba ngày, dù tôi muốn đọc xong ngay lập tức: ba ngày đầy cảm xúc, ba ngày đầy nước mắt nhớ thương, đầy tình yêu và sự tiếc nuối… Và giờ đây, mỗi lần đọc lại là tôi không cầm được nước mắt! Một ít người bạn của tôi cũng có cảm xúc như vậy… Nhưng tôi muốn đọc lại nhiều lần để nhớ về chồng tôi.
', 51)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1089, N'Trịnh Công Sơn - Thư Tình Gửi Một Người', N'1089.jpg', N'NXB Trẻ', N'Trịnh Công Sơn', 129200, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1089_1.jpg', N'Tập Thư tình gửi một người của Nhà xuất bản Trẻ ra mắt nhân kỷ niệm mười năm ngày nhạc sĩ Trịnh Công Sơn từ trần (1/4/2001 - 1/4/2011); đầu sách này cũng ở trong số các ấn phẩm đặc biệt ra đời trong tháng kỷ niệm 30 năm ngày thành lập Nhà xuất bản Trẻ (1981 - 2011).
Thông qua những lá thư của nhạc sĩ Trịnh Công Sơn gửi cô gái Huế có tên Ngô Vũ Dao Ánh, người đọc không chỉ tìm thấy vẻ đẹp kỳ diệu của một tình yêu huyền nhiệm mà còn hiểu được những lo âu, dằn vặt triền miên của nhạc sĩ về kiếp người, về lòng tin và những điều tốt đẹp đang bị mai một dần trong cõi nhân gian. Bên cạnh gia tài đồ sộ về âm nhạc của Trịnh Công Sơn, đây có thể được xem là một áng văn chương thật ấn tượng trong đời hoạt động nghệ thuật của ông.
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1090, N'Cuộc Đời Kỳ Lạ Của Nikola Tesla ', N'1090.jpg', N'Kinh Tế Thành Phố Hồ Chí Minh', N'Nikola Tesla', 76500, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1090_1.jpg', N'Được mệnh danh là “nhà khoa học điên” của giới vật lý, Tesla là người đi tiên phong đưa kỹ thuật điện, điện từ vào đời sống. Với cách tư duy kỳ lạ của mình, ông đã có đến khoảng 300 bằng phát minh, tiêu biểu như động cơ điện không đồng bộ hay lõi Tesla. Rất nhiều phát minh của Tesla đang được ứng dụng trong các thiết bị điện xung quanh ta ngày nay.
Thật không dễ để hiểu thấu hết những gì đang diễn ra trong đầu Tesla, một thiên tài với trí nhớ hình ảnh, biết tám thứ tiếng và có tầm nhìn vượt thời đại. Những gì ông đã viết trong quyển sách này có thể kỳ lạ và khó tin, nhưng hãy nhớ rằng, người ta đã mất gần một thế kỷ để biết những gì Tesla đề xuất là chính xác và khả thi!
Hy vọng quý bạn đọc có thể nhìn ra được điều gì đó mới mẻ trong những câu chữ của Tesla, bởi đó có thể là những hiểu biết giúp ta thay đổi cả thế giới này.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1091, N'Bác Hồ Với Thiếu Niên Nhi Đồng', N'1091.jpg', N'NXB Văn Học', N'Tuệ Minh', 48600, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1091_1.jpg', N'Cả cuộc đời vì nước, vì dân, Bác Hồ là biểu tượng cao đẹp nhất của chủ nghĩa yêu nước và chủ nghĩa anh hùng cách mạng Việt Nam. Tấm gương đạo đức trong sáng, phong cách sống và làm việc của Người là mẫu mực, có sức cảm hóa và thúc đẩy cho mọi thế hệ cán bộ, đảng viên và nhân dân học tập, noi theo.
Sáu cuốn sách: Bác Hồ của chúng em, Chuyện kể từ làng Sen, Bác Hồ cầu hiền tài, Bác Hồ - tấm gương sáng mãi, Bác Hồ với thiếu niên nhi đồng, Học Bác lòng ta trong sáng hơn là những câu chuyện nhỏ xung quanh cuộc đời của vị lãnh tụ kính yêu kể từ khi còn nhỏ sống cùng mẹ cha nơi làng Sen đầy ắp yêu thương cho đến khi bước lên tàu từ bến cảng Nhà Rồng ra đi tìm đường cứu nước. Hay những câu câu chuyện, ghi lại tình cảm ấm áp của Bác với thiếu niên nhi đồng trong và ngoài nước. Mỗi câu chuyện là một kỷ niệm xúc động về tình cảm chan chứa yêu thương của Bác dành cho thiếu nhi. Bao giờ, lúc nào, ở đâu Bác cũng luôn dành tình cảm yêu thương bao la vô bờ bến cho các cháu thiếu niên nhi đồng.
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1092, N'Kể Chuyện Cuộc Đời Các Thiên Tài: Alfred Nobel Và Bản Di Chúc Bất Hủ', N'1092.jpg', N'NXB Thanh Niên', N'Rasmus Hoài Nam', 55250, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1092_1.jpg', N'Cuốn sách gồm những câu chuyện viết về cuộc đời của Alfred Nobel – nhà hoá học, người kĩ sư tài năng, nhà sản xuất vũ khí, người phát minh ra các loại thuốc nổ và là nhà triệu phú người Thuỵ Điển. Con đường đi tới thành công của Alfred Nobel trải đầy bi kịch, nhưng ông luôn vững niềm tin để nuôi dưỡng những ý tưởng tốt đẹp. Sau khi Nobel mất, bản di chúc bất hủ đã được công bố. Cả thế giới đều ngưỡng mộ và khâm phục trước tấm lòng cao cả của ông. Trong di chúc, ông quyết định dùng toàn bộ tài sản của mình để sáng lập ra giải thưởng Nobel nhằm vinh danh những bậc thiên tài, có cống hiến lớn cho nhân loại trong các lĩnh vực Vật lí, Hoá học, Sinh lí học và Y khoa, Văn học và Hòa bình.', 221)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1093, N'Nick Vujicic - Cuộc Sống Không Giới Hạn', N'1093.jpg', N'NXB Tổng Hợp TPHCM', N'Nick Vujicic', 125800, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1093_1.jpg', N'Cuộc sống là do mỗi người đặt ra cho mình, giới hạn ấy thể hiện rõ khả năng và sự nỗ lực của bạn trong việc ước mơ và chinh phục ước mơ. Giới hạn ấy, tất nhiên, là hoàn cảnh sống, là tính cách, là con người, là khả năng tài chính, là điều kiện giáo dục,... Và đôi khi, chúng ta đổ lỗi cho chúng vì sự thất bại của mình.
Nhưng vốn dĩ cuộc sống thực sự không có giới hạn nào cả, chỉ cần bạn có đủ sức mạnh, ý chí và khả năng để chinh phục thì giới hạn cuộc sống vĩnh viễn nằm ở điểm vô cực.
', 23)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1094, N'Kể Chuyện Cuộc Đời Các Thiên Tài: Albert Einstein - Tuổi Thơ Gian Khó Và Cuộc Đời Khoa Học Vĩ Đại', N'1094.jpg', N'NXB Thanh Niên', N'Rasmus Hoài Nam', 144000, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1094_1.jpg', N'Cuốn sách gồm những âu chuyện viết về cuộc đời của nhà khoa học thiên tài Albert Einstein, người đã làm thay đổi cả thế giới cũng như quan niệm khoa học đương thời.
Do xuất thân có nguồn gốc Do Thái nên ngay từ khi bắt đầu đi học Albert Einstein đã chịu nhiều sự phân biệt kì thị. Cuộc đời nghiên cứu khoa học của Albert Einstein cũng gặp nhiều khó khăn do hoàn cảnh khách quan và thời cuộc đem lại, nhưng bằng trí tuệ phi thường, ông đã cho ra những công trình nghiên cứu làm thay đổi khoa học hiện đại.
Vào năm 1999, ông được tạp chi Time của Mỹ vinh danh là con người của Thế kỷ. Trước khi qua đời, ông đã viết giấy hiến tặng bộ óc của mình cho các nhà nhân chủng học nghiên cứu. Đại văn hào Bernard Shaw đã gọi Albert Einstein là “VĨ NHÂN THỨ TÁM” của thế giới khoa học, sau Pythagoras, Aristotle, Ptolemy, Copernicus, Galileo, Kepler và Newton.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1095, N'Kể Chuyện Cuộc Đời Các Thiên Tài: Lev Tolstoy - Nhà Văn Hiện Thực Thiên Tài', N'1095.jpg', N'NXB Thanh Niên', N'Rasmus Hoài Nam', 59500, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1095_1.jpg', N'Cuốn sách gồm những câu chuyện viết về cuộc đời và sự nghiệp sáng tác của đại văn hào người Nga Lev Nikolayevich Tolstoy, từ những ngày thơ ấu ở Yasnaya Polyana đến những ngày trải qua biến cố của gia đình ở Moscow. Từ khi tình yêu văn học bắt đầu nảy nở cho đến khi ông tạo dựng cho mình một hành trang quý giá trên con đường cầm bút và viết nên những tác phẩm để đời.
Cuộc sống trong quân ngũ và những ngày tháng du ngoạn ở Tây Âu, Samara… đã giúp Lev Tolstoy hiểu sâu sắc hơn về mọi tầng lớp trong xã hội, nhận thấy sự bất công, ông thương cảm cho những người lao động nghèo khổ, muốn thay đổi cuộc sống của họ nhưng học thuyết ông đưa ra lại không tưởng. Mâu thuẫn giữa tư tưởng và hiện thực mà ông đang sống đã dẫn đến những bi kịch trong chính gia đình ông.
Lev Tolstoy đã để lại một di sản văn học vô cùng giá trị gồm nhiều thể loại. Ông là mẫu mực của nghệ thuật chân chính, là cây đại thụ tỏa bóng mát cho nhiều thế hệ nhà văn, mang đến thành tựu lớn của cả một thời đại rực rỡ trong văn học Nga thế kỉ XIX.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1096, N'Kể Chuyện Cuộc Đời Các Thiên Tài: Beethoven - Nhà Soạn Nhạc Cổ Điển Vĩ Đại Thế Giới', N'1096.jpg', N'NXB Thanh Niên', N'Rasmus Hoài Nam', 51000, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1096_1.jpg', N'Beethoven sinh ngày 17 tháng 12 năm 1770, mất ngày 26 tháng 3 năm 1827. Ông là một hình tượng âm nhạc quan trọng trong giai đoạn giao thời từ thời kì âm nhạc cổ điển sang thời kì âm nhạc lãng mạn. Ông được cả thế giới công nhận là nhà soạn nhạc vĩ đại, nổi tiếng nhất và có ảnh hưởng tới rất nhiều nhà soạn nhạc, nhạc sĩ và khán giả về sau.
Cuốn sách gồm các câu chuyện về tuổi thơ, những năm tháng trưởng thành, cùng quá trình sáng tác những kiệt tác âm nhạc bất hủ của Beethoven.
Beethoven được coi là người dọn đường cho thời kì âm nhạc lãng mạn. Cuộc sống của ông cũng có rất nhiều khó khăn. Cha ông là một người nghiện và thô lỗ, mẹ ông lại hay đau ốm, bản thân ông cũng phải chịu đựng sự hành hạ đau đớn về thể xác. Nhưng chúng ta có thể tìm thấy trong âm nhạc của ông là tinh thần vượt qua nghịch cảnh, chiến thắng sự tuyệt vọng và đau buồn để trở thành một thiên tài âm nhạc với những kiệt tác bất hủ.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1097, N'Hành Trình Một Đời Người: Những Đúc Kết Từ 15 Năm Ở Vị Trí Ceo Công Ty Walt Disney', N'1097.jpg', N'NXB Trẻ', N'Robert Iger', 136000, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1097_1.jpg', N'Robert Iger trở thành Giám đốc điều hành Công ty Walt Disney vào năm 2005, trong một thời kỳ khó khăn. Cạnh tranh khốc liệt hơn bao giờ hết và công nghệ thay đổi nhanh hơn bất kỳ thời điểm nào trong lịch sử của công ty. Tầm nhìn của ông đưa ra ba ý tưởng rõ ràng: Tuân thủ quan niệm rằng chất lượng là vấn đề quan trọng, đi theo công nghệ thay vì chống lại nó, và nghĩ lớn hơn — tư duy toàn cầu — và biến Disney thành một thương hiệu mạnh hơn trên thị trường quốc tế.
Ngày nay, Disney là công ty truyền thông lớn nhất, được ngưỡng mộ nhất trên thế giới, tính cả Pixar, Marvel, Lucasfilm và 21th Century Fox trong số các tài sản của nó. Giá trị công ty tăng gần gấp năm lần so với khi Iger tiếp quản, và ông được công nhận là một trong những CEO thành công và sáng tạo nhất trong thời đại của chúng ta.
Trong Hành trình một đời người, Robert Iger chia sẻ những bài học đúc kết được khi điều hành Disney và lãnh đạo hơn 220.000 nhân viên của hãng, và khám phá những phẩm chất lãnh đạo đích thực.
Cuốn sách này nói về sự tò mò không ngừng đã thúc đẩy Iger trong suốt 45 năm, kể từ ngày ông bắt đầu làm công việc thấp nhất ở ABC. Đó cũng là về sự thấu đáo và tôn trọng, cũng như cách tiếp cận ngay thẳng-thắng-tiền bạc đã trở thành nền tảng cho mọi dự án và quan hệ đối tác mà Iger theo đuổi, từ tình bạn sâu sắc với Steve Jobs trong những năm cuối đời cho đến tình yêu vĩnh cửu dành cho thần thoại Chiến tranh giữa các vì sao.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1098, N'Elon Musk - Đặt Cả Thế Giới Lên Bốn Bánh Xe Điện', N'1098.jpg', N'NXB Tài Chính', N'Hamish McKenzie', 169150, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1098_1.jpg', N'Cuốn sách “Elon Musk - Đặt cả thế giới lên bốn bánh xe điện” mang đến cho độc giả hành trình chinh phục giấc mơ hoang dã của một công ty khởi nghiệp tại Thung lũng Silicon. Giấc mơ đó có đủ đầy sóng gió, khó khăn và sự thông tuệ của người đứng đầu - Elon Musk.
Tesla, hãng ô tô điện được Elon Musk thành lập, đã đứng lên chống lại sức mạnh không chỉ của các nhà sản xuất xe hơi Detroit được chính phủ hậu thuẫn mà còn cả sức mạnh khổng lồ của Big Oil và những nhà tài phiệt đứng sau nó - anh em nhà Koch khét tiếng. Tesla đã mang đến cho thế giới những nhận thức mới và những thành công đáng ngưỡng mộ bên cạnh tranh cãi về ô tô điện và ô tô truyền thống.
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1099, N'Pep Guardiola - Một Cách Thắng Khác', N'1099.jpg', N'NXB Hà Nội', N'Gulliem Balague', 194650, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1099_1.jpg', N'Tôi từng để hụt Pep Guardiola khi anh ấy còn đang thi đấu, vào thời điểm anh ấy nhận ra rằng mình không có tương lai ở Barcelona nữa.
Dù không có lý do nào rõ ràng để anh ấy rời đội bóng, chúng tôi vẫn nói chuyện với Guardiola và tôi đã nghĩ rằng mình đang có một cơ hội tốt để có được anh. Có thể là tôi đã chọn sai thời điểm. Nếu thành công, đó sẽ là một vụ chuyển nhượng thú vị. Guardiola chính là mẫu cầu thủ mà sau này Paul Scholes phát triển thành: Anh ấy là đội trưởng, thủ lĩnh và tiền vệ tổ chức lối chơi trong đội hình Dream Team của Barcelona do Johan Cruyff xây dựng. Sự điềm tĩnh, khả năng điều khiển trái bóng và kiểm soát nhịp độ trận đấu là những phẩm chất khiến anh trở thành một trong những cầu thủ vĩ đại nhất thế hệ mình. Đó cũng là những phẩm chất mà tôi đang tìm kiếm. Chính vì những lý do đó mà tôi đã mua Juan Sebastián Verón. Đôi lúc, ta nhìn lại một cầu thủ ở đẳng cấp hàng đầu và tự hỏi: “Không biết điều gì sẽ xảy ra nếu anh ta tới chơi bóng cho United nhỉ?” Đó chính là trường hợp của Pep Guardiola.
', 21)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1100, N'Tiểu Sử Steve Jobs', N'1100.jpg', N'NXB Lao Động', N'Walter Isaacson', 404100, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1100_1.jpg', N'Cuốn tiểu sử với tiêu đề ngắn gọn Steve Jobs do cựu thư ký tòa soạn của tạp chí Time, Walter Isaacson biên soạn, dựa trên 40 cuộc phỏng vấn với Steve Jobs trong 2 năm qua cùng các cuộc phỏng vấn với hơn 100 người thân, bạn bè, đồng nghiệp và đối thủ của ông, phát hành trên Amazon vào ngày 24/10 đang liên tục đứng vị trí số 1 danh sách sách bán chạy nhất của cả Amazon lẫn Barnes & Nobles. Đây cũng là cuốn tiểu sử đầu tiên và duy nhất nhận được sự đồng ý của Steve Jobs. Walter Isaacson cũng là người viết tiểu sử nổi tiếng, với 2 tác phẩm viết về Benjamin Franklin và Albert Einstein.', 221)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1101, N'Nick Vujicic - Sống Cho Điều Ý Nghĩa Hơn', N'1101.jpg', N'NXB Tổng Hợp TPHCM', N'Nick Vujicic', 83600, CAST(N'1980-03-29' AS Date), 1, N'1005', N'1101_1.jpg', N'Sau hai cuốn tự truyện gây sốt cho độc giả: Cuộc Sống Không Giới Hạn và Đừng Bao Giờ Từ Bỏ Khát Vọng, một lần nữa độc giả Việt Nam lại được hội ngộ cùng Nick Vujicic thông qua tác phẩm Limitless – Sống Cho Điều Ý Nghĩa Hơn. Tựa sách được đặt từ ý nghĩa của bài hát nổi tiếng nhất của Nick Something More, do Công ty Văn hóa Sáng tạo Trí Việt – First News ấn hành vào ngày 16/05/2013 nhân sự kiện chàng trai đặc biệt nhất hành tinh Nick Vujicic sang thăm Việt Nam và gặp gỡ, trò chuyện cùng mọi người.
Sinh ra không có một cơ thể lành lặn, Nick chào đời trong tình trạng không tay không chân. Từng có ý định tự tử, tuyệt vọng đến mức tin rằng cuộc sống của mình sẽ chẳng có giá trị gì hết và anh sẽ mãi mãi là gánh nặng cho những người mà anh yêu thương. Nhưng qua thời gian, Nick đã tự nhận thức được về ý nghĩa đặc biệt của sự khuyết thiếu tay chân khi anh được sinh ra, đó là sứ mạng trở thành người truyền cảm hứng và khích lệ tinh thần tất cả những người khác trên trái đất này.
Nick nhận ra: “Cuộc sống không có giới hạn nào ngoài những giới hạn ta tự đặt ra cho chính bản thân mình”.
', 214)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1102, N'Atlat Địa lí Việt Nam', N'1102.jpg', N'NXB Hà Nội', N'Nhiều Tác Giả', 27900, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1102_1.jpg', N'Bản đồ là phương tiện giảng dạy và học tập điạ lý không thể thiếu trong nhà trường phổ thông. Cùng với sách giáo khoa, Atlat địa lí Việt Nam là nguồn cung cấp kiến thức, thông tin tổng hợp và hệ thống giúp giáo viên đổi mới phương pháp dạy học, hỗ trợ học.
Để đáp ứng nhu cầu bức thiết đó, NXB Giáo dục Việt Nam trân trọng giới thiệu tập Atlat địa lý Việt Nam gồm 21 bản đồ, được in màu rõ nét, liên quan đến các lĩnh vực kinh tế - xã hội. Các bản đồ được xây dựng theo nguồn số liệu của Nhà xuất bản thống kê - Tổng cục thống kê. Đây là tài liệu được phép mang vào phòng thi tốt nghiệp THPT môn Địa lý do Bộ Giáo dục và Đào tạo quy định.
', 42)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1103, N'Sách Giáo Khoa Bộ Lớp 12 - Sách Bài Học (Bộ 13 Cuốn - Không Tiếng Anh', N'1103.jpg', N'NXB Giáo Dục Việt Nam', N'Bộ Giáo Dục Và Đào Tạo', 163000, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1103_1.jpg', NULL, 51)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1104, N'Move Up 4', N'1104.jpg', N'NXB Giáo Dục Việt Nam', N'Nhiều Tác Giả', 55000, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1104_1.jpg', N'Những năm gần đây, học sinh Tiểu học luôn được tiếp cận với rất nhiều chương trình học đa dạng các nguồn tài liệu phong phú và chất lượng; Cũng như các kì thi đánh giá năng lựcTiếng Anh quốc tế đang rất phổ biến hiện nay.
Bộ sách MOVE UP ĐƯỢC dùng như là bộ tài liệu bổ trợ cho Sách ! giáo khoa Tiếng Anh FAMILY AND FRIENDS (National Edition).
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1105, N'Tổng Ôn Ngữ Pháp Tiếng Anh ', N'1105.jpg', N'NXB Hồng Đức', N'Trang Anh', 189000, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1105_1.jpg', N'Đầy đủ nhất với 30 CHUYÊN ĐỀ NGỮ PHÁP Trong Tiếng Anh của cô Trang Anh.
Dày 606 trang gần 7.000 bài tập - SỐ LƯỢNG BÀI NHIỀU NHẤT.
TỔNG ÔN TẬP ngữ pháp tiếng anh- CHẮC CHẮN CÓ trong đề thi.
Lý thuyết được đơn giản hoá, trình bày MINDMAP dễ hiểu và siêu dễ nhớ.
Mức độ bài tập đi từ CỰC DỄ đến KHÔNG THỂ KHÓ HƠN.
', 14)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1106, N'Sổ Tay Kiến Thức Vật Lí Trung Học Phổ Thông', N'1106.jpg', N'NXB Đại Học Quốc Gia Hà Nội', N'ThS Nguyễn Phú Đồng, ThS Võ Văn Thế', 102000, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1106_1.jpg', N'Nhằm giúp các em học sinh bậc trung học phổ thông (THPT) nắm vững được kiến thức và kĩ năng của chương trình Vật lí trong quá trình học và ôn tập, chúng tôi biên soạn cuốn sách Sổ tay kiến thức Vật Lí trung học phổ thông.
Với mong muốn cuốn sách sẽ là "All in One" thật tiện ích cho các em, trong mỗi chủ đề chúng tôi hệ thống những kiến thức cơ bản, bổ sung những kiến thức nâng cao và trình bày phương pháp giải các dạng bài tập thường gặp trong chương trình Vật lí THPT. Với cách trình bày, chúng tôi hi vọng sẽ giúp các em vừa nắm vững và vận dụng được kiến thức, vừa có cái nhìn bao quát toàn bộ chương trình Vật lí trải dài từ lớp 10 đến lớp 12. 
Trong quá trình biên soạn cuốn sách chắc chắn sẽ không tránh khỏi những hạn chế, sai sót. Chúng tôi rất mong nhận được sự góp ý chân thành từ độc giả để những lần tái bản sau được hoàn thiện hơn. 
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1107, N'50 Đề Minh Họa 2023 Môn Toán Học', N'1107.jpg', N'NXB Thanh Niên', N'Lê Văn Tuấn, Nguyễn Thế Duy', 170000, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1107_1.jpg', N'Phân tích đề và hướng ra đề của bộ giáo dục.
Định hướng làm bài tập và làm đề hiệu quả.
Sách gồm 50 đề trắc nghiệm ôn thi THPTQG môn toán do thầy Lê Văn Tuấn biên soạn.
Cập nhật các đề thi chính thức, đề minh hoạ của bộ các năm trước. - Livestream chữa đề và
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1109, N'Chinh Phục Các Chuyên Đề Vật Lý Trong Đề Thi Tốt Nghiệp THPT Bằng Máy Tính Casio FX-580VN X', N'1109.jpg', N'NXB Đại Học Sư Phạm TP Hồ Chí Minh', N'Trung Tâm Nghiên Cứu Ứng Dụng Giáo Dục', 93500, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1109_1.jpg', N'Nội dung cuốn sách: "Chinh phục các chuyên đề Vật lý trong đề thi tốt nghiệp THPT bằng máy tính FX-580VN X". Dưới dạng cẩm nang, cuốn sách sẽ hướng dẫn sử dụng máy tính FX-580VN X một cách hiệu quả, hỗ trợ đắc lực cho quá trình học của học sinh cũng như nâng cao năng lực dạy Vật lý cho giáo viên. Nhờ đó, quá trình chinh phục bộ môn Vật lý trong bối cảnh đổi mới giáo dục trở nên thuận tiện và toàn diện hơn rất nhiều.', 112)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1110, N'Bộ Đề Luyện Thi THPT Môn Tiếng Anh ', N'1110.jpg', N'NXB Đà Nẵng', N'Mai Lan Hương, Phạm văn Luận', 60760, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1110_1.jpg', N'Nhằm giúp các em học sinh ôn luyện để làm tốt bài thi môn tiếng Anh trong kỳ thi trung học phổ thông quốc gia, chúng tôi biên soạn Bộ Đề Luyện Thi Trung Học Phổ Thông môn tiếng Anh.
Bộ đề gồm 20 đề luyện thi được biên soạn theo cấu trúc đề thi THPT quốc gia của Bộ Giáo Dục & Đào Tạo, với nội dung theo sát chương trình tiếng Anh trung học phổ thông.
', 23)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1111, N'Giải Chi Tiết Bộ Đề Luyện Thi Thử THPT Quốc Gia Môn Toán', N'1111.jpg', N'NXB Đại Học Quốc Gia Hà Nội', N'Nhiều Tác Giả', 161500, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1111_1.jpg', N'Giải Chi Tiết Bộ Đề Luyện Thi Thử THPT Quốc Gia Môn Toán', 112)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1112, N'Các Chuyên Đề Bám Sát Đề Thi THPT Quốc Gia Môn Sinh Học', N'1112.jpg', N'NXB Đại Học Quốc Gia Hà Nội', N'TS Phan Khắc Nghệ', 117300, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1112_1.jpg', N'Bộ Giáo Dục và Đào Tạo đang có lộ trình hướng tới một kỳ thi quốc gia chuẩn mực "2 trong 1" để vừa xét tốt nghiệp THPT vừa xét đầu vào cho các trường Đại Học và Cao Đẳng cũng như khuyến khích các trường tự chủ trong công tác tuyển sinh.
Vào Đại Học là một công việc có nhiều ý nghĩa đỗi với mỗi học sinh. Một kết quả tốt trong kì thi này không những mở ra cách cửa rộng lớn để xây dựng tương lai sáng cho bản thân các em mà còn là thước đo năng lực trí tuệ, thái độ trong học tập của các em nữa. Kết quả tốt trong kỳ thi này còn thể hiện phần nào sự báo đáp, tri ân của các em dành cho cha mẹ, người thân và thầy cô.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1113, N'Tóm Tắt Kiến Thức Toán Phổ Thông', N'1113.jpg', N'NXB Thế Giới', N'Đỗ Minh Triết', 123250, CAST(N'1980-03-29' AS Date), 1, N'1006', N'1113_1.jpg', N'Đúng như tên gọi, Tóm tắt kiến thức toán phổ thông tổng hợp những kiến thức mà học sinh cần có trong quá trình học tập môn Toán ở hai bậc học Trung học cơ sở và Trung học phổ thông. Đó là những kiến thức căn bản không chỉ giúp học sinh giải quyết các bài tập, các yêu cầu học và thi trong nhà trường, mà còn giúp các em hình thành một nền tảng tư duy toán học có thể áp dụng vào thực tiễn đời sống.
Điểm độc đáo là cuốn sách được thiết kế theo phong cách ghi chép sổ tay bullet journal. Thay vì những gạch đầu dòng nhàm chán, các kiến thức được tổng hợp luôn gắn với những ký hiệu sinh động, những tranh ảnh minh họa bắt mắt. Sẽ thật thú vị khi bạn phát hiện ra việc gắn kết số nguyên tố với hình ảnh những chú ve sầu không phải là ngẫu nhiên, hay như hình vẽ hyperbol lại được gợi lên qua những rặng san hô xinh đẹp.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1118, N'Phát Triển Năng Lực Thi Trắc Nghiệm Môn Địa Lí ', N'1114.jpg', N'NXB Dân Trí', N'Nguyễn Yến - Nguyễn Thị Kiều Hoa', 98100, CAST(N'2023-10-23' AS Date), 1, N'1006', N'1114_1.jpg', N'Để tự tin và hoàn thành tốt các bài thi trắc nghiệm, các em học sinh không chỉ cần trang bị cho mình vốn kiến thức vững vàng mà còn cần được hình thành kỹ năng để xử lý các câu hỏi trong đề thi một cách chính xác, nhanh chóng. Để hiểu được điều đó, các tác giả đã dành nhiều thời gian và tâm huyết để biên soạn tài liệu tự học cho các em học sinh.
Nội dung sách được xây dựng một cách bao quát, hệ thống, bám sát chương trình THPT hiện hành theo 04 mức độ đánh giá năng lực học sinh (nhận biết, thông hiểu, vận dụng thấp và vận dụng cao). Do đó, các em học sinh các khối lớp 10, 11, 12 đều có thể sử dụng và sử dụng cuốn sách như một tài liệu tự học thống nhất, xuyên suốt, nâng cao.
', 43)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1121, N'Tuyển Tập Đề Thi Học Sinh Giỏi Ngữ Văn THPT Qua Các Kì Thi', N'1115.jpg', N'NXB Thanh Niên', N'Nguyễn Thành Huân, Đỗ Trung Kiên', 210800, CAST(N'2023-10-21' AS Date), 1, N'1006', N'1115_1.jqg', N'“Những trang sách suốt đời đi vẫn nhớ,/ Như đám  mây ngũ sắc ngủ  trên đầu.” (Nghĩ lại về Pau-tốp-xki, Bằng Việt). Ôi thân thương biết bao với những trang sách như dòng sông sóng vỗ về miền xanh thẳm của đại dương kiến thức!
Nhằm đáp ứng nhu cầu nhận diện đề và cấu trúc đề cũng như rèn  kĩ năng giải đề thi môn Ngữ văn THPT, chuẩn bị cho các kì thi Học sinh giỏi cấp thành phố, tỉnh, khu vực và Quốc gia của học sinh trên toàn quốc. Chính vì vậy mà chúng tôi đã dày công sưu tầm và biên soạn một số đề thi học sinh giỏi qua các kì thi và tập hợp thành cuốn sách TUYỂN TẬP ĐỀ THI HỌC SINH GIỎI NGỮ VĂN THPT QUA CÁC KÌ THI.
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1123, N'Tuyển Chọn 3000 Bài Tập Điện Xoay Chiều Và Dao Động Điện Từ', N'1116.jpg', N'NXB Đại Học Quốc Gia Hà Nội', N'Lại Đắc Hợp, Nguyễn Thị Lượng', 139000, CAST(N'2023-10-21' AS Date), 1, N'1006', N'1116_1.jpg', N'Điện xoay chiều và dao động điện từ là những chương quan trọng trong chương trình Vật lý 12. Số lượng câu hỏi của những phần này trong đề thi đại học các năm gần đây thường chiếm khoảng 25% - 30%. Với nội dung kiến thức đa dạng, phong phú nên các bài tập của hai chương này xuất hiện đầy đủ ở các mức độ câu hỏi từ dễ đến khó ở trong đề thi chính thức.
Về nội dung cuốn sách, chúng tôi đã chia nhỏ các bài tập theo các chủ đề trong đó chương Điện xoay chiều gồm 17 chủ đề và chương Dao động điện từ gồm 2 chủ đề.
Trong các chủ đề chúng tôi tiếp tục chia nhỏ thành các dạng bài tập, các bài tập được sắp xếp theo mức độ từ cơ bản đến nâng cao. Điểm nổi bật của cuốn sách là toàn bộ bài tập tự luyện đều dưới dạng trắc nghiệm và đáp án đúng ở cuối sách, tuy nhiên các em có thể tra cứu lời giải chi tiết cho từng bài tập thông qua chức năng tìm kiếm theo mã câu hỏi (ID) trên trang M Ngoài ra, các dạng bài tập sẽ được đồng bộ với hệ thống video bài giảng giúp các em có thể khai thác các nội dung lý thuyết kèm theo một cách đơn giản và hiệu quả nhất. 
', 12)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO

GO
ALTER DATABASE [BBBBStore123C] SET  READ_WRITE 
GO

