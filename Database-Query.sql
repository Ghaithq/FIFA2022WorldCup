USE [master]
GO
/****** Object:  Database [FIFAWorldCup]    Script Date: 12/29/2022 4:35:58 AM ******/
CREATE DATABASE [FIFAWorldCup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FIFAWorldCup', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FIFAWorldCup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FIFAWorldCup_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FIFAWorldCup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FIFAWorldCup] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FIFAWorldCup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FIFAWorldCup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET ARITHABORT OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FIFAWorldCup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FIFAWorldCup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FIFAWorldCup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FIFAWorldCup] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET RECOVERY FULL 
GO
ALTER DATABASE [FIFAWorldCup] SET  MULTI_USER 
GO
ALTER DATABASE [FIFAWorldCup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FIFAWorldCup] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FIFAWorldCup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FIFAWorldCup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FIFAWorldCup] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FIFAWorldCup] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FIFAWorldCup', N'ON'
GO
ALTER DATABASE [FIFAWorldCup] SET QUERY_STORE = OFF
GO
USE [FIFAWorldCup]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[M_Name] [nvarchar](30) NULL,
	[M_Cups] [int] NULL,
	[Nationality] [nvarchar](20) NULL,
	[Passport_Id] [int] NOT NULL,
	[Manages] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Passport_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[ID] [int] NOT NULL,
	[team1] [nvarchar](20) NOT NULL,
	[team2] [nvarchar](20) NOT NULL,
	[referee1] [int] NOT NULL,
	[referee2] [int] NOT NULL,
	[stadium] [varchar](100) NOT NULL,
	[stage] [int] NOT NULL,
	[MatchDateTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Match__3214EC27C2B0B034] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match_Transaction]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match_Transaction](
	[ID] [int] NOT NULL,
	[Seat_Row] [int] NOT NULL,
	[Seat_column] [int] NOT NULL,
	[Stadium_Name] [varchar](100) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Ticket_Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Match_Tr__06826BA7FFF308A6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Stadium_Name] ASC,
	[Seat_Row] ASC,
	[Seat_column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[P_Name] [nvarchar](30) NOT NULL,
	[Position] [nvarchar](2) NOT NULL,
	[P_Number] [int] NOT NULL,
	[Plays_For] [nvarchar](20) NOT NULL,
	[numOfYellowCards] [int] NOT NULL,
	[numOfRedCards] [int] NOT NULL,
	[Goals] [int] NOT NULL,
	[Assists] [int] NOT NULL,
 CONSTRAINT [PK__Player__90856F6AF216D74F] PRIMARY KEY CLUSTERED 
(
	[P_Number] ASC,
	[Plays_For] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PREVIOUSMATCHES]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PREVIOUSMATCHES](
	[MatchID] [int] NOT NULL,
	[ScoreA] [int] NOT NULL,
	[ScoreB] [int] NOT NULL,
	[ShotsA] [int] NOT NULL,
	[ShotsB] [int] NOT NULL,
	[YellowsA] [int] NOT NULL,
	[YellowsB] [int] NOT NULL,
	[RedsA] [int] NOT NULL,
	[RedsB] [int] NOT NULL,
	[PassesA] [int] NOT NULL,
	[PassesB] [int] NOT NULL,
	[AccuracyA] [float] NOT NULL,
	[AccuracyB] [float] NOT NULL,
	[PossessionA] [int] NOT NULL,
	[PossessionB] [int] NOT NULL,
	[FoulsA] [int] NOT NULL,
	[FoulsB] [int] NOT NULL,
	[OffSidesA] [int] NOT NULL,
	[OffSidesB] [int] NOT NULL,
	[CornersA] [int] NOT NULL,
	[CornersB] [int] NOT NULL,
	[ShotsOnTargetA] [int] NOT NULL,
	[ShotsOnTargetB] [int] NOT NULL,
 CONSTRAINT [PK__PREVIOUS__4218C837D363D77A] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referee]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referee](
	[ID] [int] NOT NULL,
	[Nationlity] [nvarchar](20) NOT NULL,
	[R_role] [nvarchar](20) NOT NULL,
	[R_Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__Referee__3214EC279DE482C7] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[Seat_Row] [int] NOT NULL,
	[Seat_Column] [int] NOT NULL,
	[StadiumName] [varchar](100) NOT NULL,
	[TicketType] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Seat__99B31C69530ED06F] PRIMARY KEY CLUSTERED 
