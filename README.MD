# Retail Sales Analysis Using SQL

## Project Overview

This project analyzes retail sales data using MySQL to understand sales performance, profitability, customer behavior, product returns, and shipping efficiency.

The goal is to extract meaningful business insights using SQL queries and help businesses make data-driven decisions.

## Tools & Technologies

- MySQL
- SQL
- MySQL Workbench

## Dataset

This project uses two tables:

- **SALES:** Contains sales transactions, customer details, product categories, sales, profit, discounts, regions, returns, and shipping information.
- **CALENDER_FILE:** Contains date, year, quarter, month, week, and day information.

## Data Cleaning

- Created the `SALES_DB` database.
- Inspected tables using `SELECT` and `DESC`.
- Converted date columns into the DATE data type using `STR_TO_DATE()`.
- Checked for missing values in the calendar table.
- Prepared the data for analysis.

## SQL Analysis and Business Questions

### 1. Year-over-Year Sales and Profit Analysis

Analyzed yearly sales and profit to understand business growth and financial performance.

### 2. Day-wise Sales and Returns Analysis

Compared sales and product returns across different days of the week to identify day-wise patterns.

### 3. Best Performing Quarter

Identified the year and quarter with the highest total sales.

### 4. Discount and Profitability Analysis

Analyzed category-wise and sub-category-wise sales, average discounts, and profits to identify loss-making products.

### 5. Regional Return Rate Analysis

Calculated the return rate percentage for each region to identify regions with higher product returns.

### 6. Top 10 Loss-making Customers

Identified the ten customers generating the highest total losses.

### 7. Shipping Delay Analysis

Calculated average shipping days for different shipping modes using `DATEDIFF()`.

### 8. Salesperson Performance Analysis

Evaluated salesperson performance based on total sales, total profit, and profit margin percentage.

### 9. Customer Churn Analysis

Identified customers who purchased in 2015 or 2016 but did not purchase in 2017.

### 10. 30-Day Moving Average

Calculated a rolling average of daily sales using Common Table Expressions (CTEs) and window functions.

## SQL Concepts Used

- Data Definition Language (DDL) and Data Manipulation Language (DML)
- Data cleaning and date conversion
- Aggregate functions: `SUM()`, `AVG()`, and `COUNT()`
- Filtering using `WHERE` and `HAVING`
- Grouping and sorting using `GROUP BY` and `ORDER BY`
- Conditional logic using `CASE WHEN`
- Joins
- Subqueries
- Common Table Expressions (CTEs)
- Date functions: `STR_TO_DATE()` and `DATEDIFF()`
- Window functions and moving averages
- Business KPI calculations

## Project Objective

The objective is to demonstrate practical SQL skills by solving business problems related to sales, profit, discounts, customer retention, product returns, and shipping performance.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Import the sales and calendar datasets.
3. Create and select the `SALES_DB` database.
4. Ensure the tables are named `SALES` and `CALENDER_FILE`.
5. Open the SQL script and execute the queries in order.

**Recommended Version:** MySQL 8.0 or later.

## Repository Files

- `README.md` — Project documentation.
- `Retail_Analysis.sql` — SQL queries for data cleaning and analysis.
- `SALES.csv` — Sales dataset.
- `CALENDER_FILE.csv` — Calendar dataset.

## Conclusion

This project demonstrates how SQL can be used to analyze retail sales data, identify profitability issues, understand customer behavior, evaluate shipping performance, and generate actionable business insights.
