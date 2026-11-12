--PART-A
use taxpayer_1;
select* from taxpayer;
select* from income_category;
select* from financial_year;
select* from income_record;
--PART-B
--lvl 1
--task 1
select full_name,income_source
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id;
--task 2
select full_name,category_name
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id;
--task 3
select amount,year_label
from income_record i
INNER JOIN financial_year f
ON i.year_id=f.year_id;
--task 4
select full_name,annual_income,income_source
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id;
--task 5
select full_name,income_source,category_name,year_label
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id
INNER JOIN financial_year f
on i.year_id = f.year_id;
--lvl 2
--task 1
select full_name,category_name
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id
WHERE category_name = 'Salary';
--task 2
select full_name,category_name,occupation,income_source
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id
WHERE category_name='Business';
--task 3
select full_name,year_label,start_date,end_date
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN financial_year f 
on i.year_id = f.year_id;
--task 4
select full_name,occupation,annual_income,category_name,des_cription
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id;
--task 5
select full_name,pan_number,occupation,income_source,category_name,amount,year_label,start_date,end_date
from taxpayer t
INNER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id 
INNER JOIN income_category ic 
on i.category_id = ic.category_id
INNER JOIN financial_year f
on i.year_id=f.year_id;
--lvl3
--task 1
select full_name,income_source
from taxpayer t
LEFT OUTER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id;
--task 2
select category_name,income_source
from  income_record i
RIGHT OUTER JOIN income_category ir
ON i.category_id=ir.category_id;
--task 3
select full_name,income_source
from taxpayer t
LEFT OUTER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id
UNION
select full_name,income_source
from taxpayer t
RIGHT OUTER JOIN income_record i
ON t.taxpayer_id=i.taxpayer_id;
--task 4
select full_name,year_label
from taxpayer t
CROSS JOIN financial_year;
--task 5
SELECT t1.full_name as Taxp1,t2.full_name as Taxp2,t1.occupation
from taxpayer t1
INNER JOIN taxpayer t2 
on t1.occupation = t2.occupation and t1.taxpayer_id < t2.taxpayer_id;

