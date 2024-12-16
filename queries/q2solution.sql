with cte1 as (
SELECT
	count(distinct(product_code)) as unique_product_2020 FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY fiscal_year),

cte2 as (
SELECT 
	count(distinct(product_code)) as unique_product_2021 FROM fact_sales_monthly
WHERE fiscal_year = 2021
GROUP BY fiscal_year)

SELECT *,
	round((unique_product_2021 - unique_product_2020)/unique_product_2020 * 100, 2) as percantage_chg
FROM cte1 cross join cte2 ;