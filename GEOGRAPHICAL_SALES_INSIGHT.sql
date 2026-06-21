CREATE OR REPLACE VIEW geographical_sales_insight AS 

SELECT 
ct.cityname AS City,
co.countryname AS Country,
COUNT(DISTINCT(sa.salesID)) AS total_transactions,
SUM(sa.Quantity) AS total_volume, 
ROUND(SUM((p.price *(1 - sa.discount))*sa.quantity),2) AS total_sales,
DENSE_RANK() OVER(ORDER BY ROUND(SUM(p.price*sa.quantity),2) DESC) AS city_rank,
ROUND(SUM(p.price*sa.quantity)/ SUM(SUM(p.price*sa.quantity)) OVER() * 100,2) AS percentage
FROM sales_all sa
LEFT JOIN products p ON sa.productID = p.productID
LEFT JOIN customers_all c ON sa.customerID = c.customerID
LEFT JOIN cities ct ON c.cityID = ct.cityID
LEFT JOIN countries co ON ct.countryID = co.countryID
GROUP BY co.countryname,ct.cityname
ORDER BY total_sales DESC 

