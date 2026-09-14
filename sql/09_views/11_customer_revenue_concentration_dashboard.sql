CREATE OR REPLACE VIEW customer_revenue_concentration_dashboard AS
    WITH customer_performance AS (
        SELECT customer_id,customer_name,
            total_spent,
            ROW_NUMBER() OVER(ORDER BY total_spent DESC) AS customer_rank,
            (total_spent/
                    NULLIF(SUM(total_spent) OVER(),0)) * 100
                AS revenue_percentage
        FROM customer_lifetime_value
    )
    SELECT customer_id,customer_name,
        total_spent,customer_rank,
        ROUND((revenue_percentage),2) AS revenue_percentage,
        ROUND(
            SUM(revenue_percentage) OVER(ORDER BY revenue_percentage DESC),2
            )AS cumulative_revenue_percentage
        FROM customer_performance
        ORDER BY total_spent DESC;