SELECT  
	m.product_code,
    p.product,
    m.manufacturing_cost
FROM fact_manufacturing_cost m 
JOIN 
dim_product p
USING (product_code)
where manufacturing_cost = (SELECT MAX(manufacturing_cost) as maxm FROM fact_manufacturing_cost)

UNION 

SELECT  
	m.product_code,
    p.product,
    m.manufacturing_cost
FROM fact_manufacturing_cost m 
JOIN 
dim_product p
USING (product_code)
where manufacturing_cost = (SELECT MIN(manufacturing_cost) as maxm FROM fact_manufacturing_cost)


