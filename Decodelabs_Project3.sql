-- ============================================
-- PROJECT 3: SQL DATA ANALYSIS
-- DATABASE: MySQL
-- TABLE: orders
-- INTERN NAME: Martina Marco
-- ============================================

CREATE DATABASE IF NOT EXISTS decodelabs_project;
USE decodelabs_project;

-- ============================================
-- 1. CREATE TABLE STRUCTURE
-- ============================================
-- DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    Date VARCHAR(20),
    CustomerID VARCHAR(20),
    Product VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    ShippingAddress VARCHAR(100),
    PaymentMethod VARCHAR(20),
    OrderStatus VARCHAR(20),
    TrackingNumber VARCHAR(50),
    ItemsInCart INT,
    CouponCode VARCHAR(20),
    ReferralSource VARCHAR(20),
    TotalPrice DECIMAL(10,2),
    `Net-TotalProfit` DECIMAL(10,2)
);
SHOW TABLES;
DESCRIBE orders;


SELECT * FROM decodelabs_project.orders;

-- ============================================
-- LEVEL 1: BASIC SELECT 
-- ============================================
-- Q1: Show all orders with key columns

SELECT 
    OrderID,
    CustomerID,
    Product,
    Quantity,
    TotalPrice,
    OrderStatus,
    ReferralSource
FROM orders
LIMIT 20;

-- ============================================
-- LEVEL 2: WHERE CLAUSE & FILTERING
-- ============================================

-- Q2: How many orders were cancelled?

SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE OrderStatus = 'Cancelled';

-- ============================================
-- Q3: Which orders have a total price above 2000?

SELECT *
FROM orders
WHERE TotalPrice > 2000
ORDER BY TotalPrice DESC;

-- ============================================
-- LEVEL 3: GROUP BY & AGGREGATE FUNCTIONS
-- ============================================
-- Q4: Total sales and order count per product

SELECT 
    Product,
    SUM(TotalPrice) AS total_sales,
    COUNT(*) AS order_count
FROM orders
GROUP BY Product
ORDER BY total_sales DESC;

-- ============================================
-- Q5: Order count per order status

SELECT 
    OrderStatus,
    COUNT(*) AS order_count
FROM orders
GROUP BY OrderStatus
ORDER BY order_count DESC;

-- ============================================
-- LEVEL 4: HAVING CLAUSE
-- ============================================
-- Q6: Referral sources with total sales above 30,000

SELECT 
    ReferralSource,
    SUM(TotalPrice) AS total_sales
FROM orders
GROUP BY ReferralSource
HAVING total_sales > 30000
ORDER BY total_sales DESC;

-- ============================================
-- LEVEL 5: OEDER BY
-- ============================================
-- Q7: Top 3 months with highest sales

SELECT 
    Date AS month,
    SUM(TotalPrice) AS monthly_sales
FROM orders
GROUP BY Date
ORDER BY monthly_sales DESC
LIMIT 3;
-- ============================================
-- LEVEL 6: CUSTOMER ANALYSIS
-- ============================================
-- Q8: Top 10 customers by total spending

SELECT 
    CustomerID,
    SUM(TotalPrice) AS total_spent,
    COUNT(*) AS orders_count
FROM orders
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

-- ============================================
-- Q9: Customer distribution by order status

SELECT 
    OrderStatus,
    COUNT(DISTINCT CustomerID) AS unique_customers
FROM orders
GROUP BY OrderStatus
ORDER BY unique_customers DESC;

-- ============================================
-- LEVEL 7: ADVANCED ANALYTICS
-- ============================================
-- Q10: Products with highest profit margin

SELECT 
    Product,
    ROUND((SUM(`Net-TotalProfit`) / SUM(TotalPrice)) * 100, 2) AS profit_margin_percentage
FROM orders
GROUP BY Product
ORDER BY profit_margin_percentage DESC
LIMIT 5;

-- ============================================
-- Q11: Average order value by payment method

SELECT 
    PaymentMethod,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value,
    COUNT(*) AS order_count,
    SUM(TotalPrice) AS total_sales
FROM orders
GROUP BY PaymentMethod
ORDER BY avg_order_value DESC;

-- ============================================
-- LEVEL 8: BUSINESS INSIGHTS
-- ============================================
-- Q12: Overall business summary statistics

SELECT 
    COUNT(*) AS total_orders,
    COUNT(DISTINCT CustomerID) AS unique_customers,
    COUNT(DISTINCT Product) AS unique_products,
    ROUND(SUM(TotalPrice), 2) AS total_revenue,
    ROUND(SUM(`Net-TotalProfit`), 2) AS total_profit,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM orders;

-- ============================================
-- Q13: Best performing product by all metrics

SELECT 
    Product,
    SUM(TotalPrice) AS total_sales,
    SUM(`Net-TotalProfit`) AS total_profit,
    COUNT(*) AS order_count
FROM orders
GROUP BY Product
ORDER BY total_sales DESC, total_profit DESC
LIMIT 5;

-- ============================================
-- Q14: Delivered vs Non-delivered summary

SELECT 
    CASE 
        WHEN OrderStatus = 'Delivered' THEN 'Delivered'
        ELSE 'Not Delivered'
    END AS delivery_status,
    COUNT(*) AS order_count,
    ROUND(SUM(TotalPrice), 2) AS total_revenue,
    ROUND(SUM(`Net-TotalProfit`), 2) AS total_profit,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM orders
GROUP BY CASE 
        WHEN OrderStatus = 'Delivered' THEN 'Delivered'
        ELSE 'Not Delivered'
    END;
    