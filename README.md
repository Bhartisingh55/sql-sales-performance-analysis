![image](https://github.com/user-attachments/assets/6d835ddb-5c80-492a-be94-3b7cf4ad3290)






# 🧾 Sales Performance Analysis using SQL

This project demonstrates my intermediate SQL skills by analyzing a fictional company's regional sales performance using mock datasets for customers, products, and sales.

## 🎯 Objective

To explore and analyze sales data using SQL to generate insights about revenue trends, top-performing customers, and product performance using key SQL concepts like JOINs, CTEs, window functions, subqueries, and aggregation.

---

## 🗂️ Dataset Overview

### 📁 customers.csv
- `customer_id`: Unique ID for each customer
- `customer_name`: Name of the customer
- `region`: Customer's region (North, South, East, West)

### 📁 products.csv
- `product_id`: Unique ID for each product
- `product_name`: Name of the product
- `category`: Product category
- `price`: Unit price (in INR)

### 📁 sales.csv
- `sale_id`: Unique ID for each transaction
- `customer_id`: Linked to customers table
- `product_id`: Linked to products table
- `quantity`: Quantity sold
- `sale_date`: Date of sale

---

## 🔍 SQL Features Demonstrated

- JOINs (INNER, LEFT)
- GROUP BY and HAVING
- Common Table Expressions (CTEs)
- Window Functions (`RANK()`, `ROW_NUMBER()`)
- Subqueries and Nested Queries
- Conditional Logic with `CASE WHEN`
- Date-based aggregations

---

## 💡 Sample Query

```sql
-- Total Revenue by Region
SELECT c.region, SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region;
