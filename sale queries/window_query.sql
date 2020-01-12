SELECT date, total_granted, week_total_sale_avg 
FROM  
(SELECT q1.date AS date, q1.month AS month,  SUM(q1.loan_amount) AS total_granted, AVG(SUM(q1.loan_amount)) 
OVER ( ORDER BY q1.date_key ROWS BETWEEN 3 PRECEDING and 3 FOLLOWING ) AS week_total_sale_avg 
FROM  
(   
SELECT d.*, COALESCE(s.loan_amount ,0) AS loan_amount 
FROM 
public."date" d LEFT OUTER JOIN sale s 
ON d.date_key = s.sale_date_key 
WHERE d.year = 2018 AND 
    d.month in (2,3,4) 
)AS q1  
GROUP BY q1.date_key,q1.date, q1.month 
) AS iq 
WHERE iq.month = 3 







