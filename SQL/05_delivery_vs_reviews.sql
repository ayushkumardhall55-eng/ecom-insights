-- =====================================================
-- PROJECT: InsightFlow
-- FILE: 05_delivery_vs_reviews.sql
-- PURPOSE: Compare delivery performance and reviews
-- =====================================================

-- QUESTION 6:
-- Do late deliveries receive lower review scores?

WITH order_reviews AS (
    SELECT
        order_id,
        MAX(delivery_status) AS delivery_status,
        AVG(avg_review_score) AS review_score
    FROM olist_master
    WHERE delivery_status IS NOT NULL
      AND avg_review_score IS NOT NULL
    GROUP BY order_id
)

SELECT
    delivery_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(review_score)::numeric, 2)
        AS average_review_score,
    COUNT(*) FILTER (
        WHERE review_score <= 2
    ) AS low_review_orders,
    ROUND(
        COUNT(*) FILTER (
            WHERE review_score <= 2
        ) * 100.0 / COUNT(*),
        2
    ) AS low_review_percentage
FROM order_reviews
GROUP BY delivery_status
ORDER BY average_review_score DESC;