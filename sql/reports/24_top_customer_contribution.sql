WITH customers_total_spent AS(
    SELECT SUM(total_spent) AS total_revenue
    FROM customer_lifetime_value
    )
SELECT customer_name,total_spent,
    (SELECT total_revenue FROM customers_total_spent),
    ROUND(
        (total_spent::NUMERIC/
                (SELECT total_revenue FROM customers_total_spent)) * 100,2
        ) AS revenue_percentage
FROM customer_lifetime_value
WHERE customer_rank = 1;