SELECT 
	MONTH(s.date) as Month,
    YEAR(s.date) as Year,
    round(sum(g.gross_price * s.sold_quantity),2) as Gross_sales_Amount
FROM fact_sales_monthly s
LEFT JOIN fact_gross_price g
USING(fiscal_year, product_code)
LEFT JOIN dim_customer c
USING (customer_code)
WHERE c.customer = "Atliq Exclusive"
GROUP BY Year, Month
ORDER BY Year, Month
;
