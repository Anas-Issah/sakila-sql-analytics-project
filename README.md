Sakila Analytics — PostgreSQL Business Intelligence Project
Project Overview

Sakila Analytics is a PostgreSQL-based business intelligence and analytics project built using the Sakila DVD rental database.

The project analyzes customer behavior, rental activity, revenue performance, film performance, category performance, and store performance. The goal is to transform raw transactional data into reusable reporting views, business KPIs, and dashboard-ready datasets.

The project demonstrates practical SQL skills used in data analytics and data engineering, including complex joins, aggregations, CTEs, window functions, analytical reporting, customer segmentation, revenue concentration, and reusable PostgreSQL views.

Project Objectives

The main objectives of this project are to:

Analyze customer purchasing and rental behavior
Identify high-value and loyal customers
Analyze customer revenue concentration
Analyze monthly revenue trends and growth
Evaluate film performance
Evaluate category performance
Compare store performance
Segment customers based on rental activity and spending
Analyze revenue distribution using customer deciles
Create reusable reporting views
Build dashboard-ready business metrics
Transform SQL analysis into a professional analytics portfolio project
Technologies
PostgreSQL 17
SQL
Git
GitHub
Project Architecture

The project follows a layered analytics architecture:

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

The separation between the database, analytical queries, reporting views, and business reports makes the project easier to maintain and extend.

Repository Structure
sakila-analytics/
│
├── README.md
│
├── database/
│   └── schema.sql
│
├── sql/
│   ├── 01_basic_analysis.sql
│   ├── 02_aggregations.sql
│   ├── 03_joins.sql
│   ├── 04_subqueries.sql
│   ├── 05_ctes.sql
│   ├── 06_window_functions.sql
│   ├── 07_date_analysis.sql
│   ├── 08_advanced_analytics.sql
│   │
│   ├── views/
│   │   ├── 01_customer_analytics.sql
│   │   ├── 02_film_analytics.sql
│   │   ├── 03_category_analytics.sql
│   │   ├── 04_store_analytics.sql
│   │   ├── 05_dashboard_kpis.sql
│   │   ├── 06_monthly_revenue_dashboard.sql
│   │   ├── 07_customer_segment_dashboard.sql
│   │   ├── 08_film_performance_dashboard.sql
│   │   ├── 09_category_performance_dashboard.sql
│   │   ├── 10_store_performance_dashboard.sql
│   │   ├── 11_customer_revenue_concentration.sql
│   │   ├── 12_customer_revenue_deciles.sql
│   │   ├── 13_decile_revenue_summary.sql
│   │   ├── 14_decile_performance_classification.sql
│   │   └── 15_customer_revenue_segment_summary.sql
│   │
│   └── reports/
│
└── reports/
SQL Analysis

The project contains a progression from fundamental SQL analysis to advanced business analytics.

Basic Analysis
Filtering data with WHERE
Sorting with ORDER BY
Selecting and transforming columns
Working with dates and text
Aggregations
COUNT
SUM
AVG
MIN
MAX
GROUP BY
HAVING
Joins

The project uses different join strategies to combine related Sakila tables:

INNER JOIN
LEFT JOIN
Multi-table joins
Join cardinality analysis
Subqueries and CTEs

Complex analytical problems are broken into manageable steps using:

Scalar subqueries
Correlated subqueries
Common Table Expressions
Multiple CTE pipelines
Window Functions

The project demonstrates:

ROW_NUMBER
RANK
LAG
LEAD
SUM() OVER()
COUNT() OVER()
AVG() OVER()
PARTITION BY
Running totals
Cumulative percentages
Customer and film rankings
Revenue concentration analysis
Advanced Analytics

The project includes:

Monthly revenue analysis
Revenue growth
Customer segmentation
Pareto analysis
Revenue concentration
Top-customer contribution
Customer revenue deciles
Decile performance classification
Film performance classification
Category performance classification
Store performance classification
Reporting Views

