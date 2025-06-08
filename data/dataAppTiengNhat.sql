USE [master]
GO
/****** Object:  Database [Japanese]    Script Date: 6/8/2025 5:33:56 PM ******/
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
/****** Object:  Table [dbo].[kanji]    Script Date: 6/8/2025 5:33:56 PM ******/
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
/****** Object:  Table [dbo].[lessons]    Script Date: 6/8/2025 5:33:56 PM ******/
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
/****** Object:  Table [dbo].[levels]    Script Date: 6/8/2025 5:33:56 PM ******/
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
/****** Object:  Table [dbo].[vocabulary]    Script Date: 6/8/2025 5:33:56 PM ******/
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
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30033, N'春', N'はる', N'Mùa xuân', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30034, N'夏', N'なつ', N'Mùa hè', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30035, N'秋', N'あき', N'Mùa thu', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30036, N'冬', N'ふゆ', N'Mùa đông', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30037, N'春夏秋冬', N'しゅんかしゅうとう', N' Xuân hạ thu đông', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30038, N'雪', N'ゆき', N'Tuyết', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30039, N'海', N'うみ', N'Biển', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30040, N'天気', N'てんき', N'Thời tiết', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30041, N'天才', N'てんさい', N'thiên tài', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30042, N' 天気予報', N'てんきよほ', N'Dự báo thời tiết', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30043, N'空', N'そら', N'Bầu trời', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30044, N'空港', N'くうこう', N'Sân bay', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30045, N'空気', N'くうき', N'Không khí', 10004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30046, N'暑い', N'あつい', N'Nóng', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30047, N'寒い', N'さむい', N'Lạnh', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30048, N'早い', N'はやい', N'Sớm', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30049, N'速い', N'はやい', N'Nhanh', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30050, N'速度', N'そくど', N'Tốc độ', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30051, N'早速', N'さっそく', N'Ngay lập tức', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30052, N'重い', N'おもい', N'Nặng', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30053, N'重さ', N'おもさ', N'Trọng lượng', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30054, N'体重', N'たいじゅう', N'Cân nặng (cho người)', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30055, N'軽い', N'かるい', N'Nhẹ', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30056, N'近く', N'ちかく', N'Gần', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30057, N'近い', N'ちかい', N'Gần', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30058, N'最近', N'さいきん', N'Gần đây', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30059, N'近所', N'きんじょ', N'Hàng xóm', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30060, N'遠い', N'とおい', N'Xa', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (30061, N'遠足', N'えんそく', N'Đi chơi, dã ngoại', 20003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40033, N'質問します', N'しつもんします', N'Hỏi', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40034, N'問題', N'もんだい', N'Bài', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40035, N'答える', N'こたえる', N'Trả lời', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40036, N'答え', N'こたえ', N'Câu trả lời', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40037, N'回答', N'かいとう', N'Câu trả lời( đáp án)', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40038, N'作文', N'さくぶん', N'Bài văn', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40039, N'作ります', N'つくります', N'Làm, Nấu', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40040, N'思い出します', N'おもいだします', N'Nhớ lại', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40041, N'思います', N'おもいます', N'Nghĩ', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40042, N'不思議', N'ふしぎ（な）', N'Kì lạ', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40043, N'始まります', N'はじまります', N'Bắt đầu( tự động từ )', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40044, N'始めます', N'はじめます', N'Bắt đầu', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40045, N'上着', N'うわぎ', N'áo khoác', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40046, N'下着', N'したぎ', N'áo lót', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40047, N'着物', N'きもの', N'kimono', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40048, N'着ます', N'きます', N'Mặc (áo, váy)', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40049, N'着きます', N'つきます', N'Đến nơi, tới', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40050, N'はきます', N'はきます', N'Mặc (quần,tất,dép,giày)', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40051, N'集めます', N'あつめます', N'sưu tập', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40052, N'集まります', N'あつまります', N'Tập hợp', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40053, N'集合します', N'しゅうごうします', N'Tập hợp( tự động từ)', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40054, N'集中します', N'しゅうちゅうします', N'Tập trung', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40055, N'練習', N'れんしゅう', N'Luyện tập', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40056, N'練習します', N'れんしゅうします', N'luyện tập ( hành động)', 30003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40057, N'晴れます', N'はれます', N'Nắng', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40058, N'晴れ', N'はれ', N'Nắng', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40059, N'晴天', N'せいてん', N'Trời nắng', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40060, N'星', N'ほし', N'Ngôi sao', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40061, N'星占い', N'ほしうらない', N'Bói sao', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40062, N'風', N'かぜ', N'Gió', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40063, N'台風', N'たいふう', N'Bão', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40064, N'全然', N'ぜんぜん', N'Hoàn toàn', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40065, N'自然', N'しぜん', N'Tự nhiên', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40066, N'天然', N'てんねん', N'Thiên nhiên', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40067, N'油', N'あぶら', N'Dầu ăn', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40069, N'原料', N'げんりょう', N'Nguyên liệu', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40070, N'原因', N'げんいん', N'Nguyên nhân', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40071, N'お皿', N'おさら', N'Cái đĩa', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40072, N'発表', N'はっぴょう', N'Phát biểu', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40073, N'発明します', N'はつめいします', N'phát minh', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40074, N'発見します', N'はっけんします', N'Phát hiện', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40075, N'出発します', N'しゅっぱつします', N'Khởi hành', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40076, N'発表会', N'はっぴょうかい', N'Bài thuyết trình', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40077, N'発音', N'はつおん', N'Phát âm', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (40078, N'開発します', N'かいはつします', N'Phát triển', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50033, N'会います', N'あいます', N'Gặp gỡ', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50034, N'会議室', N'かいぎしつ', N'Phòng họp', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50035, N'運動会', N'うんどうかい', N'Hội thi thể thao', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50036, N'国会議事堂', N'こっかいぎじどう', N'Tòa nhà Quốc hội', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50037, N'教会', N'きょうかい', N'Nhà thờ', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50038, N'都会', N'とかい', N'Thành phố', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50039, N'機会', N'きかい', N'Cơ hội', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50040, N'会場', N'かいじょう', N'Địa điểm', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50041, N'社会', N'しゃかい', N'Xã hội', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50042, N'二次会', N'にじかい', N'Tăng 2 ( sau khi tiệc chính kết thúc )', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50044, N'動きます', N'うごきます', N'Di chuyển ( tự ĐT)', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50045, N'動かします', N'うごかします', N'Di chuyển ( tha ĐT )', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50046, N'自動販売機', N'じどうはんばいき', N'Máy bán hàng tự động', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50047, N'動物', N'どうぶつ', N'Động vật', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50048, N'自動車', N'じどうしゃ', N'Ô tô', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50049, N'運動会', N'うんどうかい', N'Hội thi thể thao', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50050, N'動物園', N'どうぶつえん', N'sở thú', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50051, N'運動します', N'うんどうします', N'Vận động', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50052, N'歩きます', N'あるきます', N'Đi bộ', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50053, N'(公園を）散歩します', N'（こうえんを）さんぽします', N'Đi dạo（công viên)', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50054, N'急ぐ（急ぎます）', N'いそぐ（いそぎます）', N'Vội vàng', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50055, N'救急車', N'きゅうきゅうしゃ', N'Xe cứu thương', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50056, N'急行', N'きゅうこう', N'Tàu tốc hành', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50057, N'特急', N'とっきゅう', N'Tàu tốc hành siêu tốc', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50058, N'切ります', N'きります', N'Cắt (tha ĐT)', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50059, N'切符', N'きっぷ', N'Vé ( tàu, xe)', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50060, N'切手', N'きって', N'Con tem', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50061, N'締切', N'しめきり', N'Hạn chót ( deadline )', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50062, N'切れます', N'きれます', N' Bị cắt( tự động từ)', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50063, N'大切（な）', N'たいせつ（な）', N'Quan trọng', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50064, N'親切（な）', N'しんせつ（な）', N'Tốt bụng', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50065, N'送ります。', N'おくります', N'Gửi', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50066, N'習います', N'ならいます', N'Học (= với Learn)', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50067, N'練習', N'れんしゅう', N'Luyện tập', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50068, N'予習します', N'よしゅうします', N'Chuẩn bị', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50069, N'復習します', N'ふくしゅうします', N'Ôn tập', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50070, N'習慣', N'しゅうかん', N'Thói quen, tập quán', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50071, N'習字', N'しゅうじ', N'Luyện chữ', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50072, N'歌', N'うた', N'Bài hát', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50073, N'歌う', N'うたう', N'Hát', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50074, N'歌舞伎', N'かぶき', N'Kịch kabuki', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50075, N'歌手', N'かしゅ', N'Ca sĩ', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50076, N'終わります', N'おわります', N'Kết thúc', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50077, N'終わり', N'おわり', N'Phần kết thúc, phần cuối', 40003)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50078, N'会社員', N'かいしゃいん', N'Nhân viên công ty', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50079, N'社員', N'しゃいん', N'Nhân viên công ty ( cụ thể )', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50080, N'会社', N'かいしゃ', N'Công ty', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50081, N'神社', N'じんじゃ', N'Đền thờ thần đạo', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50082, N'本社', N'ほんしゃ', N'Trụ sở chính', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50083, N'旅行社', N'りょこうしゃ', N'Công ty du lịch', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50084, N'社会', N'しゃかい', N'Xã hội', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50086, N'銀行員', N'ぎんこういん', N'Nhân viên ngân hàng', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50087, N'銀行', N'ぎんこう', N'Ngân hàng', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50088, N'医者', N'いしゃ', N'Bác Sĩ', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50089, N'歯医者', N'はいしゃ', N'Bác sĩ nha khoa', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50090, N'医学', N'いがく', N'y học', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50091, N'病院', N'びょういん', N'Bệnh viện', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50092, N'病気', N'びょうき', N'Bị bệnh', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50093, N'美容院', N'びよういん', N'tiệm làm đẹp, thẩm mỹ viện、salon tóc.', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50094, N'大学院', N'だいがくいん', N'Cao học', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50095, N'入院します', N'にゅういんします', N'Nhập viện', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50096, N'退院します', N'たいいんします', N'Xuất viện', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50097, N'お国', N'おくに', N'Nước ngoài', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50098, N'韓国', N'かんこく', N'Hàn quốc', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50099, N'中国', N'ちゅうごく', N'Trung quốc', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50100, N'外国', N'がいこく', N'Nước ngoài', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50101, N'国会議事堂', N'こっかいぎじどう', N'Toà nhà quốc hội', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50102, N'国際', N'こくさい', N'Quốc tế', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50103, N'国連', N'こくれん', N'Liên hợp quốc', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50104, N'世話', N'せわ', N'Chăm sóc', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50105, N'世界', N'せかい', N'Thế giới', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50106, N'世紀', N'せいき', N'Thế kỉ', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50107, N'世界中', N'せかいじゅう', N'Toàn thế giới', 40004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50108, N'教えます', N'おしえます', N'dạy, chỉ bảo', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50109, N'教師', N'きょうし', N'Giáo viên', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50110, N'教室', N'きょうしつ', N'Lớp học', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50111, N'教会', N'きょうかい', N'Nhà thờ', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50112, N'教育', N'きょういく', N'Giáo dục', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50113, N'研究者', N'けんきゅうしゃ', N'Nhà nghiên cứu', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50114, N'研究室', N'けんきゅうしつ', N'Phòng nghiên cứu', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50115, N'研究します', N'けんきゅうします', N'Nghiên cứu', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50116, N'売り場', N'うりば', N'Quầy hàng', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50117, N'売ります', N'うります', N'Bán hàng', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50118, N'売れます', N'うれます', N'Bán chạy, bán tốt', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50119, N'自動販売機', N'じどうはんばいき', N'Máy bán hàng tự động', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50120, N'働きます', N'はたらきます', N'Làm việc', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50121, N'働きすぎ', N'はたらきすぎ', N'làm việc quá sức', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50122, N'勉強します', N'べんきょうします', N'Học ( = với study )', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50123, N'強い', N'つよい', N'Mạnh mẽ, bền bỉ', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50124, N'泳ぎます', N'およぎます', N'Bơi', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50125, N'水泳', N'すいえい', N'Bơi lội', 40005)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50126, N'部屋', N'へや', N'Căn phòng', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50127, N'全部', N'ぜんぶ', N'Toàn bộ', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50128, N'部長', N'ぶちょう', N'Trưởng phòng', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50129, N'屋上', N'おくじょう', N'Tầng thượng', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50130, N'教室', N'きょうしつ', N'Phòng học', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50131, N'会議室', N'かいぎしつ', N'Phòng họp', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50132, N'和室', N'わしつ', N'Phòng kiểu nhật', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50133, N'研究室', N'けんきゅうしつ', N'Phòng nghiên cứu', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50134, N'売り場', N'うりば', N'Quầy hàng', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50135, N'乗り場', N'のりば', N'Điểm lên xe', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50136, N'場所', N'ばしょ', N'Địa điểm', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50137, N'駐車場', N'ちゅうしゃじょう', N'Bãi đỗ xe', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50138, N'スキー場', N'すきーじょう', N'Bãi trượt tuyết', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50139, N'会場', N'かいじょう', N'Hội trường', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50140, N'所', N'ところ', N'Địa điểm', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50141, N'台所', N'だいどころ', N'Bếp ăn', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50142, N'元の所', N'もとのところ', N'Chỗ cũ', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50143, N'事務所', N'じむしょ', N'Văn phòng', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50144, N'住所', N'じゅうしょ', N'Địa chỉ', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50145, N'市役所', N'しやくしょ', N'Tòa thị chính', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50146, N'近所', N'きんじょ', N'Hàng xóm', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50147, N'図書館', N'としょかん', N'Thư viện', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50148, N'地図', N'ちず', N'Bản đồ', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50149, N'図', N'ず', N' Sơ đồ', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50150, N'美術館', N'びじゅつかん', N'Bảo tàng', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50151, N'家', N'いえ、うち', N'Nhà', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50152, N'家賃', N'やちん', N'Tiền nhà', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50153, N'家内', N'かない', N'Vợ mình', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50154, N'家族', N'かぞく', N'Gia đình', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50155, N'家具', N'かぐ', N'Đồ nội thất', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50156, N'音楽家', N'おんがくか', N'Nhạc sĩ', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50157, N'小説家', N'しょせつか', N'Tiểu thuyết gia', 40006)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50158, N'郵便局', N'ゆうびんきょく', N'Bưu điện', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50159, N'便利', N'べんり', N'Tiện lợi', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50160, N'不便（な）', N'ふべん', N'Bất tiện', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50161, N'不思議（な）', N'ふしぎ（な）', N'Kì lạ', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50162, N'静か（な）', N'しずか（な）', N'Yên tĩnh', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50163, N'同じ', N'おなじ', N'Giống', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50164, N'同時', N'どうじ', N'Đồng thời', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50165, N'有ります', N'あります', N'Có, tồn tại', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50166, N'有名（な）', N'ゆうめい（な）', N'Nổi tiếng', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50167, N'親しい', N'したしい', N'Thân thiết', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50168, N'新設（な）', N'しんせつ（な）', N'Tốt bụng', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50169, N'両親', N'りょうしん', N'Bố mẹ', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50170, N'細かいお金', N'こまかいおかね', N'Tiền lẻ', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50171, N'現金', N'げんきん', N'Tiền mặt', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (50172, N'細い', N'ほそい', N'Gầy, thon gọn', 40007)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60063, N'駅', N'えき', N'Nhà ga', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60064, N'駅員', N'えきいん', N'Nhân viên nhà ga', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60065, N'駅前', N'えきまえ', N'Trước nhà ga', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60066, N'店', N'みせ', N'Quán, của hàng', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60067, N'喫茶店', N'きっさてん', N'Quán nước', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60068, N'支店', N'してん', N'Chi nhánh', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60069, N'池', N'いけ', N'Cái ao', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60070, N'電池', N'でんち', N'Cục pin', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60071, N'公園', N'こうえん', N'Công viên', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60072, N'主人公', N'しゅじんこう', N'Nhân vật chính', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60073, N'動物園', N'どうぶつえん', N'Sở thú', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60074, N'幼稚園', N'ようちえん', N'Trường mầm non', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60075, N'洋服', N'ようふく', N'Trang phục kiểu tây', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60076, N'洋食', N'ようしょく', N'Đồ ăn kiểu tây', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60077, N'辺', N'ベン', N'Vùng', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60078, N'交通', N'こうつう', N'Giao thông', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60079, N'交差点', N'こうさてん', N'Giao lộ', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60080, N'交番', N'こうばん', N'Đồn cảnh sát', 40008)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60081, N'漢字', N'かんじ', N'Chữ hán', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60082, N'数えます', N'かぞえます', N'Đếm', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60083, N'数字', N'すうじ', N'Chữ số', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60084, N'数学', N'すうがく', N'Toán học', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60085, N'旅行', N'りょこう', N'Du lịch', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60086, N'旅行社', N'りょこうしゃ', N'Công ty du lịch', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60087, N'旅館', N'りょかん', N'Nhà trọ', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60088, N'薬', N'くすり', N'Thuốc men', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60089, N'薬代', N'くすりだい', N'Chi phí thuốc men', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60090, N'薬局', N'やっきょく', N'Hiệu thuốc', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60091, N'台', N'だい', N'Cái ( đếm vật to )', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60092, N'台所', N'だいどころ', N'Bếp ăn', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60093, N'台風', N'たいふう', N'Bão', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60094, N'古里', N'ふるさと', N'Quê quán', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60095, N'~才', N'さい', N'~Tuổi', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60096, N'天才', N'てんさい', N'Thiên tài ( nói đểu 90% )', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60097, N'去年', N'きょねん', N'Năm ngoái', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60098, N'過去', N'かこ', N'Quá khứ', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60099, N'将来', N'しょうらい', N'Tương lai', 40009)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60100, N'若い', N'わかい', N'Trẻ trung', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60101, N' 若年', N'じゃくねん', N'Thanh Niên', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60102, N'短い', N'みじかい', N'Ngắn', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60103, N'短気', N'たんき', N'Nóng nảy', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60104, N'弱い', N'よわい', N'Yếu đuối', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60105, N'弱点', N'じゃくてん', N'Nhược điểm', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60106, N'正しい', N'ただしい', N'Chính xác', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60107, N'お正月', N'おしょうがつ', N'Tết', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60108, N'広い', N'ひろい', N'Rộng', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60109, N'広めます', N'ひろめます', N'Loan tin', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60110, N'低い', N'ひくい', N'Thấp', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60111, N'楽しい', N'たのしい', N'Vui', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60112, N'楽しみます', N' たのしみます', N'Mong chờ', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60113, N'音楽', N'おんがく', N'Âm nhạc', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60114, N'音楽家', N'おんがくか', N'Nhạc sĩ', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60115, N'楽な', N'らくな', N'Nhàn nhã', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60116, N'太い', N'ふとい', N'Béo', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60117, N'太ります', N'ふとります', N'Béo lên', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (60118, N'太陽', N'たいよう', N'Mặt trời', 40010)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70100, N'野原', N'のはら', N'Cánh đồng', 30004)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70101, N'運びます', N'はこびます', N'Vận động', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70102, N'運転します', N'うんてんします', N'Lái xe', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70103, N'運動会', N'うんどうかい', N'Hội thi thể thao', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70104, N'運動します', N'うんどうします', N'Vận động', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70105, N'運転手', N'うんてんしゅ', N'Tài xế lái xe', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70106, N'試合', N'しあい', N'Trận đấu', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70107, N'間に合います', N'まにあいます', N'Kịp giờ', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70108, N'助け合います', N'たすけあいます', N'Giúp đỡ lẫn nhau', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70109, N'合います', N'あいます', N'Hợp, vừa', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70110, N' お見合い', N'おみあい', N'Xem mắt', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70111, N'知合います', N'しりあいます', N'Quen biết', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (70112, N'具合', N'ぐあい', N'Tình trạng', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80109, N'都合がいい', N'つごうがいい', N'Rảnh, tiện', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80110, N'都合が悪い', N'つごうがわるい', N'Bất tiện', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80111, N'合格します', N'ごうかくします', N'Đỗ (kì thi)', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80112, N'落ちります', N'おちります', N'Tạch, trượt (kì thi)', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80113, N'当たります', N'あたります', N'Trúng (Xổ số)', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80114, N'お弁当', N'おべんとう', N'Cơm hộp', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80115, N'考えます', N'かんがえます', N'Suy nghĩ', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80116, N'走ります', N'はしります', N'Chạy bộ', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80117, N'治ります', N'なおります', N'Khỏi ( bệnh) ( tự động từ)', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80118, N'政治', N'せいじ', N'Chính trị', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80119, N'通います', N'かよいます', N'Đi ( hành đồng thường ngày)', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80120, N'通ります', N'とおります', N'Băng qua đường', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80121, N'普通', N'ふつう', N'Bình thường, thông thường', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80122, N'交通', N'こうつう', N'Giao thông', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80123, N'知ります', N'しります', N'Biết', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80124, N'お知らせ', N'おしらせ', N'Thông báo', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80125, N'知合います', N'しりあいます', N'Quen biết', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80126, N'知らせます', N'しらせます', N'Thông báo( tha động từ)', 40011)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80127, N'ご注文', N'ごちゅうもん', N'Đặt hàng', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80128, N'作文', N'さくぶん', N'đoạn văn', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (80129, N'文法', N'ぶんぽう', N'Ngữ pháp', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90109, N'文化', N'ぶんか', N'Văn hóa', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90110, N'論文', N'ろんぶん', N'Luận văn', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90111, N'文学', N'ぶんがく', N'Văn Học', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90112, N'西洋化します', N'せいようかします', N'Tây hóa', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90113, N'化粧', N'けしょう', N'Trang điểm', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90114, N'経済', N'けいざい', N'Kinh tế', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90115, N'経験', N'けいけん', N'Kinh nghiệm', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90116, N'経歴', N'けいれき', N'Sơ yếu lý lịch', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90117, N'政治', N'せいじ', N'Chính trị', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90118, N'歴史', N'れきし', N'Lịch sử', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90119, N'育てます', N'そだてます', N'Nuôi dưỡng', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90120, N'体育館', N'たいいくかん', N'Phòng thể dục', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90121, N'教育', N'きょういく', N'Giáo dục', 40012)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90122, N' 料理', N'りょうり', N'Món ăn( nấu ăn)', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90123, N'資料', N'しりょう', N'Tài liệu', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90124, N'無料', N'むりょう', N'Miễn phí', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90125, N'給料', N'きゅうりょう', N'Tiền lương(hàng tháng)', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90126, N'原料', N'げんりょう', N'Nguyên liệu', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90127, N'材料', N'ざいりょう', N'Nguyên vật liệu', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90128, N'無理（な）', N'むり（な）', N'Vô lý', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90129, N'修理します', N'しゅうりします', N'Sửa chữa', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90130, N'無理をします', N'むりをします', N'làm việc quá sức', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90131, N'整理します', N'せいりします', N'Chỉnh sửa, sắp xếp', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90132, N'理由', N'りゆう', N'Lý do', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90133, N'味', N'あじ', N'Vị', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90134, N'趣味', N'しゅみ', N'Sở thích', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90135, N'意味', N'いみ', N'Ý nghĩa', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90136, N'興味がある', N'きょうみがある', N'Quan tâm tới', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90137, N'飯', N'めし', N'Cơm', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90138, N'朝ご飯', N'あさごはん', N'Cơm sáng', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90139, N'昼ご飯', N'ひるごはん', N'Cơm trưa', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90140, N'晩ご飯', N'ばんごはん', N'Cơm tối', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90141, N'野菜', N'やさい', N'Rau', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90142, N'野球', N'やきゅう', N'Bóng chày', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90143, N'お酒', N'おさけ', N'Rượu', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90144, N'日本酒', N'にほんしゅ', N'Rượu nhật', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90145, N'品物', N'しなもの', N'Hàng hóa', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90146, N'製品', N'せいひん', N'Hàng hóa( chế phẩm)', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90147, N'麦', N'むぎ', N'Lúa mạch', 40013)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90148, N'船', N'ふね', N'Thuyền', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90149, N'船便', N'ふなびん', N'Vận chuyển đường biển', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90150, N'船長', N'せんちょう', N'Đội trưởng', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90151, N'地下', N'ちか', N'Tầng hầm', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90152, N'地下鉄', N'ちかてつ', N'Tàu điện ngầm', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90153, N'地図', N'ちず', N'Bản đồ', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90154, N'地球', N'ちきゅう', N'Trái đất', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90155, N'地震', N'じしん', N'Động đất', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90156, N'特急', N'とっきゅう', N'Tàu tốc hành siêu tốc', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90157, N'特に', N'とくに', N'Đặc biệt là', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90158, N'特別', N'とくべつ', N'Đặc biệt', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90159, N'お客さん', N'おきゃくさん', N' Khách hàng', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90160, N'お客様', N'おきゃくさま', N'Quý khách', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90161, N'皆様', N'みなさま', N'Quý vị', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90162, N'どちら様でしょうか。', N'どちらさまでしょうか。', N'Bạn là ai (lịch sự)', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90163, N'奥様', N'おくさま', N'Vợ người khác', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90164, N'～様', N'～さま', N'~vị nào', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90165, N'様子', N'ようす', N'Tình trạng', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90166, N'荷物', N'にもつ', N'Hành lý', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90167, N'馬', N'うま', N'Cọn ngựa', 40014)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90169, N'番号', N'ばんご', N'Số', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90170, N'~番線', N'～ばんせん', N'Đường tàu số ~', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90171, N'暗証番号', N'あんしょうばんご', N'Mật khẩu', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90172, N'番組', N'ばんぐみ', N'Chương trình truyền hình', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90173, N'交番', N'こうばん', N'Đồn cảnh sát', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90174, N'順番', N'じゅんばん', N'Thứ tự', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90175, N'信号', N'しんごう', N'Đèn giao thông', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90176, N'～号', N'～ごう', N'Số hiệu, Thứ tự ~', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90177, N'号室', N'ごうしつ', N'Số phòng', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90178, N'写真', N'しゃしん', N'Bức ảnh', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90179, N'真ん中', N'まんなか', N'Chính giữa', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90180, N'真っ白', N'まっしろ', N'Trắng toát', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90181, N'時計', N'とけい', N'Đồng hồ', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90182, N'体温計', N'たいおんけい', N'Nhiệt kế', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90183, N'目覚まし時計', N'めざましどけい', N'Đồng hồ báo thức', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90184, N'お宅', N'おたく', N'Nhà (người khác)', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90185, N'お年玉', N'おとしだま', N'Tiền mừng tuổi', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90186, N'玉ねぎ', N'たまねぎ', N'Hành tây', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90187, N'10円玉', N'じゅうえんだま', N'đồng 10 yên', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90188, N'工場', N'こうじょう', N'Nhà máy', 40015)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90189, N'白', N'しろ', N'Trắng', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90190, N'黒', N'くろ', N'Đen', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90191, N'赤', N'あか', N'đỏ', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90192, N'青', N'あお', N'xanh ( blue)', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90193, N'緑', N'みどり', N'Xanh (green)', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90194, N'黄色', N'きいろ', N'màu vàng', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90195, N'色', N'いろ', N'Màu sắc', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90196, N'茶色', N'ちゃいろ', N'Màu nâu', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90197, N'金色', N'きんいろ', N'Màu vàng( ánh kim)', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90198, N'丸い', N'まるい', N'dấu tròn', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90199, N'丸', N'まる', N'Hình tròn', 40016)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90200, N'心から', N'こころから', N'Thật lòng', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90201, N'心配します', N'しんぱいします', N'Băn khoăn', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90202, N'心配', N'しんぱい', N'Băn khoăn', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90203, N'熱心', N'ねっしん', N'Nhiệt tình', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90204, N'安心します', N'あんしんします', N'yên tâm', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90205, N'安心（な）', N'あんしん', N'Yên tâm', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90206, N'自販機', N'じはんき', N'Máy bán hàng tự động', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90207, N'自動販売機', N'じどうはんばいき', N'Máy bán hàng tự động', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90208, N'自転車', N'じてんしゃ', N'Xe đạp', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90209, N'自動車', N'じどうしゃ', N'Ô tô', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90210, N'自分で', N'自分で', N'Tự mình', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90211, N'自由に', N'じゆうに', N'Tự do, tùy thích', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90212, N'自然', N'しぜん', N'Tự nhiên', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90213, N'声', N'こえ', N'Âm thanh', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90214, N'服', N'ふく', N'Quần áo', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90215, N'洋服', N'ようふく', N'Trang phục kiểu tây', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90216, N'毛糸', N'けいと', N'Sợi len', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90217, N'科学', N'かがく', N'Khoa học', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90218, N'鳴ります', N'なります', N'Kêu, reo chuông', 40017)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90219, N'道', N'みち', N'Đường', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90220, N'道具', N'どうぐ', N'Đồ dùng', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90221, N'水道', N'すいどう', N'Nước nóng', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90222, N'剣道', N'けんどう', N'Kiếm đạo', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90223, N'柔道', N'じゅうどう', N'Judo (võ)', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90224, N'村', N'むら', N'Làng', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90225, N'区', N'く', N'Quận, Khu', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90226, N'市場', N'いちば', N'Chợ (thị trường)', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90227, N'市役所', N'しやくしょ', N'Phòng hành chính TP', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90228, N'市場調査', N'しじょうちょうさ', N'Khảo sát thị trường', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90229, N'都合', N'つごう', N'Sự thuận tiện', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90230, N'都会', N'とかい', N'Thành phố lớn', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90231, N'県', N'けん', N'Huyện', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90232, N'東京', N'とうきょう', N'Tokyo', 40018)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90235, N'衣服', N'いふく', N'Y phục', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90236, N'光', N'ひかり', N'Ánh sáng', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90237, N'日光', N'にっこう', N'Ánh nắng', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90238, N'観光地', N'かんこうち', N'Danh lam thắng cảnh', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90239, N'曇', N'くも', N'Mây', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90240, N'国王', N'こくおう', N'Vương quốc', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90241, N'草', N'くさ', N'Cỏ', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90242, N'大草原', N'だいそうげん', N'Thảo nguyên', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90243, N'湖', N'みずうみ', N'Cái hồ', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90244, N'谷', N'たに', N'Thung lũng', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90245, N'虫', N'むし', N'Con sâu', 40019)
GO
INSERT [dbo].[kanji] ([id], [character], [hiragana], [meaning], [lesson_id]) VALUES (90246, N'羽', N'はね', N'Cái cánh', 40019)
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
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (20003, N'Mùa xuân đến thì hoa anh đào nở', 35, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (30003, N'Cách sử dụng của ように', 36, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (30004, N'Câu bị động( động từ bị động)', 37, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40003, N'Giải thích ngữ pháp này cho tôi được không', 26, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40004, N'Cài này có thể ăn được không', 27, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40005, N'Bữa trưa ăn ở đâu', 28, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40006, N'Tự động từ và tha động từ', 29, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40007, N'Danh từ hóa động từ và tính từ', 38, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40008, N'Rất buồn vì không được gặp em', 39, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40009, N'Có nhớ là để đâu không', 40, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40010, N'Biếu quà cho giám đốc', 41, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40011, N'Để trở thành youtuber...', 42, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40012, N'Trông có vẻ ngon', 43, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40013, N'Hôm qua uống quá nhiều', 44, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40014, N'Nấu rồi mà không ăn', 45, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40015, N'Vừa về đến nhà', 46, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40016, N'Nghe nói đã có người yêu', 47, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40017, N'Anh sẽ không làm em khóc', 48, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40018, N'Cuộc đời mỗi người', 49, 1)
GO
INSERT [dbo].[lessons] ([id], [lesson_name], [lesson_number], [level_id]) VALUES (40019, N'Chuyện kể nàng murasaki', 50, 1)
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
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (1, 6, NULL, N'Vận Động', N'', N'うんどうします', 1)
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
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (8, 3, NULL, N'Kéo dài (sốt)', N'', N'つづきます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (9, 5, NULL, N'Bị cảm', N'', N'ひきます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (10, 3, NULL, N'làm mát, làm lạnh', N'', N'ひやします', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (11, 5, NULL, N'Đông đúc (Đường)', N'', N'こみます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (12, 4, NULL, N'Vắng ( Đường )', N'', N'すきます', 1)
GO
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (13, 7, NULL, N'Trúng (Xổ số)', N'', N'あたります', 1)
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
INSERT [dbo].[vocabulary] ([id], [correct_count], [image_path], [meaning], [romanji], [word], [lesson_id]) VALUES (36, 8, NULL, N'Đội', N'', N'チーム', 1)
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
/****** Object:  Index [UKe1ejnmsswocdocld1t1iwsvr5]    Script Date: 6/8/2025 5:33:56 PM ******/
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
