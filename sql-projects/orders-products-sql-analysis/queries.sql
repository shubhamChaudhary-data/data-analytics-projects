-- 1. View sample data
SELECT * FROM products;
SELECT * FROM orders;

-- 2. Total revenue generated
SELECT 
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id;

-- 3. Revenue by product
SELECT 
    p.product_name,
    SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 4. Top selling products (by quantity)
SELECT 
    p.product_name,
    SUM(o.quantity) AS total_units_sold
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;

-- 5. Sales by category
SELECT 
    p.category,
    SUM(o.quantity * p.price) AS category_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 6. Monthly sales trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(o.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;
