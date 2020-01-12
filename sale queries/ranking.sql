SELECT d.month, SUM(s.loan_amount) , RANK() OVER ( ORDER BY SUM(s.loan_amount) DESC ) best 
FROM sale s, public."date" d   
WHERE s.sale_date_key = d.date_key AND 
    d.year = 2018 
GROUP BY  d.month; 

