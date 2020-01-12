--Amount of loan granted in euro grouped with a ROLLUP, on year, month and iso_week 

 

SELECT d.year, d.month, d.iso_week ,SUM(s.loan_amount)   
FROM sale s, public."date" d , product p  
WHERE s.sale_date_key = d.date_key AND p.product_key = s.product_key    
AND  p.currency = 'EUR' 
GROUP BY ROLLUP(d.year, d.month, d.iso_week);   

  

--Amount of loan granted group with a ROLLUP, on currency, region and province. 

  

SELECT p.currency , b.region, b.province ,SUM(s.loan_amount)    
FROM sale s, branch b, product p    
WHERE s.branch_key = b.branch_key AND p.product_key = s.product_key   
GROUP BY ROLLUP( p.currency, b.region, b.province); 
