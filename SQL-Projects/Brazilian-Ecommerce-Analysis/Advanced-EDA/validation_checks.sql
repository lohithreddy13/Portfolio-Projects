
-- STEP 1 — Table Existence Validation

SHOW TABLES;


TRUNCATE TABLE reviews;



SELECT * FROM reviews;

SELECT * FROM customers;

SELECT * FROM orders;


SELECT * FROM geolocation;

SELECT * FROM order_items;


SELECT * FROM products;


SELECT * FROM payments;

SELECT * FROM sellers;


SELECT * FROM category_translation;

-- STEP 2 — Row Count Validation

 SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM order_items;

SELECT COUNT(*) FROM payments;

SELECT COUNT(*) FROM reviews;

SELECT COUNT(*) FROM sellers;

SELECT COUNT(*) FROM category_translation;

SELECT COUNT(*) FROM products;


-- STEP 3 — Column-Level NULL Audit

-- Orders NULL Check

SELECT

SUM(order_id IS NULL) AS orderid_nulls,

SUM(customer_id IS NULL) AS customer_nulls,

SUM(order_status IS NULL) AS status_nulls,

SUM(order_purchase_timestamp IS NULL) AS purchase_nulls,

SUM(order_delivered_customer_date IS NULL) AS delivery_nulls

FROM orders;


-- STEP 4 — Duplicate Validation

-- Window Function Duplicate Audit

WITH duplicate_check AS
(
SELECT *,

DENSE_RANK() OVER(
PARTITION BY order_id
ORDER BY order_purchase_timestamp
) rn

FROM orders
)

SELECT *

FROM duplicate_check

WHERE rn>1;


-- STEP 5 — Primary Key Validation

-- Customers

SELECT

customer_id,

COUNT(*)

FROM customers

GROUP BY customer_id

HAVING COUNT(*)>1;


-- Products

SELECT

product_id,

COUNT(*)

FROM products

GROUP BY product_id

HAVING COUNT(*)>1;


-- Sellers


SELECT

seller_id,

COUNT(*)

FROM sellers

GROUP BY seller_id

HAVING COUNT(*)>1;


-- STEP 6 — Referential Integrity Validation

-- Orders → Customers( Every customer_id in orders should exist inside customers table).

SELECT COUNT(*)

FROM orders o

LEFT JOIN customers c

ON o.customer_id=c.customer_id

WHERE c.customer_id IS NULL;  


-- Order Items → Products( Every product must exist).

SELECT COUNT(*)

FROM order_items oi

LEFT JOIN products p

ON oi.product_id=p.product_id

WHERE p.product_id IS NULL;


-- Order Items → Sellers

SELECT COUNT(*)

FROM order_items oi

LEFT JOIN sellers s

ON oi.seller_id=s.seller_id

WHERE s.seller_id IS NULL;


-- Payments → Orders

SELECT COUNT(*)

FROM payments p

LEFT JOIN orders o

ON p.order_id=o.order_id

WHERE o.order_id IS NULL;



-- STEP 7 — Data Type Validation

DESCRIBE orders;


-- Numeric Validation

-- Check payments.

SELECT *

FROM payments

WHERE payment_value<0;


-- STEP 8 — Date Validation

-- Delivery before purchase Impossible.

SELECT *

FROM orders

WHERE order_delivered_customer_date
<
order_purchase_timestamp;


-- Approval before purchase Impossible.

SELECT *

FROM orders

WHERE order_approved_at
<
order_purchase_timestamp;

-- Estimated delivery before purchase Impossible.

SELECT *

FROM orders

WHERE order_estimated_delivery_date
<
order_purchase_timestamp;


-- STEP 9 — Range Validation


-- Review Score Check


SELECT *

FROM reviews

WHERE review_score NOT BETWEEN 1 AND 5;


-- Payment Installments (Negative installments impossible)

SELECT *

FROM payments

WHERE payment_installments<0;


-- Price Validation (Negative prices impossible)

SELECT *

FROM order_items

WHERE price<0;


-- STEP 10-Business Rule Validation

-- Delivered orders should have delivery dates

SELECT *

FROM orders

WHERE order_status='delivered'

AND order_delivered_customer_date IS NULL;


-- Cancelled orders should NOT have delivery dates.

SELECT *

FROM orders

WHERE order_status='canceled'

AND order_delivered_customer_date IS NOT NULL;


-- STEP 11- Distribution Validation

-- Order Status Distribution

SELECT

order_status,

COUNT(*)

FROM orders

GROUP BY order_status;


-- Payment Type Distribution

SELECT

payment_type,

COUNT(*)

FROM payments

GROUP BY payment_type;


-- STEP 12 — Outlier Detection

-- High payment values.

SELECT *

FROM payments

ORDER BY payment_value DESC

LIMIT 20;








