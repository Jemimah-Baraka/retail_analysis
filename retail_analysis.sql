CREATE DATABASE IF NOT EXISTS sales;
USE sales;
select * from online_retail_dataset o;
-- customers with most quantity
SELECT customer_id , sum(DISTINCT quantity) as total_quantity
FROM online_retail_dataset
GROUP BY customer_id
ORDER BY total_quantity
LIMIT 5;

-- Total revenue across all orders 
SELECT SUM(quantity * price) AS total_revenue
FROM online_retail_dataset;

-- Top 5 best-selling products by total quantity sold
SELECT product_name, SUM(quantity) AS total_sold
FROM online_retail_dataset
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 5;

-- Top 5 products by total revenue generated
SELECT product_name, SUM(quantity * price) AS revenue
FROM online_retail_dataset
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 5;

-- Top 5 customers by total quantity purchased
SELECT customer_id, first_name, last_name, SUM(quantity) AS total_quantity
FROM online_retail_dataset
GROUP BY customer_id, first_name, last_name
ORDER BY total_quantity DESC
LIMIT 5;

-- Top 5 customers by total amount spent
SELECT customer_id, first_name, last_name, SUM(amount) AS total_spent
FROM online_retail_dataset
GROUP BY customer_id, first_name, last_name
ORDER BY total_spent DESC
LIMIT 5;

--  Number of orders per customer
SELECT customer_id, first_name, last_name, COUNT(DISTINCT order_id) AS num_orders
FROM online_retail_dataset
GROUP BY customer_id, first_name, last_name
ORDER BY num_orders DESC
LIMIT 5;

--  Sales by city
SELECT city, SUM(quantity * price) AS total_sales
FROM online_retail_dataset
GROUP BY city
ORDER BY total_sales DESC;

--  Sales by product category
SELECT category_name, SUM(quantity * price) AS category_sales
FROM online_retail_dataset
GROUP BY category_name
ORDER BY category_sales DESC;

-- Most popular payment method
SELECT payment_method, COUNT(*) AS times_used
FROM online_retail_dataset
GROUP BY payment_method
ORDER BY times_used DESC;

--  Monthly sales trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(quantity * price) AS monthly_sales
FROM online_retail_dataset
GROUP BY month
ORDER BY month;

-- Average order amount per customer
SELECT customer_id, first_name, last_name, AVG(amount) AS avg_order_amount
FROM online_retail_dataset
GROUP BY customer_id, first_name, last_name
ORDER BY avg_order_amount DESC
LIMIT 5;

-- Customers who made only 1 order (one-time buyers)
SELECT customer_id, first_name, last_name, COUNT(DISTINCT order_id) AS orders
FROM online_retail_dataset
GROUP BY customer_id, first_name, last_name
HAVING orders = 1;

-- Highest-priced products purchased
SELECT product_name, price
FROM online_retail_dataset
ORDER BY price DESC
LIMIT 5;

-- Gender breakdown of customers by total spend
SELECT gender, SUM(amount) AS total_spent
FROM online_retail_dataset
GROUP BY gender
ORDER BY total_spent DESC;