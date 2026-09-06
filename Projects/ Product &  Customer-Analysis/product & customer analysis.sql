USE sys;

-- =========================================================
-- 1. DATA OVERVIEW
-- =========================================================

-- Total Number of Records
SELECT COUNT(*) AS total_records
FROM sales;


-- =========================================================
-- 2. DATA QUALITY CHECK
-- =========================================================

-- Null Value Analysis Across All Columns
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN invoice IS NULL THEN 1 ELSE 0 END) AS invoice_nulls,
    SUM(CASE WHEN stockcode IS NULL THEN 1 ELSE 0 END) AS stockcode_nulls,
    SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS description_nulls,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quantity_nulls,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS order_date_nulls,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price_nulls,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS country_nulls,
    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS revenue_nulls
FROM sales;


-- =========================================================
-- 3. CUSTOMER DATA QUALITY ANALYSIS
-- =========================================================

-- Customer ID Missing Value Analysis
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_rows,
    ROUND(
        100.0 * SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) 
        / COUNT(*),
        2
    ) AS null_percentage
FROM sales;


-- =========================================================
-- 4. OVERALL SALES PERFORMANCE
-- =========================================================

-- Total Revenue Generated
SELECT 
    ROUND(SUM(revenue), 2) AS total_sales
FROM sales;


-- =========================================================
-- 5. PRODUCT CATALOG ANALYSIS
-- =========================================================

-- Total Number of Unique Products
SELECT 
    COUNT(DISTINCT stockcode) AS total_products
FROM sales;


-- =========================================================
-- 6. TOP-SELLING PRODUCTS BY REVENUE
-- =========================================================

-- Top 10 Products by Revenue
SELECT 
    description,
    ROUND(SUM(revenue), 2) AS total_sales
FROM sales
GROUP BY description
ORDER BY total_sales DESC
LIMIT 10;


-- =========================================================
-- 7. LOW-PERFORMING PRODUCTS BY REVENUE
-- =========================================================

-- Bottom 10 Products by Revenue
SELECT 
    description,
    ROUND(SUM(revenue), 2) AS total_sales
FROM sales
GROUP BY description
ORDER BY total_sales ASC
LIMIT 10;


-- =========================================================
-- 8. TOP PRODUCTS BY SALES VOLUME
-- =========================================================

-- Top 10 Products by Quantity Sold
SELECT 
    description,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY description
ORDER BY total_quantity DESC
LIMIT 10;


-- =========================================================
-- 9. HIGH-DEMAND PRODUCTS
-- =========================================================

-- Top 10 Products by Number of Orders
SELECT 
    stockcode,
    description,
    COUNT(DISTINCT invoice) AS total_orders
FROM sales
WHERE quantity > 0
GROUP BY stockcode, description
ORDER BY total_orders DESC
LIMIT 10;


-- =========================================================
-- 10. PRODUCT PRICING ANALYSIS
-- =========================================================

-- Average Selling Price by Product
SELECT 
    stockcode,
    description,
    ROUND(AVG(price), 2) AS avg_price
FROM sales
GROUP BY stockcode, description
ORDER BY avg_price DESC;


-- =========================================================
-- 11. MONTHLY & YEARLY REVENUE PERFORMANCE
-- =========================================================

-- Highest Revenue-Generating Month & Year
SELECT 
    month,
    year,
    ROUND(SUM(revenue), 2) AS total_sales
FROM sales
GROUP BY month, year
ORDER BY total_sales DESC
LIMIT 1;


-- =========================================================
-- 12. ORDER TYPE ANALYSIS
-- =========================================================

-- Sales vs Returns Distribution
SELECT 
    order_type,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY order_type;


-- =========================================================
-- 13. RETURN ANALYSIS
-- =========================================================

-- Top 5 Country-Product Combinations by Returns
SELECT 
    country,
    description,
    ROUND(SUM(revenue), 2) AS total_return_value
FROM sales
WHERE order_type = 'Return'
GROUP BY country, description
ORDER BY total_return_value
LIMIT 5;

-- Top 5 Most Returned Products
SELECT 
    description,
    SUM(quantity) AS returned_quantity,
    COUNT(DISTINCT invoice) AS return_orders,
    ROUND(SUM(revenue), 2) AS return_value
FROM sales
WHERE order_type = 'Return'
GROUP BY description
ORDER BY returned_quantity ASC
LIMIT 5;


-- =========================================================
-- 1. CUSTOMER OVERVIEW
-- =========================================================

-- Total Number of Unique Customers
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM sales;


-- =========================================================
-- 2. TOP CUSTOMERS BY REVENUE
-- =========================================================

-- Top 5 Customers by Total Revenue
SELECT 
    customer_id,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 5;


-- =========================================================
-- 3. TOP CUSTOMERS BY ORDER COUNT
-- =========================================================

-- Top 5 Customers by Number of Orders
SELECT 
    customer_id,
    COUNT(DISTINCT invoice) AS total_orders
FROM sales
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 5;


-- =========================================================
-- 4. TOP CUSTOMERS BY PURCHASE TRANSACTIONS
-- =========================================================

-- Top 5 Customers by Number of Transactions
SELECT 
    customer_id,
    COUNT(*) AS total_transactions
FROM sales
GROUP BY customer_id
ORDER BY total_transactions DESC
LIMIT 5;


-- =========================================================
-- 5. TOP CUSTOMERS BY COUNTRY & REVENUE
-- =========================================================

-- Top 5 Customer-Country Combinations by Revenue
SELECT 
    country,
    customer_id,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales
GROUP BY country, customer_id
ORDER BY total_revenue DESC
LIMIT 5;   
