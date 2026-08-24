use taxpayer_1;
--task 1
SELECT full_name
FROM Taxpayer t
WHERE EXISTS (
    SELECT *
    FROM Income_record ir
    WHERE ir.taxpayer_id = t.taxpayer_id
);
--task 2
SELECT year_label
FROM Financial_Year F 
WHERE EXISTS(
    SELECT*
    FROM Income_Record ir
    WHERE ir.year_id = F.year_id
);