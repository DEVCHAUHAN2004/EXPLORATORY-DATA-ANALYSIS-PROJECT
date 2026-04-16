-- 2. DIMENSION EXPLORATION

--Explore all countries our customers come from 
SELECT DISTINCT country
FROM gold.dim_customers

--Explore all product categories "the major divisions"
SELECT DISTINCT category,subcategory,product_name
FROM gold.dim_products
order by 1,2,3