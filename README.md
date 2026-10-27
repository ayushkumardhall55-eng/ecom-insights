# InsightFlow — E-Commerce Customer Intelligence & Business Analytics

## Project Overview

InsightFlow is an e-commerce analytics project that uses SQL and PostgreSQL to analyze sales performance, monthly trends, delivery reliability, customer satisfaction, and regional delivery patterns.

The goal is to turn raw e-commerce data into actionable business insights that can support better operational decisions and customer experience improvements.

## Business Questions

This project explores the following questions:

1. What are the overall sales, order volume, and average order value?
2. Which month recorded the highest sales and order volume?
3. What percentage of orders were delivered late?
4. What is the average customer review score?
5. How do customer review scores differ between late and early/on-time orders?
6. Which Brazilian customer states have the highest late-delivery rates?

## Tools and Technologies

- **PostgreSQL** — querying and analyzing data
- **pgAdmin** — executing SQL queries and reviewing results
- **Visual Studio Code** — writing and organizing SQL scripts and project documentation
- **Python and pandas** — data preparation and database loading

## Key Findings

- **Total sales:** R$15,442,699.01
- **Total unique orders:** 96,897
- **Average order value:** R$159.37
- **Peak sales month:** November 2017, with R$1,150,227.46 in sales
- **Early/on-time delivery rate:** 91.89%
- **Late delivery rate:** 8.11%
- **Average review score:** 4.03 out of 5
- **Average review score for late orders:** 2.56 out of 5
- **Highest regional late-delivery rate:** Alagoas (AL), at 23.72%

## Business Recommendations

1. Investigate the causes of late deliveries and identify potential operational improvements.
2. Examine regional delivery performance, particularly in states with high late-delivery rates.
3. Monitor customer reviews alongside delivery performance.
4. Investigate demand patterns around November 2017 to support future planning.

## Project Structure

- `SQL/` — SQL scripts for business analysis
- `Reports/` — business findings and recommendations
- `notebook/` — Jupyter notebooks used during analysis
- `cleaned_data/` — cleaned data files, if included in the project

## Conclusion

InsightFlow demonstrates how SQL-based analysis can help identify business performance patterns and potential areas for improvement in e-commerce operations.

The findings show an association between late deliveries and lower customer review scores. Further investigation is needed to determine the causes of delivery delays and validate potential interventions.

*Note: Sales figures, order counts, and percentages are based on the current dataset and the definitions used in the SQL analysis.*
