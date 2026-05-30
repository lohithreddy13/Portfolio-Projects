

-- review analysis


-- state wise reviews

SELECT 

	c.customer_state,
    
    ROUND(AVG(r.review_score),2) AS avg_review

FROM customers c

JOIN orders o  ON c.customer_id = o.customer_id

LEFT JOIN reviews r ON r.order_id = o.order_id

WHERE o.order_status = 'delivered'

GROUP BY c.customer_state

ORDER BY   ROUND(AVG(r.review_score),2) DESC;




-- seller wise reviews


SELECT 

	oi.seller_id AS seller ,
    
    ROUND(AVG(r.review_score),2) AS avg_review
    
FROM order_items oi

JOIN  orders o

ON oi.order_id = o.order_id

JOIN reviews r

ON r.order_id = o.order_id

WHERE o.order_status = 'delivered'

GROUP BY oi.seller_id

ORDER BY ROUND(AVG(r.review_score),2)  DESC ;



-- 





