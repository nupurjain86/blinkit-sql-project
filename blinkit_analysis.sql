-- =========================================
-- BLINKIT DATA ANALYSIS PROJECT (SQL)
-- =========================================

-- Drop table if exists
DROP TABLE IF EXISTS blinkit;

-- Create table
CREATE TABLE blinkit (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

-- =========================================
-- DATA EXPLORATION
-- =========================================

-- Total rows
SELECT COUNT(*) AS total_rows FROM blinkit;

-- Sample data
SELECT * FROM blinkit LIMIT 10;

-- Check NULL values
SELECT *
FROM blinkit
WHERE name IS NULL
OR category IS NULL
OR mrp IS NULL
OR discountedSellingPrice IS NULL
OR weightInGms IS NULL;

-- Unique categories
SELECT DISTINCT category
FROM blinkit
ORDER BY category;

-- Stock availability
SELECT outOfStock, COUNT(*) AS product_count
FROM blinkit
GROUP BY outOfStock;

-- Duplicate product names
SELECT name, COUNT(*) AS sku_count
FROM blinkit
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY sku_count DESC;

-- =========================================
-- DATA CLEANING
-- =========================================

-- Remove invalid price entries
DELETE FROM blinkit
WHERE mrp = 0 OR discountedSellingPrice = 0;

-- Convert paise to rupees (if needed)
UPDATE blinkit
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0
WHERE mrp > 1000;  -- safety condition

-- Recalculate discount if missing
UPDATE blinkit
SET discountPercent =
ROUND(((mrp - discountedSellingPrice) / mrp) * 100, 2)
WHERE discountPercent IS NULL;

-- =========================================
-- DATA ANALYSIS
-- =========================================

-- Q1. Top 10 best-value products (highest discount)
SELECT name, mrp, discountPercent
FROM blinkit
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. High MRP but Out of Stock
SELECT name, mrp
FROM blinkit
WHERE outOfStock = TRUE
AND mrp > 300
ORDER BY mrp DESC;

-- Q3. Estimated Revenue per category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM blinkit
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4. Expensive products with low discount
SELECT name, mrp, discountPercent
FROM blinkit
WHERE mrp > 500
AND discountPercent < 10
ORDER BY mrp DESC;

-- Q5. Top 5 categories by avg discount
SELECT category,
ROUND(AVG(discountPercent), 2) AS avg_discount
FROM blinkit
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Best price per gram (value for money)
SELECT name,
weightInGms,
discountedSellingPrice,
ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM blinkit
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;

-- Q7. Product segmentation by weight
SELECT name,
weightInGms,
CASE
WHEN weightInGms < 1000 THEN 'Low'
WHEN weightInGms < 5000 THEN 'Medium'
ELSE 'Bulk'
END AS weight_category
FROM blinkit;

-- Q8. Total inventory weight per category
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM blinkit
GROUP BY category
ORDER BY total_weight DESC;

-- =========================================
-- ADVANCED ANALYSIS (FOR INTERNSHIP EDGE)
-- =========================================

-- A. Discount bucket distribution
SELECT
CASE
WHEN discountPercent < 10 THEN 'Low'
WHEN discountPercent < 30 THEN 'Medium'
ELSE 'High'
END AS discount_bucket,
COUNT(*) AS product_count
FROM blinkit
GROUP BY discount_bucket;

-- B. Average price per category
SELECT category,
AVG(discountedSellingPrice) AS avg_price
FROM blinkit
GROUP BY category
ORDER BY avg_price DESC;

-- C. Most expensive category
SELECT category,
MAX(mrp) AS max_price
FROM blinkit
GROUP BY category
ORDER BY max_price DESC;

-- D. Stock risk (low inventory items)
SELECT name, availableQuantity
FROM blinkit
WHERE availableQuantity < 10
ORDER BY availableQuantity ASC;

-- =========================================
-- END OF FILE
-- =========================================
