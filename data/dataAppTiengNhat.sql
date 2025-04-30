USE [master]
GO
/****** Object:  Database [Japanese]    Script Date: 4/30/2025 6:22:46 PM ******/
CREATE DATABASE [Japanese]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Japanese', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Japanese.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Japanese_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Japanese_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Japanese] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Japanese].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Japanese] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Japanese] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Japanese] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Japanese] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Japanese] SET ARITHABORT OFF 
GO
ALTER DATABASE [Japanese] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Japanese] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Japanese] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Japanese] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Japanese] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Japanese] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Japanese] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Japanese] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Japanese] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Japanese] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Japanese] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Japanese] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Japanese] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Japanese] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Japanese] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Japanese] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Japanese] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Japanese] SET RECOVERY FULL 
GO
ALTER DATABASE [Japanese] SET  MULTI_USER 
GO
ALTER DATABASE [Japanese] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Japanese] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Japanese] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Japanese] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Japanese] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Japanese] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Japanese', N'ON'
GO
ALTER DATABASE [Japanese] SET QUERY_STORE = OFF
GO
USE [Japanese]
GO
/****** Object:  Table [dbo].[kanji]    Script Date: 4/30/2025 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kanji](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[character] [nvarchar](255) NULL,
	[hiragana] [nvarchar](255) NULL,
	[meaning] [nvarchar](255) NULL,
	[lesson_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lessons]    Script Date: 4/30/2025 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lessons](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[lesson_name] [nvarchar](255) NOT NULL,
	[lesson_number] [int] NOT NULL,
	[level_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[levels]    Script Date: 4/30/2025 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[levels](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vocabulary]    Script Date: 4/30/2025 6:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vocabulary](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[correct_count] [int] NULL,
	[image_path] [varchar](255) NULL,
	[meaning] [nvarchar](255) NULL,
	[romanji] [varchar](255) NULL,
	[word] [nvarchar](255) NULL,
	[lesson_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[kanji] ON 
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (3, N'試験', N'しけん', N'Kì thi', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (4, N'試合', N'しあい', N'Trận đấu', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (5, N'経験', N'けいけん', N'Kinh nghiệm', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (6, N'映画', N'えいが', N'Phim ảnh', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (7, N'映画館', N'えいがかん', N'Rạp phim', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (8, N'計画', N'けいかく', N'kế hoạch', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (9, N'宿題', N'しゅくだい', N'Bài Tập', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10, N'問題', N'もんだい', N'Bài ( Nói chung )', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (11, N'手紙', N'てがみ', N'Bức thư', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (12, N'紙', N'かみ', N'Giấy', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (13, N'英語', N'えいご', N'Tiếng anh', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (14, N'日本語', N'にほんご', N'Tiếng nhật', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (15, N'何語', N'なにご', N'Tiếng nước nào', 2)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10002, N'毎朝', N'まいあさ', N'Mỗi sáng', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10003, N'毎晩', N'まいばん', N'Mỗi Tối', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10004, N'毎日', N'まいにち', N'Mỗi ngày', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10005, N'毎週', N'まいしゅう', N'Mỗi tuần', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10006, N'毎月', N'まいつき', N'Mỗi tháng', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10007, N'朝', N'あさ', N'Buổi sáng', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10008, N'朝ごはん', N'あさごはん', N'Bữa sáng', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10009, N'早朝', N'そうちょう', N'Dậy sớm', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10010, N'昼', N'ひる', N'Buổi trưa', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10011, N'昼休み', N'ひるやすみ', N'Nghỉ trưa', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10012, N'昼ご飯', N'ひるごはん', N'Bữa trưa', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10013, N'昼食', N'ちゅうしょく', N'Bữa trưa(trang trọng hơn)', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10014, N'朝食', N'ちょうしょく', N'Bữa sáng(trang trọng hơn)', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10015, N'昼間', N'ひるま', N'Ban ngày', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10016, N'晩ご飯', N'ばんごはん', N'Bữa tối', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10017, N'夜', N'よる', N'Ban đêm', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10018, N'今夜', N'こんや', N'Đêm nay', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10019, N'夜行バス', N'やこうばす', N'Xe buýt đêm', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10020, N'午前', N'ごぜん', N'sáng (trước 12h trưa)', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10021, N'午後', N'ごご', N'chiều ( sau 12h trưa )', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10022, N'お名前', N'おなまえ', N'Họ tên', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10023, N'前', N'まえ', N'Phía trước', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10024, N'駅前', N'えきまえ', N'trước nhà ga', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10025, N'後で', N'あとで', N'Sau khi', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10026, N'後ろ', N'うしろ', N'Đằng sau', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10027, N'先週', N'せんしゅう', N'Tuần trước', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10028, N'今週', N'こんしゅう', N'Tuần này', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10029, N'来週', N'らいしゅう', N'Tuần sau', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10030, N'週末', N'しゅうまつ', N'Cuối tuần', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10031, N'毎週', N'まいしゅう', N'Hàng tuần', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10032, N'再来週', N'さらいしゅう', N'tuần sau nữa', 10002)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10033, N'お待ちください', N'おまちください', N'Xin chờ 1 chút', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10034, N'待ちます', N'まちます', N'Chờ Đợi', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10035, N'お待たせしました', N'おまたせしました', N'Xin lỗi vì đã để đợi lâu', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10036, N'開けます', N'あけます', N'Mở (hành động mở)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10037, N'（を）開きます', N'（を）ひらきます', N'Mở (Lớp, trung tâm)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10038, N'（が）開きます', N'（が）あきます', N'Mở ( tự động từ)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10039, N'開発します', N'かいはつします', N'Phát triển', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10040, N'閉めます', N'しめます', N'Đóng', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10041, N'閉まります', N'しまります', N'Đóng ( Tự động từ)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10042, N'閉じます', N'とじます', N'Nhắm (mắt)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10043, N'持ちます', N'もちます', N'Mang , cầm , nâng', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10044, N'持っていきます', N'もっていきます', N'Mang đi', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10045, N'持ってきます', N'もってきます', N'Mang đến', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10046, N'気持ち', N'きもち', N'Cảm xúc , Sung sướng', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10047, N'使う', N'つかう', N'Sử dụng', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10048, N'使用禁止', N'しようきんし', N'Cấm sử dụng', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10049, N'立ち入り禁止', N'たちいりきんし', N'Cấm vào', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10050, N'使用中', N'しようちゅう', N'Đang sử dụng', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10051, N'止めます', N'とめます', N'Dừng', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10052, N'止まります', N'とまります', N'Dừng(Tự động từ)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10053, N'中止', N'ちゅうし', N'Hoãn lại', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10054, N'住む', N'すむ', N'Sống', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10055, N'住所', N'じゅうしょ', N'Địa chỉ', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10056, N'乗り場', N'のりば', N'Điểm lên xe', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10057, N'乗ります', N'のります', N'Lên (xe)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10058, N'乗り換えます', N'のりかえます', N'Chuyển tàu', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10059, N'乗車します', N'じょうしゃします', N'Lên (xe, tàu, mang ý nghĩa trang trọng hơn 乗ります) ', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10060, N'（雨が）降ります宇', N'ふります', N'(mưa) rơi', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10061, N'降ります', N'おります', N'Xuống ( xe, tàu )', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10062, N'（金を）降ろします', N'おろします', N'Rút (tiền)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (10063, N'乗降します', N'じょうこうします', N'Lên xuống (xe)', 1)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20033, N'私', N'わたし', N'Tôi', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20034, N'私立', N'しりつ', N'Tự lập', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20035, N'夫', N'おっと', N'Chồng', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20036, N'夫妻', N'ふさい', N'Vợ chồng', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20037, N'夫婦', N'ふうふ', N'Vợ chồng(ít trang trọng hơn）', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20038, N'丈夫', N'じょうぶ', N'Dẻo dai', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20039, N'大丈夫', N'だいじょうぶ', N'Ổn', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20040, N'主な', N'おもな', N'Chủ yếu', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20041, N'ご主人', N'ごしゅじん', N'Chổng người khác', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20042, N'主人公', N'しゅじんこ', N'Nhân vật chính', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20043, N'奥さん', N'おくさん', N'Vợ người ta', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20044, N'妻', N'つま', N'Vợ (mình)', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20045, N'兄', N'あに', N'Anh trai', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20046, N'兄弟', N'きょうだい', N'Anh em', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20047, N'弟', N'おとうと', N'Em trai', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20048, N'姉', N'あね', N'Chị gái', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20049, N'お姉さん', N'おねえさん', N'chị gái', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20050, N'妹', N'いもうと', N'Em gái', 10003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (20051, N'姉妹', N'しまい', N'Chị em', 10003)
GO
SET IDENTITY_INSERT [dbo].[kanji] OFF
GO
SET IDENTITY_INSERT [dbo].[lessons] ON 
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (1, N'Khuyên Nhủ', 32, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (2, N'Dự Định', 31, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (10002, N'Tự động từ và tha động từ', 30, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (10003, N'Im Đê ...', 33, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (10004, N'Làm theo thầy nói', 34, 1)
GO
SET IDENTITY_INSERT [dbo].[lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[levels] ON 
GO
INSERT [dbo].[levels] ([id], [name]) VALUES (1, N'N4')
GO
INSERT [dbo].[levels] ([id], [name]) VALUES (2, N'N5')
GO
SET IDENTITY_INSERT [dbo].[levels] OFF
GO
SET IDENTITY_INSERT [dbo].[vocabulary] ON 
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (1, 5, NULL, N'Vận Động', N'', N'うんどうします', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (2, 6, NULL, N'Thành công', N'', N'せいこうします', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (3, 6, NULL, N'Thất Bại, Trượt (kì thi)', N'', N'失敗します（しっぱい）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (4, 4, NULL, N'Tạnh (Mưa)', N'', N'やみます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (6, 4, NULL, N'Có mây(âm u)', N'', N'くもります', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (7, 6, NULL, N'Nắng đẹp, quang đãng', N'', N'はれます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (8, 2, NULL, N'Kéo dài (sốt)', N'', N'つづきます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (9, 5, NULL, N'Bị cảm', N'', N'ひきます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (10, 3, NULL, N'làm mát, làm lạnh', N'', N'ひやします', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (11, 5, NULL, N'Đông đúc (Đường)', N'', N'こみます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (12, 4, NULL, N'Vắng ( Đường )', N'', N'すきます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (13, 6, NULL, N'Trúng (Xổ số)', N'', N'あたります', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (14, 6, NULL, N'Tham gia(trận đấu)', N'', N'でます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (15, 6, NULL, N'Gắng sức', N'', N'むりをします', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (16, 6, NULL, N'làm việc quá sức', N'', N'はたらきすぎ', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (17, 6, NULL, N'Đủ', N'', N'十分（じゅうぶん）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (18, 6, NULL, N'Lạ, thú vị', N'', N'おかしい', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (19, 7, NULL, N'Ồn ào', N'', N'うるさい', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (20, 5, NULL, N'Bác Sĩ', N'', N'先生（せんせい）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (21, 5, NULL, N'( bị ) Bỏng', N'', N'やけど（をします）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (22, 6, NULL, N'( Bị ) Thương', N'', N'けが（をします）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (23, 6, NULL, N'Ho', N'', N'せき（をします）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (24, 6, NULL, N'(Bị) Ho', N'', N'せき（がでます）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (25, 5, NULL, N'Mắt trời', N'', N'たいよう', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (26, 6, NULL, N'Hòn đá', N'', N'石（いし）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (27, 6, NULL, N'Sao', N'', N'ほし', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (28, 6, NULL, N'Gió', N'', N'かぜ', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (29, 5, NULL, N'Hướng đông', N'', N'東（ひがし）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (30, 6, NULL, N'Hướng Tây', N'', N'西（にし）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (31, 2, NULL, N'Hướng Nam', N'', N'南（みなみ）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (32, 3, NULL, N'Hướng Bắc', N'', N'北', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (33, 5, NULL, N'Quốc Tế', N'', N'こくさい', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (34, 5, NULL, N'Nước Máy', N'', N'すいどう', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (35, 5, NULL, N'Động cơ', N'', N' エンジン', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (36, 7, NULL, N'Đội', N'', N'チーム', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (37, 6, NULL, N'Chiều Tối', N'', N'夕方（ゆうがた）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (38, 5, NULL, N'Tối hôm trước', N'', N'昨夜（ゆうべ）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (39, 5, NULL, N'Muộn', N'', N'おそぐ', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (40, 6, NULL, N'Nhanh', N'', N'早く（はやく）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (41, 7, NULL, N'Như thế này', N'', N'こんなに', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (42, 5, NULL, N'Như thế đó', N'', N'そんなに', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (43, 5, NULL, N'như thế kia', N'', N'あんなに', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (44, 5, NULL, N'Khỏe', N'', N'元気', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (45, 5, NULL, N'Dạ dày', N'', N'胃（い）', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (46, 5, NULL, N'Căng thẳng', N'', N'ストレス', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (47, 6, NULL, N'Chiêm tinh, Bói sao', N'', N'ほしうらない', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (48, 7, NULL, N'Tình trạng cơ thể', N'', N'たいちょう', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (49, 7, NULL, N'Tắc đường', N'', N'じゅうたい', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (50, 6, NULL, N'Sức khỏe', N'', N'げんこう', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (51, 6, NULL, N'Tình yêu', N'', N'れんあい', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (52, 5, NULL, N'Vật phẩm may mắn', N'', N'ラッキーアイテム', 1)
GO
SET IDENTITY_INSERT [dbo].[vocabulary] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKe1ejnmsswocdocld1t1iwsvr5]    Script Date: 4/30/2025 6:22:46 PM ******/
ALTER TABLE [dbo].[levels] ADD  CONSTRAINT [UKe1ejnmsswocdocld1t1iwsvr5] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[kanji]  WITH CHECK ADD  CONSTRAINT [FKsbm44tmdbr8bpfvcih7v3sirp] FOREIGN KEY([lesson_id])
REFERENCES [dbo].[lessons] ([id])
GO
ALTER TABLE [dbo].[kanji] CHECK CONSTRAINT [FKsbm44tmdbr8bpfvcih7v3sirp]
GO
ALTER TABLE [dbo].[lessons]  WITH CHECK ADD  CONSTRAINT [FKrr6i6ldwiuog290ut6xhgeq8o] FOREIGN KEY([level_id])
REFERENCES [dbo].[levels] ([id])
GO
ALTER TABLE [dbo].[lessons] CHECK CONSTRAINT [FKrr6i6ldwiuog290ut6xhgeq8o]
GO
ALTER TABLE [dbo].[vocabulary]  WITH CHECK ADD  CONSTRAINT [FKcv8tq14t2w43dv9b2sdi9lrh0] FOREIGN KEY([lesson_id])
REFERENCES [dbo].[lessons] ([id])
GO
ALTER TABLE [dbo].[vocabulary] CHECK CONSTRAINT [FKcv8tq14t2w43dv9b2sdi9lrh0]
GO
USE [master]
GO
ALTER DATABASE [Japanese] SET  READ_WRITE 
GO
