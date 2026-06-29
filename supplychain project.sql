USE banking_case;

SELECT * 
FROM supply_chain_analysis;

SELECT COUNT(*) 
FROM supply_chain_analysis;

-- ================================
-- 1. Overall Business Performance
-- ================================
SELECT ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order,
SUM(order_item_quantity) AS total_quantity
FROM supply_chain_analysis;

-- ================================
-- 2. Category-Level Analysis
-- ================================
SELECT category_name,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order,
SUM(order_item_quantity) AS total_quantity
FROM supply_chain_analysis
GROUP BY category_name
ORDER BY total_sales DESC;

-- ================================
-- 3. Country-Level Analysis  
-- ================================
SELECT customer_country,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order
FROM supply_chain_analysis
GROUP BY customer_country
ORDER BY total_sales DESC;

-- ================================
-- 4. State-Level Analysis  
-- ================================
SELECT customer_state,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order
FROM supply_chain_analysis
GROUP BY customer_state
ORDER BY total_sales DESC;

-- ================================
-- 5. City-Level Analysis  
-- ================================
SELECT customer_city,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order
FROM supply_chain_analysis
GROUP BY customer_city
ORDER BY total_sales DESC;

-- ================================
-- 6.  Year Sales Trend
-- ================================
SELECT order_year,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT order_id) AS total_order
FROM supply_chain_analysis
GROUP BY order_year
ORDER BY order_year ASC;
         
     
-- ================================
-- 7.  Month Sales Trend
-- ================================     
SELECT order_month,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT order_id) AS total_order
FROM supply_chain_analysis
GROUP BY order_month
ORDER BY order_month ASC;     

-- ================================
-- 8. Market-Level Analysis  
-- ================================
SELECT market,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order
FROM supply_chain_analysis
GROUP BY market
ORDER BY total_sales DESC;   

-- ================================
-- 9. Segment Analysis  
-- ================================
SELECT customer_segment,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order
FROM supply_chain_analysis
GROUP BY customer_segment
ORDER BY total_sales DESC;

-- ================================
-- 10. Order_region Analysis  
-- ================================
SELECT order_region,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order
FROM supply_chain_analysis
GROUP BY order_region
ORDER BY total_sales DESC;

-- ================================
-- 11. Department Analysis
-- ================================
SELECT department_name,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order
FROM supply_chain_analysis
GROUP BY department_name
ORDER BY total_sales DESC;

-- ================================
-- 12. Type Analysis
-- ================================
SELECT type,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order
FROM supply_chain_analysis
GROUP BY type;

-- ================================
-- 13. Shipping Analysis
-- ================================
SELECT shipping_mode,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT order_id) AS total_order,
ROUND(AVG(`days_for_shipping_(real)`),2) AS avg_shipping_days,
ROUND(AVG(late_delivery_risk),2) AS late_delivery_rate
FROM supply_chain_analysis
GROUP BY shipping_mode
ORDER BY total_sales DESC;

-- ================================
-- 14. Repat customer
-- ================================
SELECT customer_id,
COUNT(DISTINCT order_id ) AS total_orders,
ROUND(SUM(sales),2)AS total_spend
FROM supply_chain_analysis
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id ) >1
ORDER BY total_spend DESC;

-- ==========================================
-- 15. Discount vs profit 
-- ==========================================

SELECT 
    ROUND(AVG(order_item_discount),2) AS avg_discount,
    ROUND(AVG(order_profit_per_order),2) AS avg_profit
FROM supply_chain_analysis;

-- ==========================================
-- 16. Category wise discount analysis 
-- ==========================================
SELECT 
    category_name,
    ROUND(AVG(order_item_discount),2) AS avg_discount,
    ROUND(AVG(order_profit_per_order),2) AS avg_profit
FROM supply_chain_analysis
GROUP BY category_name
ORDER BY avg_discount DESC;


-- ==========================================
-- 17. Top 10 Highest sales genrated product 
-- ==========================================
SELECT product_name,
ROUND(SUM(sales),2)AS total_sales,
ROUND(SUM(order_profit_per_order),2) AS total_profit,
COUNT(DISTINCT(order_id)) AS total_order,
SUM(order_item_quantity) AS total_quantity
FROM supply_chain_analysis
GROUP BY product_name
ORDER BY total_sales DESC LIMIT 10;

-- ==========================================
-- 18. Delivary Performance
-- ==========================================
SELECT ROUND(AVG(`days_for_shipping_(real)`),2) AS avg_delivary,
ROUND(AVG(`days_for_shipment_(scheduled)`),2) AS avg_shipment_delivary
FROM supply_chain_analysis;

SELECT late_delivery_risk,
COUNT(*) AS total_orders
FROM supply_chain_analysis
GROUP BY late_delivery_risk;

 -- ==========================================
-- 19. shipping mode  Performance
-- ==========================================
SELECT shipping_mode,
ROUND(AVG(`days_for_shipping_(real)`),2) AS avg_delivery_days
FROM supply_chain_analysis
GROUP BY shipping_mode;

 -- ==========================================
-- 20. Rision wise 
-- ==========================================
SELECT order_region,
ROUND(AVG(late_delivery_risk)*100,2) AS late_percentage
FROM supply_chain_analysis
GROUP BY order_region;
 -- ==========================================
-- 21. Delivary status
-- ==========================================

SELECT delivery_status,
COUNT(*) AS total
FROM supply_chain_analysis
GROUP BY delivery_status;
