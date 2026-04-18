--7. CHANGE OVER TIME ANALYSIS

--Analyse sales performance over time 
SELECT
    YEAR(order_date) as order_year,
    SUM(sales_amount) as total_sales,
    COUNT(DISTINCT customer_key) as total_customers,
    SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date);



--part2
SELECT
    YEAR(order_date) as order_year,
    MONTH(order_date) as order_month,
    SUM(sales_amount) as total_sales,
    COUNT(DISTINCT customer_key) as total_customers,
    SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);



--part3

SELECT
    DATETRUNC(YEAR, order_date) as order_year,
    DATETRUNC(MONTH, order_date) as order_month,
    SUM(sales_amount) as total_sales,
    COUNT(DISTINCT customer_key) as total_customers,
    SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY 
    DATETRUNC(YEAR, order_date),
    DATETRUNC(MONTH, order_date)
ORDER BY 
    DATETRUNC(YEAR, order_date),
    DATETRUNC(MONTH, order_date);