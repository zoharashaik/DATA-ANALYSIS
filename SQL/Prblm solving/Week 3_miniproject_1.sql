-- Week 3: Advanced SQL – Window Functions, CTEs, Nested Queries + Projects 
-- Window Functions (ROW_NUMBER, RANK, DENSE_RANK, PARTITION BY) 
-- Common Table Expressions (CTEs) 
-- Nested Queries for complex filtering 
-- Building end-to-end SQL queries 

-- Project 1: Analyze an E-commerce dataset: Top-selling products, most active customers, revenue trends.

-- Creating tables and columns
CREATE DATABASE EcommerceDB;
GO

USE EcommerceDB;
GO

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50)
);

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(20),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);

-- Inserting values into the columns
INSERT INTO Customers
    (CustomerID, CustomerName, Email, City)
VALUES
(1,  'Rahul',   'rahul@gmail.com',   'Hyderabad'),
(2,  'Priya',   'priya@gmail.com',   'Bangalore'),
(3,  'Sneha',   'sneha@gmail.com',   'Chennai'),
(4,  'Arjun',   'arjun@gmail.com',   'Mumbai'),
(5,  'Divya',   'divya@gmail.com',   'Delhi'),
(6,  'Kiran',   'kiran@gmail.com',   'Hyderabad'),
(7,  'Ananya',  'ananya@gmail.com',  'Pune'),
(8,  'Rohit',   'rohit@gmail.com',   'Kolkata'),
(9,  'Meera',   'meera@gmail.com',   'Chennai'),
(10, 'Vikram',  'vikram@gmail.com',  'Mumbai'),
(11, 'Pooja',   'pooja@gmail.com',   'Bangalore'),
(12, 'Akhil',   'akhil@gmail.com',   'Hyderabad'),
(13, 'Swathi',  'swathi@gmail.com',  'Delhi'),
(14, 'Manoj',   'manoj@gmail.com',   'Pune'),
(15, 'Kavya',   'kavya@gmail.com',   'Chennai'),
(16, 'Suresh',  'suresh@gmail.com',  'Mumbai'),
(17, 'Neha',    'neha@gmail.com',    'Bangalore'),
(18, 'Varun',   'varun@gmail.com',   'Hyderabad'),
(19, 'Ayesha',  'ayesha@gmail.com',  'Delhi'),
(20, 'Nikhil',  'nikhil@gmail.com',  'Pune');

-- TABLE PRODUCTS
INSERT INTO Products
    (ProductID, ProductName, Category, UnitPrice)
VALUES
(101, 'Laptop',          'Electronics',      55000),
(102, 'Smartphone',      'Electronics',      25000),
(103, 'Headphones',      'Electronics',       2000),

(104, 'T-Shirt',         'Clothing',            800),
(105, 'Jeans',           'Clothing',           1500),
(106, 'Jacket',          'Clothing',           2500),

(107, 'Running Shoes',   'Footwear',           2500),
(108, 'Casual Shoes',    'Footwear',           1800),
(109, 'Sandals',         'Footwear',            900),

(110, 'Watch',           'Accessories',        3000),
(111, 'Backpack',        'Accessories',        1200),
(112, 'Sunglasses',      'Accessories',        1000),

(113, 'Mixer Grinder',   'Home Appliances',    3500),
(114, 'Electric Kettle', 'Home Appliances',    1800),
(115, 'Microwave Oven',  'Home Appliances',   12000);

-- TABLE ORDERS
INSERT INTO Orders
    (OrderID, CustomerID, OrderDate, OrderStatus)
VALUES
-- January
(1001, 1,  '2025-01-05', 'Delivered'),
(1002, 2,  '2025-01-10', 'Delivered'),
(1003, 3,  '2025-01-15', 'Shipped'),
(1004, 1,  '2025-01-20', 'Delivered'),
(1005, 4,  '2025-01-25', 'Cancelled'),

-- February
(1006, 2,  '2025-02-03', 'Delivered'),
(1007, 5,  '2025-02-08', 'Delivered'),
(1008, 1,  '2025-02-14', 'Delivered'),
(1009, 6,  '2025-02-19', 'Shipped'),
(1010, 3,  '2025-02-24', 'Delivered'),

-- March
(1011, 7,  '2025-03-02', 'Delivered'),
(1012, 2,  '2025-03-07', 'Delivered'),
(1013, 8,  '2025-03-12', 'Cancelled'),
(1014, 1,  '2025-03-18', 'Delivered'),
(1015, 9,  '2025-03-25', 'Shipped'),

