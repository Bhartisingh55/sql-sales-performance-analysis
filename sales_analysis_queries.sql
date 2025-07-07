
-- 1. Total sales revenue per region
SELECT c.region, SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region;

-- 2. Top 3 customers by revenue
SELECT c.customer_name, SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 3;

-- 3. Monthly sales trend
SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS month, SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- 4. Ranking products by revenue using window functions
SELECT product_name, category,
       SUM(price * quantity) AS total_revenue,
       RANK() OVER (PARTITION BY category ORDER BY SUM(price * quantity) DESC) AS rank_in_category
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY product_name, category;

-- 5. Use CASE WHEN to categorize regions by revenue threshold
SELECT c.region,
       SUM(p.price * s.quantity) AS total_revenue,
       CASE
           WHEN SUM(p.price * s.quantity) >= 100000 THEN 'High Revenue'
           WHEN SUM(p.price * s.quantity) >= 50000 THEN 'Medium Revenue'
           ELSE 'Low Revenue'
       END AS revenue_category
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region;
