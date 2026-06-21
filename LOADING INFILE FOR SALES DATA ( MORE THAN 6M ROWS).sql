
-- CREATE TABLE sales_all
-- ( 	
	-- SalesID INT,
    -- SalesPersonID INT,
    -- CustomerID INT,
    -- ProductID INT,
    -- Quantity INT,
    -- Discount INT,
    -- TotalPrice DECIMAL(10,2),
    -- SalesDate DATE,
    -- TransactionNumber VARCHAR(255)

-- );

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv' 
-- INTO TABLE sales_all
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"' 
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES
-- (SalesID, SalesPersonID, CustomerID, ProductID, Quantity, Discount, TotalPrice, @raw_date, TransactionNumber)
-- UPDATED FORMAT STRING: Added '%H:%i:%s.%f' to handle the hours, minutes, seconds, and milliseconds (.430)
-- SET SalesDate = IF(@raw_date = '' OR @raw_date IS NULL, NULL, STR_TO_DATE(@raw_date, '%Y-%m-%d %H:%i:%s.%f'));

SELECT COUNT(*) FROM sales_all;