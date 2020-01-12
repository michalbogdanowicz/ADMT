-- A GROUPING SETS query that shows the average of spread and indexrate on region, province and year. Taking only the combination that are required. 
					   
					  
SELECT b.region, b. province, c.customer_type , d.year ,avg(s.spread) as "mean Spread", avg(s.index_rate) as "mean IndexRate"
FROM sale s, customer c, branch b, date d
WHERE s.customer_key = c.customer_key AND
s.branch_key = b.branch_key AND
 s.sale_date_key = d.date_key
GROUP BY GROUPING SETS ((b.region, b.province, d.year),
					   (b.region, c.customer_type, d.year),
					   (b.region, c.customer_type) ); 
		

SELECT distinct d.year, d.month, p.currency,c.job ,AVG(s.fixed_rate) as "fixed rate"
FROM sale s, customer c,  date d, product p
WHERE s.customer_key = c.customer_key AND
 s.sale_date_key = d.date_key AND 
 s.product_key = p.product_key

GROUP BY GROUPING SETS ((d.year, d.month , p.currency,c.job ),
					   (d.year,  d.month, c.job ),
   					   (d.year,  d.month, p.currency ),
					   (d.year),
					   (d.year, d.month)); 