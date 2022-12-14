USE [PRJ301_SP22]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/24/2022 10:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[pname] [nvarchar](150) NOT NULL,
	[pimg] [nvarchar](200) NOT NULL,
	[pprice] [decimal](19, 2) NOT NULL,
	[pquantity] [int] NULL,
	[ptotal] [decimal](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/24/2022 10:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/24/2022 10:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[img] [nvarchar](200) NOT NULL,
	[price] [decimal](19, 2) NOT NULL,
	[title] [nvarchar](100) NULL,
	[description] [nvarchar](100) NOT NULL,
	[cateID] [int] NOT NULL,
 CONSTRAINT [PK__Product__3213E83F10D8A671] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrder]    Script Date: 3/24/2022 10:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrder](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](150) NOT NULL,
	[uemail] [varchar](150) NOT NULL,
	[uaddress] [nvarchar](150) NOT NULL,
	[uphone] [varchar](150) NOT NULL,
	[pname] [nvarchar](150) NOT NULL,
	[pdes] [nvarchar](150) NOT NULL,
	[pprice] [decimal](19, 2) NOT NULL,
	[pquantity] [int] NULL,
	[opay] [nvarchar](150) NOT NULL,
	[uid] [int] NULL,
	[orderTime] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 3/24/2022 10:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[sId] [int] IDENTITY(1,1) NOT NULL,
	[oid] [int] NULL,
	[status] [nvarchar](500) NULL,
	[details] [nvarchar](500) NULL,
	[updateTime] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/24/2022 10:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](150) NOT NULL,
	[uemail] [varchar](150) NOT NULL,
	[upass] [varchar](150) NOT NULL,
	[uaddress] [nvarchar](500) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK__Users__DD7012648A7A6ACF] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Sungla')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Dior Updated')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Prada')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (6, N'Gucci')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [img], [price], [title], [description], [cateID]) VALUES (9, N'Kính ABCD', N'glass2.png', CAST(500.00 AS Decimal(19, 2)), N'nothing', N'nothing', 3)
INSERT [dbo].[Product] ([id], [name], [img], [price], [title], [description], [cateID]) VALUES (10, N'Kính Râm', N'glass3.png', CAST(400.00 AS Decimal(19, 2)), NULL, N'nothing2', 3)
INSERT [dbo].[Product] ([id], [name], [img], [price], [title], [description], [cateID]) VALUES (11, N'Kính Cận', N'glass4.png', CAST(300.00 AS Decimal(19, 2)), NULL, N'nothing3', 4)
INSERT [dbo].[Product] ([id], [name], [img], [price], [title], [description], [cateID]) VALUES (12, N'Kính mắt2', N'glass5.png', CAST(400.00 AS Decimal(19, 2)), N'nothing4', N'nothing4', 1)
INSERT [dbo].[Product] ([id], [name], [img], [price], [title], [description], [cateID]) VALUES (16, N'Kính Râm 2', N'glass7.png', CAST(600.00 AS Decimal(19, 2)), NULL, N'nothing6', 3)
INSERT [dbo].[Product] ([id], [name], [img], [price], [title], [description], [cateID]) VALUES (17, N'Kính Cận 2', N'glass8.png', CAST(550.00 AS Decimal(19, 2)), NULL, N'nothing7', 3)
INSERT [dbo].[Product] ([id], [name], [img], [price], [title], [description], [cateID]) VALUES (18, N'Kính không tròng', N'glass1.png', CAST(400.50 AS Decimal(19, 2)), N'ABCDEFGHIJKLmn', N'ABCDEFGHIJKLmn', 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductOrder] ON 

INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (1, N'Kieu Minh Date', N'nhiep2371@gmail.com', N'DP HN', N'0369602512', N'Kính Lão', N'glass2.png', CAST(500.00 AS Decimal(19, 2)), 2, N'Paypal', 2, CAST(N'2022-03-16T16:27:00' AS SmallDateTime))
INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (2, N'Kieu Minh Date', N'nhiep2371@gmail.com', N'DP HN', N'0369602512', N'Kính mắt', N'glass1.png', CAST(1000.00 AS Decimal(19, 2)), 3, N'Paypal', 2, CAST(N'2022-03-16T16:27:00' AS SmallDateTime))
INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (3, N'Kieu Minh Date', N'nhiep2371@gmail.com', N'DP HN', N'0369602512', N'Kính mắt', N'glass1.png', CAST(1000.00 AS Decimal(19, 2)), 2, N'Paypal', 2, CAST(N'2022-03-16T16:27:00' AS SmallDateTime))
INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (4, N'Kieu Minh Date', N'nhiep2371@gmail.com', N'DP HN', N'0369602512', N'Kính Lão', N'glass2.png', CAST(250.00 AS Decimal(19, 2)), 1, N'Paypal', 2, CAST(N'2022-02-16T17:01:00' AS SmallDateTime))
INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (5, N'Kieu Minh Date', N'nhiep2371@gmail.com', N'DP HN', N'0369602512', N'Kính Râm', N'glass3.png', CAST(400.00 AS Decimal(19, 2)), 3, N'Paypal', 2, CAST(N'2022-02-16T17:03:00' AS SmallDateTime))
INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (6, N'Kieu Minh Dat', N'nhiep2371@gmail.com', N'aaa', N'0369602512', N'Kính Lão', N'glass2.png', CAST(750.00 AS Decimal(19, 2)), 3, N'Paypal', 2, CAST(N'2022-02-17T00:07:00' AS SmallDateTime))
INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (7, N'Kieu Minh Dat', N'nhiep2371@gmail.com', N'aaa', N'0369602512', N'Kính Râm', N'glass3.png', CAST(400.00 AS Decimal(19, 2)), 1, N'Paypal', 2, CAST(N'2022-02-17T00:07:00' AS SmallDateTime))
INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (8, N'Kieu Minh Dat', N'nhiep2371@gmail.com', N'aaa', N'0369602512', N'Kính Lão2', N'glass6.png', CAST(350.00 AS Decimal(19, 2)), 1, N'Paypal', 2, CAST(N'2022-02-17T00:07:00' AS SmallDateTime))
INSERT [dbo].[ProductOrder] ([oid], [uname], [uemail], [uaddress], [uphone], [pname], [pdes], [pprice], [pquantity], [opay], [uid], [orderTime]) VALUES (11, N'Kieu Minh Dat', N'datkmhe150913@fpt.edu.vn', N'aaa', N'123456789', N'Kính mắt2', N'glass5.png', CAST(300.00 AS Decimal(19, 2)), 1, N'Paypal', 2, CAST(N'2022-02-17T09:53:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ProductOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusOrder] ON 

INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (1, 1, N'Verifying your infomation', N'Verifying your information', CAST(N'2022-03-16T16:48:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (2, 2, N'Verifying your infomation', N'Verifying your infomation', CAST(N'2022-03-16T16:48:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (3, 3, N'Verifying your infomation', N'Verifying your infomation', CAST(N'2022-03-16T16:48:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (4, 1, N'Product has been sent to deliver', NULL, CAST(N'2022-03-17T16:00:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (5, 4, N'Verifying your information', N'Verifying your infomation', CAST(N'2022-02-16T17:01:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (6, 5, N'Verifying your information', N'Verifying your infomation', CAST(N'2022-02-16T17:03:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (7, 5, N'Shipping', N'Shipping', CAST(N'2022-02-17T00:04:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (8, 6, N'Verifying your information', N'Verifying your infomation', CAST(N'2022-02-17T00:07:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (9, 7, N'Verifying your information', N'Verifying your infomation', CAST(N'2022-02-17T00:07:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (10, 8, N'Verifying your information', N'Verifying your infomation', CAST(N'2022-02-17T00:07:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (16, 11, N'Verifying your information', N'Verifying your infomation', CAST(N'2022-02-17T09:53:00' AS SmallDateTime))
INSERT [dbo].[StatusOrder] ([sId], [oid], [status], [details], [updateTime]) VALUES (17, 11, N'Shipping', N'Shipping', CAST(N'2022-02-17T09:58:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[StatusOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([uid], [uname], [uemail], [upass], [uaddress], [isAdmin]) VALUES (1, N'Kieu Dat Minh', N'admin@gmail.com', N'123', N'ABC', 1)
INSERT [dbo].[Users] ([uid], [uname], [uemail], [upass], [uaddress], [isAdmin]) VALUES (2, N'Kieu Minh Dat', N'datkmhe150913@fpt.edu.vn', N'123', N'Ha Noi', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__D92E5BC07F5B599A]    Script Date: 3/24/2022 10:18:36 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__D92E5BC07F5B599A] UNIQUE NONCLUSTERED 
(
	[uemail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StatusOrder] ADD  DEFAULT (N'Đang xác minh thông tin') FOR [status]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK__Cart__uid__49C3F6B7] FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK__Cart__uid__49C3F6B7]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__cateID__45F365D3] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__cateID__45F365D3]
GO
ALTER TABLE [dbo].[ProductOrder]  WITH CHECK ADD  CONSTRAINT [FK__ProductOrde__uid__5070F446] FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[ProductOrder] CHECK CONSTRAINT [FK__ProductOrde__uid__5070F446]
GO
ALTER TABLE [dbo].[StatusOrder]  WITH CHECK ADD  CONSTRAINT [FK__StatusOrder__oid__4E88ABD4] FOREIGN KEY([oid])
REFERENCES [dbo].[ProductOrder] ([oid])
GO
ALTER TABLE [dbo].[StatusOrder] CHECK CONSTRAINT [FK__StatusOrder__oid__4E88ABD4]
GO
