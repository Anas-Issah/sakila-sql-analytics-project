# Sakila Analytics — PostgreSQL Business Intelligence Project

## Project Overview

Sakila Analytics is a PostgreSQL-based business intelligence and analytics project built using the Sakila DVD rental database.

The project analyzes customer behavior, rental activity, revenue performance, film performance, category performance, and store performance. The goal is to transform raw transactional data into reusable reporting views, business KPIs, and dashboard-ready datasets.

The project demonstrates practical SQL skills used in data analytics and data engineering, including complex joins, aggregations, CTEs, window functions, analytical reporting, customer segmentation, revenue concentration, and reusable PostgreSQL views.

---

## Project Objectives

The main objectives of this project are to:

* Analyze customer purchasing and rental behavior
* Identify high-value and loyal customers
* Analyze customer revenue concentration
* Analyze monthly revenue trends and growth
* Evaluate film performance
* Evaluate category performance
* Compare store performance
* Segment customers based on rental activity and spending
* Analyze revenue distribution using customer deciles
* Create reusable reporting views
* Build dashboard-ready business metrics
* Transform SQL analysis into a professional analytics portfolio project

---

## Technologies

* PostgreSQL 17.9
* SQL
* Git
* GitHub

---

## Project Architecture

The project follows a layered analytics architecture:

```text
Sakila Database
      ↓
SQL Analysis
      ↓
Reporting Views
      ↓
Business Reports
      ↓
Dashboard KPIs
      ↓
Business Insights
```

This layered approach separates raw database structures, analytical queries, reusable reporting logic, and business-facing outputs, making the project easier to maintain and extend.

---

## Repository Structure

```text
sakila-analytics/
│
├── database/
│   └── sakila-schema.sql
│
├── sql/
│   │
│   ├── 01_basic_queries/
│   │   ├── query_001_customer_list.sql
│   │   ├── query_002_active_customer_list.sql
│   │   ├── query_003_long_movies_list.sql
│   │   ├── ...
│   │   └── query_010_customer_fullname.sql
│   │
│   ├── 02_aggregation/
│   │   ├── query_011_number_of_customers.sql
│   │   ├── query_012_active_vs_inactive_customers.sql
│   │   ├── query_013_total_payment.sql
│   │   ├── ...
│   │   └── query_025_high_spending_customers.sql
│   │
│   ├── 03_joins/
│   │
│   ├── 04_subqueries_ctes/
│   │
│   ├── 05_window_functions/
│   │
│   ├── 06_time_and_date_analysis/
│   │
│   ├── 07_conditional_logic_and_advance_aggregation/
│   │
│   ├── 08_analytical_queries/
│   │
│   ├── 09_views/
│   │
│   └── reports/
│
└── README.md
```

### Directory Overview

| Directory                                       | Purpose                                                               |
| ----------------------------------------------- | --------------------------------------------------------------------- |
| `database/`                                     | Contains the Sakila database schema                                   |
| `01_basic_queries/`                             | Fundamental filtering, sorting, and column transformations            |
| `02_aggregation/`                               | Aggregations, grouping, and business metrics                          |
| `03_joins/`                                     | Combining data from multiple relational tables                        |
| `04_subqueries_ctes/`                           | Subqueries and Common Table Expressions                               |
| `05_window_functions/`                          | Ranking, running totals, comparisons, and analytical window functions |
| `06_time_and_date_analysis/`                    | Date-based and time-series analysis                                   |
| `07_conditional_logic_and_advance_aggregation/` | `CASE`, conditional aggregation, and advanced aggregation techniques  |
| `08_analytical_queries/`                        | Advanced business and analytical questions                            |
| `09_views/`                                     | Reusable PostgreSQL reporting and dashboard views                     |
| `reports/`                                      | Business-focused reports and final analytical outputs                 |

---

## SQL Learning Progression

The SQL directory follows a deliberate progression:

```text
Basic SQL
   ↓
Aggregations
   ↓
Joins
   ↓
Subqueries & CTEs
   ↓
Window Functions
   ↓
Date Analysis
   ↓
Conditional & Advanced Aggregation
   ↓
Analytical Queries
   ↓
Reusable Views
   ↓
Business Reports
```