-- April
(1016, 10, '2025-04-04', 'Delivered'),
(1017, 2,  '2025-04-09', 'Delivered'),
(1018, 11, '2025-04-14', 'Delivered'),
(1019, 1,  '2025-04-20', 'Shipped'),
(1020, 12, '2025-04-26', 'Delivered'),

-- May
(1021, 13, '2025-05-03', 'Delivered'),
(1022, 2,  '2025-05-08', 'Delivered'),
(1023, 14, '2025-05-13', 'Delivered'),
(1024, 1,  '2025-05-19', 'Cancelled'),
(1025, 15, '2025-05-25', 'Shipped'),

-- June
(1026, 16, '2025-06-02', 'Delivered'),
(1027, 2,  '2025-06-07', 'Delivered'),
(1028, 17, '2025-06-12', 'Delivered'),
(1029, 1,  '2025-06-18', 'Delivered'),
(1030, 18, '2025-06-24', 'Shipped'),

-- July
(1031, 19, '2025-07-03', 'Delivered'),
(1032, 2,  '2025-07-08', 'Delivered'),
(1033, 20, '2025-07-14', 'Delivered'),
(1034, 1,  '2025-07-20', 'Delivered'),
(1035, 3,  '2025-07-26', 'Cancelled'),

-- August
(1036, 4,  '2025-08-02', 'Delivered'),
(1037, 2,  '2025-08-08', 'Shipped'),
(1038, 5,  '2025-08-14', 'Delivered'),
(1039, 1,  '2025-08-20', 'Delivered'),
(1040, 6,  '2025-08-26', 'Delivered'),

-- September
(1041, 7,  '2025-09-03', 'Delivered'),
(1042, 2,  '2025-09-09', 'Delivered'),
(1043, 8,  '2025-09-15', 'Shipped'),
(1044, 1,  '2025-09-21', 'Delivered'),
(1045, 9,  '2025-09-27', 'Delivered'),

-- October
(1046, 10, '2025-10-04', 'Delivered'),
(1047, 2,  '2025-10-10', 'Delivered'),
(1048, 11, '2025-10-16', 'Delivered'),
(1049, 1,  '2025-10-22', 'Shipped'),
(1050, 12, '2025-10-28', 'Delivered'),

-- November
(1051, 13, '2025-11-05', 'Delivered'),
(1052, 2,  '2025-11-11', 'Delivered'),
(1053, 14, '2025-11-17', 'Delivered'),
(1054, 1,  '2025-11-23', 'Cancelled'),
(1055, 15, '2025-11-29', 'Delivered'),

-- December
(1056, 16, '2025-12-03', 'Delivered'),
(1057, 2,  '2025-12-09', 'Delivered'),
(1058, 17, '2025-12-15', 'Shipped'),
(1059, 1,  '2025-12-21', 'Delivered'),
(1060, 18, '2025-12-27', 'Delivered');

-- TABLE ORDER DETAILS
WITH GeneratedDetails AS
(
    SELECT
        o.OrderID,
        v.Slot,

        101 + ((o.OrderID - 1001 + (v.Slot * 3)) % 15)
            AS ProductID,

        1 + ((o.OrderID - 1001 + v.Slot) % 5)
            AS Quantity,

        ROW_NUMBER() OVER(
            ORDER BY o.OrderID, v.Slot
        ) AS OrderDetailID

    FROM Orders AS o

    CROSS JOIN
    (
        VALUES (1), (2)
    ) AS v(Slot)
)

INSERT INTO OrderDetails
    (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)

SELECT
    gd.OrderDetailID,
    gd.OrderID,
    gd.ProductID,
    gd.Quantity,
    p.UnitPrice

FROM GeneratedDetails AS gd

INNER JOIN Products AS p
    ON gd.ProductID = p.ProductID;

--  CHECKING TABLES
SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM OrderDetails;

-- CHECKING TABLE RELATIONSHIIPS
SELECT
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    p.ProductName,
    od.Quantity,
    od.UnitPrice,
    od.Quantity * od.UnitPrice AS Revenue,
    o.OrderStatus
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.CustomerID = c.CustomerID
INNER JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
INNER JOIN Products AS p
    ON od.ProductID = p.ProductID
ORDER BY o.OrderID;

-- PROJECT QUERY

USE EcommerceDB;
GO

WITH SalesData AS
(
    -- Step 1: Combine all four tables and calculate line revenue
    SELECT
        o.OrderID,
        o.CustomerID,
        c.CustomerName,
        o.OrderDate,
        o.OrderStatus,
        p.ProductID,
        p.ProductName,
        p.Category,
        od.Quantity,
        od.UnitPrice,
        od.Quantity * od.UnitPrice AS Revenue

    FROM Orders AS o

    INNER JOIN Customers AS c
        ON o.CustomerID = c.CustomerID

    INNER JOIN OrderDetails AS od
        ON o.OrderID = od.OrderID

    INNER JOIN Products AS p
        ON od.ProductID = p.ProductID

    -- Exclude cancelled orders
    WHERE o.OrderStatus <> 'Cancelled'
),

