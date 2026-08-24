use taxpayer_1;
--task-1
SELECT t.full_name
FROM Taxpayer t
WHERE t.taxpayer_id IN (
    SELECT i.taxpayer_id
    FROM Income_Record i
    WHERE i.category_id = (
        SELECT c.category_id
        FROM Income_Category c
        WHERE c.category_name = 'Salary'
    )
)

UNION

SELECT t.full_name
FROM Taxpayer t
WHERE t.taxpayer_id IN (
    SELECT i.taxpayer_id
    FROM Income_Record i
    WHERE i.category_id = (
        SELECT c.category_id
        FROM Income_Category c
        WHERE c.category_name = 'Business'
    )
);
--task 2
SELECT income_source
FROM Income_Record
WHERE financial_year='2024-2025'

UNION

SELECT income_source
FROM Income_Record
WHERE financial_year = '2025-2026';

SELECT income_source
FROM Income_Record
WHERE year_id = (
    SELECT year_id
    FROM Financial_Year
    WHERE year_label = '2024-2025'
)

UNION

SELECT income_source
FROM Income_Record
WHERE year_id = (
    SELECT year_id
    FROM Financial_Year
    WHERE year_label = '2025-2026'
);
--task 3
SELECT full_name
FROM Taxpayer 
WHERE occupation = 'Teacher'
UNION
SELECT full_name
FROM Taxpayer 
WHERE occupation = 'Software engineer';