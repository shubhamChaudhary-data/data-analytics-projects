-- PROJECT: ZEPTO DATA ANALYSIS (SQL)
-- AUTHOR: <Shubham Chaudhary>
-- DESCRIPTION: Data cleaning + business analysis (Q1–Q9)

-- ====================================================================
-- 1. DATABASE AND TABLE SETUP
-- ====================================================================

CREATE DATABASE Zepto_SQL_Project ;
USE Zepto_SQL_Project;
CREATE TABLE zepto(
 sku_id SERIAL PRIMARY KEY,
 Category VARCHAR (120),
 name VARCHAR (150) NOT NULL,
 mrp NUMERIC (8,2),
 DiscountPercent NUMERIC (5,2),
 availableQuantity INTEGER ,
 discountedSellingPrice NUMERIC (5,2) ,
 weightinGms INTEGER ,
 Outofstock BOOLEAN,
 Quantity INTEGER
 );
 ALTER TABLE zepto
MODIFY mrp DECIMAL(10,2),
MODIFY discountedSellingPrice DECIMAL(10,2);


-- ==============================================================
-- 2. DATA IMPORT CHECKS 
-- ==============================================================

-- Check Total Rows
SELECT count(*) FROM zepto;

-- Sample data
SELECT * FROM zepto
limit 10;

-- Null Values
SELECT * FROM zepto
WHERE name is NULL
OR
Category is NULL
OR
mrp is NULL
OR
DiscountPercent is NULL
OR
availableQuantity is NULL
OR
discountedSellingPrice is NULL
OR
weightinGms is NULL
OR
OutofStock is NULL
OR
Quantity is NULL;
 
-- different product categories
SELECT DISTINCT Category
FROM zepto
ORDER BY Category;

-- products in stock vs out of stock
  SELECT OutofStock, COUNT(sku_id)
  FROM zepto
  GROUP BY OutofStock;
  
-- product names present multiple times
  SELECT name, COUNT(sku_id) as "Number of SKUs"
  FROM zepto
  GROUP BY name
  HAVING COUNT(sku_id) > 1
  ORDER BY count(sku_id) DESC;
  
  
-- ======================================================  
-- 3. DATA CLEANING
-- ======================================================
  
-- products with a price=0
  
 SELECT * FROM zepto
 WHERE mrp=0 or discountedSellingPrice =0;
 
 DELETE FROM zepto 
 WHERE mrp=0;
 SET SQL_SAFE_UPDATES = 0;
 DELETE FROM zepto 
 WHERE mrp=0;
 
-- convert paise to rupees
 
 UPDATE zepto
 SET mrp = mrp/100.0,
 discountedSellingPrice=discountedSellingPrice/100.0 ;
 
 SELECT mrp, discountedSellingPrice FROM zepto;
 
 
-- =========================================================
-- BUSINESS QUESTIONS	( Q1-Q9)
-- =========================================================
 
 
-- Q1. Find the top 10 best-value products based on the discount percentage.
 
  SELECT DISTINCT name, mrp, DiscountPercent
  FROM zepto 
  ORDER BY DiscountPercent DESC
  LIMIT 10;
 

-- Q2.What are the Products with High MRP but Out of Stock?

SELECT DISTINCT name, mrp
FROM zepto
WHERE OutofStock= 1 and mrp>300
ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category

SELECT Category,
 SUM(discountedSellingPrice * availableQuantity) AS category_revenue
 FROM zepto
 GROUP BY Category
 ORDER BY category_revenue ;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

SELECT DISTINCT name , mrp, DiscountPercent
FROM zepto
WHERE mrp > 500 AND DiscountPercent < 10
ORDER BY mrp DESC, DiscountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT Category,
ROUND(AVG(DiscountPercent)) AS avg_discount
FROM zepto
GROUP BY Category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightinGms , discountedSellingPrice,
round(discountedSellingPrice/weightinGms,2) AS price_per_gram
FROM zepto
WHERE weightinGms>= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.

SELECT DISTINCT name , weightinGms,
CASE WHEN weightinGms < 1000 THEN 'Low'
     WHEN weightinGms < 5000 THEN 'Medium'
     ELSE 'Bulk'
     END AS weight_category
FROM zepto;     

-- Q8.What is the Total Inventory Weight Per Category?

SELECT Category,
SUM(weightinGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY Category
ORDER BY total_weight;

-- Q9. Revenue share (%) by category

SELECT 
    Category,
    SUM(discountedSellingPrice * availableQuantity) AS category_revenue,
    ROUND(
        100.0 * SUM(discountedSellingPrice * availableQuantity) /
        (SELECT SUM(discountedSellingPrice * availableQuantity) FROM zepto),
        2
    ) AS revenue_share_pct
FROM zepto
GROUP BY Category
ORDER BY revenue_share_pct DESC;


