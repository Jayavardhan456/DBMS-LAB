use taxpayer_1;
--task 1
SELECT full_name
FROM Taxpayer
WHERE taxpayer_id IN(
    SELECT taxpayer_id
    FROM Income_Record
);
--task 2
SELECT full_name,occupation
FROM Taxpayer                   
WHERE occupation IN(
    SELECT occupation
    FROM Taxpayer
    WHERE taxpayer_id IN(
        SELECT taxpayer_id
        FROM Income_Record
        WHERE category_id IN(
            SELECT category_id
            FROM Income_Category
            WHERE category_name = "Bussiness"
        )
    )
);