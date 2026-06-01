
# Brazilian Marketplace Analytics: SQL Business Intelligence Project

## Project Overview

This project analyzes a Brazilian E-Commerce Marketplace dataset using **SQL** to uncover business insights related to:

* Revenue performance
* Customer behavior
* Customer retention
* Delivery operations
* Customer satisfaction
* Seller performance
* Product & category performance

The project simulates a **real-world business intelligence workflow**, starting from **database creation and data validation** through **business analytics** and ending with a **Star Schema data model for Tableau reporting**.

---

## Business Problem

A Brazilian marketplace company wants to better understand:

* What drives revenue growth?
* Which customer segments generate the most value?
* How are customer satisfaction and delivery performance related?
* Which sellers contribute most to revenue?
* Which categories and states drive business performance?
* What operational improvements can increase customer experience?

The goal is to support **data-driven business decisions** using SQL analytics.

---

## Dataset Overview

The project uses a Brazilian marketplace dataset containing transactional, customer, product, seller, payment, and review information.

### Tables Used

| Table                | Description                  |
| -------------------- | ---------------------------- |
| customers            | Customer information         |
| orders               | Order-level transaction data |
| order_items          | Product-level order details  |
| payments             | Payment transactions         |
| products             | Product attributes           |
| sellers              | Seller information           |
| reviews              | Customer reviews             |
| geolocation          | Geographic information       |
| category_translation | Category name mapping        |

---

## Database Design

The database was created manually using SQL DDL statements.

Core schema includes:

* Customer Dimension
* Order Transaction Layer
* Product Layer
* Seller Layer
* Payment Layer
* Review Layer

---

## Data Validation & Data Quality Checks

Before analysis, extensive validation checks were performed to simulate **real analyst / ETL workflows**.

### Table Validation

Validated existence and successful loading of all tables.

### Row Count Validation

Verified record counts across datasets.

### NULL Audits

Checked critical columns for missing values.

Examples:

* customer_id
* order_status
* order_purchase_timestamp
* delivery dates

### Duplicate Validation

Performed duplicate checks using **Window Functions**.

### Primary Key Validation

Validated uniqueness of:

* customer_id
* product_id
* seller_id

### Referential Integrity Validation

Validated business relationships:

* Orders → Customers
* Order Items → Products
* Order Items → Sellers
* Payments → Orders

### Date Validation

Validated impossible business scenarios:

* delivery before purchase
* approval before purchase
* estimated delivery before purchase

### Business Rule Validation

Validated operational rules:

* delivered orders must contain delivery dates
* canceled orders should not contain delivery dates

### Range Validation

Checked invalid ranges for:

* review scores
* payment installments
* prices

### Distribution Validation

Analyzed:

* order status distribution
* payment type distribution

### Outlier Detection

Identified unusually large payment values.

---

## KPI Layer

Core business KPIs were built to measure marketplace performance.

### KPIs Developed

* Total Revenue
* Total Orders
* Total Customers
* Average Order Value (AOV)
* Order Status Distribution

---

## Sales Analysis

### Revenue & Order Trends Over Time

Analyzed:

* monthly revenue growth
* order volume evolution

Business Question:

**How is marketplace growth evolving over time?**

---

### State-wise Sales Analysis

Measured:

* revenue by state
* order volume by state

Business Question:

**Which geographic regions drive business growth?**

---

### Category Performance Analysis

Analyzed:

* category revenue
* order volume
* category ranking

Business Question:

**Which product categories generate the highest business impact?**

---

## Customer Analytics

### Active Customers Over Time

Tracked monthly customer activity.

Business Question:

**How is customer engagement evolving?**

---

### New vs Returning Customers

Compared:

* new customer acquisition
* repeat customers

Business Question:

**Is growth driven by acquisition or retention?**

---

### Customer Lifetime Value (CLV)

Calculated total customer revenue contribution.

Built customer rankings using Window Functions.

Business Question:

**Who are the highest-value customers?**

---

### RFM Analysis

Built:

* Recency
* Frequency
* Monetary Value

Customer Segments:

* Champions
* Loyal Customers
* At Risk
* Churned

Business Question:

**How can customers be segmented based on purchase behavior?**

---

### Cohort Analysis

Performed retention cohort analysis to measure customer behavior across acquisition cohorts.

Business Question:

**How well are customers retained over time?**

---

### Customer Segmentation

Segmented customers into:

* High Value
* Normal Value
* Low Value

using customer revenue contribution.

---

## Delivery & Operations Analytics

### Average Delivery Days

Measured average delivery duration.

---

### Delivery Performance

Analyzed:

* On-Time Orders
* Late Orders
* Late Delivery Rate

Business Question:

**How efficient is marketplace delivery performance?**

---

### State-wise Delivery Analysis

Measured delivery performance by state.

Business Question:

**Which regions face operational challenges?**

---

### Delivery Delay vs Customer Ratings

Compared review scores across delivery delay buckets.

Findings showed a strong relationship between:

