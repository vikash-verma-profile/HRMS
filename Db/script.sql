USE [master]
GO
/****** Object:  Database [HRMSDB]    Script Date: 11/14/2021 8:45:17 AM ******/
CREATE DATABASE [HRMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HRMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\HRMSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HRMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\HRMSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HRMSDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HRMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HRMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HRMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HRMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HRMSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HRMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HRMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HRMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HRMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HRMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HRMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HRMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HRMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HRMSDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HRMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HRMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HRMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HRMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HRMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HRMSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HRMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HRMSDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HRMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [HRMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HRMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HRMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HRMSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HRMSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HRMSDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HRMSDB', N'ON'
GO
ALTER DATABASE [HRMSDB] SET QUERY_STORE = OFF
GO
USE [HRMSDB]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 11/14/2021 8:45:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 11/14/2021 8:45:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [nvarchar](50) NULL,
	[EmployeeName] [nvarchar](100) NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 11/14/2021 8:45:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMenuMaster]    Script Date: 11/14/2021 8:45:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenuMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuText] [nvarchar](100) NULL,
	[ControllerName] [nvarchar](100) NULL,
	[ActionName] [nvarchar](100) NULL,
	[IsParent] [int] NULL,
 CONSTRAINT [PK_tblMenuMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblDepartment] ON 

INSERT [dbo].[tblDepartment] ([Id], [DepartmentName]) VALUES (1, N'IT')
INSERT [dbo].[tblDepartment] ([Id], [DepartmentName]) VALUES (2, N'Sales')
INSERT [dbo].[tblDepartment] ([Id], [DepartmentName]) VALUES (3, N'Cleaning')
SET IDENTITY_INSERT [dbo].[tblDepartment] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLogin] ON 

INSERT [dbo].[tblLogin] ([Id], [UserName], [Password]) VALUES (1, N'admin@admin.com', N'admin')
SET IDENTITY_INSERT [dbo].[tblLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMenuMaster] ON 

INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (1, N'Dashboard', N'', N'', 0)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (2, N'Employee Management', N'', N'', 0)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (3, N'Department Management', N'', N'', 0)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (4, N'Create Employee', N'Employee', N'Index', 2)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (5, N'Department List', N'Department', N'DepartmentList', 3)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (6, N'Create Department', N'Department', N'Index', 3)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (7, N'Employee List', N'Employee', N'EmployeeList', 2)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (8, N'Attendance Management', NULL, NULL, 0)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (9, N'Insert Attendance', N'Attendance', N'Index', 8)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (10, N'Attendance List', N'Attendance', N'AttendanceList', 8)
INSERT [dbo].[tblMenuMaster] ([Id], [MenuText], [ControllerName], [ActionName], [IsParent]) VALUES (11, N'Dashboard', N'Dashboard', N'Index', 1)
SET IDENTITY_INSERT [dbo].[tblMenuMaster] OFF
GO
USE [master]
GO
ALTER DATABASE [HRMSDB] SET  READ_WRITE 
GO
