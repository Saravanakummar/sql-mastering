-- Day 1 – SQL Challenges
-- Make sure you ran practice.sql first and you are using:
--   USE day1_sql_store;

USE day1_sql_store;

--------------------------------------------------
-- Q1: Top 10 highest paying customers
-- Requirement:
--   Show the top 10 customers based on the total amount they have paid.
--   Columns:
--     customer_id, full_name, city, total_paid
--------------------------------------------------

-- TODO: Write your query here
-- HINT:
--   - Join customers -> orders -> payments
--   - SUM(paid_amount) grouped by customer
--   - ORDER BY total_paid DESC
--   - LIMIT 10

-- Q1 Solution Attempt:
SELECT
    -- your columns here
FROM
    -- your joins here
WHERE
    -- optional filters
GROUP BY
    -- group by customer
ORDER BY
    -- order by total_paid desc
LIMIT 10;


--------------------------------------------------
-- Q2: Total orders placed in last 7 days
-- Requirement:
--   Count how many orders were placed in the last 7 days
--   from today (CURDATE).
--   Columns:
--     total_orders_last_7_days
--------------------------------------------------

-- TODO: Write your query here
-- HINT:
--   - Filter orders using:
--       order_date >= CURDATE() - INTERVAL 7 DAY

-- Q2 Solution Attempt:
SELECT
    -- COUNT(*) AS total_orders_last_7_days
FROM
    orders
WHERE
    -- date filter here
;


--------------------------------------------------
-- Q3: Categorize orders into Low / Medium / High
-- Requirement:
--   For each order, show:
--     order_id, customer_id, total_amount, amount_bucket
--   Where amount_bucket is:
--     'Low'    -> total_amount < 1000
--     'Medium' -> 1000 <= total_amount < 5000
--     'High'   -> total_amount >= 5000
--------------------------------------------------

-- TODO: Write your query here
-- HINT:
--   - Use CASE expression on total_amount

-- Q3 Solution Attempt:
SELECT
    order_id,
    customer_id,
    total_amount,
    CASE
        -- your conditions
    END AS amount_bucket
FROM
    orders;


--------------------------------------------------
-- Q4: Average order value (AOV) for completed orders
-- Requirement:
--   Calculate the average order value (AOV) considering only:
--     status IN ('PAID', 'SHIPPED')
--   Columns:
--     avg_order_value
--------------------------------------------------

-- TODO: Write your query here
-- HINT:
--   - Use AVG(total_amount)
--   - Filter by status

-- Q4 Solution Attempt:
SELECT
    -- AVG(total_amount) AS avg_order_value
FROM
    orders
WHERE
    -- status filter
;


--------------------------------------------------
-- Q5: Top 3 cities by total revenue
-- Requirement:
--   For each city, compute total revenue based on paid_amount.
--   Then show only top 3 cities by total revenue.
--   Columns:
--     city, total_revenue
--------------------------------------------------

-- TODO: Write your query here
-- HINT:
--   - Join customers -> orders -> payments
--   - Group by city and sum(paid_amount)
--   - ORDER BY total_revenue DESC
--   - LIMIT 3

-- Q5 Solution Attempt:
SELECT
    -- city,
    -- SUM(paid_amount) AS total_revenue
FROM
    -- joins here
GROUP BY
    -- city
ORDER BY
    -- total_revenue DESC
LIMIT 3;


--------------------------------------------------
-- EXTRA (Optional): Customers with no orders
-- Requirement:
--   List customers who have never placed any order.
--   Columns:
--     customer_id, full_name, city
--------------------------------------------------

-- Try this on your own. No solution is provided for this here.
-- (You can always write it and later compare with your own answer.)
