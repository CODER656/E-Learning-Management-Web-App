USE [master]
GO
/****** Object:  Database [ELearningDb]    Script Date: 28\09\2023 16:52:59 ******/
CREATE DATABASE [ELearningDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELearningDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ELearningDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ELearningDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ELearningDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ELearningDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELearningDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELearningDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELearningDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELearningDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELearningDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELearningDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELearningDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ELearningDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELearningDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELearningDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELearningDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELearningDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELearningDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELearningDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELearningDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELearningDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ELearningDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELearningDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELearningDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELearningDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELearningDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELearningDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELearningDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELearningDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ELearningDb] SET  MULTI_USER 
GO
ALTER DATABASE [ELearningDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELearningDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELearningDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELearningDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ELearningDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ELearningDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ELearningDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [ELearningDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ELearningDb]
GO
/****** Object:  Table [dbo].[CourseAssignments]    Script Date: 28\09\2023 16:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignments](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[OverallScore] [float] NULL,
 CONSTRAINT [PK_CoureAssignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEnrollment]    Script Date: 28\09\2023 16:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEnrollment](
	[CourseEnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
	[Grade] [float] NULL,
	[LastCompletedLessonId] [int] NULL,
 CONSTRAINT [PK_CourseEnrollment] PRIMARY KEY CLUSTERED 
(
	[CourseEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseResource]    Script Date: 28\09\2023 16:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseResource](
	[ResourceId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[ResourceType] [int] NULL,
	[ContentInfo] [nvarchar](max) NULL,
	[LessonId] [int] NULL,
 CONSTRAINT [PK_CourseResource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 28\09\2023 16:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 28\09\2023 16:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourseAssignment]    Script Date: 28\09\2023 16:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourseAssignment](
	[StudentCourseAssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[AssignmentId] [int] NULL,
	[Score] [float] NULL,
	[FileUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentCourseAssignment] PRIMARY KEY CLUSTERED 
(
	[StudentCourseAssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28\09\2023 16:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](max) NOT NULL,
	[Last_Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [varbinary](max) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CourseAssignments] ON 

INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (1, 8, N'ASSIGNMENT 1', N'RECURSIVE FIBONACCI', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (2, 8, N'ASSIGNMENT 2', N'10 TO 1 WITH FOR', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (3, 9, N'ASSIGNMENT 1', N'recursive ile fibonacci', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (4, 10, N'Assignment 1', N'Do a fibonacci with recursive functions', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (5, 11, N'Bank System', N'Create a bank web page with using nodejs', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (6, 11, N'Learning Management System', N'Create a lms with using nodejs', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (7, 12, N'DSFFD', N'DVVCVCCX', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (8, 13, N'Implement logic of array', N'Implement array', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (9, 14, N'HTML WORK1 ', N'DO THIS WORK AND GAIN KNOWLEDGE', 0)
INSERT [dbo].[CourseAssignments] ([AssignmentId], [CourseId], [Title], [Description], [OverallScore]) VALUES (10, 14, N'HTML WORK2 ', N'DO YOU KNOW WHAT -  YOU KNOW HTML NOW', 0)
SET IDENTITY_INSERT [dbo].[CourseAssignments] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseEnrollment] ON 

INSERT [dbo].[CourseEnrollment] ([CourseEnrollmentId], [StudentId], [CourseId], [Grade], [LastCompletedLessonId]) VALUES (1, 4, 10, 99, 9)
INSERT [dbo].[CourseEnrollment] ([CourseEnrollmentId], [StudentId], [CourseId], [Grade], [LastCompletedLessonId]) VALUES (2, 4, 11, 50, NULL)
INSERT [dbo].[CourseEnrollment] ([CourseEnrollmentId], [StudentId], [CourseId], [Grade], [LastCompletedLessonId]) VALUES (3, 4, 13, 50, NULL)
INSERT [dbo].[CourseEnrollment] ([CourseEnrollmentId], [StudentId], [CourseId], [Grade], [LastCompletedLessonId]) VALUES (4, 4, 14, 100, 16)
SET IDENTITY_INSERT [dbo].[CourseEnrollment] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseResource] ON 

INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (1, 6, 1, N'https://www.youtube.com/watch?v=gCCVsvgR2KU&pp=ygUYcHl0aG9uIGNvdXJzZSBkYXRhIHR5cGVz', 3)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (2, 6, 1, N'https://www.youtube.com/watch?v=_wZUNiGtkcw&ab_channel=Kavax', 4)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (3, 7, 1, N'https://www.youtube.com/watch?v=gCCVsvgR2KU&pp=ygUYcHl0aG9uIGNvdXJzZSBkYXRhIHR5cGVz', 5)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (4, 8, 1, N'https://www.youtube.com/watch?v=gCCVsvgR2KU&pp=ygUYcHl0aG9uIGNvdXJzZSBkYXRhIHR5cGVz', 6)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (5, 9, 1, N'https://www.youtube.com/watch?v=gCCVsvgR2KU&pp=ygUYcHl0aG9uIGNvdXJzZSBkYXRhIHR5cGVz', 7)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (6, 10, 1, N'https://www.youtube.com/embed/YKSpANU8jPE', 8)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (7, 10, 1, N'https://www.youtube.com/embed/pkYVOmU3MgA', 9)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (8, 11, 1, N'https://www.youtube.com/embed/zb3Qk8SG5Ms', 10)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (9, 11, 1, N'https://www.youtube.com/embed/OIBIXYLJjsI', 11)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (10, 12, 1, N'https://www.youtube.com/watch?v=gCCVsvgR2KU&pp=ygUYcHl0aG9uIGNvdXJzZSBkYXRhIHR5cGVz', 12)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (11, 12, 1, N'https://www.youtube.com/watch?v=gCCVsvgR2KU&pp=ygUYcHl0aG9uIGNvdXJzZSBkYXRhIHR5cGVz', 13)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (12, 13, 1, N'https://www.youtube.com/watch?v=eIrMbAQSU34&t=2118s', 14)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (13, 14, 1, N'https://www.youtube.com/watch?v=jiCSs0Weiqk&list=PLfAfrKyDRWrG7tK01yW92A2j7Ou0qpOFm&ab_channel=PROTOTURK', 15)
INSERT [dbo].[CourseResource] ([ResourceId], [CourseId], [ResourceType], [ContentInfo], [LessonId]) VALUES (14, 14, 1, N'https://www.youtube.com/watch?v=Y86zzWRle3g&list=PLURN6mxdcwL_dk2ftGRrvt4R2TqfIUysy&ab_channel=EnesBayram', 16)
SET IDENTITY_INSERT [dbo].[CourseResource] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [Title], [Description], [UserId], [ImageUrl]) VALUES (10, N'Python Course', N'Learn Python like a Professional Start from the basics and go all the way to creating your own applications and games', 6, N'/course_thumbnails/c21b31a7-1690-4b68-ad70-ae6dc0d8d03e_python-thumbnail.jpg')
INSERT [dbo].[Courses] ([CourseId], [Title], [Description], [UserId], [ImageUrl]) VALUES (11, N'Node.js Course', N'Learn from real NodeJS experts! Includes REALLY Advanced NodeJS. Express, GraphQL, REST, MongoDB, SQL, MERN + much more', 6, N'/course_thumbnails/e24a2a7e-45c4-42a6-b55f-9c0b5ed27fcd_nodejs_cover_photo_smaller_size.png')
INSERT [dbo].[Courses] ([CourseId], [Title], [Description], [UserId], [ImageUrl]) VALUES (13, N'Learn Java', N'Learn the core Java skills needed to apply for Java developer positions in just 14 hours.
Be able to sit for and pass the Oracle Java Certificate exam if you choose.
Be able to demonstrate your understanding of Java to future employers.
Learn industry "best practices" in Java software development from a professional Java developer who has worked in the language for 18 years.', 6, N'/course_thumbnails/44b8e90f-1be4-4ad5-9110-c1d3cdbe10be_java.jpeg')
INSERT [dbo].[Courses] ([CourseId], [Title], [Description], [UserId], [ImageUrl]) VALUES (14, N'HTML', N'WE LEARN HTML ', 6, N'/course_thumbnails/fea0440d-1a8c-486c-b38b-5f66693e88e1_html.jpg')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (1, N'PYTHON 1', N'python good', 5)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (2, N'PYTHON 2', N'PYTHON OK', 5)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (3, N'PYTHON 1', N'PYTHON GOOD', 6)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (4, N'PYTHON 2', N'PYTHON OK', 6)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (5, N'C# 1', N'ASDASDD', 7)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (6, N'JAVA 1', N'DATA TYPES', 8)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (7, N'JAVA 1', N'JAVA ÇOK ÖNEMLİ OOP', 9)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (8, N'Lesson 1', N'Python Setup', 10)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (9, N'Lesson 2', N'Python Data Structures', 10)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (10, N'Introduction', N'Course Outline', 11)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (11, N'Internals', N'Asynchronous Callbacks', 11)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (12, N'DFSDFFDS', N'SDFFDSDSF', 12)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (13, N'VXXVC', N'XCXVCXCV', 12)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (14, N'Java variables', N'Int float string etc.', 13)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (15, N'HTML 101 ', N'IN THIS LESSON WE ARE GOING TO LEARN HTML BASIC', 14)
INSERT [dbo].[Lesson] ([LessonId], [Title], [Description], [CourseId]) VALUES (16, N'HTML 101 ', N'WE CONTINUE HTML AND LEARN MORE ', 14)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentCourseAssignment] ON 

INSERT [dbo].[StudentCourseAssignment] ([StudentCourseAssignmentId], [UserId], [AssignmentId], [Score], [FileUrl]) VALUES (1, 4, 4, 33, N'/assignment_files/54317952-94aa-43a2-b0a6-c2b0350b92be_alg1.jpg')
INSERT [dbo].[StudentCourseAssignment] ([StudentCourseAssignmentId], [UserId], [AssignmentId], [Score], [FileUrl]) VALUES (2, 4, 5, 44, N'/assignment_files/7cef545f-7046-49ac-a0e7-f7c0b6353677_enzim1.png')
INSERT [dbo].[StudentCourseAssignment] ([StudentCourseAssignmentId], [UserId], [AssignmentId], [Score], [FileUrl]) VALUES (3, 4, 6, 55, N'/assignment_files/fd6ebbb6-5483-4682-a900-b13292dddcb7_enzim3.png')
INSERT [dbo].[StudentCourseAssignment] ([StudentCourseAssignmentId], [UserId], [AssignmentId], [Score], [FileUrl]) VALUES (4, 4, 8, 66, N'/assignment_files/267c3a44-58c5-49ec-ac22-bc2d0b7b4ac4_desktop-wallpaper-widescreen-background-digital-widescreen-best-digital.jpg')
INSERT [dbo].[StudentCourseAssignment] ([StudentCourseAssignmentId], [UserId], [AssignmentId], [Score], [FileUrl]) VALUES (5, 4, 9, 22, N'/assignment_files/4ea17543-bf76-48cd-8393-462b62f4ac94_576c9dae-eefe-470d-b623-d6be532bdc1c.jpg')
INSERT [dbo].[StudentCourseAssignment] ([StudentCourseAssignmentId], [UserId], [AssignmentId], [Score], [FileUrl]) VALUES (6, 4, 10, 77, N'/assignment_files/499dfb3b-7c78-4382-a163-8239c41bb774_0127afbe-f82f-4e62-b51a-de8953ddb6ec.jpg')
SET IDENTITY_INSERT [dbo].[StudentCourseAssignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [Role]) VALUES (4, N'İbrahim', N'İçgili', N'ibrahimicgili@gmail.com', 0x2432612431312474614373466D773767654E6C534C2E595174762E6F65546A6E79466A58326F78462E65667231696B7046534276612F3370775A386D, 1)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [Role]) VALUES (5, N'Furkan', N'Taşkın', N'furkantaskin@gmail.com', 0x24326124313124636A38474A5635316166775A43437A303273526F39757A3975574749365A63332F4F5258465443526D6E3737644169386672723371, 99)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [Role]) VALUES (6, N'halil', N'yılmaz', N'halil@yilmaz.com', 0x2432612431312478424F352E4D35415566726D63465A53557265785475356172646968654A76656546534C67653939596B6E746B6A3571366C486B75, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [ELearningDb] SET  READ_WRITE 
GO
