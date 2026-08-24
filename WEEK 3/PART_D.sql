USE taxpayer_1;
---PART-D
--lvl-1
SELECT CURDATE();
--2
SELECT CURDATE(),NOW();
--3
SELECT YEAR(start_date)
FROM Financial_Year;
--4
SELECT MONTH(start_date)
FROM Financial_Year;
--5
SELECT DAY(start_date)
FROM Financial_Year;
--lvl2
--6
SELECT  DATE_ADD(start_date,INTERVAL 1 YEAR)
FROM Financial_Year;
--7
SELECT  DATE_ADD(start_date,INTERVAL 30 DAY)
FROM Financial_Year;
--8
SELECT  DATE_SUB(start_date,INTERVAL 7 DAY)
FROM Financial_Year;
--lvl-3
--9
SELECT DATEDIFF(CURDATE(),start_date)
FROM Financial_Year;
--10
SELECT CONCAT(
    YEAR(CURDATE()) - (MONTH(CURDATE()) < 4),
    '-',
    YEAR(CURDATE()) + (MONTH(CURDATE()) >= 4)
) AS Financial_Year;
