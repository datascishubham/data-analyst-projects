USE data_projects;


-- 1. Check Total Number of Records
SELECT COUNT(*) 
FROM sales;


-- 2. Check Sales Table Structure
DESCRIBE sales;


-- 3. Change Customer ID Data Type
ALTER TABLE sales
MODIFY COLUMN customer_id VARCHAR(50);


-- 4. Verify Customer ID Data Type
DESCRIBE sales;


-- 5. Overall Sales Performance
SELECT 
    ROUND(SUM(revenue),2) AS total_revenue,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(AVG(price),2) AS avg_price,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND((SUM(revenue) / COUNT(DISTINCT order_id)),2) AS AOV,
    ROUND(
        (COUNT(DISTINCT order_id) / COUNT(DISTINCT customer_id)),2
    ) AS order_per_customer
FROM sales;


-- 6. Overall Return Performance
SELECT 
    ROUND(SUM(revenue),2) AS total_return,
    SUM(quantity) AS total_quantity,
    ROUND(
        (COUNT(DISTINCT order_id) /
        (SELECT COUNT(DISTINCT order_id) FROM sales)) * 100,
        2
    ) AS return_rate
FROM returns;


-- 7. Top 10 Products by Revenue
SELECT 
    product_name,
    ROUND(SUM(revenue),2) AS revenue_by_product,
    SUM(quantity) AS quantity_by_product
FROM sales
GROUP BY product_name
ORDER BY revenue_by_product DESC
LIMIT 10;


-- 8. Bottom 10 Products by Revenue
SELECT 
    product_name,
    COUNT(product_name) AS total_products,
    ROUND(SUM(revenue),2) AS revenue_by_product,
    SUM(quantity) AS quantity_by_product
FROM sales
GROUP BY product_name
ORDER BY revenue_by_product ASC
LIMIT 10;


-- 9. Top 5 Products by Country
WITH A AS (
    SELECT 
        country,
        product_name,
        COUNT(product_name) AS product_count
    FROM sales
    GROUP BY country, product_name
),
ranked AS (
    SELECT 
        country,
        product_name,
        product_count,
        DENSE_RANK() OVER(
            PARTITION BY country 
            ORDER BY product_count DESC
        ) AS ranked_country
    FROM A
)
SELECT * 
FROM ranked
WHERE ranked_country <= 5;

-- 10. Top 10 Country by Revenue

SELECT 
country,ROUND(SUM(revenue),2) AS total_revenue
FROM sales
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;

-- MONTH BY REVENUE
SELECT 
    MONTHNAME(order_date) AS months,
    ROUND(SUM(revenue),2) AS total_revenue
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);

-- MONTH GROWTH PERCENTAGE --------
WITH A AS ( SELECT 
    MONTHNAME(order_date) AS months,
    ROUND(SUM(revenue),2) AS month_by_revenue,
    LAG(ROUND(SUM(revenue),2)) OVER(ORDER BY MONTH(order_date)) AS previous_month_revenue
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date)
)
SELECT 
months,month_by_revenue,previous_month_revenue,
ROUND((month_by_revenue-previous_month_revenue)/previous_month_revenue*100,2) AS month_growth_percentages
FROM A ;

-- 11. Top 10 Customers by Revenue
SELECT 
    customer_id,
    ROUND(SUM(revenue),2) AS revenue_by_customers,
    SUM(quantity) AS quantity_by_customer
FROM sales
GROUP BY customer_id
ORDER BY revenue_by_customers DESC
LIMIT 10;


-- 12. Bottom 10 Customers by Revenue
SELECT 
    customer_id,
    ROUND(SUM(revenue),2) AS revenue_by_customers,
    SUM(quantity) AS quantity_by_customer
FROM sales
GROUP BY customer_id
ORDER BY revenue_by_customers ASC
LIMIT 10;

-- 
SELECT 
country,COUNT(DISTINCT customer_id) AS customers_in_country
FROM sales
GROUP BY country
ORDER BY customers_in_country DESC;


-- 
SELECT COUNT(*) AS new_customers 
FROM
(SELECT customer_id
FROM sales
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id)=1)t;


SELECT COUNT(*) AS new_customers 
FROM
(SELECT customer_id
FROM sales
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id)>1)t;

WITH A AS (
SELECT 
customer_id,
COUNT(DISTINCT order_id) AS total_unique_orders
FROM sales
GROUP BY customer_id) 

SELECT 
 0
FROM A
