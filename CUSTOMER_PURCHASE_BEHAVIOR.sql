CREATE OR REPLACE VIEW customer_purchase_behavior AS 

WITH Customer_summary AS ( 
SELECT 
sa.customerId,
CONCAT(c.Firstname, ' ', c.Lastname) AS Customer_Name,
COUNT(DISTINCT(sa.salesID)) AS Total_Transactions,
SUM(sa.quantity) AS Total_Quantity,
ROUND(SUM((p.price *(1 - sa.discount)) * sa.quantity),2) AS Total_sales
FROM sales_all sa
LEFT JOIN products p ON sa.ProductID = p.ProductID
LEFT JOIN customers_all c ON sa.CustomerID = c.CustomerID
WHERE MONTH(sa.salesdate) BETWEEN 1 AND 4
GROUP BY sa.CustomerID, CONCAT(c.Firstname, ' ', c.Lastname)
ORDER BY Total_sales ASC
 ) 

SELECT 
customerid,
customer_name,
total_transactions,
total_sales,
CASE 
	WHEN total_transactions > 1 THEN "Repeat customer" 
	ELSE "One-time buyer" 
END AS buyer_type,
CASE 
	WHEN total_sales >= AVG(total_sales) OVER() AND total_transactions >= AVG(total_transactions) OVER() THEN "VIP"
    WHEN total_sales >= AVG(total_sales) OVER() AND total_transactions < AVG(total_transactions) OVER() THEN "WholeSales"
    WHEN total_sales < AVG(total_sales) OVER() AND total_transactions >= AVG(total_transactions) OVER() THEN "B2B"
    WHEN total_sales < AVG(total_sales) OVER() AND total_transactions < AVG(total_transactions) OVER() THEN "Standard"
    ELSE "Unclassified"
END AS customer_segmentation,
ROUND(SUM(total_sales) OVER() / SUM(total_transactions) OVER(), 2) AS Store_AOV,
ROUND(SUM(total_quantity) OVER() / SUM(total_transactions) OVER(), 2) AS Store_Basket_Size
FROM Customer_summary
GROUP BY customerid,customer_name,total_transactions,total_sales
ORDER BY total_sales DESC 