WITH customers_total_spent AS(
    SELECT SUM(total_spent) AS total_revenue
    FROM customer_lifetime_value
    ),
top_10_revenue AS(
    SELECT SUM(total_spent) AS top_revenue
    FROM customer_lifetime_value
    WHERE customer_rank <= 10
),
top_11_to_20_revenue AS(
    SELECT SUM(total_spent) AS top_revenue
    FROM customer_lifetime_value
    WHERE customer_rank > 10 AND customer_rank <= 20
)
SELECT
    (SELECT top_revenue FROM top_10_revenue) AS top_10_customers_revenue,
    (SELECT top_revenue FROM top_11_to_20_revenue) AS customers_11_to_20_revenue,
    ROUND(
        ((SELECT top_revenue FROM top_10_revenue)::NUMERIC/
                (SELECT total_revenue FROM customers_total_spent)) * 100,2
    ) AS top_10_revenue_percentage,
    ROUND(
        ((SELECT top_revenue FROM top_11_to_20_revenue)::NUMERIC/
                (SELECT total_revenue FROM customers_total_spent)) * 100,2
    ) AS customers_11_to_20_revenue_percentage
    ;