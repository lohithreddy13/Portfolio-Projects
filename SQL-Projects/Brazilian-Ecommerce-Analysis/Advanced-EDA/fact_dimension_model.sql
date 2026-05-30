
/* -- STEP 1 — Understand Star Schema


                dim_customer
                     |

dim_product --- fact_sales --- dim_seller
                     |

                 dim_date
                 
*/


-- STEP 2 — Build FACT TABLE
                 

-- FACT SALES TABLE

CREATE TABLE fact_sales AS
SELECT
    o.order_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value,
    p.payment_value,
    o.order_status,
    DATE(o.order_purchase_timestamp)        AS order_date,
    o.order_delivered_customer_date         AS delivered_date,
    o.order_estimated_delivery_date         AS estimated_delivery_date,  
    r.review_score
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN payments p ON o.order_id = p.order_id
LEFT JOIN reviews r ON o.order_id = r.order_id;







SELECT * FROM fact_sales;


-- Validate Fact Table

-- Row count

SELECT COUNT(*)
FROM fact_sales;


-- Null Check

SELECT

SUM(order_id IS NULL),

SUM(product_id IS NULL),

SUM(payment_value IS NULL)

FROM fact_sales;


-- STEP 3 — Build DIMENSION TABLES


-- DIM CUSTOMER

CREATE TABLE dim_customer AS

SELECT

customer_id,

customer_unique_id,

customer_city,

customer_state

FROM customers;


SELECT * FROM dim_customer;

-- Validate

SELECT COUNT(*)
FROM dim_customer;


-- DIM PRODUCT



CREATE TABLE dim_product AS

SELECT

p.product_id,

p.product_category_name,

ct.product_category_name_english,

p.product_weight_g,

p.product_length_cm,

p.product_height_cm,

p.product_width_cm

FROM products p

LEFT JOIN category_translation ct

ON p.product_category_name=
ct.product_category_name;

SELECT * FROM dim_product;

-- DIM SELLER

CREATE TABLE dim_seller AS

SELECT

seller_id,

seller_city,

seller_state

FROM sellers;


SELECT * FROM dim_seller;


-- DIM DATE

CREATE TABLE dim_date AS

SELECT DISTINCT

DATE(order_purchase_timestamp) AS full_date,

YEAR(order_purchase_timestamp) AS year,

MONTH(order_purchase_timestamp) AS month,

DAY(order_purchase_timestamp) AS day,

QUARTER(order_purchase_timestamp) AS quarter

FROM orders;


SELECT * FROM dim_date;

-- Validate.

SELECT *
FROM dim_date
LIMIT 10;


-- STEP 4 — Create Analytical View 



CREATE OR REPLACE VIEW analytics_master AS
SELECT
    fs.order_id,
    fs.purchase_date,
    fs.customer_id,             
    dc.customer_state,
    dp.product_category_name_english,
    ds.seller_state,
    fs.payment_value,
    fs.price,
    fs.review_score,
    fs.order_status
FROM fact_sales fs
LEFT JOIN dim_customer dc ON fs.customer_id = dc.customer_id
JOIN dim_product dp ON fs.product_id = dp.product_id
JOIN dim_seller ds ON fs.seller_id = ds.seller_id;



select * from analytics_master ;