**delivery performance → customer satisfaction**

Delay Buckets:

* On Time / Early
* 1–3 Days Late
* > 3 Days Late

---

## Review Analytics

### Review Analysis by State

Measured:

* Average Review Score
* Revenue
* Orders
* State Ranking

Business Question:

**How does customer satisfaction vary across regions?**

---

### Review Analysis by Seller

Measured:

* Seller Revenue
* Seller Reviews
* Order Volume
* Seller Ranking

Business Question:

**Which sellers drive revenue and customer experience?**

---

### Review Analysis by Category

Measured:

* Category Revenue
* Orders
* Review Scores
* Category Ranking

Business Question:

**Which categories create strong or weak customer satisfaction?**

---

## Seller Analytics

Built seller performance analysis including:

* Revenue contribution
* Order volume
* Review performance
* Seller ranking

Business Question:

**Who are the marketplace’s highest-impact sellers?**

---

## Key Findings

### Revenue Concentration

Business revenue is concentrated among a small number of states.

High-performing regions contribute a significant portion of total marketplace revenue.

---

### Delivery Performance Drives Customer Satisfaction

Review scores decline sharply as delivery delays increase.

Orders delayed beyond 3 days experience significantly lower customer satisfaction.

---

### Seller Performance Varies Significantly

Some high-revenue sellers generate weaker customer ratings.

This creates potential operational and customer experience risk.

---

### Customer Behavior Shows Retention Opportunities

Customer analytics indicate opportunities to strengthen:

* repeat purchases
* retention strategies
* customer lifecycle management

---

### Category Performance Is Uneven

Certain product categories dominate business contribution.

---

## Business Recommendations

### 1. Improve Delivery Operations

Because customer ratings decline significantly for delayed deliveries, prioritize:

* logistics optimization
* carrier monitoring
* SLA tracking
* operational bottleneck analysis

---

### 2. Protect High-Revenue Regions

High-revenue states should receive focused attention through:

* customer experience monitoring
* operational improvement
* delivery optimization

---

### 3. Build Customer Retention Programs

Strengthen customer retention through:

* loyalty initiatives
* personalized campaigns
* repeat purchase strategies

---

### 4. Create Seller Performance Monitoring

Build seller scorecards tracking:

* revenue
* orders
* reviews
* operational KPIs

Use monitoring to identify:

**high-revenue / low-satisfaction sellers**

---

### 5. Expand Strong Mid-Performing Sellers

Identify sellers showing:

* strong customer experience
* healthy order volume
* moderate revenue

Support them through:

* marketplace visibility
* growth initiatives
* promotion programs

---

## SQL Concepts Demonstrated

This project demonstrates strong practical SQL skills.

### SQL Skills Used

* DDL / Database Design
* Table Creation
* Joins
* Aggregations
* GROUP BY
* CASE Statements
* CTEs
* Window Functions
* Ranking Functions
* Date Functions
* Data Validation
* Business Rule Checks
* Cohort Analysis
* Customer Segmentation
* Star Schema Modeling

---

## Star Schema Design for Tableau

To support BI reporting, a dimensional model was created.

### Fact Table

**fact_sales**

Contains:

* order_id
* customer_id
* order_date
* delivered_date
* order_status
* payment_value
* review_score

### Dimension Tables

#### dim_customer

* customer attributes
* customer geography

#### dim_product

* category
* physical product attributes

#### dim_seller

* seller information
* seller geography

#### dim_date

* year
* month
* quarter
* week
* calendar breakdown

---

## Planned Tableau Dashboard

Next phase of the project:

### Executive Dashboard

KPIs:

* Revenue
* Orders
* Customers
* AOV
* Avg Review
* Late Delivery Rate

### Sales Dashboard

* Revenue Trends
* Orders Trends
* State Performance
* Category Performance

### Customer Dashboard

* Active Customers
* CLV
* RFM Segments
* Cohort Retention

### Operations Dashboard

* Delivery Performance
* Delay Analysis
* Delivery vs Ratings

### Seller Dashboard

* Seller Rankings
* Revenue
* Orders
* Reviews

---

## Project Structure

```txt
Brazilian-Marketplace-Analytics/

│── sql/
│   ├── 01_database_creation.sql
│   ├── 02_data_validation.sql
│   ├── 03_kpi_analysis.sql
│   ├── 04_sales_analysis.sql
│   ├── 05_customer_analysis.sql
│   ├── 06_delivery_analysis.sql
│   ├── 07_review_analysis.sql
│   ├── 08_star_schema.sql
│
│── tableau/
│   ├── dashboard_file.twb
│
│── README.md
```

---

## Future Improvements

Planned enhancements:

* Tableau Dashboard Development
* Advanced KPI Dashboarding
* Enhanced Star Schema Optimization
* Deeper Seller Scorecard Analytics
* Advanced Retention Metrics
* Delivery Logistics Deep Dive

---

## Author

Lohit Reddy

SQL | Data Analytics | Business Intelligence | Tableau
