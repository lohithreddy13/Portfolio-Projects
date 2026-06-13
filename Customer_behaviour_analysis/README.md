
# 🛍️ Customer Behaviour Analytics — End-to-End Data Project


## 📌 Project Overview

An end-to-end data analytics project analyzing **3,900 customer transactions** from a retail business to uncover revenue drivers, loyalty patterns, discount impact, and seasonal demand. Built across the full analytics stack — from raw data cleaning to an interactive business dashboard.

---

## 🛠️ Tools & Tech Stack

| Stage | Tool |
|---|---|
| Data Cleaning & EDA | Python (Pandas) |
| Exploratory Data Analysis | SQL |
| Dashboard & Visualization | Tableau |

---

## 📂 Dataset

- **Rows:** 3,900 customer records
- **Columns:** 19 features
- **Key Fields:** `customer_id`, `age`, `gender`, `category`, `purchase_amount`, `location`, `season`, `review_rating`, `subscription_status`, `discount_applied`, `payment_method`, `frequency_of_purchases`, `age_group`, `purchase_frequency_days`

---

## 🔄 Project Workflow

```
Raw CSV → Python (Pandas) Cleaning & EDA → SQL EDA → Tableau Dashboard
```

**Step 1 — Python (Pandas)**
- Handled missing values and data type corrections
- Engineered new features: `age_group`, `purchase_frequency_days`
- Generated descriptive statistics and distribution reports

**Step 2 — SQL EDA**
- Aggregated revenue by category, season, location, and age group
- Calculated subscription rates and discount utilization
- Identified top-performing customer segments

**Step 3 — Tableau Dashboard**
- Built 10+ worksheets and combined into an interactive dashboard
- Applied cross-sheet filters for Season, Category, Age Group, Gender, Location, and Discount

---

## 📊 Dashboard Highlights

The Tableau dashboard includes the following views:

**KPI Cards (BANs)**
- Total Customers · Total Orders · Total Revenue
- Avg Purchase Amount · Avg Review Rating
- Discount Utilization Rate · Subscription Rate
- Avg Purchase Frequency (days) · Avg Previous Purchases

**Charts & Visualizations**
- Subscription vs Revenue (Pie Chart)
- Season vs Revenue (Area Chart)
- Age Group vs Revenue (Bar Chart)
- Category vs Sales & Review (Dual-Axis Bar + Line)
- Location vs Revenue (Bar Chart — 50 US states)
- Discount Impact on Revenue & Review (Dual-Axis Bar + Line)

---

## 🔍 Key Findings

1. **Clothing dominates revenue** — Clothing accounts for **$104K (45%)** of total revenue ($233K), far ahead of Accessories ($74K), Footwear ($36K), and Outerwear ($18K).

2. **Discounts are overused with minimal payoff** — **43% of all transactions** used a discount, yet average purchase amount was almost identical: $60.13 (no discount) vs $59.28 (with discount). Discounts are not driving higher spend.

3. **Only 27% of customers are subscribed** — Yet subscribers are a critical retention segment. Growing the subscription base is the highest ROI lever for the business.

4. **Seasonality is flat** — Revenue is remarkably consistent across all four seasons (Fall: $60K, Spring: $58.7K, Winter: $58.6K, Summer: $55.8K), suggesting demand is driven by product need rather than seasonal trends.

5. **Young adults are the top revenue segment** — Young adults generate $62K, followed by middle-aged ($59K), adults ($55.9K), and seniors ($55.7K). Marketing should prioritize the young adult segment.

6. **Montana, Illinois, and California are the top revenue states** — Geographic concentration offers targeted marketing opportunities.

---

## 💡 Business Recommendations

### 1. Re-evaluate the Discount Strategy
With 43% discount utilization and virtually no difference in average order value ($60.13 vs $59.28), the current discount program is giving away margin without driving incremental spend. **Recommendation:** Shift to targeted discounts for high-value or lapsed customers only, rather than blanket promotions.

### 2. Grow the Subscription Program
Only 27% of customers are subscribed. Subscribers represent a loyal, repeat-purchase segment. **Recommendation:** Introduce a referral or onboarding incentive to convert non-subscribers, especially among the young adult age group who show the highest purchase volume.

### 3. Double Down on Clothing & Accessories
These two categories together account for **77% of total revenue**. **Recommendation:** Prioritize inventory, promotions, and marketing spend on Clothing and Accessories. Outerwear at only $18K ($8% of revenue) should be reviewed for profitability.

### 4. Launch Geo-Targeted Campaigns
Montana, Illinois, California, Idaho, and Nevada are the top 5 revenue states. **Recommendation:** Run location-specific email or ad campaigns in these states to deepen penetration in already-strong markets.

### 5. Address the Age Gap
Seniors and adults (45+) generate notably less revenue than younger segments. **Recommendation:** Investigate whether this is a product-fit issue or a marketing reach issue, and consider product line expansion or channel diversification for older demographics.




*Dataset used for portfolio/educational purposes.*
