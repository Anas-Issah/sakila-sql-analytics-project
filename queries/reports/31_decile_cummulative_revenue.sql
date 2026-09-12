WITH customers_total_spent AS(
    SELECT SUM(total_spent) AS total_revenue
    FROM customer_lifetime_value
),
customer_revenue_deciles AS(
    SELECT customer_id,customer_name,total_spent,
    NTILE(10) OVER(ORDER BY total_spent DESC) AS revenue_decile
FROM customer_lifetime_value
),
deciles_revenue AS(
    SELECT
    revenue_decile,COUNT(customer_id) AS customer_count,
    SUM(total_spent) AS total_revenue,
    ROUND(
        (SUM(total_spent)/
            (SELECT total_revenue FROM customers_total_spent)) * 100,2
    ) AS revenue_percentage 
FROM customer_revenue_deciles
GROUP BY revenue_decile
)
SELECT
    revenue_decile,customer_count,
    total_revenue,revenue_percentage,
    SUM(revenue_percentage) OVER(ORDER BY revenue_decile) AS cumulative_revenue_percentage
    FROM deciles_revenue
;
