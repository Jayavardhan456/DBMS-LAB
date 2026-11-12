use taxation_db;
select * from taxpayer;
select * from income_category;
select * from income_record;
select * from financial_year;
-- level 01
-- Task 1
create view Highest_Income As
select * from income_record 
where amount= (SELECT MAX(amount) FROM income_record);
SELECT * FROM Highest_Income;
-- Task 2
create view Lowest_Income As
select * from income_record 
where amount= (SELECT MIN(amount) FROM income_record);
SELECT * FROM Lowest_Income;

-- Task 3
create view Average_Income As
select * from income_record 
where amount> (SELECT Avg(amount) FROM income_record);
SELECT * FROM Average_Income;
-- Task 4
create view Highest_Income As
select * from income_record 
where amount= (SELECT MAX(amount) FROM income_record);
SELECT * FROM Highest_Income;
-- Task 5
Create view Business_Income As
select taxpayer_id,full_name 
from taxpayer
where taxpayer_id in (select taxpayer_id 
from income_record 
where category_id in (select category_id 
from income_category
where category_name='Business Income' ));
select * from Business_Income;
-- Level 2
-- Task 01
CREATE VIEW TaxpayersHavingAtleastOneIncomeRecord AS
SELECT * 
FROM taxpayer 
WHERE Taxpayer_Id IN (SELECT Taxpayer_Id
					  FROM INCOME_RECORD
					  );
SELECT *
FROM TaxpayersHavingAtleastOneIncomeRecord;

-- Task 02
CREATE VIEW TaxpayersHavingIncomeInBusiness AS
SELECT *
FROM Taxpayer
WHERE Taxpayer_Id IN (SELECT Taxpayer_Id
					  FROM INCOME_RECORD
                      WHERE Category_Id IN (SELECT Category_Id
											FROM INCOME_CATEGORY
                                            WHERE Category_Name = 'Business'
												)
						);
SELECT *
FROM TaxpayersHavingIncomeInBusiness;

-- Task 03
CREATE VIEW IncomeRecordsBelongToSameFinancialYear AS
SELECT * 
FROM INCOME_RECORD
WHERE Year_Id IN (SELECT Year_Id
				  FROM financial_year
                  WHERE Year_Label = '2025-2026'
					);
SELECT *
FROM IncomeRecordsBelongToSameFinancialYear;

-- Task 04
CREATE VIEW IncomeRecordsAmountGreaterThanMinimumBusinessIncome AS
SELECT *
FROM INCOME_RECORD
WHERE Amount > (SELECT MIN(Amount)
				FROM INCOME_RECORD
                WHERE Category_Id IN (SELECT Category_Id
									  FROM INCOME_CATEGORY
                                      WHERE Category_Name = 'Business'
									 )); 
SELECT *
FROM IncomeRecordsAmountGreaterThanMinimumBusinessIncome;

-- Task 05
CREATE VIEW IncomeRecordsAmountLessThanMaximumSalaryIncome AS
SELECT * 
FROM INCOME_RECORD
WHERE Amount < (SELECT MAX(Amount)
				 FROM INCOME_RECORD
                 WHERE Category_Id IN (SELECT Category_Id
									   FROM INCOME_CATEGORY
                                       WHERE Category_Name = 'Salary'
									));
SELECT *
FROM IncomeRecordsAmountLessThanMaximumSalaryIncome;

-- Task06
CREATE VIEW IncomeRecordsGreaterThanAverageIncome AS
SELECT *
FROM Taxpayer
WHERE Taxpayer_Id IN (SELECT Taxpayer_Id
					 FROM INCOME_RECORD
                     WHERE Amount > (SELECT AVG(Amount)
									FROM INCOME_RECORD
								     )
						); 
SELECT * 
FROM IncomeRecordsGreaterThanAverageIncome;

-- Task 07
CREATE VIEW IncomeCategoryAtleastOneIncomeRecord As
SELECT *
FROM INCOME_CATEGORY
WHERE Category_Id IN (SELECT Category_Id
					  FROM INCOME_RECORD
						);  
SELECT *
FROM IncomeCategoryAtleastOneIncomeRecord;

-- Task 08
CREATE VIEW TaxpayerHaveNoIncomeRecordsInInvestment AS
SELECT * 
FROM Taxpayer
WHERE Taxpayer_Id NOT IN (SELECT Taxpayer_Id
						  FROM INCOME_RECORD
                          WHERE Category_Id IN (SELECT Category_Id
												FROM INCOME_CATEGORY
                                                WHERE Category_Name = 'Investment'
												)
							) ;
SELECT *
FROM TaxpayerHaveNoIncomeRecordsInInvestment;

--  Level 03 – Medium to Advanced 

--  Task 01
CREATE VIEW TaxpayerHavingHighestRecordedIncome AS
SELECT * 
FROM Taxpayer
WHERE taxpayer_Id IN (SELECT taxpayer_Id
					  FROM INCOME_RECORD
                      WHERE Amount IN (SELECT MAX(Amount)
									   FROM INCOME_RECORD
										)
						);   
SELECT *
FROM TaxpayerHavingHighestRecordedIncome;

