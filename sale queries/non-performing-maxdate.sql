-- need the to calculate the day distance from the pointed one.
select 730, sum(loan_amount), 
(case when min_date_npl is null then 'BONIS'
 when (730-min_date_npl) > 180 then 'DEFAULT'
 when (730-min_date_npl) > 90 then 'UTP' else 'PASTDUE' end) status
from sale s 
left join npl on s.customer_key = npl.sale_customer_key
group by status

select month_end_Date,  npl_capital, min_date_npl, s.customer_key,
(case when npl.min_date_npl is null then 'BONIS'
 when (month_end.date_key -npl.min_date_npl) > 180 then 'DEFAULT'
 when (month_end.date_key -npl.min_date_npl) > 90 then 'UTP' else 'PASTDUE' end) as creditor_type
from sale s , npl ,
(select max(date_key) as date_key, max(date) as month_end_Date
from "date"
group by year, month 
HAVING max(date) < current_date
order by year, month ) month_end
WHERE s.customer_key = npl.sale_customer_key


select npl.min_date_npl, loan_amount, s.customer_key,
(case when npl.min_date_npl is null then 'BONIS'
 when (730-npl.min_date_npl) > 180 then 'DEFAULT'
 when (730-npl.min_date_npl) > 90 then 'UTP' else 'PASTDUE' end) status
from sale s left join npl on s.customer_key = npl.sale_customer_key ,
(select max(date_key) as date_key, max(date) as month_end_Date
from "date"
group by year, month 
HAVING max(date) < current_date
order by year, month )  month_ends
WHERE npl.date_key = month_ends.date_key
ORDER BY npl.date_key

