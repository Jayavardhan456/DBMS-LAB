use taxpayer_1;
--lvl-1
--task 1
SELECT*
FROM Income_Record i 
WHERE amount=(
    SELECT MAX(amount)
    FROM Taxpayer);