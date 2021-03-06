USE [master]
GO
/****** Object:  Database [ScaleFocus-PMA]    Script Date: 7/14/2021 8:15:19 PM ******/
CREATE DATABASE [ScaleFocus-PMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ScaleFocus-PMA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ScaleFocus-PMA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ScaleFocus-PMA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ScaleFocus-PMA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScaleFocus-PMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScaleFocus-PMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScaleFocus-PMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScaleFocus-PMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ScaleFocus-PMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScaleFocus-PMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ScaleFocus-PMA] SET  MULTI_USER 
GO
ALTER DATABASE [ScaleFocus-PMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScaleFocus-PMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ScaleFocus-PMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ScaleFocus-PMA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ScaleFocus-PMA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ScaleFocus-PMA]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[UserIdLastChanged] [int] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectsTeams]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectsTeams](
	[ProjectsId] [int] NOT NULL,
	[TeamsId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectsTeams] PRIMARY KEY CLUSTERED 
(
	[ProjectsId] ASC,
	[TeamsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectsId] [int] NOT NULL,
	[AssigneeId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[StatusId] [int] NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[UserIdLastChanged] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[UserIdLastChanged] [int] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Last_Name] [nvarchar](50) NOT NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[UserIdLastChanged] [int] NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTeams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsersId] [int] NOT NULL,
	[TeamsId] [int] NOT NULL,
 CONSTRAINT [PK_UsersTeams_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vProjectsTasksUsers]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vProjectsTasksUsers]
AS
SELECT dbo.Tasks.Id, dbo.Projects.Title AS ProjectTitle, dbo.Users.Username, dbo.Tasks.Title AS TaskTitle, dbo.Tasks.DateOfCreation
FROM     dbo.Projects INNER JOIN
                  dbo.Tasks ON dbo.Projects.Id = dbo.Tasks.ProjectsId INNER JOIN
                  dbo.Users ON dbo.Tasks.AssigneeId = dbo.Users.Id
