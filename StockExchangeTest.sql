USE [master]
GO
/****** Object:  Database [StockExchangeTest]    Script Date: 09/21/2016 07:55:58 ******/
ALTER DATABASE [StockExchangeTest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockExchangeTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockExchangeTest] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StockExchangeTest] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StockExchangeTest] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StockExchangeTest] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StockExchangeTest] SET ARITHABORT OFF
GO
ALTER DATABASE [StockExchangeTest] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StockExchangeTest] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StockExchangeTest] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StockExchangeTest] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StockExchangeTest] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StockExchangeTest] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StockExchangeTest] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StockExchangeTest] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StockExchangeTest] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StockExchangeTest] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StockExchangeTest] SET  DISABLE_BROKER
GO
ALTER DATABASE [StockExchangeTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StockExchangeTest] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StockExchangeTest] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StockExchangeTest] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StockExchangeTest] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StockExchangeTest] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StockExchangeTest] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StockExchangeTest] SET  READ_WRITE
GO
ALTER DATABASE [StockExchangeTest] SET RECOVERY SIMPLE
GO
ALTER DATABASE [StockExchangeTest] SET  MULTI_USER
GO
ALTER DATABASE [StockExchangeTest] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StockExchangeTest] SET DB_CHAINING OFF
GO
USE [StockExchangeTest]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 09/21/2016 07:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[trader_id] [int] NOT NULL,
	[stock_code] [nvarchar](255) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[transaction_time] [datetime] NOT NULL,
	[transaction_type] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[transactions] ON
