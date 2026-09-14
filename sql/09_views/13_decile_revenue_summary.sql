CREATE OR REPLACE VIEW decile_revenue_summary AS
    WITH deciles_summary AS(
        SELECT DISTINCT revenue_decile,
            decile_customer_count AS customer_count,
            decile_total_revenue,decile_revenue_percentage
       FROM customer_revenue_deciles
    )
    SELECT
        revenue_decile,customer_count,
        decile_total_revenue,decile_revenue_percentage,
        ROUND(
            SUM(decile_revenue_percentage) OVER(ORDER BY revenue_decile ASC),2
        )
            AS cumulative_revenue_percentage
    FROM deciles_summary;