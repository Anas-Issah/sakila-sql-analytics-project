WITH customer_performance AS (
    SELECT customer_id,customer_name,
        total_spent,
        ROW_NUMBER() OVER(ORDER BY total_spent DESC) AS customer_rank,
        ROUND(
            (total_spent/
                NULLIF(SUM(total_spent) OVER(),0)) * 100,2
        ) AS revenue_percentage
    FROM customer_lifetime_value
)
SELECT customer_id,customer_name,
    total_spent,customer_rank,
    revenue_percentage,
    SUM(revenue_percentage) OVER(ORDER BY revenue_percentage DESC)
        AS cumulative_revenue_percentage
    FROM customer_performance
    ORDER BY total_spent;