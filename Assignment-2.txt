--1
select s.name , c.Cust_Name , s.city from Salesman as s Join Customer as c on  c.Salesman_ID = s.Salesman_ID where c.City = s.City

--2
select o.Ord_No , c.Cust_Name, c.City , o.Purch_Amt from Orders as o Join Customer as c on  c.Customer_ID = o.Customer_ID where o.Purch_Amt BETWEEN 500 and 2000.

--3
select s.name , c.Cust_Name , c.city , s.Commission from Salesman as s Join Customer as c on  c.Salesman_ID = s.Salesman_ID

--4
select s.name , c.Cust_Name , c.city , s.Commission from Salesman as s Join Customer as c on  c.Salesman_ID = s.Salesman_ID where s.Commission > 12

--5
select  c.Cust_Name , c.city , s.Name , s.City, s.Commission from Salesman as s Join Customer as c on  c.Salesman_ID = s.Salesman_ID where s.Commission > 12 and s.city != c.city

--6
select o.Ord_No , o.Ord_Date,  o.Purch_Amt, c.Cust_Name, c.Grade, s.Name , s.Commission from Orders as o JOIN Customer as c on  c.Customer_ID = o.Customer_ID JOIN Salesman as s on o.Salesman_ID = s.Salesman_ID;


--7
select o.Ord_No,o.Purch_Amt,o.Ord_Date,s.Salesman_ID,s.Name,s.City,s.Commission,c.Customer_ID,c.Cust_Name,c.City,c.Grade from Orders as o join Customer as c on c.Customer_ID = o.Customer_ID 
join Salesman as s on s.Salesman_ID = o.Salesman_ID 

--8
select c.Cust_Name , c.City , c.Grade , s.Name , s.City from Salesman as s Join Customer as c on  c.Salesman_ID = s.Salesman_ID ORDER BY c.Customer_ID ASC

--9
select c.Cust_Name , c.City , c.Grade , s.Name , s.City from Salesman as s Join Customer as c on  c.Salesman_ID = s.Salesman_ID where c.Grade > 300  ORDER BY c.Customer_ID ASC 

--10
select c.Cust_Name , c.City, o.Ord_No , o.Ord_Date , o.Purch_Amt from orders as o Join Customer as c on  c.Customer_ID = o.Customer_ID ORDER BY o.Ord_Date ASC 

--11
select  c.Cust_Name , c.City ,o.Ord_No,o.Ord_Date,o.Purch_Amt,s.Name, s.Commission from  Orders as o left join Customer as c on c.Customer_ID = o.Customer_ID  left join Salesman as s on s.Salesman_ID = o.Salesman_ID 

--12
select s.Salesman_ID , s.Name , s.Commission from Salesman as s  left join Customer as c on c.Salesman_ID = s.Salesman_ID order by s.Name ASC

--13
select s.Name, c.Cust_Name , c.City ,c.Grade , o.Ord_No , o.Ord_Date , o.Purch_Amt from orders as o join Customer as c on c.Customer_ID = o.Customer_ID
join Salesman as s on s.Salesman_ID = o.Salesman_ID 


--14



-- 15
select * from Salesman as s
left JOIN Customer as c on c.Salesman_ID = s.Salesman_ID 
left JOIN Orders as o on o.Customer_ID = c.Customer_ID and o.Purch_Amt >= 200
and c.Grade is not NULL


--17
Select s.Salesman_ID,s.Name,s.City,s.Commission,c.Customer_ID,c.Cust_Name,c.Grade,c.City from Salesman as s full join Customer as c on c.Salesman_ID = s.Salesman_ID


--18
select s.Salesman_ID, s.Name, s.City, s.Commission , c.Customer_ID, c.Cust_Name, c.Grade, c.City as customer_city from Salesman as s CROSS JOIN Customer as c where c.City = s.city

--19
select s.Salesman_ID, s.Name, s.City, s.Commission , c.Customer_ID, c.Cust_Name, c.Grade, c.City as customer_city from Salesman as s CROSS JOIN Customer as c where c.Salesman_ID = s.Salesman_ID and
c.Grade is not NULL
and c.city = s.city


--20
select s.Salesman_ID, s.Name, s.City, s.Commission , c.Customer_ID, c.Cust_Name, c.Grade, c.City as customer_city from Salesman as s CROSS JOIN Customer as c where c.Salesman_ID = s.Salesman_ID and
c.Grade is not NULL
and c.city != s.city