-- Task 02 
CREATE VIEW IncomeRecordsHavingIncomeRecordsGreaterThanAverageBusinessIncome AS
SELECT * 
FROM INCOME_RECORD
WHERE Amount > (SELECT AVG(Amount)
				FROM INCOME_RECORD
                WHERE Category_Id IN (SELECT Category_Id
									  FROM INCOME_CATEGORY
                                      WHERE Category_Name = 'Business'
										)
                
				);
SELECT *
FROM IncomeRecordsHavingIncomeRecordsGreaterThanAverageBusinessIncome;

-- Task 03
CREATE VIEW TaxpayerIncomeGreaterThanAverageOfAllTaxpayers AS
SELECT * 
FROM Taxpayer
WHERE Taxpayer_Id IN (SELECT Taxpayer_Id
					  FROM INCOME_RECORD
                      WHERE Amount > (SELECT AVG(Amount)
									  FROM INCOME_RECORD)
						); 
SELECT *
FROM TaxpayerIncomeGreaterThanAverageOfAllTaxpayers;
--task4
CREATE VIEW IncRec_amtGretr_AtlestOneInvestIncRec AS
SELECT * FROM income_record WHERE amount > ANY (
    SELECT amount FROM income_record WHERE category_id IN (
        SELECT category_id FROM income_category WHERE category_name = 'Investment'
    )
);
--task5
CREATE VIEW IncRec_amtGretr_EvryInvestIncRec AS
SELECT * FROM income_record WHERE amount > ALL (
    SELECT amount FROM income_record WHERE category_id IN (
        SELECT category_id FROM income_category WHERE category_name = 'Investment'
    )
);
--task6
CREATE VIEW IncCatgry_HighestIncRec AS
SELECT category_id,category_name FROM income_category WHERE category_id IN (
    SELECT category_id FROM income_record WHERE amount = (
        SELECT MAX(amount) FROM income_record
    )
);
--task7
CREATE VIEW Fy_HighestTotalInc AS
SELECT year_id,year_label FROM financial_year WHERE year_id = (
    SELECT year_id FROM income_record GROUP BY year_id
    ORDER BY SUM(amount) DESC LIMIT 1
);
--task8
CREATE VIEW Taxpayers_Above_Avg_TotalIncome AS
SELECT full_name FROM taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id FROM income_record GROUP BY taxpayer_id
    HAVING SUM(amount) > (
        SELECT AVG(total_income) FROM (
            SELECT taxpayer_id, SUM(amount) AS total_income FROM income_record GROUP BY taxpayer_id
        ) AS taxpayer_totals
    )
);


--Real-World Taxation Analysis Using Views
--Task1
CREATE VIEW Tax_HighestInc AS
SELECT full_name FROM taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id FROM income_record WHERE amount = (
        SELECT MAX(amount) FROM income_record
    )
);
--task2
CREATE VIEW Tax_IncGretr_OveralAvgInc AS
SELECT full_name FROM taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id FROM income_record WHERE amount > (
        SELECT AVG(amount) FROM income_record
    )
);
--task3
CREATE VIEW IncCatgry_HghistIncRec AS
SELECT category_id,category_name FROM income_category WHERE category_id IN (
    SELECT category_id FROM income_record WHERE amount = (
        SELECT MAX(amount) FROM income_record
    )
);
--task4
CREATE VIEW Business_No_Investment AS
SELECT full_name FROM taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id FROM income_record WHERE category_id IN (
        SELECT category_id FROM income_category WHERE category_name = 'Business'
    )
)
AND taxpayer_id NOT IN (
    SELECT taxpayer_id FROM income_record WHERE category_id IN (
        SELECT category_id FROM income_category WHERE category_name = 'Investment'
    )
);
--task5
CREATE VIEW IncRec_amtGretr_EvryInvesIncRec AS
SELECT * FROM income_record WHERE amount > ALL (
    SELECT amount FROM income_record WHERE category_id IN (
        SELECT category_id FROM income_category WHERE category_name = 'Investment'
    )
);
--task6
CREATE VIEW IncRec_amtGretr_AtlestIncRec AS
SELECT * FROM income_record WHERE amount > ANY (
    SELECT amount FROM income_record WHERE category_id IN (
        SELECT category_id FROM income_category WHERE category_name = 'Investment'
    )
);
--task7
CREATE VIEW Tax_HighestTotalInc AS
SELECT taxpayer_id, full_name FROM taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id FROM income_record GROUP BY taxpayer_id HAVING SUM(amount) = (
        SELECT MAX(total_income) FROM (
            SELECT taxpayer_id, SUM(amount) AS total_income FROM income_record GROUP BY taxpayer_id
        ) AS totals
    )
);
--task8
CREATE VIEW IncRec_amtGretr_AvgIncCorresCatgry AS
SELECT ir.income_id, ir.taxpayer_id, ir.income_source,ir.amount, ir.category_id FROM income_record ir JOIN (
    SELECT category_id, AVG(amount) AS avg_income FROM income_record GROUP BY category_id
) AS category_avg ON ir.category_id = category_avg.category_id
WHERE ir.amount > category_avg.avg_income;