ProductAnalysis AS
(
    -- Step 2: Analyse product performance
    SELECT
        ProductID,
        ProductName,
        Category,

        SUM(Quantity) AS Total_Quantity_Sold,
        SUM(Revenue) AS Total_Product_Revenue,

        RANK() OVER(
            ORDER BY SUM(Quantity) DESC
        ) AS Product_Sales_Rank,

        DENSE_RANK() OVER(
            ORDER BY SUM(Revenue) DESC
        ) AS Product_Revenue_Rank,

        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY SUM(Revenue) DESC, ProductID
        ) AS Category_Row_Number

    FROM SalesData

    GROUP BY
        ProductID,
        ProductName,
        Category
),

CustomerAnalysis AS
(
    -- Step 3: Analyse customer activity and spending
    SELECT
        CustomerID,
        CustomerName,

        COUNT(DISTINCT OrderID) AS Total_Orders,

        SUM(Revenue) AS Total_Spending,

        DENSE_RANK() OVER(
            ORDER BY COUNT(DISTINCT OrderID) DESC
        ) AS Customer_Activity_Rank,

        RANK() OVER(
            ORDER BY SUM(Revenue) DESC
        ) AS Customer_Spending_Rank

    FROM SalesData

    GROUP BY
        CustomerID,
        CustomerName
),

MonthlyRevenue AS
(
    -- Step 4: Calculate revenue month-wise
    SELECT
        YEAR(OrderDate) AS Revenue_Year,
        MONTH(OrderDate) AS Revenue_Month,

        SUM(Revenue) AS Total_Monthly_Revenue

    FROM SalesData

    GROUP BY
        YEAR(OrderDate),
        MONTH(OrderDate)
),

RevenueAnalysis AS
(
    -- Step 5: Analyse monthly revenue trends
    SELECT
        Revenue_Year,
        Revenue_Month,
        Total_Monthly_Revenue,

        LAG(Total_Monthly_Revenue) OVER(
            ORDER BY Revenue_Year, Revenue_Month
        ) AS Previous_Month_Revenue,

        RANK() OVER(
            ORDER BY Total_Monthly_Revenue DESC
        ) AS Revenue_Rank,

        SUM(Total_Monthly_Revenue) OVER(
            PARTITION BY Revenue_Year
        ) AS Yearly_Revenue

    FROM MonthlyRevenue
),

CustomerAverage AS
(
    -- Step 6: Calculate average spending per customer
    SELECT
        AVG(Total_Spending) AS Average_Customer_Spending

    FROM CustomerAnalysis
)

-- Step 7: Combine all three analyses into one result

SELECT
    'Product Analysis' AS Analysis_Type,
    ProductName AS Entity_Name,
    Category AS Category_Or_Period,
    Total_Quantity_Sold AS Quantity_Or_Orders,
    Total_Product_Revenue AS Revenue,
    Product_Sales_Rank AS Primary_Rank,
    Product_Revenue_Rank AS Secondary_Rank,
    Category_Row_Number AS Additional_Rank,
    CAST(NULL AS DECIMAL(18,2)) AS Previous_Month_Revenue,
    CAST(NULL AS DECIMAL(18,2)) AS Yearly_Revenue,
    CAST(NULL AS DECIMAL(18,2)) AS Average_Spending_Flag

FROM ProductAnalysis

UNION ALL

SELECT
    'Customer Analysis',
    CustomerName,
    'Customer',
    Total_Orders,
    Total_Spending,
    Customer_Activity_Rank,
    Customer_Spending_Rank,
    NULL,
    NULL,
    NULL,

    CASE
        WHEN Total_Spending > (
            SELECT Average_Customer_Spending
            FROM CustomerAverage
        )
        THEN Total_Spending
        ELSE NULL
    END

FROM CustomerAnalysis

UNION ALL

SELECT
    'Revenue Analysis',
    CONCAT(
        Revenue_Year,
        '-',
        RIGHT('0' + CAST(Revenue_Month AS VARCHAR(2)), 2)
    ),
    'Monthly Revenue',
    NULL,
    Total_Monthly_Revenue,
    Revenue_Rank,
    NULL,
    NULL,
    Previous_Month_Revenue,
    Yearly_Revenue,
    NULL

FROM RevenueAnalysis

ORDER BY
    Analysis_Type,
    Primary_Rank;

