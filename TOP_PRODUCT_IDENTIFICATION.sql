CREATE OR REPLACE VIEW top_product_identification AS 

SELECT 
	p.ProductID,
	p.productName,
    p.class,
    SUM(sa.quantity) AS quantity,
	ROUND(SUM(sa.quantity *(p.price *(1 - sa.discount))),2) AS total_revenue, 
    DENSE_RANK() OVER(PARTITION BY p.class ORDER BY ROUND(SUM(sa.quantity *(p.price *(1 - sa.discount))),2) DESC) AS class_ranking
    FROM sales_all sa 
    LEFT JOIN products p ON sa.productID = p.productID
    GROUP BY p.productName, p.class, p.ProductID
	ORDER BY p.class, class_ranking;