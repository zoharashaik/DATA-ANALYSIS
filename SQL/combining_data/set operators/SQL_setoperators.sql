SELECT  
	FirstName,
	LastName
FROM Sales.Customers

UNION

SELECT
	FirstName,
	LastName
FROM Sales.Employees;

--Combine the datafrom employees and customers into one table
SELECT  
	FirstName,
	LastName
FROM Sales.Customers
UNION
SELECT
	FirstName,
	LastName
FROM Sales.Employees;

--Combine the datafrom employees and customers into one table including duplicates
SELECT  
	FirstName,
	LastName
FROM Sales.Customers
UNION ALL
SELECT
	FirstName,
	LastName
FROM Sales.Employees;

--Find the employees who are not customers at the same time
SELECT  
	FirstName,
	LastName
FROM Sales.Employees
EXCEPT
SELECT
	FirstName,
	LastName
FROM Sales.Customers;

--Find employees, who are also customers
SELECT  
	FirstName,
	LastName
FROM Sales.Customers
INTERSECT
SELECT
	FirstName,
	LastName
FROM Sales.Employees;

--Orders data are stored in separate tables (Orders and Orders Archive)
--Combine all orders data into one report without any duplicates.
--BEST PRACTICE- DONT USE ASTERISK* TO COMBINE TABLES;LIST NEEDED COLUMNS INSTEAD
SELECT  
'Orders' AS sourcetable
,[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress] 
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
FROM Sales.Orders
UNION
SELECT
'OrdersArchive' AS sourcetable
,[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID;

