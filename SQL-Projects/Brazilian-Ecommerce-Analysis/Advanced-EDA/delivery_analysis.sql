

-- Average Delivery Days


SELECT 
FLOOR(AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp))) AS avg_delivery_days
FROM orders;


-- Late Delivery %

SELECT 

ROUND(SUM( CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END ) * 100 / COUNT(*),2) AS late_delivery_percentage

FROM orders;


-- State-wise Delivery Performance

SELECT 

customer_state,

ROUND(AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp)),2) AS avg_delivery_days

FROM orders o

JOIN customers c

ON o.customer_id = c.customer_id

GROUP BY customer_state;


-- Delivery vs Review Relationship


SELECT
  CASE
    WHEN o.order_status = 'canceled' THEN 'Cancelled'
    WHEN o.order_delivered_customer_date IS NULL THEN 'No Delivery Date'
    WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 'On Time'
    ELSE 'Late'
  END AS delivery_status,
  ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM orders o
JOIN reviews r
  ON o.order_id = r.order_id
GROUP BY 1;