GO
/****** Object:  View [dbo].[vProjectsTeams]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vProjectsTeams]
AS
SELECT        dbo.Projects.Id, dbo.Projects.Title AS Project, dbo.Teams.Title AS TeamTitle, dbo.Projects.DateOfCreation
FROM            dbo.Projects INNER JOIN
                         dbo.ProjectsTeams ON dbo.Projects.Id = dbo.ProjectsTeams.ProjectsId INNER JOIN
                         dbo.Teams ON dbo.ProjectsTeams.TeamsId = dbo.Teams.Id
GO
/****** Object:  View [dbo].[vUsersTeams]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUsersTeams]
AS
SELECT Teams.Title, Teams.DateOfCreation, dbo.Users.First_Name, dbo.Users.Last_Name, Teams.Id AS TeamsId, dbo.Users.Id AS UsersId, dbo.Users.Username
FROM     dbo.Teams AS Teams INNER JOIN
                  dbo.UsersTeams ON dbo.UsersTeams.TeamsId = Teams.Id INNER JOIN
                  dbo.Users ON dbo.UsersTeams.UsersId = dbo.Users.Id
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged]) VALUES (1, N'AQUA', N'Create Website', CAST(N'2021-07-14T10:00:44.0000000' AS DateTime2), NULL, CAST(N'2021-07-14T10:00:44.0000000' AS DateTime2), NULL)
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged]) VALUES (2, N'AI for nature', N'Create robot', CAST(N'2021-07-14T13:59:04.0000000' AS DateTime2), NULL, CAST(N'2021-07-14T13:59:04.0000000' AS DateTime2), NULL)
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged]) VALUES (3, N'Forza#', N'car', CAST(N'2021-07-14T17:40:53.0000000' AS DateTime2), NULL, CAST(N'2021-07-14T17:40:53.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
INSERT [dbo].[ProjectsTeams] ([ProjectsId], [TeamsId]) VALUES (1, 2)
INSERT [dbo].[ProjectsTeams] ([ProjectsId], [TeamsId]) VALUES (2, 1003)
INSERT [dbo].[ProjectsTeams] ([ProjectsId], [TeamsId]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [status]) VALUES (1, N'pending')
INSERT [dbo].[Status] ([Id], [status]) VALUES (2, N'inProgress')
INSERT [dbo].[Status] ([Id], [status]) VALUES (3, N'completed')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([Id], [ProjectsId], [AssigneeId], [Title], [Description], [StatusId], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged]) VALUES (1, 2, 1, N'Create database', N'Open SSMS', NULL, CAST(N'2021-07-14T14:17:38.0000000' AS DateTime2), NULL, CAST(N'2021-07-14T14:17:38.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged]) VALUES (2, N'Team1', N'Making homemade pizza dough can sound like a lot of work, but it’s so worth the bragging rights. The dough itself requires few ingredients and just a little bit of rising and rest time. While you wait for the dough to be ready, you can get to work prepping your tomato sauce, chopping fresh vegetable', CAST(N'2021-07-08T10:13:03.0000000' AS DateTime2), NULL, CAST(N'2021-07-08T10:13:03.0000000' AS DateTime2), NULL)
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged]) VALUES (3, N'TeamLegend', N'We will win(probably)', CAST(N'2021-07-13T10:20:57.0000000' AS DateTime2), NULL, CAST(N'2021-07-13T10:20:57.0000000' AS DateTime2), NULL)
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged]) VALUES (4, N'Sharks', N'SharksSharksSharksSharksAWin', CAST(N'2021-07-13T11:11:14.0000000' AS DateTime2), NULL, CAST(N'2021-07-13T11:11:14.0000000' AS DateTime2), NULL)
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged]) VALUES (1003, N'Astro', N'Space', CAST(N'2021-07-14T10:35:28.0000000' AS DateTime2), NULL, CAST(N'2021-07-14T10:35:28.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [First_Name], [Last_Name], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged], [IsAdmin]) VALUES (1, N'TotalDrama', N'd2d02ea74de2c9fab1d802db969c18d409a8663a9697977bb1c98ccdd9de4372', N'Valio', N'Vulev', CAST(N'2021-07-06T17:59:43.0000000' AS DateTime2), NULL, CAST(N'2021-07-06T17:59:43.0000000' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [Username], [Password], [First_Name], [Last_Name], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged], [IsAdmin]) VALUES (2, N'StrawHat', N'17756315ebd47b7110359fc7b168179bf6f2df3646fcc888bc8aa05c78b38ac1', N'Dimitur', N'Dimitriov', CAST(N'2021-07-06T18:04:34.0000000' AS DateTime2), NULL, CAST(N'2021-07-06T18:04:34.0000000' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [Username], [Password], [First_Name], [Last_Name], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged], [IsAdmin]) VALUES (4, N'NotAdmin', N'c2160380dd3254336251c26d43df3b66e01c1926e094e475db40c2a9517b6cba', N'Georgi', N'Kalchev', CAST(N'2021-07-08T09:28:05.0000000' AS DateTime2), NULL, CAST(N'2021-07-08T09:28:05.0000000' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [Username], [Password], [First_Name], [Last_Name], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged], [IsAdmin]) VALUES (5, N'SSMarine', N'33b79e9c41e470953254dec41504b36de76b6c6bd3054cfea24bdd61a543e7d8', N'Stoyan', N'Stoyanov', CAST(N'2021-07-12T09:30:24.0000000' AS DateTime2), NULL, CAST(N'2021-07-12T09:30:24.0000000' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [Username], [Password], [First_Name], [Last_Name], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged], [IsAdmin]) VALUES (6, N'MaMaMia', N'fa67184b25bdc4d572cd05b9e9c219c580de3d352d922757db6328d26bab3b07', N'Ivan', N'Ivanov', CAST(N'2021-07-13T10:21:28.0000000' AS DateTime2), NULL, CAST(N'2021-07-13T10:21:28.0000000' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [Username], [Password], [First_Name], [Last_Name], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged], [IsAdmin]) VALUES (1008, N'admin', N'adminpass', N'Admin', N'Admin', CAST(N'2021-07-14T14:32:56.0000000' AS DateTime2), 1, CAST(N'2021-07-14T14:32:56.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [First_Name], [Last_Name], [DateOfCreation], [CreatorId], [DateOfLastChange], [UserIdLastChanged], [IsAdmin]) VALUES (1009, N'Monkey123', N'207e21e651f3c64a0c95edb00cf0b2358a8204b813aab3a01976cc15680420dc', N'Georgi', N'Georgiev', CAST(N'2021-07-14T20:06:56.0000000' AS DateTime2), NULL, CAST(N'2021-07-14T20:06:56.0000000' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersTeams] ON 

INSERT [dbo].[UsersTeams] ([Id], [UsersId], [TeamsId]) VALUES (2, 1, 2)
INSERT [dbo].[UsersTeams] ([Id], [UsersId], [TeamsId]) VALUES (3, 2, 2)
INSERT [dbo].[UsersTeams] ([Id], [UsersId], [TeamsId]) VALUES (5, 4, 2)
INSERT [dbo].[UsersTeams] ([Id], [UsersId], [TeamsId]) VALUES (1002, 5, 2)
INSERT [dbo].[UsersTeams] ([Id], [UsersId], [TeamsId]) VALUES (1003, 6, 3)
INSERT [dbo].[UsersTeams] ([Id], [UsersId], [TeamsId]) VALUES (1004, 1009, 3)
SET IDENTITY_INSERT [dbo].[UsersTeams] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Projects_Title]    Script Date: 7/14/2021 8:15:19 PM ******/
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [UK_Projects_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Teams_Title]    Script Date: 7/14/2021 8:15:19 PM ******/
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [UK_Teams_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Users_Username]    Script Date: 7/14/2021 8:15:19 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users1] FOREIGN KEY([UserIdLastChanged])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users1]
GO
ALTER TABLE [dbo].[ProjectsTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsTeams_Projects] FOREIGN KEY([ProjectsId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[ProjectsTeams] CHECK CONSTRAINT [FK_ProjectsTeams_Projects]
GO
ALTER TABLE [dbo].[ProjectsTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsTeams_Teams] FOREIGN KEY([TeamsId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[ProjectsTeams] CHECK CONSTRAINT [FK_ProjectsTeams_Teams]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Projects] FOREIGN KEY([ProjectsId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Projects]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Status]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users1] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users1]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users2] FOREIGN KEY([UserIdLastChanged])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users2]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users1] FOREIGN KEY([UserIdLastChanged])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users1] FOREIGN KEY([UserIdLastChanged])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users1]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams_Teams] FOREIGN KEY([TeamsId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams_Teams]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams_Users] FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams_Users]
GO
/****** Object:  StoredProcedure [dbo].[RegisterTeam]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegisterTeam]
	@Title nvarchar(50),
	@Description nvarchar(300)
AS
	INSERT INTO Teams (Title, Description)
    VALUES (@Title, @Description)
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegisterUser]
	@Username varchar(50),
	@Password varchar(256),
	@First_Name nvarchar(50),
	@Last_Name nvarchar(50)
AS
	INSERT INTO Users (Username, First_Name, Last_Name, Password)
    VALUES (@Username, @First_Name, @Last_Name, @Password)
GO
/****** Object:  StoredProcedure [dbo].[UpdateUsers]    Script Date: 7/14/2021 8:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateUsers]
	@Id int,
	@Username varchar(50),
	@First_Name nvarchar(50),
	@Last_Name nvarchar(50)
AS
	UPDATE Users 
    SET Username = @Username, First_Name = @First_Name, Last_Name = @Last_Name
    WHERE Id = @Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Projects"
            Begin Extent = 
               Top = 99
               Left = 59
               Bottom = 262
               Right = 281
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tasks"
            Begin Extent = 
               Top = 11
               Left = 372
               Bottom = 174
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 139
               Left = 780
               Bottom = 302
               Right = 1002
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProjectsTasksUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProjectsTasksUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Projects"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 191
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProjectsTeams"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 102
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teams"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 207
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProjectsTeams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vProjectsTeams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Teams"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UsersTeams"
            Begin Extent = 
               Top = 0
               Left = 427
               Bottom = 113
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 156
               Left = 607
               Bottom = 286
               Right = 798
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 1356
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsersTeams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsersTeams'
GO
USE [master]
GO
ALTER DATABASE [ScaleFocus-PMA] SET  READ_WRITE 
GO
