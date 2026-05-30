

-- CUSTOMER ANALYSIS

-- Customers Count

SELECT 

COUNT(distinct customer_id) 

FROM fact_sales;


-- Repeated Customers

SELECT 

customer_id,

COUNT(distinct order_id) AS total_orders

FROM fact_sales

GROUP BY customer_id

HAVING total_orders  > 1;


-- Customer Lifetime Value (CLV)

SELECT

customer_id,

ROUND(SUM(payment_value),2) AS clv

FROM fact_sales

GROUP BY customer_id

ORDER BY clv DESC;



-- Top Customer States

SELECT 

customer_state,

COUNT(distinct customer_id) AS no_of_customers

FROM analytics_master

GROUP BY customer_state

ORDER BY no_of_customers DESC;


-- RFM


WITH rc AS (

SELECT 

customer_id,

TIMESTAMPDIFF(month,max(purchase_date),curdate() ) AS recency


FROM fact_sales

GROUP BY customer_id

),

fr AS (

SELECT 

customer_id,

count(distinct order_id) AS frequency

FROM fact_sales

GROUP BY customer_id

),


mo AS (

SELECT 

customer_id,

FLOOR(SUM(payment_value)) AS monetary

FROM fact_Sales

GROUP BY customer_id)


SELECT 

rc.customer_id,

rc.recency,

fr.frequency,

mo.monetary

FROM rc

JOIN fr ON rc.customer_id= fr.customer_id

JOIN mo ON mo.customer_id=rc.customer_id;



-- cohort analysis

SELECT 

DATE_FORMAT(purchase_date,'%Y-%m') AS cohort_month,

COUNT(distinct customer_id) AS customers

FROM fact_sales

GROUP BY DATE_FORMAT(purchase_date,'%Y-%m')

ORDER BY cohort_month;

