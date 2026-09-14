--how much of the company's total revenue comes from the top 10 customers combined?
WITH customers_total_spent AS(
    SELECT SUM(total_spent) AS total_revenue
    FROM customer_lifetime_value
    ),
top_10_revenue AS(
    SELECT SUM(total_spent) AS top_revenue
    FROM customer_lifetime_value
    WHERE customer_rank <= 10
)
SELECT
    (SELECT top_revenue FROM top_10_revenue) AS top_10_customers_revenue,
    (SELECT total_revenue FROM customers_total_spent) AS total_revenue,
    ROUND(
        ((SELECT top_revenue FROM top_10_revenue)::NUMERIC/
                (SELECT total_revenue FROM customers_total_spent)) * 100,2
    ) AS revenue_percentage
    ;