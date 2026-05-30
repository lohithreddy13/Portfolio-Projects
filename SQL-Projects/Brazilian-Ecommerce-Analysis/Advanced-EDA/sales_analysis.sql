

-- SALES ANALYSIS


-- Sales and order trends over time (monthly revenue)

SELECT 

	DATE_FORMAT(o.order_delivered_customer_date, '%Y-%b') AS month,

	ROUND(SUM(p.payment_value),2) AS revenue,

	COUNT(DISTINCT o.order_id) AS no_of_orders

FROM orders o

JOIN payments p

ON o.order_id = p.order_id

WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL

GROUP BY DATE_FORMAT(o.order_delivered_customer_date, '%Y-%b')

ORDER BY month;



-- State-wise sales


SELECT 

	c.customer_State ,

	ROUND(SUM(p.payment_value),2)  AS sales

FROM customers c

JOIN orders o ON c.customer_id=o.customer_id

JOIN payments p ON o.order_id = p.order_id

WHERE order_status = 'delivered'  

GROUP BY c.customer_State

ORDER BY sales DESC ;


-- Category-wise sales metrics


SELECT 
    
	ct.product_category_name_english,
    
    COUNT(DISTINCT o.order_id) AS total_orders,
    
    COUNT(*) AS total_items,
    
    ROUND(SUM(p.payment_value),2) AS total_sales
    
FROM orders o 

JOIN order_items oi ON o.order_id = oi.order_id

JOIN payments p ON p.order_id = oi.order_id

JOIN products ps ON ps.product_id = oi.product_id

JOIN category_translation ct ON ct.product_category_name = ps.product_category_name

WHERE o.order_status = 'delivered'

GROUP BY ct.product_category_name_english

ORDER BY total_sales DESC;














