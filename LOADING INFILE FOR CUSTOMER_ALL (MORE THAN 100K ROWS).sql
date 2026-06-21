-- CREATE TABLE customers_all
-- (
 -- CustomerID INT,
 -- FirstName VARCHAR(255),
 -- MiddleInitial VARCHAR(255),
 -- LastName VARCHAR(255),
 -- CityID INT,
 -- Address VARCHAR(255));
 
-- SELECT * FROM customers_all; 
 
-- USE grocery_sales;
 
-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv' 
-- INTO TABLE customers_all
-- FIELDS TERMINATED BY ','
-- IGNORE 1 LINES;

SELECT * FROM customers_all LIMIT 1000;