CREATE OR REPLACE VIEW category_performance_dashboard AS

WITH category_metrics AS (
    SELECT
        category_id,name,
        film_count,rental_count,
        total_revenue
    FROM category_revenue_summary
),

category_thresholds AS (
    SELECT
        PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY rental_count) AS median_rentals,

        PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY total_revenue) AS median_revenue

    FROM category_metrics
),

category_classification AS (
    SELECT
        cm.category_id,
        cm.name,
        cm.film_count,
        cm.rental_count,
        cm.total_revenue,

        CASE
            WHEN cm.rental_count >= ct.median_rentals
                 AND cm.total_revenue >= ct.median_revenue
                THEN 'Top Category'

            WHEN cm.rental_count >= ct.median_rentals
                THEN 'High Volume'

            WHEN cm.total_revenue >= ct.median_revenue
                THEN 'High Revenue'

            ELSE 'Low Performance'
        END AS performance_category

    FROM category_metrics cm
    CROSS JOIN category_thresholds ct
)

SELECT
    category_id,
    name,
    film_count,
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

FROM category_classification
ORDER BY total_revenue DESC;