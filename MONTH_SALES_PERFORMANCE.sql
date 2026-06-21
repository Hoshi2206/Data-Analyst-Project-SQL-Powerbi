CREATE OR REPLACE VIEW monthly_sales_performance AS 

 SELECT 
    c.CategoryID,
    c.categoryname,
    ROUND(SUM(sa.quantity * (p.price * (1- sa.discount))),2) AS total_sales,
    SUM(sa.Quantity) as total_sold,
    IFNULL(MONTH(sa.salesdate), "Missing Date") AS month
	FROM sales_all sa 
    LEFT JOIN products p ON sa.ProductID = p.ProductID
	LEFT JOIN categories c ON p.categoryID = c.categoryID
	GROUP BY IFNULL(MONTH(sa.salesdate),"Missing Date"), c.categoryname, c.categoryID
    ORDER BY month ASC, total_sold DESC;