This progression demonstrates how the project evolved from SQL practice into a structured business analytics project.

---

## SQL Analysis

### Basic Analysis

The project covers fundamental SQL operations including:

* Filtering data with `WHERE`
* Sorting with `ORDER BY`
* Selecting and transforming columns
* Working with dates and text

### Aggregations

The project demonstrates:

* `COUNT`
* `SUM`
* `AVG`
* `MIN`
* `MAX`
* `GROUP BY`
* `HAVING`

### Joins

Different join strategies are used to combine related Sakila tables:

* `INNER JOIN`
* `LEFT JOIN`
* Multi-table joins
* Join cardinality analysis

### Subqueries and CTEs

Complex analytical problems are broken into manageable steps using:

* Scalar subqueries
* Correlated subqueries
* Common Table Expressions
* Multiple CTE pipelines

### Window Functions

The project demonstrates:

* `ROW_NUMBER`
* `RANK`
* `LAG`
* `LEAD`
* `SUM() OVER()`
* `COUNT() OVER()`
* `AVG() OVER()`
* `PARTITION BY`
* Running totals
* Cumulative percentages
* Customer and film rankings
* Revenue concentration analysis

### Advanced Analytics

The project includes:

* Monthly revenue analysis
* Revenue growth
* Customer segmentation
* Pareto analysis
* Revenue concentration
* Top-customer contribution
* Customer revenue deciles
* Decile performance classification
* Film performance classification
* Category performance classification
* Store performance classification

---

## Reporting Views

The project uses reusable PostgreSQL views to separate analytical logic from business reporting.

### Customer Analytics

Examples include:

* Customer spending summaries
* Customer rental summaries
* Customer retention summaries
* Customer lifetime value
* Customer revenue concentration
* Customer revenue deciles
* Customer revenue segments

### Film Analytics

Examples include:

* Film rental performance
* Film revenue performance
* Film rankings
* Film performance classification
* Film revenue contribution

### Category Analytics

Examples include:

* Category revenue summaries
* Category rankings
* Category revenue contribution
* Category performance classification

### Store Analytics

Examples include:

* Store performance summaries
* Store revenue comparison
* Store performance classification

### Dashboard Views

The project contains dashboard-ready views for:

* Overall KPIs
* Monthly revenue
* Customer segments
* Film performance
* Category performance
* Store performance
* Customer revenue concentration
* Customer revenue deciles

---

## Key Business Questions

The analysis is designed to answer questions such as:

### Customers

* Who are the highest-value customers?
* Which customers generate the most revenue?
* How many customers are loyal, regular, occasional, or inactive?
* How concentrated is revenue among high-value customers?
* What percentage of revenue comes from the highest-spending customers?

### Revenue

* What is the total rental revenue?
* What is the average revenue per rental?
* How does revenue change over time?
* What is the monthly revenue growth?
* How concentrated is customer revenue?

### Films

* Which films generate the most revenue?
* Which films have the highest rental volume?
* Which films are top performers?
* Which films contribute the largest percentage of total revenue?

### Categories

* Which categories generate the most revenue?
* Which categories have the highest rental volume?
* Which categories are high-volume or high-revenue performers?

### Stores

* Which store generates the most revenue?
* Which store has the highest rental volume?
* How do the stores compare in customer and revenue performance?

---

## Customer Revenue Analysis

A major part of the project focuses on understanding how revenue is distributed across customers.

Customers are divided into ten revenue deciles using NTILE(10):


Decile 1  → Highest-spending customers
Decile 2
Decile 3
---
Decile 9
Decile 10 → Lowest-spending customers


This allows the project to analyze:

* Number of customers in each decile
* Revenue generated by each decile
* Percentage of total customer revenue
* Cumulative revenue contribution
* Customer value categories

The analysis is then summarized into broader customer groups:


Top Customers
Mid Customers
Low Customers
Lowest Customers


---

## Dashboard KPIs

The project includes an executive-level KPI layer containing metrics such as:

* Total customers
* Active customers
* Total films
* Total categories
* Total rentals
* Total revenue
* Average customer spend
* Average rental revenue
* Top customer
* Top film
* Top category
* Top store

