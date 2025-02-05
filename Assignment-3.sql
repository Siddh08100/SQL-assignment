--1
select e.Emp_Name,d.Dept_Name,e.Salary from employee e 
join Department d on d.Dept_ID = e.Dept_ID
WHERE e.Salary = (
	select MAX(salary) from Employee emp
	where emp.Dept_ID = e.Dept_ID
	GROUP by Dept_ID
) 

--2
select d.Dept_Name from employee e 
join Department d on d.Dept_ID = e.Dept_ID  
GROUP by d.Dept_ID,d.Dept_Name
having count(e.Dept_ID) < 3

--3
select d.Dept_Name , COUNT(e.Dept_ID) as NoOfEmployees from employee e 
join Department d on d.Dept_ID = e.Dept_ID  
GROUP by d.Dept_ID,d.Dept_Name


--4
select d.Dept_Name , SUM(e.Salary)  from employee e 
join Department d on d.Dept_ID = e.Dept_ID  
GROUP by d.Dept_ID,d.Dept_Name

