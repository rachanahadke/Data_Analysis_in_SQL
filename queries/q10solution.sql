with cte1 as (SELECT 
	p.division,
    p.product_code,
    p.product,
    sum(s.sold_quantity) as total_sold_quantity,
    dense_rank() over(partition by division order by sum(s.sold_quantity) desc) as rank_order
FROM dim_product p
LEFT JOIN  fact_sales_monthly s
USING(product_code)
WHERE s.fiscal_year = 2021
GROUP BY p.division,
    p.product_code,
    p.product
    )
    
SELECT * from cte1 
where 
rank_order <= 3
;