These metrics provide a high-level view of the business and can be connected to a visualization or BI tool.

---

## Key Insights

### Customer and Revenue Performance

* The Sakila database contains **599 customers**, of whom **584 are active** and **15 are inactive**.
* Total rental revenue is **$61,312.04**, generated from **16,044 rentals**.
* The average customer spend is **$102.36**, while the average revenue per rental is **$3.82**.
* Customer revenue is highly concentrated among the High Value and Loyal segments. High Value customers generated **$36,290.89**, while Loyal customers generated **$24,754.84**.
* Together, the High Value and Loyal segments generated approximately **99.6% of the revenue represented in the customer segmentation report**.

### Revenue Trends

* Revenue increased substantially from **$8,349.85 in June 2005 to $28,377.87 in July 2005**, representing **239.86% growth**.
* Revenue decreased by **15.18% in August 2005**, falling to **$24,070.14**.
* May 2005 contains **1,156 rentals but no recorded revenue**, indicating a difference between rental activity and available payment records for that period.
* February 2006 contains only **182 rentals and $514.18 in revenue**. Because there is a large gap between August 2005 and February 2006, this should not be interpreted as a normal month-to-month decline.

### Film Performance

* **Telegraph Voyage** generated the highest revenue among the films analyzed, with **$215.75** from 27 rentals.
* **Zorro Ark** and **Wife Turn** each recorded 31 rentals, while generating **$199.72** and **$198.73** respectively.
* The highest-revenue film contributed only **0.35% of total revenue**, indicating that revenue is distributed broadly across the film catalog rather than being dominated by a single title.
* The film performance classification distinguishes films using both rental volume and revenue rather than relying on rental count alone.

### Category Performance

* **Sports** generated the highest category revenue at **$4,892.19**, representing **7.98%** of category revenue.
* **Sci-Fi** generated **$4,336.01**, followed by **Animation** with **$4,245.31**.
* The updated category classification uses the median rental volume and median revenue of the categories as data-driven thresholds.
* Six categories are classified as **Top Category**, two as **High Revenue**, two as **High Volume**, and six as **Low Performance** under the project's classification rules.
* The classification provides a relative view of category performance within the Sakila dataset rather than using arbitrary fixed thresholds.

### Store Performance

* Store 2 generated **$30,813.33**, representing **50.26%** of total store revenue.
* Store 1 generated **$30,498.71**, representing **49.74%**.
* The difference between the two stores is only **$314.62**, showing that revenue is almost evenly distributed between them.
* Store 1 recorded slightly more rentals (**8,044**) than Store 2 (**8,004**), despite generating slightly less revenue.
* Store 2 is classified as **Higher Revenue** and Store 1 as **Lower Revenue**, based on each store's revenue relative to the average revenue of the two stores.


---

## What This Project Demonstrates

This project demonstrates the ability to:

* Work with a relational PostgreSQL database
* Understand relational data structures
* Write complex SQL queries
* Join multiple related tables
* Aggregate transactional data
* Use CTEs to structure analytical queries
* Apply window functions to business problems
* Build reusable database views
* Perform customer segmentation
* Analyze revenue concentration
* Perform time-series revenue analysis
* Create dashboard-ready datasets
* Organize SQL code into a maintainable GitHub project

---

## Future Improvements

Possible future improvements include:

* Build an interactive business intelligence dashboard
* Connect the PostgreSQL database to a BI tool
* Automate dashboard data refreshes
* Add automated data-quality checks
* Add PostgreSQL performance optimization analysis
* Add query execution plans using `EXPLAIN ANALYZE`
* Add automated reporting
* Integrate the project with Python for data extraction and visualization
* Containerize the analytics environment with Docker

---

## Project Status

**Status: Analytics and reporting phase**

The core SQL analysis, reporting views, customer segmentation, revenue analysis, and dashboard-ready datasets have been developed.

The project is now in the portfolio documentation and presentation stage. The next step is to finalize the business insights from the completed analysis and present the project as a complete data engineering and analytics portfolio project.

---

## Author

**Anas Issah**

Data Engineering / Analytics Portfolio Project
