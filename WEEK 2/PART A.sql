USE taxpayer_1;

ALTER TABLE Income_Record
DROP COLUMN category_name,
DROP COLUMN financial_year;

ALTER TABLE Income_Record
ADD COLUMN category_id INT,
ADD COLUMN year_id INT;

ALTER TABLE Income_Record
ADD CONSTRAINT fk_taxpayer
FOREIGN KEY (taxpayer_id)
REFERENCES Taxpayer(taxpayer_id);

ALTER TABLE Income_Record
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES Income_Category(category_id);

ALTER TABLE Income_Record
ADD CONSTRAINT fk_year
FOREIGN KEY (year_id)
REFERENCES Financial_year(year_id);

UPDATE Income_Record SET category_id=1 WHERE income_id = 1001;
UPDATE Income_Record SET year_id=2001 WHERE income_id = 1001;
UPDATE Income_Record SET category_id=2 WHERE income_id = 1002;
UPDATE Income_Record SET year_id=2002 WHERE income_id = 1002;
UPDATE Income_Record SET category_id=3 WHERE income_id = 1003;
UPDATE Income_Record SET year_id=2003 WHERE income_id = 1003;