The project uses reusable PostgreSQL views to separate analytical logic from business reporting.

Customer Analytics

Examples include:

Customer spending summaries
Customer rental summaries
Customer retention summaries
Customer lifetime value
Customer revenue concentration
Customer revenue deciles
Customer revenue segments
Film Analytics

Examples include:

Film rental performance
Film revenue performance
Film rankings
Film performance classification
Film revenue contribution
Category Analytics

Examples include:

Category revenue summaries
Category rankings
Category revenue contribution
Category performance classification
Store Analytics

Examples include:

Store performance summaries
Store revenue comparison
Store performance classification
Dashboard Views

The project also contains dashboard-ready views for:

Overall KPIs
Monthly revenue
Customer segments
Film performance
Category performance
Store performance
Customer revenue concentration
Customer revenue deciles
Key Business Questions

The analysis is designed to answer questions such as:

Customers
Who are the highest-value customers?
Which customers generate the most revenue?
How many customers are loyal, regular, occasional, or inactive?
How concentrated is revenue among high-value customers?
What percentage of revenue comes from the highest-spending customers?
Revenue
What is the total rental revenue?
What is the average revenue per rental?
How does revenue change over time?
What is the monthly revenue growth?
How concentrated is customer revenue?
Films
Which films generate the most revenue?
Which films have the highest rental volume?
Which films are top performers?
Which films contribute the largest percentage of total revenue?
Categories
Which categories generate the most revenue?
Which categories have the highest rental volume?
Which categories are high-volume or high-revenue performers?
Stores
Which store generates the most revenue?
Which store has the highest rental volume?
How do the stores compare in customer and revenue performance?
Customer Revenue Analysis

A major part of the project focuses on understanding how revenue is distributed across customers.

Customers are divided into ten revenue deciles using NTILE(10).

Decile 1  → Highest-spending customers
Decile 2
Decile 3
...
Decile 9
Decile 10 → Lowest-spending customers

This allows the project to analyze:

Number of customers in each decile
Revenue generated by each decile
Percentage of total customer revenue
Cumulative revenue contribution
Customer value categories

The analysis is then summarized into broader customer groups such as:

Top Customers
Mid Customers
Low Customers
Lowest Customers
Dashboard KPIs

The project includes an executive-level KPI layer containing metrics such as:

Total customers
Active customers
Total films
Total categories
Total rentals
Total revenue
Average customer spend
Average rental revenue
Top customer
Top film
Top category
Top store

These metrics provide a high-level view of the business and can be connected to a visualization or BI tool.

Key Insights

Key findings will be added after the final dashboard analysis.

The final insights will focus on:

Customer revenue concentration
Highest-value customer segments
Revenue trends
Top-performing films
Top-performing categories
Store performance
Revenue distribution across customer deciles

All reported values will be derived directly from the Sakila PostgreSQL database.

What This Project Demonstrates

This project demonstrates the ability to:

Work with a relational PostgreSQL database
Understand relational data structures
Write complex SQL queries
Join multiple related tables
Aggregate transactional data
Use CTEs to structure analytical queries
Apply window functions to business problems
Build reusable database views
Perform customer segmentation
Analyze revenue concentration
Perform time-series revenue analysis
Create dashboard-ready datasets
Organize SQL code into a maintainable GitHub project
Future Improvements

Possible future improvements include:

Build an interactive business intelligence dashboard
Connect the PostgreSQL database to a BI tool
Automate dashboard data refreshes
Add automated data-quality checks
Add PostgreSQL performance optimization analysis
Add query execution plans using EXPLAIN ANALYZE
Add automated reporting
Integrate the project with Python for data extraction and visualization
Containerize the analytics environment with Docker
Project Status

Status: Analytics and reporting phase

The core SQL analysis and reporting views have been developed. The next stage is to finalize the business dashboard, document the key findings, and present the project as a complete data engineering and analytics portfolio project.

Author

Anas Issah

Data Engineering / Analytics Portfolio Project