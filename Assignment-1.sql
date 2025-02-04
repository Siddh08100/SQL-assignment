SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[QuantityPerUnit] [nvarchar](50) NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[UnitsOnOrder] [int] NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[Discontinued] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




SELECT ProductID, ProductName, UnitPrice from dbo.products WHERE UnitPrice < 20;

SELECT ProductID, ProductName, UnitPrice from dbo.products WHERE UnitPrice BETWEEN 15 and 25;

SELECT ProductID, ProductName, UnitPrice from dbo.products WHERE UnitPrice > (SELECT AVG(UnitPrice) from dbo.products)

Select Top 10 ProductID, ProductName, UnitPrice from dbo.products ORDER BY UnitPrice DESC;


Select Discontinued , Count(Discontinued) as count from dbo.products Group BY Discontinued;

select ProductName, UnitsInStock, UnitsOnOrder from products where UnitsInStock < UnitsOnOrder;