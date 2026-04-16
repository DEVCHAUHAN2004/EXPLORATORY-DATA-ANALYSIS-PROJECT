-- 4. MEASURES EXPLORATION

--Find the Total Sales
SELECT SUM(sales_amount) as total_sales
FROM gold.fact_sales

--Find how many items are sold
SELECT SUM(quantity) as total_quantity
FROM Gold.fact_sales

--Find the average selling price
SELECT AVG(price) as avg_price
FROM Gold.fact_sales

--Find the Total number of Orders
SELECT COUNT(order_number) as total_orders
FROM Gold.fact_sales

--Find the total number of products
SELECT COUNT(product_number) as total_orders
FROM Gold.dim_products

--Find the total number of customers
SELECT COUNT(customer_number) as total_orders
FROM Gold.dim_customers

--Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_number) as total_orders
FROM Gold.dim_customers


-- Generate a Report that shows all key metrics of the business

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Nr. Customers', COUNT(customer_key) FROM gold.dim_customers;

--Total Sales:  29356250
--Total Quantity:	60423
--Average Price:  	486
--Total Nr. Orders:  	27659
--Total Nr. Products: 	295
--Total Nr. Customers: 	18484