(
	[Seat_Row] ASC,
	[Seat_Column] ASC,
	[StadiumName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stadium]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadium](
	[StadiumName] [varchar](100) NOT NULL,
	[StadiumCapacity] [int] NOT NULL,
	[StadiumLocation] [varchar](300) NOT NULL,
	[imgURL] [varchar](200) NOT NULL,
 CONSTRAINT [PK__Stadium__A15453D4A63AF73B] PRIMARY KEY CLUSTERED 
(
	[StadiumName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Nationality] [nvarchar](20) NOT NULL,
	[noOfWorldCups] [int] NOT NULL,
	[stage] [int] NOT NULL,
	[T_group] [nvarchar](2) NOT NULL,
	[T_wins] [int] NOT NULL,
	[T_draws] [int] NOT NULL,
	[T_losses] [int] NOT NULL,
	[GF] [int] NOT NULL,
	[GA] [int] NOT NULL,
	[flag] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK__Team__20628292C173D92F] PRIMARY KEY CLUSTERED 
(
	[Nationality] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket_Type]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket_Type](
	[Type] [varchar](50) NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpcomingMatch]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpcomingMatch](
	[ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 12/29/2022 4:35:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[UserName] [varchar](30) NOT NULL,
	[AccountPassword] [varchar](100) NOT NULL,
	[Name] [varchar](30) NULL,
	[Nationality] [varchar](30) NULL,
	[Email] [varchar](300) NULL,
	[PhoneNumber] [varchar](30) NULL,
	[Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (3, N'argentina', N'England', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'27/12/2022')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (5, N'Brazil', N'argentina', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'29/12/2022')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (6, N'Brazil', N'argentina', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'29/12/2022')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (7, N'Brazil', N'argentina', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'29/12/2022')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (9, N'Brazil', N'argentina', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'29/12/2022')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (10, N'Brazil', N'argentina', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'29/12/2022')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (13, N'Brazil', N'argentina', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'29/12/2022')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (22, N'Costa Rica', N'Ghana', 2, 1, N'Stadium 974', 8, N'11/12/2022')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (44, N'Cameroon', N'France', 2, 1, N'Stadium 974', 4, N'04/01/2023')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (89, N'Canada', N'argentina', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'19/01/2023')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (90, N'Ecuaddor', N'Brazil', 2, 1, N'Ahmad Bin Ali Stadium', 2, N'03/02/2023')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (97, N'Brazil', N'argentina', 2, 1, N'Ahmad Bin Ali Stadium', 32, N'01/03/2023')
GO
INSERT [dbo].[Match] ([ID], [team1], [team2], [referee1], [referee2], [stadium], [stage], [MatchDateTime]) VALUES (990, N'Brazil', N'argentina', 2, 1, N'Stadium 974', 32, N'19/04/2023')
GO
INSERT [dbo].[Match_Transaction] ([ID], [Seat_Row], [Seat_column], [Stadium_Name], [UserName], [Ticket_Type]) VALUES (22, 1, 1, N'Stadium 974', N'fares', N'Gold')
GO
INSERT [dbo].[Match_Transaction] ([ID], [Seat_Row], [Seat_column], [Stadium_Name], [UserName], [Ticket_Type]) VALUES (22, 1, 2, N'Stadium 974', N'fares', N'Gold')
GO
INSERT [dbo].[Match_Transaction] ([ID], [Seat_Row], [Seat_column], [Stadium_Name], [UserName], [Ticket_Type]) VALUES (90, 1, 1, N'Stadium 974', N'fares', N'Gold')
GO
INSERT [dbo].[Match_Transaction] ([ID], [Seat_Row], [Seat_column], [Stadium_Name], [UserName], [Ticket_Type]) VALUES (90, 3, 1, N'Stadium 974', N'fares', N'Platinum')
GO
INSERT [dbo].[Match_Transaction] ([ID], [Seat_Row], [Seat_column], [Stadium_Name], [UserName], [Ticket_Type]) VALUES (90, 3, 2, N'Stadium 974', N'fares', N'Platinum')
GO
INSERT [dbo].[Match_Transaction] ([ID], [Seat_Row], [Seat_column], [Stadium_Name], [UserName], [Ticket_Type]) VALUES (990, 1, 1, N'Stadium 974', N'fares', N'Gold')
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Jordan Pickford', N'G', 1, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Hugo Lloris', N'G', 1, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Luke Shaw', N'D', 3, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'John Stones', N'D', 5, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Jules Kounde', N'D', 5, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Rodrigo De Paul', N'M', 7, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Harry Maguire	', N'D', 7, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Marcos Acuna', N'D', 8, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Jordan Henderson', N'M', 8, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Aurelien Tchouameni', N'M', 8, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Julian Alvarez', N'F', 9, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Harry Kane	', N'F', 9, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Lionel Messi', N'F', 10, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Raheem Sterling', N'F', 10, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Kylian Mbappe', N'F', 10, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Angel Di Maria', N'F', 11, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Ousmane Dembele', N'F', 11, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Jack Grealish', N'F', 13, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Adrien Rabiot', N'M', 14, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Jordan Veretout', N'M', 15, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Trent Alexander-Arnold', N'D', 18, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Dayot Upamecano', N'D', 18, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Nicolas Otamendi', N'D', 19, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Alexis Mac Allister', N'M', 20, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Kingsley Coman', N'F', 20, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Paulo Dybala', N'F', 21, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Lautaro Martinez', N'F', 22, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Jude Bellingham', N'M', 22, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Theo Hernandez', N'D', 22, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Emiliano Martinez', N'G', 23, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Enzo Fernandez', N'M', 24, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Ibrahima Konate', N'D', 24, N'France', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'James Maddison', N'M', 25, N'England', 0, 0, 0, 0)
GO
INSERT [dbo].[Player] ([P_Name], [Position], [P_Number], [Plays_For], [numOfYellowCards], [numOfRedCards], [Goals], [Assists]) VALUES (N'Nahuel Molina', N'D', 26, N'Argentina', 0, 0, 0, 0)
GO
INSERT [dbo].[PREVIOUSMATCHES] ([MatchID], [ScoreA], [ScoreB], [ShotsA], [ShotsB], [YellowsA], [YellowsB], [RedsA], [RedsB], [PassesA], [PassesB], [AccuracyA], [AccuracyB], [PossessionA], [PossessionB], [FoulsA], [FoulsB], [OffSidesA], [OffSidesB], [CornersA], [CornersB], [ShotsOnTargetA], [ShotsOnTargetB]) VALUES (3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[PREVIOUSMATCHES] ([MatchID], [ScoreA], [ScoreB], [ShotsA], [ShotsB], [YellowsA], [YellowsB], [RedsA], [RedsB], [PassesA], [PassesB], [AccuracyA], [AccuracyB], [PossessionA], [PossessionB], [FoulsA], [FoulsB], [OffSidesA], [OffSidesB], [CornersA], [CornersB], [ShotsOnTargetA], [ShotsOnTargetB]) VALUES (44, 1, 1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (1, N'South Africa', N'referee', N'Victor Gomes')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (2, N'USA', N'Assistant_Referee', N'ATKINS Kyle')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (3, N'QAT', N'Referee', N'AL JASSIM Abdulrahman')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (4, N'SLV', N'Referee', N'BARTON Ivan')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (5, N'AUS', N'Referee', N'BEATH Chris')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (6, N'BRA', N'Referee', N'CLAUS Raphael')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (7, N'NZL', N'Referee', N'CONGER Matthew')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (8, N'USA', N'Referee', N'NELFATH IsmailULL')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (9, N'GUA', N'Referee', N'ESCOBAR Mario')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (10, N'IRN', N'Referee', N'FAGHANI Alireza')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (11, N'FRA', N'Referee', N'FRAPPART Stephanie')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (12, N'GAM', N'Referee', N'GASSAMA Bakary')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (13, N'ALG', N'Referee', N'GHORBAL Mustapha')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (14, N'ROU', N'Referee', N'KOVACS Istvan')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (15, N'ESP', N'Referee', N'MATEU Antonio')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (16, N'EGY', N'Assistant Referee', N'ABOUELREGAL Mahmoud ')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (17, N'UAE', N'Assistant Referee', N' ALMAHRI Hasan')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (18, N'BRA', N'Assistant Referee', N' BACK Neuza ')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (19, N'ENG', N'Assistant Referee', N' BENNETT Simon')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (20, N'VEN', N'Assistant Referee', N' MORENO Tulio')
GO
INSERT [dbo].[Referee] ([ID], [Nationlity], [R_role], [R_Name]) VALUES (21, N'HON', N'Referee', N'MARTINEZ Said ')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 1, N'Ahmad Bin Ali Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 1, N'Al Bayt Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 1, N'Al Janoub Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 1, N'Al Thumama Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 1, N'Education City Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 1, N'Khalifa International Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 1, N'Lusail Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 1, N'Stadium 974', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 2, N'Ahmad Bin Ali Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 2, N'Al Bayt Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 2, N'Al Janoub Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 2, N'Al Thumama Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 2, N'Education City Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 2, N'Khalifa International Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 2, N'Lusail Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (1, 2, N'Stadium 974', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 1, N'Ahmad Bin Ali Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 1, N'Al Bayt Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 1, N'Al Janoub Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 1, N'Al Thumama Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 1, N'Education City Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 1, N'Khalifa International Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 1, N'Lusail Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 1, N'Stadium 974', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 2, N'Ahmad Bin Ali Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 2, N'Al Bayt Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 2, N'Al Janoub Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 2, N'Al Thumama Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 2, N'Education City Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 2, N'Khalifa International Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 2, N'Lusail Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (2, 2, N'Stadium 974', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 1, N'Ahmad Bin Ali Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 1, N'Al Bayt Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 1, N'Al Janoub Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 1, N'Al Thumama Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 1, N'Education City Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 1, N'Khalifa International Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 1, N'Lusail Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 1, N'Stadium 974', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 2, N'Ahmad Bin Ali Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 2, N'Al Bayt Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 2, N'Al Janoub Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 2, N'Al Thumama Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 2, N'Education City Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 2, N'Khalifa International Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 2, N'Lusail Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (3, 2, N'Stadium 974', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 1, N'Al Bayt Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 1, N'Al Janoub Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 1, N'Education City Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 1, N'Lusail Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 1, N'Stadium 974', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 2, N'Al Bayt Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 2, N'Al Janoub Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 2, N'Education City Stadium', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 2, N'Lusail Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (4, 2, N'Stadium 974', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 1, N'Al Bayt Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 1, N'Al Janoub Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 1, N'Education City Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 1, N'Lusail Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 1, N'Stadium 974', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 2, N'Al Bayt Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 2, N'Al Janoub Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 2, N'Education City Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 2, N'Lusail Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (5, 2, N'Stadium 974', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 1, N'Al Bayt Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 1, N'Al Janoub Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 1, N'Education City Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 1, N'Lusail Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 1, N'Stadium 974', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 2, N'Al Bayt Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 2, N'Al Janoub Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 2, N'Education City Stadium', N'Platinum')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 2, N'Lusail Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (6, 2, N'Stadium 974', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (7, 1, N'Al Bayt Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (7, 1, N'Lusail Stadium', N'Silver')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (7, 1, N'Stadium 974', N'Gold')
GO
INSERT [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName], [TicketType]) VALUES (7, 2, N'Lusail Stadium', N'Silver')
GO
INSERT [dbo].[Stadium] ([StadiumName], [StadiumCapacity], [StadiumLocation], [imgURL]) VALUES (N'Ahmad Bin Ali Stadium', 45032, N'Ar-Rayyan, Qatar', N'/Assets/ahmad-bin-ali-stadium-01.jpg')
GO
INSERT [dbo].[Stadium] ([StadiumName], [StadiumCapacity], [StadiumLocation], [imgURL]) VALUES (N'Al Bayt Stadium', 68895, N'Al Khor, Qatar', N'/Assets/Al_Bayt_Stadium_(2)_(3)webp.jpg')
GO
INSERT [dbo].[Stadium] ([StadiumName], [StadiumCapacity], [StadiumLocation], [imgURL]) VALUES (N'Al Janoub Stadium', 44325, N'Al Wakrah, Qatar', N'/Assets/Al_Janoub_Stadium.jpg')
GO
INSERT [dbo].[Stadium] ([StadiumName], [StadiumCapacity], [StadiumLocation], [imgURL]) VALUES (N'Al Thumama Stadium', 44400, N'Doha, Qatar', N'/Assets/Al_Thumama.jpg')
GO
INSERT [dbo].[Stadium] ([StadiumName], [StadiumCapacity], [StadiumLocation], [imgURL]) VALUES (N'Education City Stadium', 44667, N'Al Rayyan, Qatar', N'/Assets/Education-City-Stadium-Qatar.png')
GO
INSERT [dbo].[Stadium] ([StadiumName], [StadiumCapacity], [StadiumLocation], [imgURL]) VALUES (N'Khalifa International Stadium', 45857, N'Al Rayyan, Qatar', N'/Assets/khalifa_stadium10.jpg')
GO
INSERT [dbo].[Stadium] ([StadiumName], [StadiumCapacity], [StadiumLocation], [imgURL]) VALUES (N'Lusail Stadium', 88966, N'Lusail, Qatar', N'/Assets/Lusail-Stadium-3-scaled.jpg')
GO
INSERT [dbo].[Stadium] ([StadiumName], [StadiumCapacity], [StadiumLocation], [imgURL]) VALUES (N'Stadium 974', 44089, N'Doha, Qatar', N'/Assets/974stadium.jpeg')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'argentina', 2, 32, N'c', 0, 0, 0, 0, 0, N'https://cdn0.iconfinder.com/data/icons/world-flags-1/100/Argentina-2-512.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Australia', 0, 32, N'd', 0, 0, 0, 0, 0, N'https://4.bp.blogspot.com/-sk0VfEc3g34/UJ-E_PT-XdI/AAAAAAAABzk/R--g8G_XOks/s200/au.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Belguim', 0, 32, N'f', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.e566c0ec29a638e39a957a46786e707a?rik=c7Mw4dI5XsFlOw&riu=http%3a%2f%2fwww.holocaustremembrance.com%2fsites%2fdefault%2ffiles%2f2018-01%2fflag_belgium.png&ehk=zF0oUTBaEBKYCqPsRc18XXlFZX3yVzFEaZ0FiCf7ob4%3d&risl=&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Brazil', 5, 32, N'g', 0, 0, 0, 0, 0, N'https://i.pinimg.com/originals/58/e9/71/58e971546523b6139d70402a1b84bab4.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Cameroon', 0, 32, N'g', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.24b8d6a71993428a43c9db982d0fd75a?rik=2dy6QYz%2f6c4%2bww&riu=http%3a%2f%2faddgadgets.com%2fclock%2fflag%2fSenegal.png&ehk=KNYjNORCcdhncd3TEsGf%2bLifwR%2fICn%2bv5Gi73TXsP%2fI%3d&risl=&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Canada', 0, 32, N'f', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.703142f570a345ce2cf5fbb56f5ac134?rik=YFIdgEQzaBTQkQ&riu=http%3a%2f%2fhoster2.onlinebadgemaker.com%2f370470a40eca01be258c8a53e2fa1d9050c8772797d60.png&ehk=f3bFT066ucubHB3OiakeKKc5OI7fsPkpha3dEjVg6LM%3d&risl=&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Costa Rica', 0, 32, N'e', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.92e277e5b842d3092af9a902d5708691?rik=6iZ5rNgob2N2TQ&riu=http%3a%2f%2f4.bp.blogspot.com%2f-sqeNbaEgMl4%2fTgBDxKZ38vI%2fAAAAAAAAM6o%2fZis4nIJ0skI%2fw1200-h630-p-k-no-nu%2fcosta%2brica%2bflag%2bicon.png&ehk=AtlICBMXhwUsz2FjJVPGexpPFRE0sPMhrMWQR1J%2fO8Q%3d&risl=&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Croatia', 0, 32, N'f', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.4c38a069f270ebb9e2d0d6acdeff2d86?rik=I5TC%2f9PoNLiZmA&riu=http%3a%2f%2f4.bp.blogspot.com%2f--_Fb33w0lns%2fTgBES-Dyx5I%2fAAAAAAAAM60%2fCmxeJx49fqc%2fs1600%2fcroatia%2bflag%2bicon.png&ehk=XwhxdnVw3ZOZtVdGOzH%2fezLpvP7cJeQAiqKYhJLcAjg%3d&risl=&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Denmark', 0, 32, N'd', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.504ebbd378fc426d521280fe02f2d086?rik=cuqAMDBU13bYcw&pid=ImgRaw&r=0&sres=1&sresct=1')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Ecuaddor', 0, 32, N'a', 0, 0, 0, 0, 0, N'https://cdn0.iconfinder.com/data/icons/world-flags-1/100/Ecuador-2-512.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'England', 1, 32, N'b', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.7a9d4c10f7ff80c3303e03a361df0b39?rik=9Ng%2fbdtZrTED%2bw&riu=http%3a%2f%2fwww.clipartbest.com%2fcliparts%2f9iz%2fx58%2f9izx58R5T.png&ehk=grccRzdZcQkae1VOy%2b1xI%2fgLDLCmiIaBOIUsVOeZoPI%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'France', 2, 32, N'd', 0, 0, 0, 0, 0, N'https://www.nicepng.com/png/full/190-1909755_france-flag-3d-round-xl-france-flag-icon.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Germany', 4, 32, N'e', 0, 0, 0, 0, 0, N'https://www.pavellefterov.bg/wp-content/themes/pavellefterov/images/flags/germany-flag.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Ghana', 0, 32, N'h', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.13bb2ecb95f48f693764cbb71488184b?rik=%2fg6cEhwuf%2f7eTw&riu=http%3a%2f%2f3.bp.blogspot.com%2f-kHKk4GwV7TU%2fTghaPZ0_ooI%2fAAAAAAAAM_4%2fPGpuaW8uefA%2fw1200-h630-p-k-no-nu%2fghana%2bflag%2bicon.png&ehk=B8uzcaHYcfor1AybZFjwU1NyKQjkgjw2rwZ6B6nm%2f2Y%3d&risl=&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Iran', 0, 32, N'b', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.5c790386df8e90151e7ad5edc238051f?rik=fvPBgQVsFF%2f%2bcA&pid=ImgRaw&r=0&sres=1&sresct=1')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Japan', 0, 32, N'e', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.b40e473a24e84fdc63a29e2133e3b3fe?rik=zF5dEr3%2fws2J0g&riu=http%3a%2f%2fwww.freepngimg.com%2fdownload%2fjapan%2f4-2-japan-flag-png-image.png&ehk=1JFXtn8K%2fz%2bNVDpaQOv%2fteprDScNKenZYxUQ5VoJH5Y%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Mexico', 0, 32, N'c', 0, 0, 0, 0, 0, N'https://www.motosportstravel.com/wp-content/uploads/2021/04/mx.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Morocco', 0, 32, N'f', 0, 0, 0, 0, 0, N'https://cdn3.iconfinder.com/data/icons/flags-of-countries-3/128/Morocco-512.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'NetherLands', 0, 32, N'a', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.dc0f1c441b3c5ce34875a9ac1e260674?rik=7W2NjUCPMAzTUg&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'poland', 0, 32, N'c', 0, 0, 0, 0, 0, N'https://icons.veryicon.com/png/Flag/Rounded%20World%20Flags/Poland%20Flag.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Portugal', 0, 32, N'h', 0, 0, 0, 0, 0, N'https://1.bp.blogspot.com/-prhOyHXj1DA/UlxUkNwmKVI/AAAAAAAAH1Y/Oe3Oyem5X6s/s1600/glossy+round+flag+of+Portugal.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Qatar', 0, 32, N'a', 0, 0, 0, 0, 0, N'https://cdn.countryflags.com/thumbs/qatar/flag-3d-round-250.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Senegal', 0, 32, N'a', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.800e4a84d6b3450f8aaa5038a39d1df4?rik=vQhCXgz48qJ%2bew&riu=http%3a%2f%2fimg.freeflagicons.com%2fthumb%2fround_icon%2fsenegal%2fsenegal_640.png&ehk=ZucQlAcTTtSWqPiVqKbaCmOruCtPGzEqsEzM0ayYFDo%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Serbia', 0, 32, N'g', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.2a04642b890c042c149f02f8e1bed81f?rik=iKFYjivdSC%2bpaw&riu=http%3a%2f%2fimg.freeflagicons.com%2fthumb%2fglossy_round_icon%2fserbia%2fserbia_640.png&ehk=4F487oN7l0fuslRXCSEmW3g%2fPsayNrbUOc1verIoOeo%3d&risl=&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'South koria', 0, 32, N'h', 0, 0, 0, 0, 0, N'https://seascape.zendesk.com/hc/article_attachments/900008898383/iconfinder_kr_53212.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Spain', 1, 32, N'e', 0, 0, 0, 0, 0, N'https://vakantiehuisruil.weebly.com/uploads/6/0/7/9/6079613/9862540.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Suadi arabia', 0, 32, N'c', 0, 0, 0, 0, 0, N'https://www.matildevicenzi.com/wp-content/uploads/2021/05/arabo-1-160x160.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Switzerland', 0, 32, N'g', 0, 0, 0, 0, 0, N'https://i.pinimg.com/originals/ca/83/5f/ca835f7d562584da73eee5d353935982.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Tunisia', 0, 32, N'd', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.d3c01aae65fcf1fb24fc4bbec83d241c?rik=JUPNibxXmDnRxw&pid=ImgRaw&r=0')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Uruguay', 2, 32, N'h', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.271bae0fa1e7d334165821dc848861c2?rik=bFSsSWk4WN0CMQ&riu=http%3a%2f%2fmoon.university%2fwp-content%2fuploads%2f2019%2f12%2furuguay-390x390.png&ehk=3YJEeMvk7wDWBhq3MKYAKIr3VBg72%2bB4ujlpmXRRN5g%3d&risl=&pid=ImgRaw&r=0g')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'USA', 0, 32, N'b', 0, 0, 0, 0, 0, N'https://alpsav.com/wp-content/uploads/2019/08/USA_flag.png')
GO
INSERT [dbo].[Team] ([Nationality], [noOfWorldCups], [stage], [T_group], [T_wins], [T_draws], [T_losses], [GF], [GA], [flag]) VALUES (N'Wales', 0, 32, N'b', 0, 0, 0, 0, 0, N'https://th.bing.com/th/id/R.927384c6024ee49475f531c17491ef7f?rik=GbGFZSqjSA4F%2bw&riu=http%3a%2f%2fimg.freeflagicons.com%2fthumb%2fround_icon%2fwales%2fwales_640.png&ehk=cupSqPFXYISxxxXbHoCYGR9huRrLPq8YmenaL1uH5Jo%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1')
GO
INSERT [dbo].[Ticket_Type] ([Type], [Price]) VALUES (N'Gold', 150)
GO
INSERT [dbo].[Ticket_Type] ([Type], [Price]) VALUES (N'Platinum', 200)
GO
INSERT [dbo].[Ticket_Type] ([Type], [Price]) VALUES (N'Silver', 100)
GO
INSERT [dbo].[UpcomingMatch] ([ID]) VALUES (22)
GO
INSERT [dbo].[UpcomingMatch] ([ID]) VALUES (89)
GO
INSERT [dbo].[UpcomingMatch] ([ID]) VALUES (90)
GO
INSERT [dbo].[UpcomingMatch] ([ID]) VALUES (97)
GO
INSERT [dbo].[UpcomingMatch] ([ID]) VALUES (990)
GO
INSERT [dbo].[UserAccount] ([UserName], [AccountPassword], [Name], [Nationality], [Email], [PhoneNumber], [Type]) VALUES (N'123456', N'123456', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[UserAccount] ([UserName], [AccountPassword], [Name], [Nationality], [Email], [PhoneNumber], [Type]) VALUES (N'4567', N'123456', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[UserAccount] ([UserName], [AccountPassword], [Name], [Nationality], [Email], [PhoneNumber], [Type]) VALUES (N'fares', N'123456', N'ldfjnvskjdb l', N'France', N'Muhammed@gmail.com', N'3924728437', 2)
GO
/****** Object:  Index [UQ__PREVIOUS__4218C8365241E301]    Script Date: 12/29/2022 4:35:58 AM ******/
ALTER TABLE [dbo].[PREVIOUSMATCHES] ADD  CONSTRAINT [UQ__PREVIOUS__4218C8365241E301] UNIQUE NONCLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK__Manager__Manages__300424B4] FOREIGN KEY([Manages])
REFERENCES [dbo].[Team] ([Nationality])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK__Manager__Manages__300424B4]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK__Match__referee1__5165187F] FOREIGN KEY([referee1])
REFERENCES [dbo].[Referee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK__Match__referee1__5165187F]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK__Match__referee2__52593CB8] FOREIGN KEY([referee2])
REFERENCES [dbo].[Referee] ([ID])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK__Match__referee2__52593CB8]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK__Match__stadium__534D60F1] FOREIGN KEY([stadium])
REFERENCES [dbo].[Stadium] ([StadiumName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK__Match__stadium__534D60F1]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK__Match__team1__5441852A] FOREIGN KEY([team1])
REFERENCES [dbo].[Team] ([Nationality])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK__Match__team1__5441852A]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK__Match__team2__5535A963] FOREIGN KEY([team2])
REFERENCES [dbo].[Team] ([Nationality])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK__Match__team2__5535A963]
GO
ALTER TABLE [dbo].[Match_Transaction]  WITH CHECK ADD  CONSTRAINT [FK__Match_Tra__Ticke__71D1E811] FOREIGN KEY([Ticket_Type])
REFERENCES [dbo].[Ticket_Type] ([Type])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match_Transaction] CHECK CONSTRAINT [FK__Match_Tra__Ticke__71D1E811]
GO
ALTER TABLE [dbo].[Match_Transaction]  WITH CHECK ADD  CONSTRAINT [FK__Match_Tra__UserN__70DDC3D8] FOREIGN KEY([UserName])
REFERENCES [dbo].[UserAccount] ([UserName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match_Transaction] CHECK CONSTRAINT [FK__Match_Tra__UserN__70DDC3D8]
GO
ALTER TABLE [dbo].[Match_Transaction]  WITH CHECK ADD  CONSTRAINT [FK__Match_Transa__ID__6FE99F9F] FOREIGN KEY([ID])
REFERENCES [dbo].[Match] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match_Transaction] CHECK CONSTRAINT [FK__Match_Transa__ID__6FE99F9F]
GO
ALTER TABLE [dbo].[Match_Transaction]  WITH CHECK ADD  CONSTRAINT [FK__Match_Transactio__6EF57B66] FOREIGN KEY([Seat_Row], [Seat_column], [Stadium_Name])
REFERENCES [dbo].[Seat] ([Seat_Row], [Seat_Column], [StadiumName])
GO
ALTER TABLE [dbo].[Match_Transaction] CHECK CONSTRAINT [FK__Match_Transactio__6EF57B66]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK__Player__Plays_Fo__30F848ED] FOREIGN KEY([Plays_For])
REFERENCES [dbo].[Team] ([Nationality])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK__Player__Plays_Fo__30F848ED]
GO
ALTER TABLE [dbo].[PREVIOUSMATCHES]  WITH CHECK ADD  CONSTRAINT [FK_PREVIOUSMATCHES_Match] FOREIGN KEY([MatchID])
REFERENCES [dbo].[Match] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PREVIOUSMATCHES] CHECK CONSTRAINT [FK_PREVIOUSMATCHES_Match]
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FK__Seat__StadiumNam__6C190EBB] FOREIGN KEY([StadiumName])
REFERENCES [dbo].[Stadium] ([StadiumName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FK__Seat__StadiumNam__6C190EBB]
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FK__Seat__TicketType__75A278F5] FOREIGN KEY([TicketType])
REFERENCES [dbo].[Ticket_Type] ([Type])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FK__Seat__TicketType__75A278F5]
GO
ALTER TABLE [dbo].[UpcomingMatch]  WITH CHECK ADD  CONSTRAINT [FK__UpcomingMatc__ID__5812160E] FOREIGN KEY([ID])
REFERENCES [dbo].[Match] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UpcomingMatch] CHECK CONSTRAINT [FK__UpcomingMatc__ID__5812160E]
GO
USE [master]
GO
ALTER DATABASE [FIFAWorldCup] SET  READ_WRITE 
GO
