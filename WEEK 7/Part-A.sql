use taxpayer_1;
select* from taxpayer;
select* from income_record;
select* from income_category;
select* from Financial_Year;
--lvl1
--task1
create view highest_income as
SELECT amount
FROM income_record
where amount = (
    SELECT MAX(amount)
    FROM income_record
);
--task2
create view lowest_income as
SELECT amount
FROM income_record
where amount = (
    SELECT MIN(amount)
    FROM income_record
);
--task 3
create view gre_avg as
SELECT*
from income_record
where amount>(
    SELECT AVG(amount)
    from income_record
);
--task 4
create view equals_highamount as
SELECT amount
FROM income_record
where amount = (
    SELECT MAX(amount)
    FROM income_record
);
--task5
create view bussiness_occupation as
SELECT full_name
from taxpayer
where occupation =(
    SELECT occupation
    from taxpayer
    where occupation = 'Bussiness Owner'
);
--lvl2
--task 1
create view atleastone_record as
SELECT full_name
from taxpayer
where taxpayer_id = any(
    SELECT taxpayer_id
    from income_record
);
--task 2
create view bussiness_income_cat as
select full_name
from taxpayer
where taxpayer_id in(
    SELECT taxpayer_id
    from income_record
    where category_id in(
        SELECT category_id
        from income_category
        where category_name = 'Bussiness'
    )
);
--task3
create view belongs_2k2526 as 
select i.*
from income_record i
JOIN financial_year f
on i.year_id = f.year_id
where f.year_label = '2025-2026';
--task 4
create view min_bus_in as
select*
from income_record
where amount>(
    select min(amount)
    from income_record
    where category_id in (
        SELECT category_id
        from income_category
        where category_name='Bussiness'
    )
);
--task 5
create view max_salary_in as
select*
from income_record
where amount<(
    select max(amount)
    from income_record
    where category_id in (
        SELECT category_id
        from income_category
        where category_name='Salary'
    )
);
--task 6
create view greater_avg as
SELECT full_name
from taxpayer
where taxpayer_id in (
    SELECT taxpayer_id
    from income_record
    where amount>(
        SELECT avg(amount)
        from income_record
    )
);
--task 7
create view atleastone_category as
SELECT *
from income_category
where category_id = any(
    SELECT category_id
    from income_record
);
--task 8
CREATE VIEW taxpayers_no_investment_income AS
SELECT t.taxpayer_id, t.full_name
FROM taxpayer t
WHERE NOT EXISTS (
    SELECT 1
    FROM income_record i
    INNER JOIN income_category ic
        ON i.category_id = ic.category_id
    WHERE i.taxpayer_id = t.taxpayer_id
      AND ic.category_name = 'Investment'
);



