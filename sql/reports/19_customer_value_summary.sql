WITH customer_value_analysis AS(
    SELECT customer_id,customer_name,
    rental_count,total_spent,
    average_payment,customer_rank,
    CASE
        WHEN rental_count >= 20 AND total_spent >= 120	THEN 'VIP'
        WHEN rental_count >= 20 THEN 'Frequent Customer'
        WHEN total_spent >= 120	THEN 'High Spender'
        WHEN rental_count >= 10 THEN 'Regular Customer'
        ELSE 'Low Value'
    END
        AS customer_value_category
FROM customer_lifetime_value
)
SELECT customer_value_category,COUNT(customer_id) AS customer_count,
    SUM(total_spent) AS total_revenue,
   ROUND(
            AVG(total_spent),2
   ) AS average_customer_spend,
    ROUND(
            AVG(rental_count),2
    ) AS average_rental_count
FROM customer_value_analysis
GROUP BY customer_value_category;