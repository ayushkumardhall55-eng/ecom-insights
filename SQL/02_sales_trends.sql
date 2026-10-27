-- QUESTION 3: Monthly sales trends

SELECT
    TO_CHAR(
        TO_TIMESTAMP(
            order_purchase_timestamp,
            'YYYY-MM-DD HH24:MI:SS'
        ),
        'YYYY-MM'
    ) AS sales_month,
    ROUND(SUM(item_total_value)::numeric, 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM olist_master
WHERE order_purchase_timestamp IS NOT NULL
GROUP BY sales_month
ORDER BY sales_month;