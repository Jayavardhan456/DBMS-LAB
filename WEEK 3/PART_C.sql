USE taxpayer_1;
--level 1
--1
SELECT ROUND(annual_income)
FROM Taxpayer;
--2
SELECT ABS(annual_income)
FROM Taxpayer;
--3
SELECT POWER(annual_income,2)
FROM Taxpayer;
--level 2
--4
SELECT MOD(annual_income,1000)
FROM Taxpayer;
--5
SELECT ROUND(annual_income,2)
FROM Taxpayer;
--6
SELECT CEIL(annual_income),
       FLOOR(annual_income) 
FROM Taxpayer;
--lvl 3
--7
SELECT FLOOR(RAND()*100)+1;
--8
SELECT SQRT(annual_income)
FROM Taxpayer;
--9
SELECT annual_income*1.10 AS estimate_income
FROM Taxpayer;
