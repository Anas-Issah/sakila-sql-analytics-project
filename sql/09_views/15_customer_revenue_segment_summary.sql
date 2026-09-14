CREATE OR REPLACE VIEW customer_revenue_segment_summary AS
    SELECT value_category AS revenue_segment,
        SUM(customer_count) AS customer_count,
        SUM(decile_total_revenue) AS total_revenue,
        SUM(revenue_percentage) AS revenue_percentage,
        ROUND(
            SUM(decile_total_revenue)/
                SUM(customer_count), 2         
        ) AS average_customer_spend
    FROM decile_performance_classification
    GROUP BY value_category;