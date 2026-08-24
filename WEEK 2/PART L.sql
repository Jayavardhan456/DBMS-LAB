use taxpayer_1;
--task 1
SELECT full_name,occupation
FROM Taxpayer
WHERE annual_income>ALL(
    SELECT occupation
    FROM Taxpayer
    WHERE occupation = 'Teacher'
);
--task 2
SELECT full_name,occupation
FROM Taxpayer
WHERE annual_income>ALL(
    SELECT taxpayer_id
    FROM Taxpayer
    WHERE taxpayer_id IN(
        SELECT taxpayer_id
        FROM Income_Record
        WHERE category_id IN(
            SELECT category_id
            FROM Income_category
            WHERE category_name='Bussiness'
        )
    )
);
