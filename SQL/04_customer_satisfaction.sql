-- =====================================================
-- PROJECT: InsightFlow
-- FILE: 04_customer_satisfaction.sql
-- PURPOSE: Customer review analysis
-- =====================================================

-- QUESTION 5:
-- What is the average customer review score?

SELECT
    ROUND(AVG(avg_review_score)::numeric, 2)
        AS average_review_score,
    COUNT(DISTINCT order_id)
        AS orders_with_review_data,
    COUNT(*) FILTER (
        WHERE avg_review_score <= 2
    ) AS low_review_rows,
    COUNT(*) FILTER (
        WHERE avg_review_score >= 4
    ) AS high_review_rows
FROM olist_master
WHERE avg_review_score IS NOT NULL;