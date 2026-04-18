--9. PERFORMANCE ANALYSIS


/* Analyze the yearly performance of products by comparing their sales
to both the average sales performance of the product 
and the previous year's sales */

WITH yearly_product_sales AS(
SELECT 
      YEAR(f.order_date) AS order_year,
      p.product_name,
      SUM(f.sales_amount) AS current_sales
FROM Gold.fact_sales f
LEFT JOIN Gold.dim_products p
on f.product_key = p.product_key
WHERE f.order_date IS NOT NULL
GROUP BY  YEAR(f.order_date),p.product_name
)


select order_year,product_name,current_sales,
      AVG(current_sales) OVER(PARTITION BY product_name) as avg_sales,
      current_sales -  AVG(current_sales) OVER(PARTITION BY product_name) as diff_avg_sales,

      CASE WHEN  current_sales -  AVG(current_sales) OVER(PARTITION BY product_name) > 0 THEN 'Above avg'
           when  current_sales -  AVG(current_sales) OVER(PARTITION BY product_name) < 0 then 'Below avg'
           else 'Avg'
      END AS avg_change,


LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) py_sales,
current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) diff_py_sales,
   
   CASE WHEN  current_sales -  LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year)   > 0 THEN 'Incr'
           when  current_sales -  LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year)  < 0 then 'Decr'
           else 'No change'
      END AS py_change
from yearly_product_sales
ORDER BY product_name, order_year
