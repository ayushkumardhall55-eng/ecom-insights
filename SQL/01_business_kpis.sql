-- =====================================================
-- PROJECT: InsightFlow
-- FILE: 01_business_kpis.sql
-- PURPOSE: Overall business and category analysis
-- DATABASE: olist_analytics
-- TABLE: olist_master
-- =====================================================


-- QUESTION 1:
-- What are the overall sales, unique orders, and average order value?

SELECT
    ROUND(SUM(item_total_value)::numeric, 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        (
            SUM(item_total_value)
            / COUNT(DISTINCT order_id)
        )::numeric,
        2
    ) AS average_order_value
FROM olist_master;


-- QUESTION 2:
-- Which product categories generate the most sales?

SELECT
    COALESCE(
        product_category_name_english,
        'Unknown'
    ) AS product_category,
    ROUND(SUM(item_total_value)::numeric, 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(item_total_value)::numeric, 2)
        AS average_item_value
FROM olist_master
GROUP BY product_category_name_english
ORDER BY total_sales DESC
LIMIT 10;