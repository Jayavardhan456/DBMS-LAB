use taxpayer_1;
--task 1
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

EXCEPT

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
SELECT t.full_name
FROM Taxpayer t
WHERE t.taxpayer_id IN(
    SELECT i.taxpayer_id
    FROM Income_Record i
    WHERE year_id  = (
        SELECT year_id
        FROM FINANCIAL_YEAR
        WHERE year_label = '2025-2026'
    )
    EXCEPT
    SELECT i.taxpayer_id
    FROM Income_Record i
    WHERE year_id  = (
        SELECT year_id
        FROM FINANCIAL_YEAR
        WHERE year_label = '2024-2025'
    )
);