USE [master]
GO
/****** Object:  Database [HRMSDB]    Script Date: 11/16/2021 12:13:36 PM ******/
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
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 11/16/2021 12:13:36 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [iislogin]    Script Date: 11/16/2021 12:13:36 PM ******/
CREATE USER [iislogin] FOR LOGIN [iislogin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_owner] ADD MEMBER [iislogin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [iislogin]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [iislogin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [iislogin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [iislogin]
GO
/****** Object:  Table [dbo].[tblAttendance]    Script Date: 11/16/2021 12:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 11/16/2021 12:13:36 PM ******/
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
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 11/16/2021 12:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [nvarchar](50) NULL,
	[EmployeeName] [nvarchar](100) NULL,
	[DepartmentId] [int] NULL,
	[Gender] [int] NULL,
	[DOB] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 11/16/2021 12:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_tblLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMenuMaster]    Script Date: 11/16/2021 12:13:36 PM ******/
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
/****** Object:  Table [dbo].[tblRole]    Script Date: 11/16/2021 12:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoleMenuMapping]    Script Date: 11/16/2021 12:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoleMenuMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[MenuId] [int] NULL,
 CONSTRAINT [PK_tblRoleMenuMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAttendance] ON 

INSERT [dbo].[tblAttendance] ([Id], [CheckIn], [CheckOut], [UpdatedBy], [UpdatedOn], [CreatedBy], [CreatedOn]) VALUES (1, CAST(N'2021-11-15T09:06:55.910' AS DateTime), CAST(N'2021-11-15T10:08:39.367' AS DateTime), 1, CAST(N'2021-11-15T10:08:39.367' AS DateTime), 1, CAST(N'2021-11-15T09:06:56.357' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblAttendance] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDepartment] ON 

INSERT [dbo].[tblDepartment] ([Id], [DepartmentName]) VALUES (1, N'IT')
INSERT [dbo].[tblDepartment] ([Id], [DepartmentName]) VALUES (2, N'Sales')
INSERT [dbo].[tblDepartment] ([Id], [DepartmentName]) VALUES (3, N'Cleaning')
INSERT [dbo].[tblDepartment] ([Id], [DepartmentName]) VALUES (4, N'Admin')
SET IDENTITY_INSERT [dbo].[tblDepartment] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([Id], [EmployeeId], [EmployeeName], [DepartmentId], [Gender], [DOB], [RoleId]) VALUES (1, N'RNO001', N'Admin', 4, NULL, NULL, NULL)
INSERT [dbo].[tblEmployee] ([Id], [EmployeeId], [EmployeeName], [DepartmentId], [Gender], [DOB], [RoleId]) VALUES (2, N'RNO002', N'Vikash Verma', 1, NULL, NULL, NULL)
INSERT [dbo].[tblEmployee] ([Id], [EmployeeId], [EmployeeName], [DepartmentId], [Gender], [DOB], [RoleId]) VALUES (3, N'RNO0003', N'Walid', 1, 1, N'11/5/2021', NULL)
INSERT [dbo].[tblEmployee] ([Id], [EmployeeId], [EmployeeName], [DepartmentId], [Gender], [DOB], [RoleId]) VALUES (4, N'RNO0004', N'Sumit', 2, 1, N'11/4/2021', NULL)
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLogin] ON 

INSERT [dbo].[tblLogin] ([Id], [UserName], [Password], [EmployeeId]) VALUES (1, N'admin@admin.com', N'admin', 1)
INSERT [dbo].[tblLogin] ([Id], [UserName], [Password], [EmployeeId]) VALUES (2, N'vikash@admin.com', N'vikash', 2)
INSERT [dbo].[tblLogin] ([Id], [UserName], [Password], [EmployeeId]) VALUES (3, N'walid@admin.com', N'123456', 3)
INSERT [dbo].[tblLogin] ([Id], [UserName], [Password], [EmployeeId]) VALUES (4, N'sumit@admin.com', N'123456', 4)
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
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([Id], [RoleName]) VALUES (2, N'Employee')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoleMenuMapping] ON 

INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (1, 1, 1)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (2, 1, 2)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (3, 1, 3)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (4, 1, 4)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (5, 1, 5)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (6, 1, 6)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (7, 1, 7)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (8, 1, 8)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (9, 1, 9)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (10, 1, 10)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (11, 1, 11)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (12, 2, 1)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (13, 2, 11)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (14, 2, 8)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (15, 2, 9)
INSERT [dbo].[tblRoleMenuMapping] ([Id], [RoleId], [MenuId]) VALUES (16, 2, 10)
SET IDENTITY_INSERT [dbo].[tblRoleMenuMapping] OFF
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardData]    Script Date: 11/16/2021 12:13:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetDashboardData]
as begin

declare @employeecount int,@employeeabsent int,@employeepresent int,@newemployeecount int;
set @employeecount=(select count(*) from tblEmployee);
set @employeeabsent= 0 ;
set @newemployeecount= 2 ;
set @employeepresent=(select count(*)  from tblAttendance where CAST(CreatedOn as date)=CAST(GETDATE() as date));
select @employeecount as EmployeeCount,@employeeabsent as EmployeeAbsent,
@newemployeecount as NewEmployeeCount ,@employeepresent as EmployeePresent;
end
GO
/****** Object:  StoredProcedure [dbo].[GetIsCheckIn]    Script Date: 11/16/2021 12:13:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetIsCheckIn](@EmployeeId int)
as 

Begin


select count(*) as CheckedIn,Id from tblAttendance where CAST(CreatedOn as date)=CAST(GETDATE() as date) 
and CreatedBy=@EmployeeId group by Id;

End
GO
USE [master]
GO
ALTER DATABASE [HRMSDB] SET  READ_WRITE 
GO
