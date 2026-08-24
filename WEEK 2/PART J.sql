use taxpayer_1;
--task 1
SELECT full_name
FROM Taxpayer t
WHERE NOT EXISTS(
    SELECT*
    FROM Income_Record ir
    WHERE ir.taxpayer_id = t.taxpayer_id
);
--task 2
SELECT category_name
FROM Income_Category ic
WHERE NOT EXISTS(
    SELECT*
    FROM Income_Record ir
    WHERE ir.category_id = ic.category_id
);