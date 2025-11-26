
---

## `practice.sql`

```sql
-- Day 1 – SQL Practice Setup (MySQL)
-- This script creates a sample e-commerce database with:
--   customers, orders, payments

-- 1. Create and use database
DROP DATABASE IF EXISTS day1_sql_store;
CREATE DATABASE day1_sql_store;
USE day1_sql_store;

-- 2. Create tables

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      VARCHAR(100) UNIQUE,
    city       VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders (
    order_id     INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    total_amount DECIMAL(10,2),
    status       ENUM('PENDING','PAID','SHIPPED','CANCELLED'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Payments table
CREATE TABLE payments (
    payment_id     INT AUTO_INCREMENT PRIMARY KEY,
    order_id       INT,
    paid_amount    DECIMAL(10,2),
    payment_date   DATE,
    payment_method VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 3. Insert sample data

-- Customers
INSERT INTO customers (first_name, last_name, email, city, created_at) VALUES
('Arun',     'Kumar',   'arun.kumar@example.com',     'Chennai',   '2025-10-01 10:00:00'),
('Priya',    'Sharma',  'priya.sharma@example.com',   'Bengaluru', '2025-09-15 09:15:00'),
('Rahul',    'Verma',   'rahul.verma@example.com',    'Mumbai',    '2025-08-20 11:30:00'),
('Sneha',    'Reddy',   'sneha.reddy@example.com',    'Hyderabad', '2025-10-10 14:45:00'),
('Vikram',   'Singh',   'vikram.singh@example.com',   'Delhi',     '2025-09-25 16:10:00'),
('Kavya',    'Iyer',    'kavya.iyer@example.com',     'Chennai',   '2025-08-05 13:05:00'),
('Aniket',   'Patil',   'aniket.patil@example.com',   'Pune',      '2025-08-28 08:50:00'),
('Meera',    'Nair',    'meera.nair@example.com',     'Kochi',     '2025-09-05 12:20:00'),
('Sanjay',   'Gupta',   'sanjay.gupta@example.com',   'Mumbai',    '2025-10-20 17:40:00'),
('Lavanya',  'Mishra',  'lavanya.mishra@example.com', 'Bengaluru', '2025-10-25 19:00:00');

-- Orders
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2025-11-18',  750.00,  'PAID'),
(1, '2025-11-20',  1500.00, 'SHIPPED'),
(2, '2025-11-15',  5600.50, 'PAID'),
(2, '2025-11-21',  3200.00, 'PENDING'),
(3, '2025-11-10',  990.00,  'CANCELLED'),
(3, '2025-11-19',  2200.00, 'PAID'),
(4, '2025-11-22',  4800.00, 'PAID'),
(4, '2025-11-23',  5100.00, 'PAID'),
(5, '2025-11-01',  300.00,  'PAID'),
(5, '2025-11-05',  1200.00, 'SHIPPED'),
(6, '2025-11-16',  8500.00, 'PAID'),
(7, '2025-11-08',  4300.00, 'PENDING'),
(7, '2025-11-19',  6400.00, 'PAID'),
(8, '2025-11-17',  150.00,  'PAID'),
(9, '2025-11-21',  9999.99, 'PAID'),
(10,'2025-11-18',  2000.00, 'PAID');

-- Payments
INSERT INTO payments (order_id, paid_amount, payment_date, payment_method) VALUES
(1,  750.00,  '2025-11-18', 'UPI'),
(2,  1500.00, '2025-11-20', 'CARD'),
(3,  5600.50, '2025-11-15', 'NETBANKING'),
(6,  2200.00, '2025-11-19', 'CARD'),
(7,  4800.00, '2025-11-22', 'UPI'),
(8,  5100.00, '2025-11-23', 'CARD'),
(9,  300.00,  '2025-11-01', 'UPI'),
(10, 1200.00, '2025-11-05', 'CARD'),
(11, 8500.00, '2025-11-16', 'NETBANKING'),
(13, 6400.00, '2025-11-19', 'UPI'),
(14, 150.00,  '2025-11-17', 'UPI'),
(15, 9999.99, '2025-11-21', 'CARD'),
(16, 2000.00, '2025-11-18', 'CARD');

-- 4. Quick sanity checks (optional)

-- Check customers
SELECT * FROM customers LIMIT 5;

-- Check orders
SELECT * FROM orders LIMIT 5;

-- Check payments
SELECT * FROM payments LIMIT 5;

