use taxpayer_1;
--task 6
select full_name,pan_number,income_source,category_name,year_label
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id
INNER JOIN financial_year f
on i.year_id=f.year_id;
--task 7
select full_name,category_name,des_cription
from taxpayer t
JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
JOIN income_category ic 
on i.category_id = ic.category_id;
--task 8
SELECT income_source,year_label
from income_record i
JOIN financial_year f
on i.year_id = f.year_id;
--task 9
select full_name,category_name,year_label
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id
INNER JOIN financial_year f
on i.year_id=f.year_id
WHERE category_name = 'Business' and year_label = '2025-2026';
--task 10
select full_name,pan_number,occupation,income_source,category_name,des_cription,amount,year_label,start_date,end_date
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id
INNER JOIN financial_year f
on i.year_id=f.year_id;
