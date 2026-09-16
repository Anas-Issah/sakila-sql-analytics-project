CREATE OR REPLACE VIEW store_performance_dashboard AS

WITH store_metrics AS (
    SELECT
        store_id,store_manager,
        customer_count,rental_count,
        total_revenue
    FROM store_performance_summary
),

store_classification AS (
    SELECT
        store_id,store_manager,
        customer_count,rental_count,
        total_revenue,

        CASE
            WHEN total_revenue >= AVG(total_revenue) OVER ()
                THEN 'Higher Revenue'
            ELSE 'Lower Revenue'
        END AS performance_category

    FROM store_metrics
)

SELECT
    store_id,
    store_manager,
    customer_count,
    rental_count,
    total_revenue,

    ROUND(
        (
            total_revenue /
            NULLIF(SUM(total_revenue) OVER (), 0)
        ) * 100,
        2
    ) AS revenue_percentage,

    performance_category

FROM store_classification
ORDER BY total_revenue DESC;