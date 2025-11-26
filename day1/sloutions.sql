-- Day 1 – SQL Challenge Solutions
-- Make sure you ran practice.sql first and you are using:
--   USE day1_sql_store;

USE day1_sql_store;

--------------------------------------------------
-- Q1: Top 10 highest paying customers
--------------------------------------------------

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.city,
    SUM(p.paid_amount) AS total_paid
FROM
    customers c
    JOIN orders o   ON c.customer_id = o.customer_id
    JOIN payments p ON o.order_id = p.order_id
GROUP BY
    c.customer_id,
    full_name,
    c.city
ORDER BY
    total_paid DESC
LIMIT 10;


--------------------------------------------------
-- Q2: Total orders placed in last 7 days
--------------------------------------------------

SELECT
    COUNT(*) AS total_orders_last_7_days
FROM
    orders
WHERE
    order_date >= CURDATE() - INTERVAL 7 DAY;


--------------------------------------------------
-- Q3: Categorize orders into Low / Medium / High
--------------------------------------------------

SELECT
    order_id,
    customer_id,
    total_amount,
    CASE
        WHEN total_amount < 1000 THEN 'Low'
        WHEN total_amount >= 1000 AND total_amount < 5000 THEN 'Medium'
        ELSE 'High'
    END AS amount_bucket
FROM
    orders;


--------------------------------------------------
-- Q4: Average order value (AOV) for completed orders
--------------------------------------------------

SELECT
    AVG(total_amount) AS avg_order_value
FROM
    orders
WHERE
    status IN ('PAID', 'SHIPPED');


--------------------------------------------------
-- Q5: Top 3 cities by total revenue
--------------------------------------------------

SELECT
    c.city,
    SUM(p.paid_amount) AS total_revenue
FROM
    customers c
    JOIN orders o   ON c.customer_id = o.customer_id
    JOIN payments p ON o.order_id = p.order_id
GROUP BY
    c.city
ORDER BY
    total_revenue DESC
LIMIT 3;


--------------------------------------------------
-- EXTRA (Optional): Customers with no orders
-- (Not part of the main 5, but useful pattern)
--------------------------------------------------

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.city
FROM
    customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE
    o.order_id IS NULL;

