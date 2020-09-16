USE [NORTHWIND]
GO
INSERT [dbo].[CustomerDemographics] ([CustomerTypeID], [CustomerDesc]) VALUES (N'A0', N'Non-buying customer')
INSERT [dbo].[CustomerDemographics] ([CustomerTypeID], [CustomerDesc]) VALUES (N'A1', N'Annual revenue less than $10,000')
INSERT [dbo].[CustomerDemographics] ([CustomerTypeID], [CustomerDesc]) VALUES (N'A2', N'Annual revenue >= $10,000 and <$50,000')
INSERT [dbo].[CustomerDemographics] ([CustomerTypeID], [CustomerDesc]) VALUES (N'A3', N'Annual revenue >=$50,000 and <$100,000')
INSERT [dbo].[CustomerDemographics] ([CustomerTypeID], [CustomerDesc]) VALUES (N'A4', N'Annual revenue >=$100,000')
