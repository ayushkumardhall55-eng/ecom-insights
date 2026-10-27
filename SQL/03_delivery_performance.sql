-- =====================================================
-- PROJECT: InsightFlow
-- FILE: 03_delivery_performance.sql
-- PURPOSE: Analyze delivery performance
-- =====================================================

-- QUESTION 4:
-- How many orders are delivered late versus early/on time?

SELECT
    delivery_status,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        COUNT(DISTINCT order_id) * 100.0
        / SUM(COUNT(DISTINCT order_id)) OVER (),
        2
    ) AS percentage_of_orders
FROM olist_master
WHERE delivery_status IS NOT NULL
GROUP BY delivery_status
ORDER BY total_orders DESC;