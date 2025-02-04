-->1
alter PROCEDURE CalculateFreight @Cusid nchar(5)
AS
SELECT AVG(freight) FROM DemoOrders WHERE CustomerID = @Cusid
GO



-->2
Alter Procedure SalesByCountry
AS
select e.Country, SUM(dod.Quantity * dod.UnitPrice * (1-dod.Discount)) as total_sales
from DemoEmployees e
join DemoOrders as d on e.EmployeeID = d.EmployeeID
join DemoOrderDetails as dod on dod.OrderID = d.OrderID
GROUP BY e.Country
GO

-->3
create PROCEDURE SalesByYear
AS
select year(d.OrderDate) , SUM(dod.Quantity * dod.UnitPrice * (1-dod.Discount)) as total_sales
from DemoOrders as d 
join DemoOrderDetails as dod on dod.OrderID = d.OrderID
GROUP BY YEAR(d.OrderDate)
GO

-->4
create Procedure SalesByCategory
AS
select dc.CategoryName ,  SUM(dod.Quantity * dod.UnitPrice * (1-dod.Discount)) as total_sales
from DemoOrderDetails dod
join DemoProducts as d on dod.ProductID = d.ProductID
join DemoCategories as dc on d.CategoryID = dc.CategoryID
GROUP BY dc.CategoryName
GO


-->5
alter PROCEDURE ExpensiveProduct
AS
select top 10 d.ProductName, d.UnitPrice from DemoProducts d
order by UnitPrice DESC
Go

-->6
Create PROCEDURE InsertValues @orderId int, @ProductId int, @unitPrice money, @Quantity SMALLINT, @discount REAL
AS
INSERT into DemoOrderDetails(OrderID , ProductID, UnitPrice, Quantity , Discount )
VALUES(@orderId , @ProductId , @unitPrice , @Quantity , @discount)
Go

-->7
Create PROCEDURE UpdateValues @orderId int, @ProductId int, @unitPrice money, @Quantity SMALLINT, @discount REAL
AS
UPDATE DemoOrderDetails 
            SET    ProductID = @ProductId,
                   UnitPrice =  @unitPrice,
                   Quantity = @Quantity,
                   Discount = @discount

            WHERE  OrderID = @orderId
Go


EXEC CalculateFreight @Cusid = 'VINET';
EXEC SalesByCountry
EXEC SalesByYear
EXEC SalesByCategory
EXEC ExpensiveProduct
EXEC InsertValues  @orderId = 12, @ProductId = 12, @unitPrice = 12, @Quantity = 13, @discount = 0.08
EXEC UpdateValues  @orderId = 12, @ProductId = 102, @unitPrice = 102, @Quantity = 130, @discount = 0.008



