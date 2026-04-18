-- 3. DATE EXPLORATION

--Find the date of the 1st and last order
SELECT MIN(order_date) AS first_order_date,
       MAX(order_date) AS last_order_date, 
       DATEDIFF(year, MIN(order_date), MAX(order_date)) as order_range_years,
       DATEDIFF(month, MIN(order_date), MAX(order_date)) as order_range_month,
       DATEDIFF(DAY, MIN(order_date), MAX(order_date)) as order_range_date
FROM gold.fact_sales

--find the youngest and oldest customer
SELECT MIN(birthdate) AS first_order_date,
       MAX(birthdate) AS last_order_date, 
       DATEDIFF(year, MIN(birthdate), MAX(birthdate)) as order_range_years,
       DATEDIFF(month, MIN(birthdate), MAX(birthdate)) as order_range_month,
       DATEDIFF(DAY, MIN(birthdate), MAX(birthdate)) as order_range_date
FROM gold.dim_customers