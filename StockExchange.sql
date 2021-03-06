USE [master]
GO
/****** Object:  Database [StockExchange]    Script Date: 09/21/2016 07:55:18 ******/
ALTER DATABASE [StockExchange] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockExchange].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockExchange] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StockExchange] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StockExchange] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StockExchange] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StockExchange] SET ARITHABORT OFF
GO
ALTER DATABASE [StockExchange] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StockExchange] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StockExchange] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StockExchange] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StockExchange] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StockExchange] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StockExchange] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StockExchange] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StockExchange] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StockExchange] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StockExchange] SET  DISABLE_BROKER
GO
ALTER DATABASE [StockExchange] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StockExchange] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StockExchange] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StockExchange] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StockExchange] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StockExchange] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StockExchange] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StockExchange] SET  READ_WRITE
GO
ALTER DATABASE [StockExchange] SET RECOVERY SIMPLE
GO
ALTER DATABASE [StockExchange] SET  MULTI_USER
GO
ALTER DATABASE [StockExchange] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StockExchange] SET DB_CHAINING OFF
GO
USE [StockExchange]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 09/21/2016 07:55:19 ******/
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
/****** Object:  Table [dbo].[traders]    Script Date: 09/21/2016 07:55:19 ******/
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
/****** Object:  Table [dbo].[stocks]    Script Date: 09/21/2016 07:55:19 ******/
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
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (1, N'Samsung', 1000)
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (2, N'acer', 5000)
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (3, N'Dell', 10000)
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (5, N'HP', 100)
INSERT [dbo].[stocks] ([stock_id], [stock_code], [stock_price]) VALUES (6, N'Lenovo', 1000)
SET IDENTITY_INSERT [dbo].[stocks] OFF
/****** Object:  Table [dbo].[portfolios]    Script Date: 09/21/2016 07:55:19 ******/
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
/****** Object:  StoredProcedure [dbo].[VerifyUser]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[UserExists]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTransactions]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTraderBalance]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTrader]    Script Date: 09/21/2016 07:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrader]   
    @username nvarchar(255) 
AS   
    SET NOCOUNT ON;  
    SELECT trader_id, trader_username, trader_password,balance  
    FROM StockExchange.dbo.traders  
    WHERE trader_username = @username
GO
/****** Object:  StoredProcedure [dbo].[GetStockQuantity]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[GetStockPrice]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPortofolio]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[AddTransaction]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[AddTrader]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[AddToPortfolio]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[StockExists]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[SetTraderBalance]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[SetStockPrice]    Script Date: 09/21/2016 07:55:20 ******/
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
/****** Object:  StoredProcedure [dbo].[RemoveFromPortfolio]    Script Date: 09/21/2016 07:55:20 ******/
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
