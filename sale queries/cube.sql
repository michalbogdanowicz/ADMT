-- A CUBE query, on the amount of loan granted on Marital Status, Region, Month, and Currency 

SELECT c.marital_status, b.Region, d.Month, p.currency,SUM(s.loan_amount)   
FROM sale s, public."date" d , customer c, product p, branch b 
WHERE s.sale_date_key = d.date_key AND 
s.product_key = p.product_key AND 
s.customer_key = c.customer_key AND 
s.branch_key = b.branch_key 
GROUP BY CUBE(c.marital_status, b.Region, d.Month, p.currency );  


-- A CUBE query, on the mean fixed rate on quarter, region, province of the year 2018. 
SELECT  d.quarter, b.region, b.province ,AVG(s.fixed_rate) as mean_fixed_rate  
FROM sale s, branch b , public."date" d 
WHERE s.branch_key = b.branch_key AND 
s.sale_date_key = d.date_key and  
d.year = 2018 
GROUP BY CUBE(d.quarter, b.region, b.province); 
