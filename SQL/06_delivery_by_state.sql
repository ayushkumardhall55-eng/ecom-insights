-- =====================================================
-- PROJECT: InsightFlow
-- FILE: 06_delivery_by_state.sql
-- PURPOSE: Identify regional delivery problems
-- =====================================================

-- QUESTION 7:
-- Which customer states have the highest late-delivery rates?

SELECT
    customer_state,
    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT order_id)
        FILTER (WHERE delivery_status = 'Late')
        AS late_orders,

    ROUND(
        100.0 * COUNT(DISTINCT order_id)
            FILTER (WHERE delivery_status = 'Late')
        / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS late_delivery_percentage

FROM olist_master
WHERE delivery_status IS NOT NULL
  AND customer_state IS NOT NULL

GROUP BY customer_state
HAVING COUNT(DISTINCT order_id) >= 100

ORDER BY late_delivery_percentage DESC;