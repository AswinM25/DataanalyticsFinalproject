CREATE DATABASE retails_data;
USE retails_data;
CREATE TABLE superstore (
    Row_ID INTEGER,
    Order_ID TEXT,
    Order_Date TEXT,
    Ship_Date TEXT,
    Ship_Mode TEXT,
    Customer_ID TEXT,
    Customer_Name TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    Postal_Code TEXT,
    Region TEXT,
    Product_ID TEXT,
    Category TEXT,
    Sub_Category TEXT,
    Product_Name TEXT,
    Sales REAL,
    Profit REAL,
    Quantity INTEGER,
    Discount REAL
);
SELECT 
  Category,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  CASE 
    WHEN SUM(Sales) = 0 THEN 0
    ELSE ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2)
  END AS Profit_Margin
FROM superstore
GROUP BY Category
ORDER BY Profit_Margin ASC;

SELECT 
  Category,
  Sub_Category,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin
FROM superstore
GROUP BY Category, Sub_Category
ORDER BY Profit_Margin ASC;
