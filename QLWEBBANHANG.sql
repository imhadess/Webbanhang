create database QLWEBBANGHANG
go
USE [QLWEBBANGHANG]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 21/07/2021 11:27:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MAADMIN] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [varchar](50) NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienthoaiKH] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAADMIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 21/07/2021 11:27:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaCTDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[MADH] [int] NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUCSP]    Script Date: 21/07/2021 11:27:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCSP](
	[MADM] [int] IDENTITY(1,1) NOT NULL,
	[TENDM] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MADM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 21/07/2021 11:27:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MADH] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[Ngaydat] [datetime] NULL,
	[Ngaygiao] [datetime] NULL,
	[MaKH] [int] NULL,
	[MAADMIN] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MADH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANGSX]    Script Date: 21/07/2021 11:27:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGSX](
	[MaHANGSX] [int] IDENTITY(1,1) NOT NULL,
	[TENHANG] [nvarchar](50) NOT NULL,
	[Tieusu] [nvarchar](max) NULL,
	[Dienthoai] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHANGSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 21/07/2021 11:27:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [varchar](50) NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienthoaiKH] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 21/07/2021 11:27:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TENSP] [nvarchar](100) NOT NULL,
	[GIASP] [decimal](18, 0) NULL,
	[MOTASP] [nvarchar](max) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluongton] [int] NULL,
	[MADM] [int] NULL,
	[MAHANGSX] [int] NULL,
	[HINHSP] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([MAADMIN], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (1, N'Hoàng Huy', N'hoanghuy0', N'123456', N'hoanghuy14099@gmail.com', N'12 Trần Huy Liệu', N'0909098434', CAST(N'1999-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ADMIN] ([MAADMIN], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (2, N'Dương Chí Hào', N'duongchihao0', N'123456', NULL, N'21 Quận 6', N'0917654310', CAST(N'1990-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ADMIN] ([MAADMIN], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (3, N'Nguyễn Bá Thịnh', N'nguyenbathinh0', N'123456', N'thinhnguyen100199@gmail.com', N'32 Sư Vạn Hạnh', N'098713245', CAST(N'1991-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ADMIN] ([MAADMIN], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (4, N'Lê Nhật Sơn', N'lenhatson0', N'123456', N'sunbi4719@gmail.com', N'12 Khu chung cư', N'0918544699', CAST(N'1986-10-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[DANHMUCSP] ON 

INSERT [dbo].[DANHMUCSP] ([MADM], [TENDM]) VALUES (1, N'LAPTOP')
INSERT [dbo].[DANHMUCSP] ([MADM], [TENDM]) VALUES (2, N'Bàn phím')
INSERT [dbo].[DANHMUCSP] ([MADM], [TENDM]) VALUES (3, N'Chuột gaming')
INSERT [dbo].[DANHMUCSP] ([MADM], [TENDM]) VALUES (4, N'Tai nghe gaming')
INSERT [dbo].[DANHMUCSP] ([MADM], [TENDM]) VALUES (5, N'Màn hình')
SET IDENTITY_INSERT [dbo].[DANHMUCSP] OFF
GO
SET IDENTITY_INSERT [dbo].[HANGSX] ON 

INSERT [dbo].[HANGSX] ([MaHANGSX], [TENHANG], [Tieusu], [Dienthoai]) VALUES (1, N'Logitech', N'Là một công ty của Thụy Sĩ tập trung vào đổi mới và chất lượng, Logitech thiết kế ra các sản phẩm và trải nghiệm có mặt trong cuộc sống hàng ngày của mọi người. Được thành lập vào năm 1981 tại Lausanne, Thụy Sĩ và nhanh chóng mở rộng tới Thung lũng Silicon, Logitech bắt đầu kết nối mọi người thông qua các thiết bị ngoại vi máy tính sáng tạo và nhiều sản phẩm hàng đầu trong ngành, bao gồm chuột không dây hồng ngoại, trackball hoạt động bằng ngón tay cái, chuột laser, v.v.', NULL)
INSERT [dbo].[HANGSX] ([MaHANGSX], [TENHANG], [Tieusu], [Dienthoai]) VALUES (2, N'Asus', N'Được thành lập năm 1989, ASUS là công ty điện tử tiêu dùng và phần cứng máy tính đa quốc gia có trụ sở tại Đài Loan. Luôn cam kết tạo nên những sản phẩm thông minh cho cuộc sống hiện tại và tương lai, ASUS là thương hiệu gaming và bo mạch chủ Số 1 thế giới, đồng thời thuộc top 3 nhà cung cấp máy tính xách tay tiêu dùng hàng đầu.', N'1800-6588')
INSERT [dbo].[HANGSX] ([MaHANGSX], [TENHANG], [Tieusu], [Dienthoai]) VALUES (3, N'MSI', N'Hãng sản xuất MSI có tên đầy đủ là Micro-Star International. Đây là một công ty đa quốc gia có trụ sở chính tại Tân Bắc, Đài Loan. Ban đầu, MSI là công ty chuyên về thiết kế, phát triển và cung cấp phần cứng máy tính. Các sản phẩm, dịch vụ có thể kế đến như: laptop, bo mạch chủ, card đồ họa, máy chủ, thiết bị ngoại vi...  Sau nhiều năm nghiên cứu và phát triển, MSI đã có những thành công bước đầu khi giới thiệu mẫu bo mạch chủ cho phép ép xung lên đến 286. ', NULL)
INSERT [dbo].[HANGSX] ([MaHANGSX], [TENHANG], [Tieusu], [Dienthoai]) VALUES (4, N'Razor', N'Razer được thành lập vào năm 1998 bởi một nhóm các nhà tiếp thị và kỹ sư với mục đích phát triển thị trường chuột máy tính chơi game cao cấp, gọi là Boomslang, nhắm mục tiêu, đối tượng khách hang đến các game thủ máy tính.', NULL)
INSERT [dbo].[HANGSX] ([MaHANGSX], [TENHANG], [Tieusu], [Dienthoai]) VALUES (5, N'SteelSeries', N'Được thành lập từ năm 2001 với trụ sở chính đặt tại Đan Mạch. Từ khi mới thành lập cho tới 2004, họ chỉ có cho mình những sản phẩm là Mousepad (Bàn di chuột) với cái tên khá xa lạ là Steel Qck, và mẫu tai nghe chơi game Icemat. Năm 2004, họ đã chính thức đổi tên mình thành Steelseries với việc liên tục ra mắt và cải tiến những sản phẩm mới như Chuột chơi game, bàn phím, tai nghe và những phụ kiện khác. Ngày nay, mỗi khi nhắc tới Gaming Gear, có lẽ không ai không nhắc tới cái tên Steelseries, họ đã trở thành một trong những thương hiệu nổi tiếng nhất trong lĩnh vực này', NULL)
INSERT [dbo].[HANGSX] ([MaHANGSX], [TENHANG], [Tieusu], [Dienthoai]) VALUES (6, N'Corsair', N'Corsair Components, Inc. (được cách điệu là CORSAIR) là một công ty phần cứng và thiết bị ngoại vi máy tính của Mỹ có trụ sở tại Fremont, California. Công ty được thành lập tại California vào tháng 1 năm 1994 và được tái hợp nhất tại Delaware vào năm 2007.', NULL)
SET IDENTITY_INSERT [dbo].[HANGSX] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (1, N'Hoàng Huy1', N'hoanghuy1', N'123456', N'hoanghuy14099@gmail.com', N'12 Trần Huy Liệu', N'0909098434', CAST(N'1999-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (2, N'Dương Chí Hào1', N'duongchihao1', N'123456', NULL, N'21 Quận 6', N'0917654310', CAST(N'1990-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (3, N'Nguyễn Bá Thịnh1', N'nguyenbathinh1', N'123456', N'thinhnguyen100199@gmail.com', N'32 Sư Vạn Hạnh', N'098713245', CAST(N'1991-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (4, N'Lê Nhật Sơn1', N'lenhatson1', N'123456', N'sunbi4719@gmail.com', N'12 Khu chung cư', N'0918544699', CAST(N'1986-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (10, N'dương chí hào', N'haodeptrai123', N'123456', NULL, NULL, N'0976660500', CAST(N'1999-12-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (1, N'Bàn phím Razer Blackwidow', CAST(2690000 AS Decimal(18, 0)), N'Bàn phím cơ giá rẻ - Razer Blackwidow được thiết kế và sản xuất bởi hãng Razer Inc. - một công ty của Mỹ, được thành lập bởi Min-Liang Tan, và Robert Krakoff có trụ sở ở Califoria chuyên cung cấp các sản phẩm, phụ kiện chất lượng dành cho game thủ. Các sản phẩm đến từ Razer thường được giới game thủ đánh giá cao về mặt chất lượng lẫn giá cả.', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 2, 4, N'sanpham-1.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (2, N'Bàn phím Logitech G PRO KDA', CAST(3269000 AS Decimal(18, 0)), N'Các phím switch cơ học GX Tactile tiên tiến được chế tạo để tăng hiệu suất, độ nhạy và độ bền, với phản hồi nhấn phím phát ra âm thanh, có thể cảm nhận được', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 2, 1, N'sanpham-2.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (3, N'Chuột Corsair DarkCore RGB Pro', CAST(2490000 AS Decimal(18, 0)), N'Tích hợp tính năng Qi Wireless Charging, Công nghệ SLIPSTREAM CORSAIR WIRELESS 2.4 GHz dưới 1 ms , Bluetooth® 4.2 + LE,Cáp USB', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 3, 6, N'sanpham-3.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (4, N'Chuột Logitech G502 Hero KDA', CAST(1799000 AS Decimal(18, 0)), N'G502 HERO K/DA là một trong những dòng chuột gaming mới nhất đến từ Logitech. Được trang bị đến 11 nút có thể tùy chỉnh giúp bạn dễ dàng chỉ định các lệnh cá nhân, cùng cảm biến quang học tiên tiến cho độ chính xác theo dõi tối đa, tính năng chiếu sáng RGB có thể tùy chỉnh, cảm biến trò chơi từ 200 cho tới 25.600 DPI.', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 3, 1, N'sanpham-4.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (5, N'Màn hình cong MSI OPTIX MAG272CQR', CAST(8990000 AS Decimal(18, 0)), N'Màn hình chơi game MSI Optix được trang bị công nghệ HDR có thể tạo ra hình ảnh với nhiều chi tiết hơn, dải màu rộng hơn và trông giống với những gì mắt người nhìn thấy hơn khi so sánh với màn hình truyền thống.', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 5, 3, N'sanpham-5.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (6, N'Màn hình cong Asus ROG Strix XG32VC', CAST(14590000 AS Decimal(18, 0)), N'Với độ phân giải WQHD (2560 x 1440) giúp màn hình tận dụng được hơn 77% không gian chơi game trên màn hình so với màn hình Full HD tiêu chuẩn (1920 x 1080). Ngoài ra, màn hình này còn được trang bị độ tương phản đáng kinh ngạc 3000:1.', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 5, 2, N'sanpham-6.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (7, N'Tai nghe SteelSeries Arctis Pro Wireless', CAST(8490000 AS Decimal(18, 0)), N'Tai nghe SteelSeries Arctis Pro Wireless với các trình điều khiển loa kết hợp công nghệ mà hãng sản xuất tạo ra được sản phẩm không dây nhưng có độ trễ cực kì ngắn, mang âm thanh lớn tới tai nghe của bạn. Đây là một sự giải pháp dành cho giới game thủ muốn có một chiếc tai nghe không dây chất lượng trong từng trận đấu.', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 4, 5, N'sanpham-7.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (8, N'Tai nghe Logitech G733 KDA ', CAST(3999000 AS Decimal(18, 0)), N'Các thiết bị bàn phím không dây Logitech, chuột chơi game, tai nghe luôn là những sự lựa chọn hàng đầu của game thủ và người dùng phổ thông hiện nay. Trong đó, không thể nào bỏ qua tai nghe Logitech G733 KDA một trong những phiên bản đặc biệt của dòng tai nghe gaming đến từ Logitech.', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 4, 1, N'sanpham-8.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (9, N'Laptop Asus ROG Strix SCAR 15', CAST(57490000 AS Decimal(18, 0)), N'Laptop ASUS ROG Strix SCAR 15 G533QR HQ098T là chiếc máy tính xác tay có biên dạng thấp, thuận tiện cho cả làm việc và chơi game. Họa tiết cybertext tinh tế mang tới phong cách viễn tưởng cho thiết bị. Bản lề kiểu cửa cắt kéo ẩn giúp ổn định màn hình có viền siêu mỏng, đem lại góc nhìn rộng hơn. Để có trải nghiệm RGB đầy đủ, hãy bật đèn Aura Sync để thắp sáng bàn phím gaming và thanh đèn cuộn.', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 1, 2, N'sanpham-9.jpg')
INSERT [dbo].[SANPHAM] ([MaSP], [TENSP], [GIASP], [MOTASP], [Ngaycapnhat], [Soluongton], [MADM], [MAHANGSX], [HINHSP]) VALUES (10, N'Laptop Gaming MSI GS66 Stealth', CAST(58990000 AS Decimal(18, 0)), N'Với lớp vỏ đen nhám và thiết kế chân phương, laptop MSI GS66 Stealth 10UE-200VN mới giúp bạn dễ dàng hòa mình vào mọi môi trường sử dụng. Khung máy làm từ kim loại cứng cáp, đáp ứng tốt nhu cầu sử dụng hàng ngày. GS66 Stealth 2021 không chỉ là mẫu laptop chơi game mạnh mẽ, mà còn là công cụ thiết yếu để làm việc với phong cách chuyên nghiệp.', CAST(N'2021-06-30T00:00:00.000' AS DateTime), 100, 1, 3, N'sanpham-10.jpg')
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ADMIN__7FB3F64FCC69949A]    Script Date: 21/07/2021 11:27:15 SA ******/
ALTER TABLE [dbo].[ADMIN] ADD UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ADMIN__A9D10534AAEFD9EB]    Script Date: 21/07/2021 11:27:15 SA ******/
ALTER TABLE [dbo].[ADMIN] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__7FB3F64FCAACFE6B]    Script Date: 21/07/2021 11:27:15 SA ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CTDH_MADH] FOREIGN KEY([MADH])
REFERENCES [dbo].[DONDATHANG] ([MADH])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CTDH_MADH]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CTDH_MASP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CTDH_MASP]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [DONDATHANG_MAADMIN] FOREIGN KEY([MAADMIN])
REFERENCES [dbo].[ADMIN] ([MAADMIN])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [DONDATHANG_MAADMIN]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [DONDATHANG_MAKH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [DONDATHANG_MAKH]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [SP_MADM] FOREIGN KEY([MADM])
REFERENCES [dbo].[DANHMUCSP] ([MADM])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [SP_MADM]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [SP_MAHANGSX] FOREIGN KEY([MAHANGSX])
REFERENCES [dbo].[HANGSX] ([MaHANGSX])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [SP_MAHANGSX]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD CHECK  (([GIASP]>=(0)))
GO
