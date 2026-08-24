USE taxpayer_1;
--lvl1
--1
SELECT CONVERT(annual_income,SIGNED)
FROM Taxpayer;
--2
SELECT CONVERT(taxpayer_id,char)
FROM Taxpayer;
--lvl 2
--3
SELECT CONVERT(start_date,DATETIME)
FROM Financial_Year;
--4
SELECT CONVERT(annual_income,DECIMAL)
FROM Taxpayer;

--lvl3
--5
SELECT CONVERT(annual_income,CHARACTER)
FROM Taxpayer;
--6
SELECT CONVERT(annual_income, DECIMAL(10,2)) * 0.10 AS tax
FROM Taxpayer;
