USE [XceedTask]
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 
GO
INSERT [dbo].[Companies] ([Id], [DiscountPercentage], [Code], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsBlocked], [TitleAr], [TitleEn]) VALUES (1, 10, N'324156', CAST(N'2023-12-27T15:19:29.0002367' AS DateTime2), 0, NULL, 0, NULL, 0, N'الشركة العربية ', N'Arab Company')
GO
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[AssociationSections] ON 
GO
INSERT [dbo].[AssociationSections] ([Id], [NumberOfMonths], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (1, 6, N'ستة اشهر', N'Six Months', CAST(N'2023-12-22T01:42:06.1040022' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[AssociationSections] ([Id], [NumberOfMonths], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (2, 8, N'ثمانية اشهر', N'Eight Months', CAST(N'2023-12-22T01:42:06.1041654' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[AssociationSections] ([Id], [NumberOfMonths], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (3, 12, N'اثنى عشرة اشهر', N'Twelve Months', CAST(N'2023-12-22T01:42:06.1041681' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[AssociationSections] ([Id], [NumberOfMonths], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (4, 18, N'ثمانية عشرة اشهر', N'Eighteen Months', CAST(N'2023-12-22T01:42:06.1041692' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[AssociationSections] ([Id], [NumberOfMonths], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (5, 24, N'أربعة وعشرون شهر', N'Twenty Four Months', CAST(N'2023-12-22T01:42:06.1041696' AS DateTime2), 0, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[AssociationSections] OFF
GO
SET IDENTITY_INSERT [dbo].[Associations] ON 
GO
INSERT [dbo].[Associations] ([Id], [AssociationSectionId], [Price], [Fees], [StartDate], [EndDate], [IsShow], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10002, 2, 16000, 200, CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2023-12-24T12:17:07.7595087' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Associations] ([Id], [AssociationSectionId], [Price], [Fees], [StartDate], [EndDate], [IsShow], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20002, 1, 6000, 600, CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), 0, CAST(N'2023-12-27T20:43:57.1399361' AS DateTime2), 0, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Associations] OFF
GO
SET IDENTITY_INSERT [dbo].[Cycles] ON 
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (1, 0, N'الدور الاول', N'First Cycle', CAST(N'2023-12-22T01:42:06.2479552' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (2, 1, N'الدور الثاني', N'Second Cycle', CAST(N'2023-12-22T01:42:06.2480682' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (3, 2, N'الدور الثالث', N'Third Cycle', CAST(N'2023-12-22T01:42:06.2480713' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (4, 3, N'الدور الرابع', N'Fourth Cycle', CAST(N'2023-12-22T01:42:06.2480725' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (5, 4, N'الدور الخامس', N'Fifth Cycle', CAST(N'2023-12-22T01:42:06.2480729' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (6, 5, N'الدور السادس', N'Sixth Cycle', CAST(N'2023-12-22T01:42:06.2480737' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (7, 6, N'الدور السابع', N'Seventh Cycle', CAST(N'2023-12-22T01:42:06.2480740' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (8, 7, N'الدور الثامن', N'Eighth Cycle', CAST(N'2023-12-22T01:42:06.2480742' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (9, 8, N'الدور التاسع', N'Ninth Cycle', CAST(N'2023-12-22T01:42:06.2480745' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10, 9, N'الدور العاشر', N'Tenth Cycle', CAST(N'2023-12-22T01:42:06.2480749' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (11, 10, N'الدور الحادي عشر', N'Eleventh Cycle', CAST(N'2023-12-22T01:42:06.2480752' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (12, 11, N'الدور الثاني عشر', N'Twelfth Cycle', CAST(N'2023-12-22T01:42:06.2480755' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (13, 12, N'الدور الثالث عشر', N'Thirteenth Cycle', CAST(N'2023-12-22T01:42:06.2480758' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (14, 13, N'الدور الرابع عشر', N'Fourteenth Cycle', CAST(N'2023-12-22T01:42:06.2480760' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (15, 14, N'الدور الخامس عشر', N'Fifteenth Cycle', CAST(N'2023-12-22T01:42:06.2480763' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (16, 15, N'الدور السادس عشر', N'Sixteenth Cycle', CAST(N'2023-12-22T01:42:06.2480766' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (17, 16, N'الدور السابع عشر', N'Seventeenth Cycle', CAST(N'2023-12-22T01:42:06.2480769' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (18, 17, N'الدور الثامن عشر', N'Eighteenth Cycle', CAST(N'2023-12-22T01:42:06.2480778' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (19, 18, N'الدور التاسع عشر', N'Nineteenth Cycle', CAST(N'2023-12-22T01:42:06.2480810' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20, 19, N'الدور العشرون', N'Twentieth Cycle', CAST(N'2023-12-22T01:42:06.2480815' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (21, 20, N'الدور الحادي والعشرون', N'Twenty First Cycle', CAST(N'2023-12-22T01:42:06.2480817' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (22, 21, N'الدور الثاني والعشرون', N'Twenty Second Cycle', CAST(N'2023-12-22T01:42:06.2480820' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (23, 22, N'الدور الثالث والعشرون', N'Twenty Third Cycle', CAST(N'2023-12-22T01:42:06.2480823' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Cycles] ([Id], [NumberOfCycle], [TitleAr], [TitleEn], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (24, 23, N'الدور الرابع والعشرون', N'Twenty Fourth Cycle', CAST(N'2023-12-22T01:42:06.2480825' AS DateTime2), 0, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Cycles] OFF
GO
SET IDENTITY_INSERT [dbo].[AssociationCycles] ON 
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (10008, 10002, 1, 0, CAST(N'2023-12-24T12:19:37.9019604' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (10009, 10002, 2, 0, CAST(N'2023-12-24T12:19:37.9021283' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (10010, 10002, 3, 0, CAST(N'2023-12-24T12:19:37.9021399' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-03-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (10011, 10002, 4, 1, CAST(N'2023-12-24T12:19:37.9021496' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-04-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (10012, 10002, 5, 1, CAST(N'2023-12-24T12:19:37.9021651' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (10013, 10002, 6, 1, CAST(N'2023-12-24T12:19:37.9021852' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (10014, 10002, 7, 1, CAST(N'2023-12-24T12:19:37.9022056' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (10015, 10002, 8, 1, CAST(N'2023-12-24T12:19:37.9022124' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (20002, 20002, 1, 1, CAST(N'2023-12-27T20:43:57.1799086' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (20003, 20002, 2, 1, CAST(N'2023-12-27T20:43:57.1803840' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (20004, 20002, 3, 1, CAST(N'2023-12-27T20:43:57.1803952' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-03-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (20005, 20002, 4, 1, CAST(N'2023-12-27T20:43:57.1804217' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-04-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (20006, 20002, 5, 1, CAST(N'2023-12-27T20:43:57.1804309' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[AssociationCycles] ([Id], [AssociationId], [CycleId], [IsAvailable], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [DateTime]) VALUES (20007, 20002, 6, 1, CAST(N'2023-12-27T20:43:57.1804385' AS DateTime2), 0, NULL, 0, NULL, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[AssociationCycles] OFF
GO
INSERT [dbo].[Users] ([Id], [FullName], [DeviceToken], [RegistrationDate], [Status], [IsAdmin], [UserType], [UserImgUrl], [RandomCode], [IsDeleted], [Latitude], [Longitude], [AddressTitle], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [PermissibleLimit]) VALUES (N'10e3e376-a018-49a9-abc4-f92de87bfc71', N'superAdmin', NULL, CAST(N'2023-12-14T10:46:13.9111742' AS DateTime2), 1, 1, 0, N'/Files/AdminImg/948KD9R7HP_WhatsApp Image 2022-11-05 at 9.07.04 AM.jpeg', NULL, 0, -3.40282347E+38, -3.40282347E+38, N'', N'superAdmin123@gmail.com', N'SUPERADMIN123@GMAIL.COM', N'superAdmin123@gmail.com', N'SUPERADMIN123@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEAmBTz9ZA9Lr6M+OwS9F7bS7X/DA51zpBDH/VjFoZAkmY/rK0eLp+8W0WJQ36ACH5g==', N'QYF3UNCX6M4ZCMOYPKXUMRUKNOIYPPCM', N'2f3d72b3-85ca-4b55-af86-552aae5ff5bf', N'01551232341', 1, 0, NULL, 1, 0, 0)
GO
INSERT [dbo].[Users] ([Id], [FullName], [DeviceToken], [RegistrationDate], [Status], [IsAdmin], [UserType], [UserImgUrl], [RandomCode], [IsDeleted], [Latitude], [Longitude], [AddressTitle], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [PermissibleLimit]) VALUES (N'a1ca766a-6033-4d82-b972-188cee3595f7', N'Mahmoud sabry ', NULL, CAST(N'2023-12-25T15:21:50.1169315' AS DateTime2), 1, 0, 1, N'/File/Users\XHLE6EKY25_Users.jpeg', N'6211', 0, -3.40282347E+38, -3.40282347E+38, N'', N'01005149525', N'01005149525', N'MahmoudSabry123@example.com', N'MAHMOUDSABRY123@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEDJrGnGMsOBXpvGlQUYK09S+ZVJXv8NV13LBQVE2RC8qHxFm664+OYQANEe/GblxvA==', N'4CW3VDOIIN4B5WZ4QT4H6SDFF6WQREXT', N'a0d4bab4-2dd8-430d-a155-dc905a22943f', N'01005149525', 1, 0, NULL, 1, 0, 20000)
GO
INSERT [dbo].[Users] ([Id], [FullName], [DeviceToken], [RegistrationDate], [Status], [IsAdmin], [UserType], [UserImgUrl], [RandomCode], [IsDeleted], [Latitude], [Longitude], [AddressTitle], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [PermissibleLimit]) VALUES (N'a3771f32-d61e-4503-9cda-1fa13c55a2d5', N'Admin', NULL, CAST(N'2023-12-14T10:46:14.2172483' AS DateTime2), 1, 1, 0, N'/Files/AdminImg/5T13C5J7Z8_faba8b44-5bfb-4e58-bc37-695d1ab5bc31.jpeg', N'3359', 0, -3.40282347E+38, -3.40282347E+38, N'', N'admin123@gmail.com', N'ADMIN123@GMAIL.COM', N'admin123@gmail.com', N'ADMIN123@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJtf4qc5JgmN2aYVvgP3xw4a4lHiMdNfkWO3yNtwu/e3GAA9lG1HDs1M6YS5BG0A2g==', N'Q6WXTZ2U425UBQGNOIRKVO53MRH6KVUX', N'c6ee56e1-fe54-4ff4-bba5-e18ae56a7b93', N'01273409387', 1, 0, NULL, 1, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Services] ON 
GO
INSERT [dbo].[Services] ([Id], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow], [IsAssociations], [IsNeedCompany], [ImgUrl]) VALUES (1, N'Corporate associations', N'جمعيات الشركات ', CAST(N'2023-12-19T18:07:37.0799908' AS DateTime2), 0, NULL, 0, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[Services] ([Id], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow], [IsAssociations], [IsNeedCompany], [ImgUrl]) VALUES (2, N'Merchants associations', N'جمعيات التجار ', CAST(N'2023-12-19T18:07:58.1364593' AS DateTime2), 0, NULL, 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Services] ([Id], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow], [IsAssociations], [IsNeedCompany], [ImgUrl]) VALUES (3, N'Register a new company with us', N'تسجيل شركة جديدة لدينا ', CAST(N'2023-12-20T23:15:56.0290900' AS DateTime2), 0, NULL, 0, NULL, 1, 0, 0, NULL)
GO
INSERT [dbo].[Services] ([Id], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow], [IsAssociations], [IsNeedCompany], [ImgUrl]) VALUES (10003, N'People', N'أشخاص', CAST(N'2023-12-25T15:34:05.3916382' AS DateTime2), 0, NULL, 0, NULL, 1, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[UserOrders] ON 
GO
INSERT [dbo].[UserOrders] ([Id], [UserId], [AssociationId], [ServiceId], [Status], [IsCompletedData], [DiscountPercentage], [ReasonOfRefuse], [AssociationCycleId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [CompanyId]) VALUES (1, N'a1ca766a-6033-4d82-b972-188cee3595f7', 10002, 1, 4, 1, 10, N'', 10014, CAST(N'2023-12-31T08:01:05.9431629' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[UserOrders] ([Id], [UserId], [AssociationId], [ServiceId], [Status], [IsCompletedData], [DiscountPercentage], [ReasonOfRefuse], [AssociationCycleId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [CompanyId]) VALUES (2, N'a1ca766a-6033-4d82-b972-188cee3595f7', 10002, 1, 3, 1, 20, N'', 10012, CAST(N'2023-12-31T09:01:44.5470443' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[UserOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Installments] ON 
GO
INSERT [dbo].[Installments] ([Id], [UserOrderId], [Amount], [Date], [Status], [Notes], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (1, 1, 2000, CAST(N'2024-01-01T21:34:07.2130000' AS DateTime2), 1, N'', CAST(N'2024-01-01T21:34:07.2195280' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Installments] ([Id], [UserOrderId], [Amount], [Date], [Status], [Notes], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (2, 1, 2000, CAST(N'2024-02-01T21:34:07.2130000' AS DateTime2), 1, N'', CAST(N'2024-01-01T21:34:07.2205731' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Installments] ([Id], [UserOrderId], [Amount], [Date], [Status], [Notes], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (3, 1, 2000, CAST(N'2024-03-01T21:34:07.2130000' AS DateTime2), 4, N'', CAST(N'2024-01-01T21:34:07.2205812' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Installments] ([Id], [UserOrderId], [Amount], [Date], [Status], [Notes], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (4, 1, 2000, CAST(N'2024-04-01T21:34:07.2130000' AS DateTime2), 0, N'', CAST(N'2024-01-01T21:34:07.2205832' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Installments] ([Id], [UserOrderId], [Amount], [Date], [Status], [Notes], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (5, 1, 2000, CAST(N'2024-05-01T21:34:07.2130000' AS DateTime2), 0, N'', CAST(N'2024-01-01T21:34:07.2205852' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Installments] ([Id], [UserOrderId], [Amount], [Date], [Status], [Notes], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (6, 1, 2000, CAST(N'2024-06-01T21:34:07.2130000' AS DateTime2), 0, N'', CAST(N'2024-01-01T21:34:07.2205881' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Installments] ([Id], [UserOrderId], [Amount], [Date], [Status], [Notes], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (7, 1, 2000, CAST(N'2024-07-01T21:34:07.2130000' AS DateTime2), 3, N'', CAST(N'2024-01-01T21:34:07.2205902' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Installments] ([Id], [UserOrderId], [Amount], [Date], [Status], [Notes], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (8, 1, 2000, CAST(N'2024-08-01T21:34:07.2130000' AS DateTime2), 0, N'', CAST(N'2024-01-01T21:34:07.2205963' AS DateTime2), 0, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Installments] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 
GO
INSERT [dbo].[Cities] ([Id], [TitleAr], [TitleEn], [IsShow], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (1, N'القاهرة', N'Cairo', 1, CAST(N'2023-12-14T19:47:58.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[UnAssociationOrders] ON 
GO
INSERT [dbo].[UnAssociationOrders] ([Id], [UserId], [ServiceId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (1, N'a1ca766a-6033-4d82-b972-188cee3595f7', 3, CAST(N'2023-12-30T02:05:22.6615170' AS DateTime2), 0, NULL, 1, CAST(N'2023-12-30T02:37:00.6449507' AS DateTime2))
GO
INSERT [dbo].[UnAssociationOrders] ([Id], [UserId], [ServiceId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (2, N'a1ca766a-6033-4d82-b972-188cee3595f7', 3, CAST(N'2023-12-30T02:10:42.6584213' AS DateTime2), 0, NULL, 1, CAST(N'2023-12-30T02:36:56.9081575' AS DateTime2))
GO
INSERT [dbo].[UnAssociationOrders] ([Id], [UserId], [ServiceId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (3, N'a1ca766a-6033-4d82-b972-188cee3595f7', 3, CAST(N'2023-12-30T02:36:46.3857311' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[UnAssociationOrders] ([Id], [UserId], [ServiceId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (4, N'a1ca766a-6033-4d82-b972-188cee3595f7', 3, CAST(N'2023-12-30T03:06:38.8571233' AS DateTime2), 0, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[UnAssociationOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Requirements] ON 
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (1, N'Enter the name quadrilateral?', N'أدخل الاسم رباعى ؟', 0, 0, 0, 0, CAST(N'2023-12-19T10:50:51.2261261' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (2, N'Enter a phone number ?', N'أدخل رقم الهاتف ؟', 0, 0, 5, 0, CAST(N'2023-12-19T11:31:21.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (3, N'Another phone number, if available', N'رقم هاتف آخر إن وجد ', 1, 0, 5, 0, CAST(N'2023-12-19T11:39:38.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (4, N'Do you have an existing activity that has been established for at least a year?', N'هل لديك نشاط قائم ومر علي تأسيسه علي الاقل سنة ', 0, 0, 3, 0, CAST(N'2023-12-19T11:41:17.7832727' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (5, N'Front side of the card', N'الجانب الامامي من البطاقة', 0, 1, 2, 0, CAST(N'2023-12-19T11:41:59.2434515' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (6, N'Back side of the card', N'الجانب الخلفي من البطاقة', 0, 1, 2, 0, CAST(N'2023-12-19T11:42:38.1091247' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (7, N'commercial register', N'السجل التجاري ', 0, 1, 2, 0, CAST(N'2023-12-19T11:43:39.2800736' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (8, N'Tax card', N'البطاقة الضريبية ', 0, 1, 2, 0, CAST(N'2023-12-19T11:43:54.0724084' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (9, N'Proof of residence (copy of receipt attached)', N'اثبات سكن ( صورة ايصال مرفق )', 0, 1, 2, 0, CAST(N'2023-12-19T11:44:47.9632115' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10, N'A picture of the activity headquarters', N'صورة لمقر النشاط ', 0, 1, 2, 0, CAST(N'2023-12-19T11:45:25.7605760' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (11, N'Enter the activity type', N'أدخل نوع النشاط', 0, 0, 0, 0, CAST(N'2023-12-19T11:46:12.6143625' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (12, N'Full house address with all details', N'عنوان المنزل بالكامل بكل التفاصيل', 0, 2, 0, 0, CAST(N'2023-12-19T11:46:51.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (13, N'The City in which the house is located', N'المحافظة التي بها المنزل', 0, 2, 1, 1, CAST(N'2023-12-19T11:47:57.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (14, N'The City in which the store is located', N'المحافظة التي بها المتجر', 0, 2, 1, 1, CAST(N'2023-12-19T11:48:33.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (15, N'Full store address with all details', N'عنوان المتجر بالكامل بكل التفاصيل ', 0, 2, 0, 0, CAST(N'2023-12-19T11:49:18.1217797' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (16, N'The time available for you to spend the contract at the address', N'الوقت المتاح لك لإمضاء العقد في العنوان', 0, 2, 1, 2, CAST(N'2023-12-19T12:05:29.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (17, N'Where do you want to sign the contract?', N'أين تريد إمضاء العقد ؟', 0, 2, 1, 2, CAST(N'2023-12-19T12:07:35.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (18, N'Yes, I agree for XceedTask to view and process my personal information', N'نعم أوافق علي ان تقوم شركة سيركلز بالأطلاع والعمل علي معلوماتي الشخصية', 0, 2, 3, 0, CAST(N'2023-12-20T15:23:50.5961776' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (19, N' Experience in the activity', N'الخبرة في النشاط', 0, 0, 1, 2, CAST(N'2023-12-20T16:03:25.9828268' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20, N'Net monthly income', N'صافي الدخل الشهري ', 0, 0, 1, 2, CAST(N'2023-12-20T16:04:13.2522980' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (21, N'Enter the company name', N'أدخل أسم الشركة ', 0, 3, 0, 0, CAST(N'2023-12-20T23:46:56.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (22, N'Number of Employees', N'عدد الموظفين ', 0, 3, 4, 0, CAST(N'2023-12-20T23:47:23.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (23, N'Name of the company owner', N'اسم صاحب الشركة ', 0, 3, 0, 0, CAST(N'2023-12-20T23:47:54.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (24, N'Total monthly salaries of employees', N'مجموع الرواتب الشهرية للموظفين ', 0, 3, 1, 2, CAST(N'2023-12-20T23:48:29.0000000' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10002, N' Enter the subscription code', N'أدخل كود الاشتراك', 1, 0, 0, 0, CAST(N'2023-12-25T15:31:19.7621009' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10003, N'A photo of the club card', N'صورة كارنية النادي', 1, 1, 2, 0, CAST(N'2023-12-25T15:32:08.9689340' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[Requirements] ([Id], [Name], [NameAr], [MandatoryType], [RequirementCategory], [RequirementType], [CitySelection], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10004, N'Photo to driving license', N'صورة رخصة القيادة', 1, 1, 2, 0, CAST(N'2023-12-25T15:33:08.0281553' AS DateTime2), 0, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Requirements] OFF
GO
SET IDENTITY_INSERT [dbo].[RequirementSelections] ON 
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (1, 16, N'From 8 - 12 am', N'من 8 - 12 صباحا ', CAST(N'2023-12-19T18:02:34.4679259' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (2, 16, N'From 12 - 4 pm', N'من 12 - 4 ظهرا ', CAST(N'2023-12-19T18:03:22.1700164' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (3, 16, N'From 4 - 8 pm', N'من 4 - 8 ظهرا ', CAST(N'2023-12-19T18:03:48.6683517' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (4, 16, N'From 8 - 12 pm', N'من 8 - 12 مسائًا ', CAST(N'2023-12-19T18:04:20.4707851' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (5, 17, N'Home ', N'المنزل ', CAST(N'2023-12-19T18:04:58.9153672' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (6, 17, N'the shop', N'المتجر', CAST(N'2023-12-19T18:05:27.8745297' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (7, 19, N'I have a business that has been in business for a year or more', N'لدي نشاط تجاري مر عليه سنة أو أكثر', CAST(N'2023-12-20T16:06:47.3704951' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (8, 19, N'I have a business that has been in business for less than a year', N'لدي نشاط تجاري مر عليه أقل من سنة', CAST(N'2023-12-20T16:07:52.7035606' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (9, 20, N'From 1000 pounds to 20000 pounds', N'من ١٠٠٠ جنية إلى ٢٠٠٠٠  جنية', CAST(N'2023-12-20T16:13:06.7356867' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (10, 20, N'From 21,000 pounds to 50,000 pounds', N'من ٢١٠٠٠  جنية إلى ٥٠٠٠٠ جنية', CAST(N'2023-12-20T16:13:54.9690217' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (11, 20, N'From 50,000 pounds to 100,000 pounds', N'من ٥٠٠٠٠ جنية إلى ١٠٠٠٠٠ جنية', CAST(N'2023-12-20T16:14:49.9508523' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (12, 20, N'More than 100,000 pounds', N'أكثر من ١٠٠٠٠٠ جنية', CAST(N'2023-12-20T16:15:28.4172284' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (13, 24, N'Less than 50,000', N'أقل من ٥٠٠٠٠  ', CAST(N'2023-12-20T23:50:38.2651220' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (14, 24, N'From 51,000 to 100,000', N'من ٥١٠٠٠ الي ١٠٠٠٠٠ ', CAST(N'2023-12-20T23:50:51.2636022' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[RequirementSelections] ([Id], [RequirementId], [Name], [NameAr], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [IsShow]) VALUES (15, 24, N'More than 100,000 pounds', N'أكثر من ١٠٠٠٠٠ جنية', CAST(N'2023-12-20T23:51:40.2908045' AS DateTime2), 0, NULL, 0, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[RequirementSelections] OFF
GO
SET IDENTITY_INSERT [dbo].[RequirementServices] ON 
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (32, 2, 1, CAST(N'2023-12-20T16:39:14.4249820' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (33, 2, 2, CAST(N'2023-12-20T16:39:14.4249859' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (34, 2, 3, CAST(N'2023-12-20T16:39:14.4249861' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (35, 2, 4, CAST(N'2023-12-20T16:39:14.4249863' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (36, 2, 11, CAST(N'2023-12-20T16:39:14.4249865' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (37, 2, 19, CAST(N'2023-12-20T16:39:14.4249871' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (38, 2, 20, CAST(N'2023-12-20T16:39:14.4249873' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (39, 2, 5, CAST(N'2023-12-20T16:39:14.4249876' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (40, 2, 6, CAST(N'2023-12-20T16:39:14.4249878' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (41, 2, 7, CAST(N'2023-12-20T16:39:14.4249881' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (42, 2, 8, CAST(N'2023-12-20T16:39:14.4249883' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (43, 2, 9, CAST(N'2023-12-20T16:39:14.4249885' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (44, 2, 10, CAST(N'2023-12-20T16:39:14.4249887' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (45, 2, 12, CAST(N'2023-12-20T16:39:14.4249889' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (46, 2, 13, CAST(N'2023-12-20T16:39:14.4249891' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (47, 2, 14, CAST(N'2023-12-20T16:39:14.4249893' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (48, 2, 15, CAST(N'2023-12-20T16:39:14.4249895' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (49, 2, 16, CAST(N'2023-12-20T16:39:14.4249902' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (50, 2, 17, CAST(N'2023-12-20T16:39:14.4249904' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (51, 2, 18, CAST(N'2023-12-20T16:39:14.4249906' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (52, 3, 21, CAST(N'2023-12-20T23:52:13.0240487' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (53, 3, 22, CAST(N'2023-12-20T23:52:13.0241365' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (54, 3, 23, CAST(N'2023-12-20T23:52:13.0241376' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (55, 3, 24, CAST(N'2023-12-20T23:52:13.0241379' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10002, 10003, 1, CAST(N'2023-12-25T15:35:24.4775522' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10003, 10003, 2, CAST(N'2023-12-25T15:35:24.4776309' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10004, 10003, 3, CAST(N'2023-12-25T15:35:24.4776322' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10005, 10003, 10002, CAST(N'2023-12-25T15:35:24.4776328' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10006, 10003, 10003, CAST(N'2023-12-25T15:35:24.4776330' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10007, 10003, 10004, CAST(N'2023-12-25T15:35:24.4776336' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10008, 10003, 5, CAST(N'2023-12-25T15:35:24.4776338' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10009, 10003, 6, CAST(N'2023-12-25T15:35:24.4776342' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10010, 10003, 9, CAST(N'2023-12-25T15:35:24.4776345' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10011, 10003, 12, CAST(N'2023-12-25T15:35:24.4776353' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10012, 10003, 13, CAST(N'2023-12-25T15:35:24.4776355' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10013, 10003, 16, CAST(N'2023-12-25T15:35:24.4776357' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (10014, 10003, 18, CAST(N'2023-12-25T15:35:24.4776361' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20002, 1, 1, CAST(N'2023-12-31T08:41:03.0250849' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20003, 1, 2, CAST(N'2023-12-31T08:41:03.0253811' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20004, 1, 3, CAST(N'2023-12-31T08:41:03.0253826' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20005, 1, 5, CAST(N'2023-12-31T08:41:03.0253833' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20006, 1, 6, CAST(N'2023-12-31T08:41:03.0253835' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20007, 1, 9, CAST(N'2023-12-31T08:41:03.0253842' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20008, 1, 12, CAST(N'2023-12-31T08:41:03.0253844' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20009, 1, 13, CAST(N'2023-12-31T08:41:03.0253846' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20010, 1, 16, CAST(N'2023-12-31T08:41:03.0253853' AS DateTime2), 0, NULL, 0, NULL)
GO
INSERT [dbo].[RequirementServices] ([Id], [ServiceId], [RequirementId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt]) VALUES (20011, 1, 18, CAST(N'2023-12-31T08:41:03.0253857' AS DateTime2), 0, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[RequirementServices] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRequirementsAnswers] ON 
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (1, NULL, 52, N'string', N'', NULL, NULL, NULL, CAST(N'2023-12-30T02:36:46.4850130' AS DateTime2), 0, NULL, 0, NULL, NULL, 3)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (2, NULL, 53, N'12', N'', NULL, NULL, NULL, CAST(N'2023-12-30T02:36:46.5379681' AS DateTime2), 0, NULL, 0, NULL, NULL, 3)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (3, NULL, 54, N'striصثصثصثng', N'', NULL, NULL, NULL, CAST(N'2023-12-30T02:36:46.5379754' AS DateTime2), 0, NULL, 0, NULL, NULL, 3)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (4, NULL, 55, N'', N'', NULL, 13, NULL, CAST(N'2023-12-30T02:36:46.5390018' AS DateTime2), 0, NULL, 0, NULL, NULL, 3)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (5, NULL, 52, N'string', N'', NULL, NULL, NULL, CAST(N'2023-12-30T03:06:38.8856117' AS DateTime2), 0, NULL, 0, NULL, NULL, 4)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (6, NULL, 53, N'12', N'', NULL, NULL, NULL, CAST(N'2023-12-30T03:06:38.8934506' AS DateTime2), 0, NULL, 0, NULL, NULL, 4)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (7, NULL, 54, N'any data ', N'', NULL, NULL, NULL, CAST(N'2023-12-30T03:06:38.8934598' AS DateTime2), 0, NULL, 0, NULL, NULL, 4)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (8, NULL, 55, N'', N'', NULL, 13, NULL, CAST(N'2023-12-30T03:06:38.8945289' AS DateTime2), 0, NULL, 0, NULL, NULL, 4)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (15, NULL, 20008, N'full address ', N'', NULL, NULL, NULL, CAST(N'2023-12-31T08:44:44.5110254' AS DateTime2), 0, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (16, NULL, 20009, N'', N'', NULL, NULL, 1, CAST(N'2023-12-31T08:44:44.5134954' AS DateTime2), 0, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (17, NULL, 20010, N'', N'', NULL, 2, NULL, CAST(N'2023-12-31T08:44:44.5135189' AS DateTime2), 0, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (18, NULL, 20011, N'', N'', 1, NULL, NULL, CAST(N'2023-12-31T08:44:44.5135316' AS DateTime2), 0, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (19, NULL, 20008, N'full address ', N'', NULL, NULL, NULL, CAST(N'2023-12-31T08:50:29.9366624' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (20, NULL, 20009, N'', N'', NULL, NULL, 1, CAST(N'2023-12-31T08:50:30.0510474' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (21, NULL, 20010, N'', N'', NULL, 2, NULL, CAST(N'2023-12-31T08:50:30.0536079' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (22, NULL, 20011, N'', N'', 1, NULL, NULL, CAST(N'2023-12-31T08:50:30.0536876' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (23, NULL, 20008, N'full address ', N'', NULL, NULL, NULL, CAST(N'2023-12-31T08:54:07.1604734' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (24, NULL, 20009, N'', N'', NULL, NULL, 1, CAST(N'2023-12-31T08:54:07.2690385' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (25, NULL, 20010, N'', N'', NULL, 2, NULL, CAST(N'2023-12-31T08:54:07.2715030' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (26, NULL, 20011, N'', N'', 1, NULL, NULL, CAST(N'2023-12-31T08:54:07.2715521' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (27, NULL, 20002, N'Mahmoud Sabry Khouzaim', N'', NULL, NULL, NULL, CAST(N'2023-12-31T08:56:24.8544421' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (28, NULL, 20003, N'01273409387', N'', NULL, NULL, NULL, CAST(N'2023-12-31T08:56:24.8591834' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (29, NULL, 20004, N'', N'', NULL, NULL, NULL, CAST(N'2023-12-31T08:56:24.8592019' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (30, NULL, 20005, N'', N'/File/OrderImages\HPPJ1V29KC_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T08:57:40.0961491' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (31, NULL, 20006, N'', N'/File/OrderImages\N1QAEVPQBG_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T08:57:40.0981509' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (32, NULL, 20007, N'', N'/File/OrderImages\VZGMMYJ1S4_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T08:57:40.0993446' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (33, NULL, 20005, N'', N'/File/OrderImages\KFJG5CN53O_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T08:58:33.1046539' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (34, NULL, 20006, N'', N'/File/OrderImages\Z27ZSZKNU8_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T08:58:33.1835033' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (35, NULL, 20007, N'', N'/File/OrderImages\J5W8DZNWPW_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T08:58:33.1852987' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (36, NULL, 20005, N'', N'/File/OrderImages\XFRFURCEYH_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T09:00:00.9501634' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (37, NULL, 20006, N'', N'/File/OrderImages\2XOIYNSV0K_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T09:00:01.0047899' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (38, NULL, 20007, N'', N'/File/OrderImages\6DO5U6Y8IG_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T09:00:01.0058136' AS DateTime2), 0, NULL, 0, NULL, 1, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (39, NULL, 20005, N'', N'/File/OrderImages\WDKGDFW4FK_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T09:02:01.9969853' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (40, NULL, 20006, N'', N'/File/OrderImages\4K1X9YN99E_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T09:02:02.0532442' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (41, NULL, 20007, N'', N'/File/OrderImages\OE9QMKIPJP_OrderImages.png', NULL, NULL, NULL, CAST(N'2023-12-31T09:02:02.0543347' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (42, NULL, 20008, N'full address ', N'', NULL, NULL, NULL, CAST(N'2023-12-31T09:02:22.0196024' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (43, NULL, 20009, N'', N'', NULL, NULL, 1, CAST(N'2023-12-31T09:02:22.0503678' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (44, NULL, 20010, N'', N'', NULL, 2, NULL, CAST(N'2023-12-31T09:02:22.0528380' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (45, NULL, 20011, N'', N'', 1, NULL, NULL, CAST(N'2023-12-31T09:02:22.0528877' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (46, NULL, 20002, N'Mahmoud Sabry Khouzaim', N'', NULL, NULL, NULL, CAST(N'2023-12-31T09:02:32.0237290' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (47, NULL, 20003, N'01273409387', N'', NULL, NULL, NULL, CAST(N'2023-12-31T09:02:32.0317331' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
INSERT [dbo].[UserRequirementsAnswers] ([Id], [ApplicationUserId], [RequirementServiceId], [Answer], [ImageUrl], [YesOrNo], [RequirementSelectionId], [CityId], [CreatedAt], [IsUpdated], [UpdatedAt], [IsDeleted], [DeletedAt], [UserOrderId], [UnAssociationOrderId]) VALUES (48, NULL, 20004, N'', N'', NULL, NULL, NULL, CAST(N'2023-12-31T09:02:32.0317557' AS DateTime2), 0, NULL, 0, NULL, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserRequirementsAnswers] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 
GO
INSERT [dbo].[Notifications] ([Id], [Title], [Body], [CreatedOn]) VALUES (1, N'test', N'test body', CAST(N'2023-12-25T14:14:26.8894741' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationsConfirmed] ON 
GO
INSERT [dbo].[NotificationsConfirmed] ([Id], [NotificationId], [UserId]) VALUES (1, 1, N'a1ca766a-6033-4d82-b972-188cee3595f7')
GO
INSERT [dbo].[NotificationsConfirmed] ([Id], [NotificationId], [UserId]) VALUES (2, 1, N'a1ca766a-6033-4d82-b972-188cee3595f7')
GO
INSERT [dbo].[NotificationsConfirmed] ([Id], [NotificationId], [UserId]) VALUES (3, 1, N'a1ca766a-6033-4d82-b972-188cee3595f7')
GO
SET IDENTITY_INSERT [dbo].[NotificationsConfirmed] OFF
GO
INSERT [dbo].[Role] ([Id], [NameAr], [Description], [Name], [NormalizedName], [ConcurrencyStamp], [DescriptionAr]) VALUES (N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Admin', N'Admin', N'Admin', N'ADMIN', N'83bce34f-01f0-45f9-bfaf-baa5d59c5cb2', NULL)
GO
INSERT [dbo].[Role] ([Id], [NameAr], [Description], [Name], [NormalizedName], [ConcurrencyStamp], [DescriptionAr]) VALUES (N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'SuperAdmin', N'SuperAdmin', N'SuperAdmin', N'SUPERADMIN', N'81b44090-62b4-412d-ae73-1c6376d4df62', NULL)
GO
INSERT [dbo].[Role] ([Id], [NameAr], [Description], [Name], [NormalizedName], [ConcurrencyStamp], [DescriptionAr]) VALUES (N'd53c9a8d-7f14-4b4b-979c-c078d737a9da', N'User', N'User', N'User', N'USER', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[RoleClaims] ON 
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2200, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Dashboard.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2201, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Design.All')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2202, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ApplicationUsers.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2203, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ApplicationUsers.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2204, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ApplicationUsers.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2205, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ApplicationUsers.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2206, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ApplicationUsers.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2207, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Roles.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2208, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Roles.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2209, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Roles.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2210, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Roles.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2211, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Roles.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2212, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ContactUs.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2213, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ContactUs.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2214, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ContactUs.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2215, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ContactUs.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2216, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.ContactUs.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2217, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionAndAnswer.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2218, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionAndAnswer.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2219, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionAndAnswer.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2220, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionAndAnswer.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2221, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionAndAnswer.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2222, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionsAndAnswersSection.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2223, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionsAndAnswersSection.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2224, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionsAndAnswersSection.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2225, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionsAndAnswersSection.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2226, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.QuestionsAndAnswersSection.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2227, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.SlidePhoto.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2228, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.SlidePhoto.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2229, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.SlidePhoto.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2230, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.SlidePhoto.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2231, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.SlidePhoto.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2232, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Client.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2233, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Client.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2234, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Client.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2235, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Client.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2236, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Client.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2237, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.City.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2238, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.City.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2239, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.City.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2240, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.City.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2241, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.City.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2242, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Requirement.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2243, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Requirement.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2244, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Requirement.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2245, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Requirement.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2246, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Requirement.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2247, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementSelection.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2248, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementSelection.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2249, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementSelection.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2250, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementSelection.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2251, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementSelection.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2252, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Service.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2253, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Service.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2254, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Service.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2255, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Service.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2256, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Service.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2257, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementService.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2258, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementService.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2259, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementService.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2260, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementService.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2261, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.RequirementService.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2262, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserRequirementsAnswer.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2263, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserRequirementsAnswer.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2264, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserRequirementsAnswer.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2265, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserRequirementsAnswer.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2266, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserRequirementsAnswer.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2267, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Dashboard.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2268, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Design.All')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2269, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ApplicationUsers.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2270, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ApplicationUsers.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2271, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ApplicationUsers.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2272, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ApplicationUsers.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2273, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ApplicationUsers.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2274, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Roles.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2275, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Roles.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2276, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Roles.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2277, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Roles.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2278, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Roles.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2279, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ContactUs.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2280, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ContactUs.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2281, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ContactUs.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2282, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ContactUs.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2283, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.ContactUs.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2284, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionAndAnswer.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2285, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionAndAnswer.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2286, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionAndAnswer.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2287, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionAndAnswer.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2288, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionAndAnswer.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2289, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionsAndAnswersSection.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2290, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionsAndAnswersSection.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2291, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionsAndAnswersSection.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2292, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionsAndAnswersSection.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2293, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.QuestionsAndAnswersSection.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2294, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.SlidePhoto.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2295, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.SlidePhoto.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2296, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.SlidePhoto.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2297, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.SlidePhoto.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2298, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.SlidePhoto.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2299, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Client.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2300, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Client.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2301, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Client.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2302, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Client.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2303, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Client.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2304, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.City.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2305, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.City.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2306, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.City.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2307, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.City.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2308, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.City.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2309, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Requirement.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2310, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Requirement.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2311, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Requirement.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2312, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Requirement.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2313, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Requirement.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2314, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementSelection.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2315, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementSelection.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2316, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementSelection.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2317, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementSelection.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2318, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementSelection.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2319, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Service.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2320, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Service.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2321, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Service.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2322, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Service.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2323, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.Service.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2324, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementService.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2325, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementService.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2326, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementService.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2327, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementService.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2328, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.RequirementService.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2329, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.UserRequirementsAnswer.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2330, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.UserRequirementsAnswer.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2331, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.UserRequirementsAnswer.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2332, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.UserRequirementsAnswer.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2333, N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e', N'Permissions', N'Permissions.UserRequirementsAnswer.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2334, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Company.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2335, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Company.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2336, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Company.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2337, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Company.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2338, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Company.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2339, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Association.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2340, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Association.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2341, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Association.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2342, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Association.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2343, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Association.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2344, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationSection.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2345, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationSection.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2346, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationSection.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2347, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationSection.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2348, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationSection.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2349, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationCycle.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2350, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationCycle.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2351, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationCycle.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2352, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationCycle.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2353, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.AssociationCycle.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2354, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Cycle.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2355, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Cycle.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2356, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Cycle.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2357, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Cycle.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2358, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Cycle.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2359, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserOrder.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2360, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserOrder.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2361, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserOrder.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2362, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserOrder.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2363, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UserOrder.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2364, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Notification.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2365, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Notification.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2366, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Notification.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2367, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Notification.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2368, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Notification.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2369, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Sms.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2370, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Sms.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2371, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Sms.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2372, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Sms.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2373, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Sms.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3364, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UnAssociationOrder.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3365, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UnAssociationOrder.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3366, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UnAssociationOrder.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3367, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UnAssociationOrder.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3368, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.UnAssociationOrder.Delete')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3369, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Installment.View')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3370, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Installment.Create')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3371, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Installment.Details')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3372, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Installment.Edit')
GO
INSERT [dbo].[RoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3373, N'd1c1c716-6f8a-4b15-8cbe-2ae375578022', N'Permissions', N'Permissions.Installment.Delete')
GO
SET IDENTITY_INSERT [dbo].[RoleClaims] OFF
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a3771f32-d61e-4503-9cda-1fa13c55a2d5', N'4f103c4a-e58a-4285-9dd2-d05e688dbf7e')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'10e3e376-a018-49a9-abc4-f92de87bfc71', N'd1c1c716-6f8a-4b15-8cbe-2ae375578022')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'10e3e376-a018-49a9-abc4-f92de87bfc71', N'd53c9a8d-7f14-4b4b-979c-c078d737a9da')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a1ca766a-6033-4d82-b972-188cee3595f7', N'd53c9a8d-7f14-4b4b-979c-c078d737a9da')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a3771f32-d61e-4503-9cda-1fa13c55a2d5', N'd53c9a8d-7f14-4b4b-979c-c078d737a9da')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102162849_InitialDatabase', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231107090645_UpdateRole', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231214072904_AddServicesAndRequirements', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231219122543_UpdateiIsShow', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231220180901_UpdateCompanyOne', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231220224647_UpdateCompanyIsBlocked', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231221233312_UpdateAssociationIsShow', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231221235233_UpdateAddCompanyToOrder', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231223220126_UpdateChangeToFloat', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231224084209_UpdateAssociationCycleDate', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231224100001_UpdateAssociationNames', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231225014507_UpdateContactUsPhoneTwo', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231227180603_UpdateServiceIsNeedCompany', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231228112812_UpdateInstallment', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231228121151_UpdateUnAssociationOrder', N'7.0.13')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240109200844_UpdateServiceFile', N'7.0.13')
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 
GO
INSERT [dbo].[ContactUs] ([Id], [WhatsAppNumber], [Email], [Link], [FaceBookLink], [PhoneNumberTwo], [TermsAndConditions], [TermsAndConditionsAr], [PhoneNumberOne]) VALUES (1, N'01273409387', N'mahmoud.sabry.khuzaim@gmail.com', NULL, NULL, NULL, N'<p>Terms And Conditions</p>', N'<p>الأحكام والشروط</p>', N'01273409387')
GO
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