INSERT [dbo].[transactions] ([transaction_id], [trader_id], [stock_code], [quantity], [price], [transaction_time], [transaction_type]) VALUES (1, 45, N'DX100', 5, 500, CAST(0x0000A58000000000 AS DateTime), N'buy')
INSERT [dbo].[transactions] ([transaction_id], [trader_id], [stock_code], [quantity], [price], [transaction_time], [transaction_type]) VALUES (2, 45, N'DX100', 2, 1000, CAST(0x0000A5A800000000 AS DateTime), N'sell')
INSERT [dbo].[transactions] ([transaction_id], [trader_id], [stock_code], [quantity], [price], [transaction_time], [transaction_type]) VALUES (21, 109, N'TT500', 5, 1000, CAST(0x0000A688006DF85A AS DateTime), N'buy')
INSERT [dbo].[transactions] ([transaction_id], [trader_id], [stock_code], [quantity], [price], [transaction_time], [transaction_type]) VALUES (22, 109, N'TT500', 1, 1000, CAST(0x0000A688006DF87F AS DateTime), N'sell')
INSERT [dbo].[transactions] ([transaction_id], [trader_id], [stock_code], [quantity], [price], [transaction_time], [transaction_type]) VALUES (23, 109, N'TT500', 5, 1000, CAST(0x0000A68800789ABC AS DateTime), N'buy')
INSERT [dbo].[transactions] ([transaction_id], [trader_id], [stock_code], [quantity], [price], [transaction_time], [transaction_type]) VALUES (24, 109, N'TT500', 1, 1000, CAST(0x0000A68800789AE8 AS DateTime), N'sell')
SET IDENTITY_INSERT [dbo].[transactions] OFF
/****** Object:  Table [dbo].[traders]    Script Date: 09/21/2016 07:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traders](
	[trader_id] [int] IDENTITY(1,1) NOT NULL,
	[trader_username] [nvarchar](255) NOT NULL,
	[trader_password] [nvarchar](255) NOT NULL,
	[balance] [float] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[traders] ON
INSERT [dbo].[traders] ([trader_id], [trader_username], [trader_password], [balance]) VALUES (109, N'test3', N'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 4999999913984)
INSERT [dbo].[traders] ([trader_id], [trader_username], [trader_password], [balance]) VALUES (45, N'test', N'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 100000)
INSERT [dbo].[traders] ([trader_id], [trader_username], [trader_password], [balance]) VALUES (49, N'test2', N'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 100000)
INSERT [dbo].[traders] ([trader_id], [trader_username], [trader_password], [balance]) VALUES (113, N'test4', N'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 1000)
INSERT [dbo].[traders] ([trader_id], [trader_username], [trader_password], [balance]) VALUES (114, N'test1474432823', N'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 10000)
INSERT [dbo].[traders] ([trader_id], [trader_username], [trader_password], [balance]) VALUES (115, N'test1474435146', N'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 10000)
SET IDENTITY_INSERT [dbo].[traders] OFF
/****** Object:  Table [dbo].[stocks]    Script Date: 09/21/2016 07:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stocks](
	[stock_id] [int] IDENTITY(1,1) NOT NULL,
	[stock_code] [nvarchar](255) NOT NULL,
	[stock_price] [float] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[stocks] ON
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (1, N'DX100', 5000)
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (2, N'DT400', 1000)
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (4, N'MM1000', 1000)
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (5, N'TT500', 1000)
SET IDENTITY_INSERT [dbo].[stocks] OFF
/****** Object:  Table [dbo].[portfolios]    Script Date: 09/21/2016 07:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portfolios](
	[portfolio_id] [int] IDENTITY(1,1) NOT NULL,
	[trader_id] [int] NOT NULL,
	[stock_code] [nvarchar](255) NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[portfolios] ON
INSERT [dbo].[portfolios] ([portfolio_id], [trader_id], [stock_code], [quantity]) VALUES (8, 45, N'DX100', 5)
INSERT [dbo].[portfolios] ([portfolio_id], [trader_id], [stock_code], [quantity]) VALUES (9, 45, N'DT400', 50)
INSERT [dbo].[portfolios] ([portfolio_id], [trader_id], [stock_code], [quantity]) VALUES (10, 109, N'TT500', 1000000004)
SET IDENTITY_INSERT [dbo].[portfolios] OFF
/****** Object:  StoredProcedure [dbo].[VerifyUser]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
CREATE PROCEDURE [dbo].[VerifyUser]   
    @username nvarchar(255) ,
    @password nvarchar(255) 
AS   
    SET NOCOUNT ON;  
    SELECT trader_id 
    FROM dbo.traders 
    WHERE traders.trader_username =@username 
	AND traders.trader_password = @password
GO
/****** Object:  StoredProcedure [dbo].[UserExists]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
CREATE PROCEDURE [dbo].[UserExists]   
    @username nvarchar(255)
AS   
    SET NOCOUNT ON;  
    SELECT COUNT(*) 
    FROM dbo.traders 
    WHERE traders.trader_username =@username
GO
/****** Object:  StoredProcedure [dbo].[GetTransactions]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
 CREATE PROCEDURE [dbo].[GetTransactions]
    @userID int  
AS   
    SET NOCOUNT ON;  
    SELECT  transactions.stock_code, transactions.quantity ,transactions.transaction_time, transactions.transaction_type, transactions.price
    FROM dbo.transactions 
	WHERE transactions.trader_id =@userID
GO
/****** Object:  StoredProcedure [dbo].[GetTraderBalance]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
 CREATE PROCEDURE [dbo].[GetTraderBalance]
    @userID int  
AS   
    SET NOCOUNT ON;  
    SELECT traders.balance
    FROM dbo.traders 
	WHERE traders.trader_id =@userID
GO
/****** Object:  StoredProcedure [dbo].[GetTrader]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrader]   
    @username nvarchar(255) 
AS   
    SET NOCOUNT ON;  
    SELECT trader_id, trader_username, trader_password,balance  
    FROM StockExchangeTest.dbo.traders  
    WHERE trader_username = @username
GO
/****** Object:  StoredProcedure [dbo].[GetStockQuantity]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////

 --////////////////////////////////////
 CREATE PROCEDURE [dbo].[GetStockQuantity]
	@userID [int],
    @stockCode nvarchar(255)  
AS    
    SET NOCOUNT ON;  
    SELECT quantity
    FROM dbo.portfolios 
    WHERE stock_code =@stockCode AND trader_id = @userID
GO
/****** Object:  StoredProcedure [dbo].[GetStockPrice]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////

 --////////////////////////////////////
 CREATE PROCEDURE [dbo].[GetStockPrice]   
    @stockCode nvarchar(255)  
AS    
    SET NOCOUNT ON;  
    SELECT stock_price 
    FROM dbo.stocks 
    WHERE stocks.stock_code =@stockCode
GO
/****** Object:  StoredProcedure [dbo].[GetPortofolio]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--//////////////////////////////////// 
CREATE PROCEDURE [dbo].[GetPortofolio]   
    @userID int  
AS   
    SET NOCOUNT ON;  
    SELECT  stocks.stock_code, quantity, stock_price
    FROM dbo.portfolios JOIN dbo.stocks on portfolios.stock_code = stocks.stock_code
    WHERE portfolios.trader_id =@userID
GO
/****** Object:  StoredProcedure [dbo].[AddTransaction]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
CREATE PROCEDURE [dbo].[AddTransaction]
    @userID [int],
    @stockCode nvarchar(255) ,
    @stockQuantity [int],
    @transactionType nvarchar(255) ,
    @price [float] 
AS   
    SET NOCOUNT ON;  
    INSERT INTO transactions
    VALUES (@userID, @stockCode, @stockQuantity, @price, GETDATE(), @transactionType);
GO
/****** Object:  StoredProcedure [dbo].[AddTrader]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
 CREATE PROCEDURE [dbo].[AddTrader]   
    @username nvarchar(255) ,
	@password nvarchar(255) ,
	@balance nvarchar(255) 
AS   
BEGIN 
    SET NOCOUNT ON;  
    INSERT INTO dbo.traders (trader_username,trader_password,balance) VALUES ( @username , @password , @balance)
END
GO
/****** Object:  StoredProcedure [dbo].[AddToPortfolio]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
CREATE PROCEDURE [dbo].[AddToPortfolio]
    @userID [int],
    @stockCode nvarchar(255) ,
    @stockQuantity [int]
AS   
SET NOCOUNT OFF;

 UPDATE portfolios
    SET quantity = quantity + @stockQuantity
    WHERE portfolios.trader_id = @userID AND portfolios.stock_code = @stockCode;
    
    if (@@ROWCOUNT < 1)
    INSERT INTO portfolios
    VALUES (@userID, @stockCode, @stockQuantity);
GO
/****** Object:  StoredProcedure [dbo].[StockExists]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
CREATE PROCEDURE [dbo].[StockExists]   
    @stockCode nvarchar(255)
AS   
    SET NOCOUNT ON;  
    SELECT COUNT(*) 
    FROM dbo.stocks 
    WHERE stocks.stock_code =@stockCode
GO
/****** Object:  StoredProcedure [dbo].[SetTraderBalance]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
CREATE PROCEDURE [dbo].[SetTraderBalance]   
    @userID [int] ,
    @balance [float]
AS   
    SET NOCOUNT ON;  
    UPDATE traders
    SET traders.balance = @balance
    WHERE traders.trader_id = @userID;
GO
/****** Object:  StoredProcedure [dbo].[SetStockPrice]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
CREATE PROCEDURE [dbo].[SetStockPrice]
    @stockCode nvarchar(255) ,
    @stockPrice [float]
AS   
    SET NOCOUNT ON;  
    UPDATE stocks
    SET stocks.stock_price = @stockPrice
    WHERE stocks.stock_code = @stockCode;
GO
/****** Object:  StoredProcedure [dbo].[RemoveFromPortfolio]    Script Date: 09/21/2016 07:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////
CREATE PROCEDURE [dbo].[RemoveFromPortfolio]
    @userID [int],
    @stockCode nvarchar(255) ,
    @stockQuantity [int]
AS   
SET NOCOUNT OFF;

if(@stockQuantity < 1)
	DELETE FROM portfolios
	WHERE portfolios.trader_id = @userID AND portfolios.stock_code = @stockCode;
ELSE
 UPDATE portfolios
 SET quantity = @stockQuantity
 WHERE portfolios.trader_id = @userID AND portfolios.stock_code = @stockCode;
GO
