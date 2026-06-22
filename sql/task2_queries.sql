-- View first 10 records
SELECT * FROM superstore_data LIMIT 10;

-- Filter Furniture category
SELECT *
FROM superstore_data
WHERE Category = 'Furniture';

-- Sales greater than 500
SELECT "Customer Name", Sales, Profit
FROM superstore_data
WHERE Sales > 500;

-- Sort by Sales
SELECT "Customer Name", Category, Sales
FROM superstore_data
ORDER BY Sales DESC;

-- Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM superstore_data;

-- Average Profit
SELECT AVG(Profit) AS Average_Profit
FROM superstore_data;

-- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM superstore_data;

-- Sales by Category
SELECT Category,
SUM(Sales) AS Total_Sales
FROM superstore_data
GROUP BY Category;

-- Profit by Category
SELECT Category,
SUM(Profit) AS Total_Profit
FROM superstore_data
GROUP BY Category;

-- Categories with Sales > 500000
SELECT Category,
SUM(Sales) AS Total_Sales
FROM superstore_data
GROUP BY Category
HAVING SUM(Sales) > 500000;

-- Customers with above-average sales
SELECT "Customer Name", Sales
FROM superstore_data
WHERE Sales >
(
SELECT AVG(Sales)
FROM superstore_data
);

-- Category Summary View
CREATE VIEW IF NOT EXISTS Category_Summary AS
SELECT
Category,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM superstore_data
GROUP BY Category;