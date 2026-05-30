

-- Total Revenue

SELECT 

ROUND(SUM(payment_value),2) AS total_revenue

FROM payments;


-- Total orders

SELECT 

COUNT(distinct order_id ) AS total_orders

FROM orders;


-- Total customers

SELECT 

COUNT(distinct customer_unique_id) AS total_customers

FROM customers;


-- Order Status Distribution

SELECT

order_status,

COUNT(*) AS total_orders

FROM orders

GROUP BY order_status

ORDER BY  total_orders DESC;


-- Top 10 States by Orders

SELECT 

c.customer_state,

COUNT(distinct o.order_id) AS total_orders

FROM orders o

JOIN customers c

ON o.customer_id = c.customer_id

GROUP BY c.customer_state

ORDER BY COUNT(distinct o.order_id) DESC 

LIMIT 10;


-- 

