use taxpayer_1;
show tables;
desc income_record;
select * from income_record;
--lvl-1
--task 1
SELECT*
FROM Income_Record i 
WHERE amount IN(
    SELECT MAX(amount)
    FROM Taxpayer);
--lvl-2
SELECT*
FROM Income_Record i 
WHERE amount IN (
    SELECT MIN(amount)
    FROM Taxpayer);
--lvl-3
SELECT*
FROM Income_Record
WHERE amount>(
    SELECT AVG(amount)
    FROM Taxpayer);
--tak-4
SELECT*
FROM Income_Record i 
WHERE amount=(
    SELECT MAX(amount)
    FROM Taxpayer);
--task-5
SELECT *
FROM Taxpayer 
WHERE full_name IN(
    SELECT occupation
    FROM Taxpayer
    WHERE occupation = 'Business Owner'
);

select * from income_record;
--lvl 2
--task 1
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN(
    SELECT taxpayer_id
    FROM income_record
);
--task 2
SELECT*
FROM Taxpayer
WHERE taxpayer_id IN(
    SELECT taxpayer_id
    FROM income_record
    WHERE category_id IN(
        SELECT category_id
        FROM income_category
        WHERE category_name = 'Business'
    )
);
--task 3
SELECT*
FROM income_record
where year_id IN(
    SELECT year_id
    FROM financial_year
    where year_label = '2025-2026'
);
--task 4
SELECT*
FROM income_record
WHERE amount>(
    select MIN(amount)
    FROM income_record
    where category_id IN(
        select category_id
        FROM income_category
        WHERE category_name = 'Business'
    )
);
--task 5
SELECT*
FROM income_record
WHERE amount<(
    select MAX(amount)
    FROM income_record
    where category_id IN(
        select category_id
        FROM income_category
        WHERE category_name = 'Salary'
    )
);
--task 6
SELECT taxpayer_id,full_name
FROM Taxpayer
where taxpayer_id IN(
    SELECT taxpayer_id
    FROM income_record
    where amount>(
        select avg(amount)
        FROM income_record
    )
);
--task 7
SELECT*
FROM income_category
where category_id IN(
    SELECT category_id
    FROM income_record
);
--task 8
SELECT taxpayer_id,full_name
FROM Taxpayer
where taxpayer_id NOT IN(
    SELECT taxpayer_id
    FROM income_record
    WHERE category_id IN(
        SELECT category_id
        FROM income_category
        WHERE category_name='Investment'
    )
);
--lvl3
--task 1
SELECT taxpayer_id,full_name
FROM Taxpayer
WHERE taxpayer_id IN(
    SELECT taxpayer_id
    FROM Income_Record
    where amount IN (
        SELECT MAX(amount)
        FROM income_record
    )
);
--task 2
SELECT*
FROM income_record
WHERE amount>(
    select AVG(amount)
    FROM income_record
    where category_id IN(
        select category_id
        FROM income_category
        WHERE category_name = 'Business'
    )
);
--task 3
SELECT taxpayer_id,full_name
FROM Taxpayer
where taxpayer_id IN(
    SELECT taxpayer_id
    FROM income_record
    where amount>(
        SELECT avg(amount)
        FROM income_record
    )
);
--task 4
SELECT*
FROM income_record
where amount>ANY(
    SELECT category_id
    FROM income_record
    where category_id IN(
        SELECT category_id
        FROM income_category
        WHERE category_name = "Investment"
    )
);
--task 5
SELECT*
FROM income_record
where amount>ALL(
    SELECT category_id
    FROM income_record
    where category_id IN(
        SELECT category_id
        FROM income_category
        WHERE category_name = "Investment"
    )
);
--task 6
SELECT*
FROM income_category
where category_id IN(
    SELECT category_id
    from income_record
    WHERE amount IN(
        select max(amount)
        from income_record
    )
);
--task 7
SELECT year_id, year_label
FROM financial_year
WHERE year_id IN (
    SELECT year_id
    FROM income_record
    GROUP BY year_id
    HAVING SUM(amount) = (
        SELECT MAX(total_income)
        FROM (
            SELECT SUM(amount) AS total_income
            FROM income_record
            GROUP BY year_id
        ) AS totals
    )
);
--task 8
SELECT taxpayer_id, full_name
FROM Taxpayer
WHERE taxpayer_id IN (
    SELECT taxpayer_id
    FROM Income_Record
    GROUP BY taxpayer_id
    HAVING SUM(amount) > (
        SELECT AVG(total_income)
        FROM (
            SELECT taxpayer_id, SUM(amount) AS total_income
            FROM Income_Record
            GROUP BY taxpayer_id
        ) AS totals
    )
);
--Real-World taxation Analysis
--task 1
SELECT taxpayer_id,full_name
from Taxpayer
where taxpayer_id in(
    SELECT taxpayer_id
    from income_record
    where amount in(
        SELECT max(amount)
        from income_record
    )
);
--task 2
SELECT taxpayer_id,full_name
from Taxpayer
where taxpayer_id in(
    SELECT taxpayer_id
    from income_record
    where amount >(
        SELECT avg(amount)
        from income_record
    )
);
--task 3
SELECT category_name
from income_category
where category_id in(
    SELECT category_id
    from income_record
    where amount in(
        SELECT max(amount)
        from income_record
    )
);
--task 4
select full_name
from Taxpayer
where taxpayer_id in(
    select taxpayer_id
    from income_record
    where category_id in(
        select category_id
        from income_category
        where category_name = 'Business'
    )
    INTERSECT
    select taxpayer_id
    from income_record
    where category_id NOT IN(
        select category_id
        from income_category
        where category_name = 'Investment'
    )
);
--task 5
SELECT *
from income_record
where amount>ALL(
    SELECT amount
    from income_record
    where category_id in(
        select category_id
        from income_category
        where category_name = 'Investment'
    )
);
--task 6
SELECT *
from income_record
where amount>ANY(
    SELECT amount
    from income_record
    where category_id in(
        select category_id
        from income_category
        where category_name = 'Investment'
    )
);
--task 7
SELECT taxpayer_id, full_name
FROM Taxpayer
WHERE taxpayer_id IN (
    SELECT taxpayer_id
    FROM income_record
    GROUP BY taxpayer_id
    HAVING SUM(amount) = (
        SELECT MAX(total_income)
        FROM (
            SELECT SUM(amount) AS total_income
            FROM income_record
            GROUP BY taxpayer_id
        ) AS totals
    )
);
--task 8
SELECT i.*
FROM Income_Record i
JOIN (
    SELECT category_id, AVG(amount) AS avg_amount
    FROM Income_Record
    GROUP BY category_id
) a
ON i.category_id = a.category_id
WHERE i.amount > a.avg_amount;