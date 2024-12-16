SELECT 
	DISTINCT(market)
FROM dim_customer
WHERE 
	customer = "Atliq Exclusive" and
    region = "APAC";