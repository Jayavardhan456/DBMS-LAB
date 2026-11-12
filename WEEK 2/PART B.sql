
USE taxpayer_1;
SELECT* FROM Income_Record;

--ALTER TABLE Income_Record
--DROP COLUMN remarks;
--task 1
INSERT INTO Income_Record() VALUES (1007,999,'ABC Comapany','50000.00','2026-04-01',1,1,7);
--task 2
INSERT INTO Income_Record() VALUES (1007,999,'ABC Comapany','50000.00','2026-04-01',20,1,8);
--task 3
INSERT INTO Income_Record() VALUES (1007,999,'ABC Comapany','50000.00','2026-04-01',1,15,9);

--task 4
DELETE FROM Taxpayer WHERE taxpayer_id = 101;
--task 5
DELETE FROM Income_category WHERE category_id=1;