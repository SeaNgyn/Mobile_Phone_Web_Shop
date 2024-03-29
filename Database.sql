USE [PhoneStoreWeb]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](10) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentNews]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentNews](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Star] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
	[NewsId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedById] [int] NULL,
	[CreatedOn] [date] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[discountName] [nvarchar](max) NULL,
	[discountCode] [varchar](20) NULL,
	[discountPercentage] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[NewsGroupId] [int] NULL,
	[heading] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsGroup]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsGroup](
	[NewsGroupId] [int] IDENTITY(1,1) NOT NULL,
	[NewsGroupName] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[TotalPrice] [float] NULL,
	[Address] [nvarchar](max) NULL,
	[AdminId] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
	[status] [nvarchar](max) NULL,
	[shipCost] [float] NULL,
	[discountCost] [float] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[OrderId] [int] NULL,
	[ListPrice] [float] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
	[status] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
	[Capacity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
	[ProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[star] [int] NULL,
	[time_new] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/15/2024 9:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Rolename] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminId], [FirstName], [LastName], [UserName], [Password], [RoleId], [Email], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Lê Duy Tống', NULL, N'admin1', N'8bfe7eede536ca9d583a6c9b241c001d', 1, N'', NULL, CAST(N'2024-01-06' AS Date), NULL, NULL)
INSERT [dbo].[Admin] ([AdminId], [FirstName], [LastName], [UserName], [Password], [RoleId], [Email], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'Phạm Văn Trà', N'', N'staff12345', N'8bfe7eede536ca9d583a6c9b241c001d', 2, N'', 5, CAST(N'2024-01-17' AS Date), 10, CAST(N'2024-01-18' AS Date))
INSERT [dbo].[Admin] ([AdminId], [FirstName], [LastName], [UserName], [Password], [RoleId], [Email], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'Cao Quang Đạt', NULL, N'12345', N'8bfe7eede536ca9d583a6c9b241c001d', 2, NULL, 7, CAST(N'2024-01-30' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Iphone    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Samsung   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Oppo      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Xiaomi    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Realme    ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CommentNews] ON 

INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (5, N'thông tin hay', 3, 4, CAST(N'2024-03-07' AS Date), NULL, NULL, 6)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (9, N'Elon musk là thiên tài ', 4, 4, CAST(N'2024-03-07' AS Date), NULL, NULL, 8)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (10, N'thông báo', 4, 4, CAST(N'2024-03-07' AS Date), NULL, NULL, 6)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (12, N'Elon Musk that hen he', 3, 4, CAST(N'2024-03-10' AS Date), 4, CAST(N'2024-03-10' AS Date), 8)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (13, N'Elon Musk th?t hèn h?', 4, 4, CAST(N'2024-03-10' AS Date), NULL, NULL, 8)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (14, N'Elon Musk th?t hèn h?', 4, 4, CAST(N'2024-03-10' AS Date), NULL, NULL, 8)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (15, N'Elon Musk th?t hèn h?', 4, 4, CAST(N'2024-03-10' AS Date), NULL, NULL, 8)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (16, N'Cai gi the nay', 1, 4, CAST(N'2024-03-10' AS Date), 4, CAST(N'2024-03-10' AS Date), 8)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (17, N'Elon Musk th?t hèn h?', 4, 4, CAST(N'2024-03-10' AS Date), NULL, NULL, 8)
INSERT [dbo].[CommentNews] ([CommentID], [Content], [Star], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [NewsId]) VALUES (39, N'bai viet tot', 4, 20, CAST(N'2024-03-14' AS Date), NULL, NULL, 6)
SET IDENTITY_INSERT [dbo].[CommentNews] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Nguyễn Thế Anh', N'8bfe7eede536ca9d583a6c9b241c001d', N'theanh', N'theanh123@gmail.com', N'0342652356', N'Phường Phú Lãm,Quận Hà Đông,TP. Hà Nội', NULL, CAST(N'2024-01-14' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'phạm duy tú', N'8bfe7eede536ca9d583a6c9b241c001d', N't1', N'duyuy12@gmail.com', N'09237461231', N'Cao lỗ - Đông anh', NULL, CAST(N'2024-01-15' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'kimlong', N'ca8db27f5bd4dc18da6776e4b5c52569', N't2', N'klt2@gmail.com', N'0923712341', N'Xã Cao Sơn,Huyện Đà Bắc,Tỉnh Hoà Bình', 11, CAST(N'2024-01-15' AS Date), 10, CAST(N'2024-01-18' AS Date))
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Nguyễn Văn A', N'8bfe7eede536ca9d583a6c9b241c001d', N'khachhang', N'khachhang123@gmail.com', N'0975412363', N'Đông Xuân-Sóc Sơn', NULL, CAST(N'2021-01-15' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'quangnt', N'8bfe7eede536ca9d583a6c9b241c001d', N'quangnt', N'', NULL, NULL, NULL, CAST(N'2024-01-18' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'Quang Duy', N'8bfe7eede536ca9d583a6c9b241c001d', N't4', N'quangduy777@gmail.com', N'0923451235', N'Thanh Oai, Hà Nội', NULL, CAST(N'2024-01-18' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'666', N'8bfe7eede536ca9d583a6c9b241c001d', N'666', N'', NULL, NULL, NULL, CAST(N'2024-01-18' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'Thế Anh', N'8bfe7eede536ca9d583a6c9b241c001d', N'nguyentheanhvnhn2k3@gmail.com', N'nguyentheanhvnhn2k3@gmail.com', N'0923451235', N'Xã Thanh Mỹ,Thị xã Sơn Tây,TP. Hà Nội', NULL, CAST(N'2024-01-30' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'nguyentheanh2k3@gmail.com', N'8bfe7eede536ca9d583a6c9b241c001d', N'nguyentheanh2k3@gmail.com', N'nguyentheanh2k3@gmail.com', NULL, NULL, NULL, CAST(N'2024-02-01' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'Nguyen The Anh', NULL, NULL, N'anhnthe171317@fpt.edu.vn', NULL, NULL, NULL, CAST(N'2024-02-01' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'oop123', N'8bfe7eede536ca9d583a6c9b241c001d', N'oop123', N'', N'123', NULL, NULL, CAST(N'2024-02-26' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, N'oop1236666', N'8bfe7eede536ca9d583a6c9b241c001d', N'oop1236666', N'quangft1507@gmail.com', N'123', NULL, NULL, CAST(N'2024-02-26' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N'Quang', N'8bfe7eede536ca9d583a6c9b241c001d', N't7', N'nguyentheanhvnhn2k3@gmail.com', N'12345656456', N'Cầu giấy, hà nội', NULL, CAST(N'2024-02-29' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, N'testmd5', N'e4b351cd58c4e507acc8329a26681404', N'testmd5', N'', N'1111111111', NULL, NULL, CAST(N'2024-02-29' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, N'testmd512', N'e4b351cd58c4e507acc8329a26681404', N'testmd512', N'', N'12345656456', NULL, NULL, CAST(N'2024-02-29' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, N'Kim Dung', N'8bfe7eede536ca9d583a6c9b241c001d', N't11', N'kimmmD22@gmail.com', N'12345656456', N'Thanh trì', NULL, CAST(N'2024-03-01' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, N't15', N'8bfe7eede536ca9d583a6c9b241c001d', N't15', N'', N'0987654321', NULL, NULL, CAST(N'2024-03-03' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, N'15', N'8bfe7eede536ca9d583a6c9b241c001d', N'15', N'', N'0987654321', NULL, NULL, CAST(N'2024-03-03' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, N't18', N'8bfe7eede536ca9d583a6c9b241c001d', N't18', N'', N'12345677', NULL, NULL, CAST(N'2024-03-07' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, N'longvu', N'1e8de88ec658de1779ff7fc6a61725f0', N'kakalet2k3@gmail.com', N'kakalet2k3@gmail.com', N'0923451235', N'Xã Kim Sơn,Thị xã Sơn Tây,TP. Hà Nội', NULL, CAST(N'2024-03-15' AS Date), NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FullName], [Password], [UserName], [Email], [Phone], [Address], [CreatedById], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, N'huyNguyen', N'1baab8009842935f4b8065c6bab0d06b', N'nguyenhuy300218@gmail.com', N'nguyenhuy300218@gmail.com', N'0923451333', N'Phường Vĩnh Phúc,Quận Ba Đình,TP. Hà Nội', NULL, CAST(N'2024-03-15' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[discount] ON 

INSERT [dbo].[discount] ([discountID], [discountName], [discountCode], [discountPercentage]) VALUES (1, N'Giam 10%', N'ABCJJFH6XD', CAST(0.10 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[discount] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'Deal Fun, Siêu Dzui, Đây Dzồi: Cùng săn 22 suất giảm 50% OPPO Reno11 F 5G tại FPT Shop', N'<p>Chương tr&igrave;nh sẽ được chia l&agrave;m 2 đợt với c&aacute;ch thức tham gia v&ocirc; c&ugrave;ng đơn giản:</p>

<p><strong>Đợt 1:&nbsp;</strong>Từ ng&agrave;y 02/03-07/03/2024, kh&aacute;ch h&agrave;ng đăng k&yacute; th&ocirc;ng tin tr&ecirc;n b&agrave;i viết gồm họ t&ecirc;n v&agrave; số&nbsp;<a href="https://fptshop.com.vn/dien-thoai">điện thoại</a>&nbsp;tại đ&acirc;y. Mỗi số điện thoại chỉ được tham gia đăng k&yacute; 1 lần duy nhất.</p>

<p><strong>C&aacute;ch thức nhận thưởng:</strong></p>

<p>FPT Shop sẽ quay số may mắn cho to&agrave;n bộ người chơi đ&atilde; đăng k&yacute; (Nếu người tham gia đăng k&yacute; nhiều lần vẫn t&iacute;nh l&agrave; 1 cơ hội duy nhất) dựa v&agrave;o 5 số cuối số điện thoại của người chơi. FPT Shop tiến h&agrave;nh quay số tr&ecirc;n trang random.org, người chơi c&oacute; 5 số cuối số điện thoại tr&ugrave;ng khớp hoặc thấp hơn gần nhất với số may mắn sẽ tr&uacute;ng thưởng. Mỗi số may mắn sẽ t&igrave;m ra 01 người may mắn nhất tr&uacute;ng giải (tổng cộng c&oacute; 6 số may mắn).</p>

<p>Thời gian quay số dự kiến ng&agrave;y 08/03 (3 suất) v&agrave; ng&agrave;y 09/03 (3 suất) được livestream tr&ecirc;n fanpage FPT Shop. Tổng đ&agrave;i vi&ecirc;n FPT Shop sẽ li&ecirc;n hệ th&ocirc;ng b&aacute;o v&agrave; trao giải dự kiến 03 ng&agrave;y sau khi c&ocirc;ng bố kết quả.</p>

<p><strong>Đợt 2:</strong>&nbsp;Tham gia v&agrave;o l&uacute;c 11 giờ đến 12 giờ ng&agrave;y 08/03 v&agrave; 09/03.</p>

<p>Bước 1: Đăng k&yacute; th&ocirc;ng tin tr&ecirc;n b&agrave;i viết gồm họ t&ecirc;n v&agrave; số điện thoại tại đ&acirc;y. Mỗi số điện thoại được tham gia săn deal 2 lần trong 1 khung giờ.<br />
Bước 2: Chọn 1 hộp qu&agrave; may mắn.&nbsp;</p>

<p><strong>C&aacute;ch thức nhận thưởng:</strong></p>

<p>Mỗi khung giờ sẽ c&oacute; 08 hộp qu&agrave; may mắn nhất tr&uacute;ng giải &nbsp;(tổng cộng c&oacute; 16 suất).</p>

<p><strong>Những lưu &yacute; khi tham gia chương tr&igrave;nh:&nbsp;</strong></p>

<p>Đối tượng &aacute;p dụng: &Aacute;p dụng cho tất cả người chơi tham gia đăng k&yacute; th&ocirc;ng tin từ ng&agrave;y 02/03-09/03/2024.<br />
Mọi trường hợp người chơi nhập sai số điện thoại khi đăng k&yacute; chơi FPT Shop sẽ kh&ocirc;ng hỗ trợ việc đổi số điện thoại cũng như x&aacute;c định tr&uacute;ng thưởng với c&aacute;c số n&agrave;y.<br />
- Sau ng&agrave;y c&ocirc;ng bố kết quả, nếu tổng đ&agrave;i vi&ecirc;n kh&ocirc;ng li&ecirc;n lạc được với người chơi trong 03 lần, giải thưởng sẽ bị hủy bỏ.<br />
C&aacute;c kết quả chơi game c&oacute; dấu hiệu gian lận, sử dụng c&ocirc;ng cụ tự động, can thiệp bằng c&aacute;c thao t&aacute;c kh&ocirc;ng ch&iacute;nh thống FPT Shop c&oacute; quyền x&oacute;a bỏ hoặc y&ecirc;u cầu người chơi tới trụ sở c&ocirc;ng ty để x&aacute;c minh kết quả.<br />
Mỗi người chơi chỉ được d&ugrave;ng tối đa 2 số điện thoại để tham gia đăng k&yacute;. Nếu ph&aacute;t hiện vi phạm c&oacute; thể huỷ giải thưởng tại bất cứ thời điểm n&agrave;o.<br />
FPT Shop c&oacute; quyền y&ecirc;u cầu người tr&uacute;ng giải xuất tr&igrave;nh Chứng minh thư/Căn cước c&ocirc;ng d&acirc;n khi nhận giải thưởng v&agrave; th&ocirc;ng tin họ t&ecirc;n người chơi phải tr&ugrave;ng với t&ecirc;n tr&ecirc;n Chứng minh thư/Căn cước c&ocirc;ng d&acirc;n của người nhận giải thưởng.<br />
Mỗi số điện thoại chỉ c&oacute; cơ hội tr&uacute;ng 1 giải thưởng duy nhất.<br />
Chương tr&igrave;nh c&oacute; thể thay đổi hoặc kết th&uacute;c trước thời hạn m&agrave; kh&ocirc;ng cần th&ocirc;ng b&aacute;o trước.<br />
Mọi trường hợp xảy ra tranh chấp, quyết định của FPT Shop l&agrave; quyết định cuối c&ugrave;ng.&nbsp;</p>
', 1, N'Từ ngày 02/03 - 09/03/2024, tất cả khách hàng tham gia chương trình ', N'RC_Collection_1000x1000 (1).webp', 5, CAST(N'2024-03-05' AS Date), 5, CAST(N'2024-03-05' AS Date))
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'Nợ tiền trợ cấp thôi việc, Elon Musk bị cựu nhân viên Twitter khởi kiện', N'<p>Theo đơn kiện mới được đệ tr&igrave;nh v&agrave;o thứ Hai vừa qua, bốn cựu l&atilde;nh đạo cấp cao của Twitter, bao gồm cả cựu Gi&aacute;m đốc điều h&agrave;nh Parag Agrawal, đ&atilde; khởi kiện tỷ ph&uacute; Elon Musk để đ&ograve;i tổng số tiền bồi thường l&ecirc;n đến hơn 128 triệu USD m&agrave; &ocirc;ng nợ họ suốt nhiều th&aacute;ng qua.</p>

<p>Ngo&agrave;i cựu CEO Parag Agrawal, c&ograve;n c&oacute; c&aacute;c nguy&ecirc;n đơn kh&aacute;c bao gồm cựu CFO Ned Segal, cựu gi&aacute;m đốc ph&aacute;p l&yacute; Vijaya Gadde v&agrave; cựu luật sư trưởng Sean Edgett. Theo b&aacute;o c&aacute;o của Wall Street Journal, bất đồng giữa 2 b&ecirc;n đ&atilde; k&eacute;o d&agrave;i hơn một năm nay sau khi &ocirc;ng Musk sa thải c&aacute;c cựu l&atilde;nh đạo n&agrave;y v&agrave; kh&ocirc;ng trả tiền trợ cấp th&ocirc;i việc cho họ.</p>

<p>&nbsp;</p>

<p><a href="https://genk.mediacdn.vn/139269124445442048/2024/3/4/fb18301106f6f57eea94f40a1494f2d5-17095967488581573087245.jpeg" target="_blank" title="Cựu CEO Twitter, Parag Agrawal"><img alt="Nợ tiền trợ cấp thôi việc, Elon Musk bị cựu nhân viên Twitter khởi kiện- Ảnh 1." id="img_77732091511652352" src="https://genk.mediacdn.vn/thumb_w/640/139269124445442048/2024/3/4/fb18301106f6f57eea94f40a1494f2d5-17095967488581573087245.jpeg" style="height:900px; width:1200px" title="Nợ tiền trợ cấp thôi việc, Elon Musk bị cựu nhân viên Twitter khởi kiện- Ảnh 1." /></a></p>

<p>Cựu CEO Twitter, Parag Agrawal</p>

<p>&quot;Đ&acirc;y l&agrave; chiến thuật của Musk: giữ tiền m&agrave; &ocirc;ng ta nợ người kh&aacute;c v&agrave; buộc họ phải kiện &ocirc;ng ta,&quot; đơn kiện viết. &quot;Ngay cả khi thua cuộc, Musk vẫn c&oacute; thể g&acirc;y ra sự chậm trễ, phiền h&agrave; v&agrave; chi ph&iacute; cho những người kh&aacute;c &iacute;t c&oacute; khả năng chi trả hơn.&quot;</p>

<p>Đ&acirc;y kh&ocirc;ng phải l&agrave; vụ kiện duy nhất li&ecirc;n quan đến tiền trợ cấp th&ocirc;i việc m&agrave; Musk v&agrave; X (trước đ&acirc;y l&agrave; Twitter) phải đối mặt. Th&aacute;ng trước, cuộc thảo luận về một thoả thuận giải quyết li&ecirc;n quan đến vụ kiện h&agrave;nh động tập thể đề xuất trị gi&aacute; 500 triệu đ&ocirc; la về tiền trợ cấp th&ocirc;i việc chưa được thanh to&aacute;n đ&atilde; kh&ocirc;ng đạt được giải ph&aacute;p, Reuters đưa tin v&agrave;o thời điểm đ&oacute;. Ri&ecirc;ng rẽ, s&aacute;u cựu quản l&yacute; cấp cao cũng đang kiện c&ocirc;ng ty đ&ograve;i tiền trợ cấp th&ocirc;i việc.</p>

<p>V&agrave;o th&aacute;ng 8 năm 2023, Agrawal, Segal v&agrave; Gadde cũng đ&atilde; kiện Twitter v&igrave; hơn 1 triệu USD kh&aacute;c, với c&aacute;o buộc c&ocirc;ng ty nợ họ tiền ph&iacute; ph&aacute;p l&yacute; li&ecirc;n quan đến việc sa thải. Đơn kiện trị gi&aacute; 128 triệu USD mới đ&acirc;y đ&atilde; tr&iacute;ch dẫn lại một cảnh trong tiểu sử của &ocirc;ng Musk do Walter Isaacson viết, trong đ&oacute; cho biết vị tỷ ph&uacute; g&acirc;y tranh c&atilde;i n&agrave;y đ&atilde; đẩy nhanh qu&aacute; tr&igrave;nh mua lại để c&oacute; thể sa thải Agrawal v&agrave; c&aacute;c gi&aacute;m đốc cấp cao kh&aacute;c v&igrave; l&yacute; do ch&iacute;nh đ&aacute;ng, trước khi quyền chọn mua cổ phiếu gi&aacute; thấp của họ k&iacute;ch hoạt.</p>

<p>Theo nhiều người kh&aacute;c, Agrawal đ&atilde; c&oacute; những cuộc tranh c&atilde;i gay gắt với Musk trước khi &ocirc;ng bị sa thải khỏi c&ocirc;ng ty về vấn đề bot v&agrave; c&aacute;c vấn đề kh&aacute;c, trong khi Segal, cựu gi&aacute;m đốc t&agrave;i ch&iacute;nh, trước đ&oacute; đ&atilde; n&oacute;i rằng việc đ&agrave;m ph&aacute;n với &ocirc;ng Musk cho đến khi đạt được thỏa thuận mua lại Twitter đ&atilde; &quot;vắt kiệt mọi sức mạnh tinh thần m&agrave; t&ocirc;i đ&atilde; ph&aacute;t triển trong 48 năm qua.&quot;</p>
', 2, N'Tổng số tiền tỷ phú Elon Musk còn nợ các nhân viên này lên đến hơn 128 triệu USD.', N'screenshot_2024-03-01_214705.png.jpg', 5, CAST(N'2024-03-05' AS Date), NULL, NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'Gợi ý quà xinh tặng Người thương: Redmi Note 13 Pro - Tự tin tỏa sáng, tự do khám phá', N'V&agrave;o ng&agrave;y 29/02, Xiaomi đ&atilde; tiếp tục cho tr&igrave;nh l&agrave;ng chiếc&nbsp;<a href="https://fptshop.com.vn/dien-thoai">điện thoại</a>&nbsp;thuộc Redmi Note 13 Series - Redmi Note 13 Pro. Được mệnh danh l&agrave; &quot;Vua Ph&acirc;n Kh&uacute;c&quot; tầm trung,&nbsp;<a href="https://fptshop.com.vn/dien-thoai/xiaomi-redmi-note-13-pro">Xiaomi Redmi Note 13 Pro</a>&nbsp;bản 8GB-128GB l&ecirc;n kệ tại FPT Shop c&oacute; mức gi&aacute; ch&iacute;nh thức l&agrave; 7.290.000 đồng. Vẫn sử dụng lối thiết kế tương tự như Redmi Note 13 v&agrave; Redmi Note 13 Pro+, phi&ecirc;n bản Pro cũng c&oacute; cụm camera si&ecirc;u lớn, to&agrave;n bộ mặt lưng v&agrave; c&aacute;c cạnh đều được l&agrave;m phẳng. Sản phẩm c&oacute; 3 lựa chọn m&agrave;u sắc gồm: Xanh l&aacute; c&acirc;y, T&iacute;m lavender v&agrave; Đen b&aacute;n dạ.&nbsp;<br />
&nbsp;
<p>Đặc biệt từ 01/03 - 17/03, khi kh&aacute;ch h&agrave;ng chọn mua sản phẩm tại FPT Shop sẽ nhận được c&aacute;c ưu đ&atilde;i hấp dẫn như sau:</p>

<p>- Giảm ngay 500.000 đồng.</p>

<p>- Trả g&oacute;p 0%.</p>

<p>- Bảo h&agrave;nh đến 18 th&aacute;ng.</p>

<p>- Thu cũ đổi mới trợ gi&aacute; ngay đến 2.000.000 đồng.</p>

<p>- Giảm th&ecirc;m 100.000 đồng khi mua trả g&oacute;p qua FE CREDIT.</p>

<p>- Nhập m&atilde; FPTLIXI giảm từ 50.000 đồng đến 300.000 đồng khi thanh to&aacute;n qua VNPAY-QR.</p>

<p>- Nhập m&atilde; ZLP100K, giảm 1% tối đa 100.000 đồng khi thanh to&aacute;n 100% qua ZaloPay.</p>

<p>- Giảm 50.000 đồng cho đơn từ 200.000 đồng đến dưới 4.000.000 đồng Hoặc giảm 5% tối đa 1.000.000 đồng đơn từ 4.000.000 đồng khi thanh to&aacute;n qua HomePayLater.<br />
&nbsp;</p>

<p><strong>Redmi Note 13 Pro 8GB-128GB: Trọn N&eacute;t Độc Bản</strong></p>

<p>D&ugrave; chỉ thuộc ph&acirc;n kh&uacute;c tầm trung nhưng sản phẩm vẫn được đầu tư cụm camera cảm biến ch&iacute;nh đến 200MP. Kết hợp c&ugrave;ng bộ đ&ocirc;i chống rung OIS + EIS v&agrave; khả năng thu ph&oacute;ng 4X điều n&agrave;y gi&uacute;p bạn tự tin chụp những vật thể ở khoảng c&aacute;ch xa, kh&ocirc;ng lo mờ hay vỡ n&eacute;t. Điện thoại sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước 6.67 inch, độ ph&acirc;n giải FHD+ v&agrave; tần số qu&eacute;t 120Hz. Hệ thống loa ứng dụng c&ocirc;ng nghệ Dolby Atmos tr&ecirc;n điện thoại sẽ mang đến cho bạn trải nghiệm như đang đắm ch&igrave;m v&agrave;o kh&ocirc;ng gian giải tr&iacute; tuyệt đỉnh.</p>

<p>Mang trong m&igrave;nh con chip 8 l&otilde;i Helio G99-Ultra được x&acirc;y dựng tr&ecirc;n tiến tr&igrave;nh 6nm hiện đại. Nhờ đ&oacute;, điện thoại c&oacute; khả năng vận h&agrave;nh mạnh mẽ d&ugrave; l&agrave; xem phim, chỉnh ảnh hay chơi game đều được xử l&yacute; ổn định. M&aacute;y được trang bị vi&ecirc;n pin dung lượng 5000mAh kết hợp c&ugrave;ng sạc Turbo c&ocirc;ng suất 67W. Bạn chỉ mất 16 ph&uacute;t để t&aacute;i tạo 50% pin v&agrave; 46 ph&uacute;t cho 100% pin. Thoải m&aacute;i li&ecirc;n lạc, lướt web, xem phim, thậm ch&iacute; l&agrave; chơi game li&ecirc;n tục khoảng 7 - 8 giờ đồng hồ m&agrave; kh&ocirc;ng lo bị gi&aacute;n đoạn.</p>

<p>Ngo&agrave;i ra, chiếc điện thoại&nbsp;<a href="https://fptshop.com.vn/dien-thoai/xiaomi-redmi-note-13-pro">Redmi Note 13 Pro</a>&nbsp;n&agrave;y cũng được trang bị nhiều t&iacute;nh năng tiện &iacute;ch kh&aacute;c như mở kh&oacute;a v&acirc;n tay, jack cắm tai nghe 3.5mm, cảm biến hồng ngoại, chống nước/bụi IP54,...</p>

<p>Hiện sản phẩm đ&atilde; c&oacute; mặt tại hệ thống FPT Shop tr&ecirc;n to&agrave;n quốc. Kh&aacute;ch h&agrave;ng c&oacute; thể đến cửa h&agrave;ng để tận tay trải nghiệm v&agrave; chọn mua &quot;Vua Ph&acirc;n Kh&uacute;c&quot; d&agrave;nh tặng người thương nh&acirc;n ng&agrave;y đặt biệt nhất của th&aacute;ng 3 nh&eacute;.</p>

<p><em>Sản phẩm mua tại FPT Shop l&agrave; h&agrave;ng ch&iacute;nh h&atilde;ng, kh&aacute;ch h&agrave;ng c&oacute; thể chọn mua trực tiếp tại cửa hàng, mua online hoặc gọi hotline 1800 6601 để được tư vấn, mua h&agrave;ng nhanh.</em></p>
', 1, N'Chào đón tháng dành riêng cho phái đẹp, FPT Shop mang đến cho khách hàng những gợi ý quà tặng độc đáo dành cho Người thương mừng lễ 08/03. Trong đó, Redmi Note 13 Pro là lựa chọn tinh tế khi sở hữu vẻ ngoài lôi cuốn cùng nhiều tính năng hiện đại.', N'redmi pro 13.webp', 5, CAST(N'2024-03-05' AS Date), NULL, NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'Apple vừa khai tử chiếc MacBook tốt nhất', N'<p>Mới đ&acirc;y, Apple đ&atilde; ch&iacute;nh thức ra mắt d&ograve;ng MacBook Air mới, sở hữu chip Apple M3 với hai phi&ecirc;n bản 13 v&agrave; 15 inch. Song song với m&agrave;n ra mắt của MacBook Air mới, Apple cũng đ&atilde; khai tử hai mẫu MacBook Air kh&aacute;c trong ph&acirc;n kh&uacute;c hiện tại. Nếu như sự biến mất của MacBook Air M2 15 inch kh&ocirc;ng phải mất m&aacute;t qu&aacute; lớn do đ&atilde; c&oacute; chiếc MacBook Air M3 15 inch mới thế chỗ, th&igrave; sự ra đi của chiếc MacBook Air M1 hẳn sẽ khiến kh&ocirc;ng &iacute;t người tỏ ra luyến tiếc.</p>

<p>Ra mắt năm 2020, MacBook Air M1 l&agrave; chiếc laptop đầu ti&ecirc;n nằm trong kế hoạch chuyển đổi từ chip Intel sang chip do Apple tự sản xuất. D&ugrave; chỉ c&aacute;ch nhau 1 năm, nhưng chiếc MacBook Air M1 v&agrave; chiếc MacBook Air chạy chip Intel trước đ&oacute; như hai sản phẩm ho&agrave;n to&agrave;n kh&aacute;c biệt.&nbsp;</p>

<p>&nbsp;</p>

<p><a href="https://genk.mediacdn.vn/139269124445442048/2024/3/4/screen-shot-2020-11-10-at-112929-am-170956624977373417007.jpg" target="_blank" title="MacBook Air là máy Mac đầu tiên được Apple công bố chuyển sang sử dụng chip M1"><img alt="Apple vừa khai tử chiếc MacBook tốt nhất- Ảnh 1." id="img_77668129556496384" src="https://genk.mediacdn.vn/thumb_w/640/139269124445442048/2024/3/4/screen-shot-2020-11-10-at-112929-am-170956624977373417007.jpg" style="height:784px; width:1400px" title="Apple vừa khai tử chiếc MacBook tốt nhất- Ảnh 1." /></a></p>

<p>MacBook Air l&agrave; m&aacute;y Mac đầu ti&ecirc;n được Apple c&ocirc;ng bố chuyển sang sử dụng chip M1</p>

<p>MacBook Air M1 nhanh hơn, thời lượng pin d&agrave;i hơn, kh&ocirc;ng tỏa nhiệt v&agrave; thậm ch&iacute; kh&ocirc;ng ph&aacute;t ra tiếng ồn do kh&ocirc;ng c&oacute; quạt. Người d&ugrave;ng c&oacute; thể thực hiện những t&aacute;c vụ m&agrave; kh&ocirc;ng một chiếc MacBook Air với chip Intel n&agrave;o trước đ&oacute; c&oacute; thể l&agrave;m được, v&iacute; dụ như thiết kế đồ họa chuy&ecirc;n nghiệp, l&agrave;m nhạc, chỉnh sửa video hay thậm ch&iacute; cả chơi game. MacBook Air dường như c&oacute; thể l&agrave;m tất cả mọi thứ.</p>

<p>Tới năm 2022, Apple tung ra chip M2 v&agrave; c&aacute;c mẫu MacBook 13 inch đi k&egrave;m, trong đ&oacute; c&oacute; MacBook Air mới. MacBook Air M2 mang tới nhiều n&acirc;ng cấp gi&aacute; trị như m&agrave;n h&igrave;nh Liquid Retina lớn hơn, webcam Full HD, thời lượng pin hay cổng sạc nam ch&acirc;m MagSafe.&nbsp;</p>

<p>&nbsp;</p>

<p><a href="https://genk.mediacdn.vn/139269124445442048/2024/3/4/maxresdefault-6-17095664650972146235085.jpg" target="_blank" title="MacBook Air M2 sở hữu nhiều nâng cấp, nhưng không đủ để thu hút người dùng M1 lên đời (ảnh: ZONEofTECH)"><img alt="Apple vừa khai tử chiếc MacBook tốt nhất- Ảnh 2." id="img_77668581357768704" src="https://genk.mediacdn.vn/thumb_w/640/139269124445442048/2024/3/4/maxresdefault-6-17095664650972146235085.jpg" style="height:720px; width:1280px" title="Apple vừa khai tử chiếc MacBook tốt nhất- Ảnh 2." /></a></p>

<p>MacBook Air M2 sở hữu nhiều n&acirc;ng cấp, nhưng kh&ocirc;ng đủ để thu h&uacute;t người d&ugrave;ng M1 l&ecirc;n đời (ảnh: ZONEofTECH)</p>

<p>Bất chấp những n&acirc;ng cấp n&agrave;y, hầu hết người d&ugrave;ng kh&ocirc;ng t&igrave;m thấy l&yacute; do thuyết phục n&agrave;o để từ bỏ chiếc MacBook Air M1 của m&igrave;nh. Thậm ch&iacute;, MacBook Air M1 c&ograve;n trở n&ecirc;n hấp dẫn hơn khi được Apple giảm gi&aacute; c&ograve;n 999 USD (v&agrave; thấp hơn nữa tại c&aacute;c đại l&yacute; b&aacute;n lẻ), một m&oacute;n hời so với những g&igrave; n&oacute; mang lại.&nbsp;</p>

<p>Tại Việt Nam, người d&ugrave;ng c&oacute; thể sở hữu MacBook Air M1 với gi&aacute; khoảng hơn 18 triệu đồng cho m&aacute;y mới, cũng l&agrave; mức gi&aacute; thấp nhất cho một chiếc MacBook. Trong khi đ&oacute;, MacBook Air M2 hiện vẫn đang được b&aacute;n với gi&aacute; hơn 26 triệu đồng, một số tiền ch&ecirc;nh lệch kh&ocirc;ng nhỏ. Đương nhi&ecirc;n, điều n&agrave;y c&oacute; thể sẽ thay đổi trong thời gian tới khi Apple khai tử MacBook Air M1 v&agrave; hạ gi&aacute; MacBook Air M2.</p>

<p>Thế chỗ cho MacBook Air M1 bị khai tử sẽ l&agrave; MacBook Air M2. Như đ&atilde; n&oacute;i ở tr&ecirc;n, MacBook Air M2 sở hữu nhiều n&acirc;ng cấp, nhưng cũng chứng kiến việc bị Apple cắt giảm hiệu năng SSD, đặc biệt tr&ecirc;n phi&ecirc;n bản ti&ecirc;u chuẩn (256GB SSD). Điều n&agrave;y dẫn đến t&igrave;nh trạng MacBook Air M2 mặc d&ugrave; c&oacute; chip mạnh hơn, nhưng tốc độ xử l&yacute; lại chậm hơn MacBook Air M1 trong một số t&aacute;c vụ đ&ograve;i hỏi tốc độ đọc/ghi SSD.</p>

<p>&nbsp;</p>

<p><a href="https://genk.mediacdn.vn/139269124445442048/2024/3/4/tocdossdchamtrenmacbookairm2vamacbookprom227107d52818e54e1cb7b78b788366efa2-1709571346495712830316.jpg" target="_blank" title="Tất cả các dòng MacBook M2, trong đó bao gồm MacBook Air, đều có tốc độ SSD chậm hơn so với phiên bản M1 tương ứng (ảnh: Max Tech)"><img alt="Apple vừa khai tử chiếc MacBook tốt nhất- Ảnh 3." id="img_77678818386149376" src="https://genk.mediacdn.vn/thumb_w/640/139269124445442048/2024/3/4/tocdossdchamtrenmacbookairm2vamacbookprom227107d52818e54e1cb7b78b788366efa2-1709571346495712830316.jpg" style="height:786px; width:1500px" title="Apple vừa khai tử chiếc MacBook tốt nhất- Ảnh 3." /></a></p>

<p>Tất cả c&aacute;c d&ograve;ng MacBook M2, trong đ&oacute; bao gồm MacBook Air, đều c&oacute; tốc độ SSD chậm hơn so với phi&ecirc;n bản M1 tương ứng (ảnh: Max Tech)</p>

<p>V&igrave; vậy, nếu như bạn l&agrave; người đơn giản v&agrave; chỉ mong muốn c&oacute; một chiếc laptop mượt m&agrave;, đầy đủ tiện &iacute;ch v&agrave; thời lượng pin l&acirc;u với mức gi&aacute; kinh tế nhất, h&atilde;y t&igrave;m mua một chiếc MacBook Air M1 trước khi chiếc m&aacute;y n&agrave;y l&acirc;m v&agrave;o cảnh &quot;cạn kho&quot; tại c&aacute;c đại l&yacute;.</p>
', 2, N'Mẫu MacBook này được người dùng ưa chuộng bởi sự cân bằng giữa hiệu năng và giá bán.', N'DSCF3483-1686014164-7221-1688583032.jpg', 5, CAST(N'2024-03-05' AS Date), 5, CAST(N'2024-03-05' AS Date))
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'AI chưa thể thay thế con người', N'<p>Glints v&agrave; Quỹ đầu tư Monk&#39;s Hill Ventures&nbsp; (MHV) vừa ph&aacute;t h&agrave;nh b&aacute;o c&aacute;o Nh&acirc;n t&agrave;i khởi nghiệp Đ&ocirc;ng Nam &Aacute; năm 2024 (Southeast Asia Startup Talent Trends Report 2024) cung cấp những ph&acirc;n t&iacute;ch chi tiết về xu hướng tuyển dụng, dữ liệu lương v&agrave; cổ phần cho c&aacute;c nh&agrave; s&aacute;ng lập v&agrave; nh&acirc;n sự cấp cao, cũng như nguồn nh&acirc;n lực khởi nghiệp.</p>

<p>Dữ liệu được khảo s&aacute;t hơn 10.000 điểm dữ liệu từ 183 nh&acirc;n sự cấp cao v&agrave; người s&aacute;ng lập v&agrave; 72 cuộc phỏng vấn với những nh&agrave; s&aacute;ng lập c&aacute;c startup từ khắp Singapore, Indonesia, Việt Nam v&agrave; Đ&agrave;i Loan (Trung Quốc). B&aacute;o c&aacute;o năm nay cũng đặc biệt ch&uacute; trọng đến t&aacute;c động của tr&iacute; tuệ nh&acirc;n tạo (AI) trong việc x&acirc;y dựng v&agrave; mở rộng đội ngũ cho c&aacute;c c&ocirc;ng ty startup; bao gồm cả xu hướng lương cho nh&acirc;n sự vận h&agrave;nh AI v&agrave; việc c&aacute;c c&ocirc;ng ty startup đang định h&igrave;nh thị trường nh&acirc;n sự trong khu vực.</p>

<p>C&ugrave;ng với đ&oacute; l&agrave; một số th&ocirc;ng tin nổi bật kh&aacute;c như mức lương từ c&aacute;c doanh nghiệp startup giảm nhiệt trong năm 2023, trong đ&oacute; những kỹ sư &iacute;t kinh nghiệm (Junior Engineer) bị sụt giảm nhiều nhất với 6%. Ri&ecirc;ng với thị trường Việt Nam, vị tr&iacute; c&oacute; mức lương sụt giảm nhiều nhất l&agrave; lập tr&igrave;nh vi&ecirc;n Back-end (Back-end Developer) với mức giảm l&ecirc;n đến 8,2%. Nguy&ecirc;n nh&acirc;n của việc sụt giảm n&agrave;y đến từ việc dư thừa nh&acirc;n sự tr&ecirc;n thị trường, ảnh hưởng của những l&agrave;n s&oacute;ng cắt giảm v&agrave; t&aacute;i cơ cấu bộ m&aacute;y trong giai đoạn kinh tế kh&oacute; khăn chung. Tuy nhi&ecirc;n, vẫn c&oacute; nhiều vị tr&iacute; chứng kiến mặt bằng lương tăng trưởng so với c&ugrave;ng kỳ năm ngo&aacute;i, chẳng hạn như mức tăng 2-3% đối với c&aacute;c vị tr&iacute; Kỹ sư dữ liệu (Data Engineer), Lập tr&igrave;nh vi&ecirc;n Full Stack (Full Stack Developer).</p>

<p>Ở chiều ngược lại, mức lương bộ phận ph&aacute;t triển kinh doanh v&agrave; b&aacute;n h&agrave;ng tăng mạnh với mức tăng l&ecirc;n tới 20%. Mức lương c&aacute;c vị tr&iacute; tạo doanh thu tiếp tục tăng trưởng tốt, điển h&igrave;nh tại Singapore với mức lương tăng trung b&igrave;nh hơn 14%. Tại thị trường Việt Nam, c&aacute;c vị tr&iacute; li&ecirc;n quan đến b&aacute;n h&agrave;ng cũng nằm trong top 3 những vị tr&iacute; c&oacute; nhu cầu tuyển dụng cao từ ph&iacute;a doanh nghiệp, phản &aacute;nh sự tập trung cao độ cho việc tạo doanh thu của c&aacute;c doanh nghiệp Đ&ocirc;ng Nam &Aacute; trong năm 2023.</p>

<p>&nbsp;</p>

<p><a href="https://genk.mediacdn.vn/139269124445442048/2024/3/5/18-tac-dong-cua-ai-len-nguon-nhan-luc-17095511937661385757458-1709599321832-1709599324086992622027.png" target="_blank" title="Tác động của AI lên nguồn nhân lực"><img alt="AI chưa thể thay thế con người- Ảnh 1." id="img_77636542245072896" src="https://genk.mediacdn.vn/139269124445442048/2024/3/5/18-tac-dong-cua-ai-len-nguon-nhan-luc-17095511937661385757458-1709599321832-1709599324086992622027.png" style="height:1080px; width:1920px" title="AI chưa thể thay thế con người- Ảnh 1." /></a></p>

<p>T&aacute;c động của AI l&ecirc;n nguồn nh&acirc;n lực</p>

<p>B&aacute;o c&aacute;o cũng chỉ ra&nbsp; AI hỗ trợ tăng hiệu suất c&ocirc;ng việc, nhưng vẫn chưa thể thay thế con người. C&aacute;c doanh nghiệp cho biết họ nhận thấy được sự lo lắng của nh&acirc;n vi&ecirc;n về việc bị thay thế khi ứng dụng AI v&agrave;o hệ thống. Tuy nhi&ecirc;n, t&iacute;nh tới hiện tại, AI vẫn chưa thể thay thế vai tr&ograve; của con người trong bất kỳ hệ thống n&agrave;o.</p>

<p>C&ugrave;ng với đ&oacute; xu hướng cho ph&eacute;p l&agrave;m việc từ xa song song với văn ph&ograve;ng (hybrid work) đang gia tăng khi c&aacute;c c&ocirc;ng ty khởi nghiệp ưu ti&ecirc;n t&iacute;nh linh hoạt để giữ ch&acirc;n nh&acirc;n t&agrave;i. T&iacute;nh linh hoạt trong c&ocirc;ng việc, đang trở th&agrave;nh xu hướng h&agrave;ng đầu trong c&aacute;c chiến lược giữ ch&acirc;n nh&acirc;n t&agrave;i của c&aacute;c c&ocirc;ng ty khởi nghiệp. Nỗ lực hướng tới m&ocirc; h&igrave;nh l&agrave;m việc kết hợp nhằm c&acirc;n bằng giữa hiệu quả hoạt động v&agrave; nhu cầu linh hoạt ng&agrave;y c&agrave;ng tăng của nh&acirc;n vi&ecirc;n, dự kiến sẽ tiếp tục k&eacute;o d&agrave;i trong năm 2024.</p>

<p>&quot;Bước v&agrave;o thời đại AI, nhu cầu n&agrave;y c&agrave;ng thể hiện r&otilde; r&agrave;ng hơn khi c&aacute;c c&ocirc;ng ty phải t&igrave;m kiếm những chuy&ecirc;n gia với kỹ năng đặc th&ugrave;. Tuy nhi&ecirc;n, c&aacute;c c&ocirc;ng ty khởi nghiệp cũng coi trọng c&aacute;c kỹ năng mềm như l&atilde;nh đạo, khả năng th&iacute;ch ứng v&agrave; giải quyết vấn đề...&nbsp; Điều n&agrave;y cho thấy được sự cần thiết trong việc c&acirc;n bằng c&aacute;c bộ kỹ năng nhằm th&uacute;c đẩy đổi mới v&agrave; tăng trưởng của c&ocirc;ng ty.&quot; B&agrave; Jessica Le, Gi&aacute;m đốc điều h&agrave;nh của Glints Việt Nam chia sẻ.</p>

<p>&quot;Tr&iacute; tuệ nh&acirc;n tạo c&oacute; sức mạnh biến đổi c&aacute;c doanh nghiệp.&quot; &ocirc;ng Peng T. Ong, đồng s&aacute;ng lập MHV nhận định &quot;Bằng c&aacute;ch tận dụng AI để x&acirc;y dựng mối quan hệ s&acirc;u sắc hơn với kh&aacute;ch h&agrave;ng, c&aacute;c doanh nghiệp c&oacute; thể nắm bắt cơ hội để mang lại những gi&aacute; trị lớn hơn. So với Mỹ, việc ứng dụng AI ở Đ&ocirc;ng Nam &Aacute; vẫn c&ograve;n kh&aacute; mới mẻ, đ&acirc;y ch&iacute;nh l&agrave; cơ hội để ch&uacute;ng ta n&acirc;ng cao hiểu biết, x&aacute;c định c&aacute;c lĩnh vực &aacute;p dụng c&oacute; t&aacute;c động to lớn nhằm x&acirc;y dựng c&aacute;c doanh nghiệp đẳng cấp thế giới. Ch&uacute;ng t&ocirc;i hợp t&aacute;c với Glints trong b&aacute;o c&aacute;o n&agrave;y để cung cấp cho hệ sinh th&aacute;i những hiểu biết thực tế, gi&uacute;p c&aacute;c c&ocirc;ng ty x&acirc;y dựng chiến lược tốt hơn, cấu tr&uacute;c nh&oacute;m tốt hơn để khai th&aacute;c sự ph&aacute;t triển của AI, từ đ&oacute; ph&aacute;t triển c&aacute;c doanh nghiệp của họ.&quot;</p>
', 2, N' VTV.vn - Báo cáo của Glints và Monk''s Hill Ventures cũng phân tích chi tiết về xu hướng tuyển dụng, dữ liệu lương và cổ phần cho các nhà sáng lập và nhân sự cấp cao...', N'f9bfb40f2478fd9cb779af77867ddb54.jpg', 5, CAST(N'2024-03-05' AS Date), NULL, NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'FPT Shop ưu đãi trả góp 0% dành cho các sản phẩm laptop', N'<p><strong>Thương hiệu v&agrave; sản phẩm &aacute;p dụng:</strong></p>

<p>Chương tr&igrave;nh &aacute;p dụng cho c&aacute;c thương hiệu laptop nổi tiếng bao gồm Acer, Dell, Lenovo, MSI, Gigabyte, v&agrave; Asus Non &ndash; Gaming. Lưu &yacute;, ưu đ&atilde;i chỉ d&agrave;nh cho c&aacute;c model Asus kh&ocirc;ng bao gồm trong ph&acirc;n kh&uacute;c Gaming, tạo cơ hội cho đa dạng người d&ugrave;ng từ sinh vi&ecirc;n, chuy&ecirc;n vi&ecirc;n văn ph&ograve;ng đến những người y&ecirc;u th&iacute;ch c&ocirc;ng nghệ.</p>

<p><img alt="" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/178167/Originals/LAPTOP.jpg" style="height:400px; width:600px" /></p>

<h4><strong>Ưu đ&atilde;i trả g&oacute;p 0%</strong></h4>

<p>Đ&aacute;ng ch&uacute; &yacute; nhất trong chương tr&igrave;nh n&agrave;y ch&iacute;nh l&agrave; ưu đ&atilde;i trả g&oacute;p 0%, gi&uacute;p bạn dễ d&agrave;ng sở hữu những chiếc laptop mong muốn m&agrave; kh&ocirc;ng lo lắng về việc chi trả một lần. Điều kiện &aacute;p dụng r&otilde; r&agrave;ng v&agrave; minh bạch, mang đến sự thoải m&aacute;i v&agrave; tiện lợi tối đa cho kh&aacute;ch h&agrave;ng.</p>

<p>&Aacute;p dụng đồng thời với c&aacute;c chương tr&igrave;nh ưu đ&atilde;i kh&aacute;c của laptop. B&ecirc;n cạnh lợi &iacute;ch trả g&oacute;p 0%, kh&aacute;ch h&agrave;ng c&ograve;n được hưởng những ưu đ&atilde;i hotsale cực kỳ hấp dẫn từ c&aacute;c thương hiệu nổi tiếng.&nbsp;</p>

<h4><strong>Thời gian &aacute;p dụng</strong></h4>

<p>Chương tr&igrave;nh được &aacute;p dụng suốt cả th&aacute;ng 3/2024, mang đến cho bạn đủ thời gian để c&acirc;n nhắc v&agrave; lựa chọn sản phẩm ph&ugrave; hợp nhất với nhu cầu v&agrave; sở th&iacute;ch c&aacute; nh&acirc;n.</p>

<p>FPT Shop cam kết cung cấp sản phẩm ch&iacute;nh h&atilde;ng, đa dạng mẫu m&atilde; v&agrave; cấu h&igrave;nh, đ&aacute;p ứng mọi nhu cầu của kh&aacute;ch h&agrave;ng. D&ugrave; bạn chọn mua sắm trực tuyến hay trực tiếp tại cửa h&agrave;ng, FPT Shop đều mang đến trải nghiệm mua sắm tiện lợi, nhanh ch&oacute;ng v&agrave; an to&agrave;n. Với ch&iacute;nh s&aacute;ch bảo h&agrave;nh d&agrave;i hạn v&agrave; dịch vụ hỗ trợ sau b&aacute;n h&agrave;ng chuy&ecirc;n nghiệp, FPT Shop lu&ocirc;n đồng h&agrave;nh c&ugrave;ng trải nghiệm sản phẩm của bạn.</p>

<p>Đừng bỏ lỡ cơ hội hiếm c&oacute; n&agrave;y để sở hữu những chiếc laptop chất lượng từ c&aacute;c thương hiệu h&agrave;ng đầu với gi&aacute; ưu đ&atilde;i c&ugrave;ng chương tr&igrave;nh trả g&oacute;p.</p>
', 1, N'FPT Shop chính thức khởi động chương trình khuyến mãi chưa từng có dành cho laptop: Trả góp 0% áp dụng đồng thời các hotsale và các chương trình khuyến mãi hiện hành khác. Đây là cơ hội vàng cho những ai đang tìm kiếm cơ hội nâng cấp trải nghiệm công nghệ với chi phí hợp lý nhất.', N'RC_Collection_1000x1000 (2).webp', 5, CAST(N'2024-03-07' AS Date), NULL, NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (14, N'test', N'', 1, N'test editor', N'screenshot_2024-03-01_214705.png.jpg', 5, CAST(N'2024-03-11' AS Date), NULL, NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N'test', N'', 1, N'test', N'401832752_1795713484203293_3420306351722857123_n.jpg', 5, CAST(N'2024-03-11' AS Date), NULL, NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (16, N'asd', N'', 1, N'asd', N'pic_bulboff.gif', 5, CAST(N'2024-03-14' AS Date), NULL, NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, N'asd', N'', 1, N'asd', N'pic_bulboff.gif', 5, CAST(N'2024-03-14' AS Date), NULL, NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Description], [NewsGroupId], [heading], [image], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, N'Khuyến mãi ngày 8/3', N'', 1, N'Tri ân phụ nữ trong ngày, tưng bừng giảm giá', N'Screenshot 2024-03-04 183524.png', 5, CAST(N'2024-03-14' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[NewsGroup] ON 

INSERT [dbo].[NewsGroup] ([NewsGroupId], [NewsGroupName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Tin khuyến mãi', 5, CAST(N'2024-01-06' AS Date), 5, CAST(N'2024-01-06' AS Date))
INSERT [dbo].[NewsGroup] ([NewsGroupId], [NewsGroupName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Tin công nghệ', 5, CAST(N'2024-01-06' AS Date), NULL, CAST(N'2024-01-06' AS Date))
SET IDENTITY_INSERT [dbo].[NewsGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Address], [AdminId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status], [shipCost], [discountCost]) VALUES (1, 4, 25040000, N'Xã Cao Sơn,Huyện Đà Bắc,Tỉnh Hoà Bình', 7, 4, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending (PAID)', 50000, 0)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Address], [AdminId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status], [shipCost], [discountCost]) VALUES (2, 28, 40720860, N'Xã Kim Sơn,Thị xã Sơn Tây,TP. Hà Nội', 7, 28, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending (PAID)', 430860, 0)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Address], [AdminId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status], [shipCost], [discountCost]) VALUES (3, 29, 31540000, N'Xã Cổ Đô,Huyện Ba Vì,TP. Hà Nội', 7, 29, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending (PAID)', 50000, 0)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Address], [AdminId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status], [shipCost], [discountCost]) VALUES (4, 29, 54830000, N'Phường Vĩnh Phúc,Quận Ba Đình,TP. Hà Nội', 7, 29, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending (PAID)', 50000, 0)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Address], [AdminId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status], [shipCost], [discountCost]) VALUES (5, 1, 16030000, N'Phường Phú Lãm,Quận Hà Đông,TP. Hà Nội', 7, 1, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending', 50000, 1603000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsId], [ProductId], [Quantity], [OrderId], [ListPrice], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status]) VALUES (1, 3, 1, 1, 24990000, 4, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending')
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [ProductId], [Quantity], [OrderId], [ListPrice], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status]) VALUES (2, 24, 1, 2, 40290000, 28, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending')
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [ProductId], [Quantity], [OrderId], [ListPrice], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status]) VALUES (3, 36, 1, 3, 31490000, 29, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending')
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [ProductId], [Quantity], [OrderId], [ListPrice], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status]) VALUES (4, 22, 1, 4, 29790000, 29, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending')
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [ProductId], [Quantity], [OrderId], [ListPrice], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status]) VALUES (5, 3, 1, 4, 24990000, 29, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending')
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [ProductId], [Quantity], [OrderId], [ListPrice], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [status]) VALUES (6, 50, 2, 5, 7990000, 1, CAST(N'2024-03-15' AS Date), NULL, NULL, N'Pending')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (3, 1, N'iPhone12 Pro', N'Ra mắt vào cuối năm 2020, iPhone 12 series mang đến một luồng gió với trong phân khúc smartphone cao cấp. Với thiết kế đổi mới đột phá so với thế hệ trước cùng nhiều nâng cấp về hiệu năng đáng kể trên iPhone 12 Pro. Đây sẽ là một trong những chiếc điện thoại đáng được bạn lựa chọn nhất so với các chiếc điện thoại khác cùng phân khúc giá.', 20, 24990000, 5, CAST(N'2023-02-12' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (6, 1, N'iPhone12', N'Dù Apple vừa giới thiệu dòng điện thoại iPhone 13 series tuy nhiên iPhone 12 vẫn đang là một trong những sự lựa chọn hàng đầu ở thời điểm hiện tại. Chiếc flagship năm 2020 của "Táo khuyết" đang nhận được rất nhiều sự quan tâm của người dùng bởi mức giá dễ tiếp cận hơn so với thời điểm ra mắt, đồng thời được trang bị cấu hình, màn hình, camera ấn tượng trong tầm giá.', 12, 11590000, 5, CAST(N'2023-05-17' AS Date), NULL, NULL, 64)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (7, 1, N'iPhone11', N'iPhone 11 sở hữu hiệu năng khá mạnh mẽ, ổn định trong thời gian dài nhờ được trang bị chipset A13 Bionic. Màn hình LCD 6.1 inch sắc nét cùng chất lượng hiển thị Full HD của máy cho trải nghiệm hình ảnh mượt mà và có độ tương phản cao. Hệ thống camera hiện đại được tích hợp những tính năng công nghệ mới kết hợp với viên Pin dung lượng 3110mAh, giúp nâng cao trải nghiệm của người dùng.', 10, 10290000, 5, CAST(N'2022-09-04' AS Date), NULL, NULL, 64)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (9, 1, N'iPhone11', N'Ngoài phiên bản 128GB, bạn cũng có thể lựa chọn cho mình điện thoại iPhone 11 64GB nếu nhu cầu sử dụng của bạn không quá nhiều.', 5, 12190000, 5, CAST(N'2022-10-12' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (11, 1, N'iPhone13 Pro Max', N'iPhone 12 ra mắt cách đây chưa lâu, thì những tin đồn mới nhất về iPhone 13 Pro Max đã khiến bao tín đồ công nghệ ngóng chờ. Cụm camera được nâng cấp, màu sắc mới, đặc biệt là màn hình 120Hz với phần notch được làm nhỏ gọn hơn chính là những điểm làm cho thu hút mọi sự chú ý trong năm nay.', 18, 22990000, 5, CAST(N'2024-01-06' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (20, 1, N'iPhone13 Pro Max', N'iPhone 13 Pro Max 256GB được đánh giá là một trong những dòng iPhone có khả năng chụp ảnh siêu ấn tượng cùng với camera góc siêu rộng mang đến khả năng chụp ảnh thiếu sáng một cách đặc biệt. Không những thế, mà dòng iPhone này còn được đánh giá là có dung lượng bộ nhớ tốt, đáp ứng được đầy đủ các công việc hằng ngày
Xem thêm thông tin iPhone 13 Pro Max 512GB thiết kế đẳng cấp, mang lại trải nghiệm vượt trội cho người dùng', 7, 23990000, 5, CAST(N'2023-12-12' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (21, 1, N'iPhone14', N'iPhone 14 128GB sở hữu màn hình Retina XDR OLED kích thước 6.1 inch cùng độ sáng vượt trội lên đến 1200 nits. Máy cũng được trang bị camera kép 12 MP phía sau cùng cảm biến điểm ảnh lớn, đạt 1.9 micron giúp cải thiện khả năng chụp thiếu sáng. Mẫu iPhone 14 mới cũng mang trong mình con chip Apple A15 Bionic phiên bản 5 nhân mang lại hiệu suất vượt trội.', 12, 18390000, 5, CAST(N'2023-10-14' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (22, 1, N'iPhone14 Pro Max', N'iPhone 14 Pro Max được trang bị bộ vi xử lý Apple A16 Bionic. Apple đã tập trung vào hiệu quả sử dụng năng lượng, màn hình và camera với con chip mới của mình. CPU sáu nhân bao gồm hai nhân hiệu suất cao sử dụng năng lượng thấp hơn 20% và bốn nhân tiết kiệm pin chỉ sử dụng một phần ba năng lượng so với chip của các đối thủ cạnh tranh.', 3, 29790000, 5, CAST(N'2024-01-06' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (23, 1, N'iPhone 15 Plus', N'iPhone 15 Plus được đánh giá cao bởi màn hình Dynamic Island 6.7 inch với mặt kính lưng pha màu ấn tượng, chip A16 Bionic mạnh mẽ cùng cổng sạc USB-C cho khả năng sạc đầy nhanh chóng. Ngoài ra, phiên bản Plus thuộc series iPhone 15 còn sở hữu 5 phiên bản màu pastel thanh lịch phù hợp với nhiều đối tượng khách hàng: hồng, vàng, xanh lá, xanh dương, đen. Xem thêm các thông tin hữu ích khác về điện thoại iPhone 15 Plus sau đây!', 7, 24950000, 5, CAST(N'2024-01-06' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (24, 1, N'iPhone15 Pro Max', N'iPhone 15 Pro Max 512GB là ấn phẩm smartphone mới của Apple, nổi bật với bộ nhớ trong lên đến 512GB, cung cấp khả năng ghi nhớ, lưu trữ không giới hạn. Bên cạnh đó, thế hệ iPhone mới này cũng đặc biệt mang tới những trải nghiệm siêu mượt mà trong mọi tác vụ nhờ được kế thừa sức mạnh xử lý từ con chip A17 Pro. Chưa hết, máy còn đi kèm với cụm ba camera sau 48MP hỗ trợ chụp đêm và quay phim chuyên nghiệp, giúp nâng tầm khả năng nhiếp ảnh của người dùng.', 2, 40290000, 5, CAST(N'2024-01-06' AS Date), NULL, NULL, 512)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (26, 2, N'Samsung Galaxy S22 Ultra ', N'Điện thoại Samsung S22 Ultra phiên bản RAM 12GB cho cảm giác siêu mượt mà khi mở và đóng ứng dụng, đi kèm bộ nhớ trong 256GB cho bạn thoải mái lưu trữ những khung hình, thước phim chất lượng cao. Vi xử lý Qualcomm Snapdragon 8 Gen 1 hứa hẹn mang đến hiệu năng tuyệt đỉnh, xử lý mượt mà mọi tác vụ.', 17, 17550000, 5, CAST(N'2022-05-16' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (28, 2, N'Samsung Galaxy S23', N'Hiệu năng vượt trội với con chip hàng đầu Qualcomm - Phục vụ tốt nhu cầu đa nhiệm ngày của người dùng. Trang bị bộ 3 ống kính với camera chính 50MP - Đem lại khả năng quay video và chụp ra những bức ảnh tốt, hài hòa, sống động hơn. Nâng cấp trải nghiệm với màn hình Dynamic AMOLED 2X - Phù hợp dùng để xem phim hay chơi các tựa game có nội dung hình ảnh đồ họa cao. Sở hữu lối thiết kế sang trọng, đẳng cấp cùng các bảng màu sắc thời thượng, trẻ trung.', 11, 13990000, 5, CAST(N'2022-03-23' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (29, 2, N'Samsung Galaxy S23 FE 5G', N'Galaxy S23 FE được đánh giá cao từ thiết kế cho đến hiệu năng của sản phẩm, được nhà sản xuất quan tâm khi trang bị công nghệ hiện đại trong sản xuất. Nhà Samsung cũng luôn đổi mới điện thoại mỗi khi ra mắt chính điều đó mà người dùng cũng hy vọng với sản phẩm lần này.', 23, 12890000, 5, CAST(N'2022-07-21' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (31, 2, N'Samsung Galaxy S23 Plus', N'Samsung Galaxy S23 Plus trang bị màn hình 6.6 inch, công nghệ màn hình sắc nét, với cụm camera sau ấn tượng với camera góc siêu rộng 12 MP, camera góc rộng 50MP, ống kính tele 10MP . Bên cạnh đó, với con chipset mạnh mẽ Snapdragon 8 Gen 2, RAM 8GB và phiên bản bộ nhớ trong 256GB/512GB ổn định khi dùng trong thời gian dài. Người dùng sẽ có những khoảnh khắc bên điện thoại cả ngày, chiến game, giải trí với dung lượng pin 4700mAh.', 19, 17990000, 5, CAST(N'2023-08-21' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (32, 2, N'Samsung Galaxy S23 Ultra', N'Sau sự đổ bộ thành công của Samsung Galaxy S22 những chiếc điện thoại dòng Flagship tiếp theo - Điện thoại Samsung Galaxy S23 Ultra là đối tượng được Samfans hết mực săn đón. Kiểu dáng thanh lịch sang chảnh kết hợp với những bước đột phá trong công nghệ đã kiến tạo nên siêu phẩm Flagship nhà Samsung.', 16, 22890000, 5, CAST(N'2023-12-03' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (33, 2, N'Samsung Galaxy Z Flip4', N'Tiếp tục là một mẫu smartphone màn hình gập độc đáo, đầy lôi cuốn và mới mẻ từ hãng công nghệ Hàn Quốc, dự kiến sẽ có tên là Samsung Galaxy Z Flip 4 với nhiều nâng cấp. Đây hứa hẹn sẽ là một siêu phẩm bùng nổ trong thời gian tới và thu hút được sự quan tâm của đông đảo người dùng với nhiều cải tiến từ ngoại hình, camera, bộ vi xử lý và viên pin được nâng cấp.', 15, 11690000, 5, CAST(N'2023-12-27' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (34, 2, N'Samsung Galaxy Z Flip5 ', N'Samsung Galaxy Z Flip 5 có thiết kế màn hình rộng 6.7 inch và độ phân giải Full HD+ (1080 x 2640 Pixels), dung lượng RAM 8GB, bộ nhớ trong 256GB. Màn hình Dynamic AMOLED 2X của điện thoại này hiển thị rõ nét và sắc nét, mang đến trải nghiệm ấn tượng khi sử dụng.', 13, 16990000, 5, CAST(N'2023-12-24' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (35, 2, N'Samsung Galaxy A15 LTE', N'Samsung Galaxy A15 được trang bị công nghệ màn hình cao cấp Super AMOLED, với độ phân giải FHD+ 1080 x 2340 pixel. Màn hình của sản phẩm lớn 6.5inch kết hợp với tần số quét nhanh, hạn chế tình trạng bị chớp màn hình hay bị nhòe khi sử dụng. Chiếc điện thoại mới của dòng Samsung Galaxy A này còn có cụm camera sắc nét và bộ nhớ lớn 8B+128GB sử dụng thả ga.', 11, 17250000, 5, CAST(N'2023-09-27' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (36, 2, N'Samsung Galaxy Z Fold5', N'Samsung Galaxy Z Fold5 12GB 256GB tạo nên trải nghiệm xử lý tác vụ siêu mượt mà thông qua chipset Snapdragon 8 Gen 2 đỉnh cao cùng dung lượng RAM lên tới 12GB. Máy được trang bị công nghệ màn hình Dynamic AMOLED 2X 120Hz với kích thước có thể lên tới 7.6 inch khi mở, đem lại trải nghiệm hình ảnh sắc nét trong từng điểm ảnh. Bên cạnh đó, phân khúc smartphone gập này còn sở hữu cụm camera hiện đại với độ sắc nét đạt tới 50MP cùng viên pin 4400mAh.', 20, 31490000, 5, CAST(N'2024-01-01' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (37, 3, N'OPPO Find N2', N'OPPO Find N2 trang bị hàng loạt thông số cấu hình cao như chip Snapdragon 8+ Gen 1, kết hợp 12GB RAM, tấm nền AMOLED, kích thước màn hình chính 7.1 inch, camera lên tới 50MP, dung lượng pin 4.520 mAh, sạc nhanh 67W.', 26, 1523000, 5, CAST(N'2022-09-23' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (38, 3, N'OPPO Find N2 Flip', N'OPPO Find N2 Flip có kích thước 3.26 inch ở màn hình ngoài và bên trong là 6.8 inch, đặc biệt là GẬP KHÔNG NÊP GẤP và công nghệ hình ảnh chuyên nghiệp - MariSilicon X. Ngoài ra smartphone sẽ được vận hành bởi con chip Dimensity 9000+, kèm dung lượng pin 4.300 mAh và sạc siêu nhanh Super VOOC 44W.', 30, 16990000, 5, CAST(N'2023-03-24' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (39, 3, N'OPPO Reno5', N'Sản phẩm mới nhất trong series OPPO Reno của hãng điện thoại OPPO chính là OPPO Reno 5. Chiếc điện thoại với nhiều kế thừa từ người tiền nhiệm Reno với thiết kế hiện đại, cấu hình cao hứa hẹn mang đến những trải nghiệm dùng ấn tượng. Ngoài ra, bạn cũng có thể tham khảo thêm điện thoại OPPO Reno 6 sắp ra mắt với nhiều nâng cấp về cấu hình cũng như camera.', 27, 7790000, 5, CAST(N'2023-10-22' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (40, 3, N'OPPO Reno7 5G', N'OPPO là thương hiệu điện thoại nổi tiếng với khả năng chụp hình đẹp và mẫu smartphone mới OPPO Reno7 cũng không ngoại lệ. Điện thoạikhông chỉ sở hữu thiết kế bắt mắt, camera chất lượng mà còn được trang bị một hiệu năng vượt trội.', 30, 7590000, 5, CAST(N'2023-07-11' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (41, 3, N'OPPO Reno 7 Pro', N'Điện thoại OPPO Reno7 Pro là mẫu điện thoại mới thuộc dòng OPPO Reno với thiết kế cùng hiệu năng vượt trội. Điện thoại OPPO Reno7 Pro sở hữu màu sắc với hiệu ứng đẹp mắt, khung viền vuông vức. Máy được trang bị màn hình 6,5 inch cùng tần số quét 90Hz mang lại những trải nghiệm hình ảnh mượt mà. Hiệu năng điện thoại đáp ứng mọi nhu câu sử dụng với con chip MediaTek 1200-MAX cùng viên pin 4500 mah hỗ trợ sạc nhanh công suất 65W.', 29, 9990000, 5, CAST(N'2023-03-19' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (42, 3, N'OPPO Reno8 5G', N'Oppo Reno8 5G sở hữu con chip MediaTek Dimensity 1300 5G cùng dung lượng RAM lên đến 8GB mang đến hiệu suất xử lý vô cùng mạnh mẽ. Với camera chính 50MP cùng hai cảm biến phụ ở mặt lưng, smartphone sẽ giúp bạn lưu lại những bức ảnh sắc nét. Thiết bị cũng thu hút sự chú ý bởi màn hình 6.43 inch AMOLED có độ phân giải Full HD+.', 30, 7990000, 5, CAST(N'2023-01-09' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (43, 3, N'OPPO Reno8 T 5G', N'OPPO Reno8 T sở hữu hiệu năng mạnh mẽ, trang bị bộ vi xử lý thế hệ mới Snapdragon 695, tấm nền AMOLED 6.7 inch, màn hình 1 tỉ màu mang lại chất lượng hình ảnh siêu sắc nét và sống động tới từng chi tiết.', 24, 7890000, 5, CAST(N'2022-12-24' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (44, 4, N'Xiaomi 13', N'Xiaomi 13 là sản phẩm mới được trang bị màn hình OLED kích thước 6.36 inch cùng tần số quét lên đến 120Hz. Bên trong Xiaomi 13 là con chip Snapdragon 8 Gen 2 mới nhất cùng bộ nhớ RAM 8GB vượt trội. Điện thoại cũng đáp ứng tốt khả năng nhiếp ảnh với camera Leica 50MP.', 35, 18090000, 5, CAST(N'2022-12-20' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (45, 4, N'Xiaomi 13 Lite', N'Xiaomi 13 Lite nổi bật nhờ cấu hình mạnh với chip Snapdragon 7 Gen 1, RAM 8GB LPDDR4x, ROM 256 GB. Ngoài ra, Mi 13 Lite còn sở hữu màn hình Full HD+ AMOLED 6.55 inch, tần số quét 120 Hz, phần khuyết đục lỗ chứa 2 camera selfie 32 MP.', 33, 8990000, 5, CAST(N'2022-07-27' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (46, 4, N'Xiaomi 13T', N'Xiaomi 13T đem tới trải nghiệm siêu mượt mà cho người dùng khi được trang bị chipset mạnh mẽ MediaTek Dimensity 8200-Ultra. Màn hình AMOLED thế hệ mới với tần số quét 144Hz giúp chất lượng hiển thị được sắc nét và chân thực trong từng điểm ảnh. Hệ thống quay chụp của máy cũng cực kỳ ấn tượng với cảm biến camera lên tới 50MP. Đồng thời, viên pin lên tới 5000mAh kết hợp với sạc nhanh 67W giúp nâng cao thời lượng sử dụng của người dùng.', 12, 11990000, 5, CAST(N'2023-04-22' AS Date), NULL, NULL, 256)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (47, 4, N'Xiaomi 12T', N'Xiaomi 12T là sản phẩm được nhiều tín đồ công nghệ đánh giá cao với màn hình AMOLED 6.67 inch độ phân giải cao, tần số quét 120Hz, chip MediaTek Dimensity 8100-Ultra, RAM 8GB và bộ nhớ trong 128GB. Thêm vào đó camera chính 108MP hỗ trợ chống rung OIS và sạc nhanh 120W cho trải nghiệm sử dụng cực chất. ', 33, 8990000, 5, CAST(N'2023-02-26' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (49, 4, N'Xiaomi Redmi 12C', N'Xiaomi Redmi 12C là mẫu điện thoại mới sắp được hãng cho ra mắt thị trường. Mang tới cho người dùng hiệu năng ổn định với con chip MediaTek Helio G85. Cùng với đó là thiết kế ấn tượng, vượt trội. Đặc biệt dung lượng pin siêu khủng tới 5000 mAh cùng sạc nhanh 10W. Đây chắc chắn sẽ là mẫu điện thoại nổi bật nhất trong phân khúc giá rẻ mà bất kỳ ai cũng không thể bỏ qua.', 45, 2390000, 5, CAST(N'2023-01-19' AS Date), NULL, NULL, 64)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (50, 4, N'Xiaomi Redmi Note 12 Pro 5G
', N'Xiaomi Redmi Note 12 Pro sở hữu cấu hình vượt trội gồm chip MediaTek Dimensity 1080, hệ thống ba camera với cảm biến chính 50MP và mạng 5G. Ngoài ra, màn hình Note 12 Pro 5G có kích thước khá lớn khoảng 6.67 inch, tấm nền AMOLED, tần số quét 120Hz khiến chiếc điện thoại nổi bật trong tầm giá dưới 8 triệu.', 40, 7990000, 5, CAST(N'2022-12-28' AS Date), NULL, NULL, 128)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Description], [Quantity], [Price], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Capacity]) VALUES (52, 4, N'Xiaomi Redmi Note 13 Pro+', N'Thuộc dòng Redmi cao cấp nhà Xiaomi Redmi Note 13 Pro Plus 5G đem đến một cảm nhận về độ tinh tế đi từ khâu thiết kế đến màn hình máy và cấu hình. Đây chắc chắn là một sản phẩm điện thoại Xiaomi đáng chú ý mà người dùng không nên bỏ lỡ.', 20, 10520000, 5, CAST(N'2024-01-06' AS Date), NULL, NULL, 256)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (1, N'iphone_12_pro.png', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (2, N'iphone-12.png', NULL, NULL, NULL, NULL, 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (3, N'iphone-11.png', NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (4, N'iphone-11-128gb.png', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (5, N'iphone-13-pro-max.png', NULL, NULL, NULL, NULL, 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (6, N'iphone-13-pro-max-256gb.png', NULL, NULL, NULL, NULL, 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (7, N'iphone-14_1.png', NULL, NULL, NULL, NULL, 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (8, N'iphone-14-pro-max-256gb.png', NULL, NULL, NULL, NULL, 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (9, N'iphone-15-plus-256gb.png', NULL, NULL, NULL, NULL, 23)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (10, N'iphone-15-pro-256gb.png', NULL, NULL, NULL, NULL, 24)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (11, N'samsung-galaxy-s22-ultra-12gb-256gb.png', NULL, NULL, NULL, NULL, 26)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (12, N'samsung-galaxy-s23-128gb_3_.png', NULL, NULL, NULL, NULL, 28)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (13, N'samsung-galaxy-s23-fe_6_.png', NULL, NULL, NULL, NULL, 29)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (14, N'samsung-galaxy-s23-plus.png', NULL, NULL, NULL, NULL, 31)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (15, N'samsung-galaxy-s23-ultra-12gb-512gb.png', NULL, NULL, NULL, NULL, 32)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (16, N'samsung-galaxy-z-flip-4.png', NULL, NULL, NULL, NULL, 33)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (17, N'samsung-galaxy-z-flip-5-256gb_1_4.png', NULL, NULL, NULL, NULL, 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (18, N'samsung-galaxy-z-fold-5.png', NULL, NULL, NULL, NULL, 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (19, N'samsung-galaxy-z-fold-5-256gb_1.png', NULL, NULL, NULL, NULL, 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (20, N'oppo-find-n2.png', NULL, NULL, NULL, NULL, 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (21, N'oppo-find-n2-flip.png', NULL, NULL, NULL, NULL, 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (22, N'oppo-reno-5_3_.png', NULL, NULL, NULL, NULL, 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (23, N'oppo-reno-7_1.png', NULL, NULL, NULL, NULL, 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (24, N'oppo-reno7-pro_1.png', NULL, NULL, NULL, NULL, 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (25, N'oppo-reno-8-5g.png', NULL, NULL, NULL, NULL, 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (26, N'oppo-reno-8t.png', NULL, NULL, NULL, NULL, 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (27, N'xiaomi-13.png', NULL, NULL, NULL, NULL, 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (28, N'xiaomi-13-lite.png', NULL, NULL, NULL, NULL, 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (29, N'xiaomi-13t_1__1_2.png', NULL, NULL, NULL, NULL, 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (30, N'xiaomi-mi-12t.png', NULL, NULL, NULL, NULL, 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (31, N'xiaomi-redmi-12c.png', NULL, NULL, NULL, NULL, 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (32, N'xiaomi-redmi-note-12-pro-5g.png', NULL, NULL, NULL, NULL, 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (33, N'xiaomi-redmi-note-13-pro-plus_9_.png', NULL, NULL, NULL, NULL, 52)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (34, N'2_240_3.jpg', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (35, N'0003_iphone-12-pro-max-nonlogo-11_1_2.jpg', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (36, N'3_223_3.jpg', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (37, N'4_185_4.jpg', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (38, N'0005_iphone-12-pro-max-nonlogo-17_1_2.jpg', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ImagePath], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ProductId]) VALUES (39, N'iphone_12_pro.jpg', NULL, NULL, NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (6, 3, 4, N'Great!!!', 5, N'2024-03-09')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (7, 6, 4, N'Its good', 4, N'2024-03-09')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (8, 3, 9, N'Khác tốt trong tầm giá !!!!', 3, N'2024-03-14')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (9, 3, 5, N'Tạm được', 3, N'2024-03-09')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (10, 6, 5, N'Quá tệ', 2, N'2024-03-09')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (11, 3, 7, N'Mọi thứ đều rất tốt', 5, N'2024-03-09')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (12, 6, 7, N'Tốt', 4, N'2024-03-09')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (13, 3, 15, N'Good', 5, N'2024-03-09')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (14, 3, 18, N'Rất tốt, nên mua', 5, N'2024-03-09')
INSERT [dbo].[Review] ([reviewID], [ProductId], [CustomerId], [comment], [star], [time_new]) VALUES (15, 6, 18, N'', 5, N'2024-03-09')
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [Rolename], [Description], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Admin', N'Chủ cửa hàng', NULL, CAST(N'2024-01-04' AS Date), NULL, NULL)
INSERT [dbo].[Role] ([RoleId], [Rolename], [Description], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'OrderStaff', N'Nhân viên hỗ trợ đơn hàng', NULL, CAST(N'2024-01-14' AS Date), NULL, NULL)
INSERT [dbo].[Role] ([RoleId], [Rolename], [Description], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Staff', N'Nhân viên quản lý sản phẩm', NULL, CAST(N'2024-01-27' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[CommentNews]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CommentNews] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CommentNews] CHECK CONSTRAINT [FK_Customer_CommentNews]
GO
ALTER TABLE [dbo].[CommentNews]  WITH CHECK ADD  CONSTRAINT [FK_News_CommentNews] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([NewsId])
GO
ALTER TABLE [dbo].[CommentNews] CHECK CONSTRAINT [FK_News_CommentNews]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([NewsGroupId])
REFERENCES [dbo].[NewsGroup] ([NewsGroupId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[Admin] ([AdminId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
