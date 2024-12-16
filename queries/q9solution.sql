with cte1 as (
select 
	round(sum(g.gross_price* s.sold_quantity)/1000000,2) as total_gross_sales_mln
FROM fact_sales_monthly s
LEFT JOIN fact_gross_price g
USING(product_code, fiscal_year)
where s.fiscal_year= 2021
),
cte2 as(
SELECT 
    c.channel,
    ROUND(sum(g.gross_price* s.sold_quantity)/1000000,2) as gross_sales_mln
FROM fact_sales_monthly s
LEFT JOIN fact_gross_price g
USING(product_code, fiscal_year)
LEFT JOIN dim_customer c
USING(customer_code)
WHERE s.fiscal_year = 2021
GROUP BY c.channel
)
SELECT 
	c2.channel,
    c2.gross_sales_mln,
	round(c2.gross_sales_mln/c1.total_gross_sales_mln*100, 2) as percentage
FROM cte2 c2
CROSS JOIN cte1 c1
ORDER BY percentage desc
;

