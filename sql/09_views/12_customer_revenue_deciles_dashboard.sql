CREATE OR REPLACE VIEW customer_revenue_deciles AS
    WITH customer_deciles AS(
        SELECT customer_id,customer_name,total_spent,
        NTILE(10) OVER(ORDER BY total_spent DESC) AS revenue_decile 
    FROM customer_lifetime_value
    ),
    decile_totals AS (
        SELECT customer_id,customer_name,
        total_spent,revenue_decile,
        COUNT(customer_id) OVER(PARTITION BY revenue_decile) AS decile_customer_count,
        SUM(total_spent) OVER(PARTITION BY revenue_decile) AS decile_total_revenue
    FROM customer_deciles
    )
    SELECT customer_id,customer_name,
        total_spent,revenue_decile,
        decile_customer_count,
        decile_total_revenue,
        ROUND(
            (decile_total_revenue/
                SUM(total_spent) OVER()) * 100,2
        ) AS decile_revenue_percentage
    FROM decile_totals
    ; 