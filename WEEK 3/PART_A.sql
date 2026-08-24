USE taxpayer_1;
SHOW TABLES;
--PARTB
--Level 1
--1.
SELECT UPPER(full_name)
FROM Taxpayer;
--2.
SELECT LOWER(occupation)
FROM Taxpayer;
--3.
SELECT LENGTH(full_name)
FROM Taxpayer;
--4.
SELECT LEFT(pan_number,4) AS first_4_char
FROM Taxpayer;


SELECT CONCAT(full_name," " ,occupation)
FROM Taxpayer;

--level2
--6.
SELECT REPLACE(category_name,"Income","Inc.")
From Income_Category;
--7.
SELECT TRIM(full_name)
FROM Taxpayer;
--8
SELECT SUBSTRING_INDEX(full_name," ",1)
FROM Taxpayer;
--lvl 3
--9
SELECT CONCAT("Taxpayer:",full_name,"\n","Occupation:",occupation)
FROM Taxpayer;
--10
SELECT LEFT(full_name,2)="AP"
FROM Taxpayer;
