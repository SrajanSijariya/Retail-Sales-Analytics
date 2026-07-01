# Retail Sales Analytics — SQL Server, Excel & Power BI

End-to-end data analytics project built on the Kaggle **Sample Superstore** dataset (9,994 retail orders, 2014–2017), covering the full pipeline from relational database querying to business intelligence dashboarding.

## Project Overview

This project analyzes retail sales performance across regions, product categories, and customer segments using a three-stage pipeline:

1. **SQL Server** — data modeling, aggregation, and analytical querying
2. **Excel** — data validation, pivot table analysis, and charting
3. **Power BI** — interactive multi-page dashboard with DAX measures

The goal was to identify profitability drivers and operational inefficiencies in the business — specifically, which regions/categories drive profit, how discounting affects margins, and how shipping performance varies by mode.

## Dataset

- **Source:** [Sample Superstore dataset](https://www.kaggle.com/datasets) (Kaggle)
- **Size:** 9,994 rows × 21 columns
- **Fields:** Order/Ship dates, Ship Mode, Customer info, Geography (Region/State/City), Category/Sub-Category, Product, Sales, Quantity, Discount, Profit

## Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| Database | SQL Server Express + SSMS | Data storage, querying, view creation |
| Spreadsheet | Microsoft Excel | Data validation, pivot tables, charts |
| BI / Visualization | Power BI Desktop | DAX measures, interactive dashboard |

## SQL Work

Implemented in SSMS against a `SuperstoreDB` database:

- Table creation and bulk import of the raw dataset (9,994 rows)
- Aggregation queries: regional sales/profit performance, category-wise profit margins, monthly sales trend
- **Window function**: `RANK()` to identify top 10 customers by sales
- **CTE**: discount-band analysis showing the relationship between discount depth and profitability
- **Date functions**: shipping mode efficiency via `DATEDIFF` on order/ship dates
- **View**: `vw_SalesSummary` — a cleaned, derived view (adds a calculated `DeliveryDays` column) used as the single source feeding the Power BI dashboard

Key finding from SQL analysis: orders with discounts above ~20% show sharply lower (often negative) average profit per order, while several sub-categories (e.g. Tables, Bookcases) are consistently unprofitable despite healthy sales volume.

## Excel Work

- Imported and validated the raw CSV (date type checks, duplicate check)
- Added a calculated `Profit Margin` column
- Built two pivot tables: Region × Category sales/profit matrix, and Sub-Category profit ranking
- Horizontal bar chart visualizing profit by sub-category

## Power BI Dashboard

Connects directly to the `vw_SalesSummary` SQL Server view (Import mode). Three pages:

1. **Executive Overview** — KPI cards (Total Sales, Total Profit, Profit Margin %, Total Orders), monthly sales trend line, regional sales/profit clustered bar, category sales donut, region slicer
2. **Product & Profitability Deep Dive** — sub-category profit ranking, discount-vs-profit scatter plot, top 10 customers table, category slicer
3. **Operations / Shipping** — average delivery days by ship mode, top states by sales, delivery KPI card

**DAX measures used:**
```dax
Total Sales = SUM(vw_SalesSummary[Sales])
Total Profit = SUM(vw_SalesSummary[Profit])
Profit Margin % = DIVIDE([Total Profit], [Total Sales], 0)
Total Orders = DISTINCTCOUNT(vw_SalesSummary[Order ID])
Avg Delivery Days = AVERAGE(vw_SalesSummary[DeliveryDays])
```

## Repository Structure

```
retail-sales-analytics-sql-powerbi/
├── README.md
├── data/
│   └── Sample_Superstore.csv
├── sql/
│   └── queries.sql
├── excel/
│   └── Superstore_Analysis.xlsx
└── powerbi/
    └── Superstore_Dashboard.pbix
```

## Key Insights

- Discounts beyond ~20% are associated with sharply reduced or negative profit per order
- Furniture sub-categories (Tables, Bookcases) generate substantial sales but erode overall profit margin
- The West and East regions outperform South and Central in both sales volume and profit margin
- Standard Class shipping accounts for the majority of orders with the longest average delivery time

## Author

**Srajan Sijariya**
**Pratyush Sahu**
B.Tech Mechanical Engineering, IIT Ropar
