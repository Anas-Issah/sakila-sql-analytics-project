WITH customer_segment AS(
    SELECT customer_id,customer_name,rental_count,total_spent,
    CASE
        WHEN rental_count > 15 and total_spent >= 100
                                THEN 'High Value'
        WHEN rental_count > 15 THEN 'Loyal'
        WHEN total_spent >= 100 THEN 'High Spender'
        WHEN rental_count > 5 THEN 'Regular'
        WHEN rental_count > 0 THEN 'Occasional'
        WHEN rental_count = 0 THEN 'Inactive'
    END
        AS customer_segment
FROM customer_spending_summary
)
SELECT customer_segment,
    COUNT(customer_id) AS customer_count,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent),2) AS average_customer_spend,
    ROUND(AVG(rental_count),2) AS average_rental_count
FROM customer_segment
GROUP BY customer_segment;