--Classify every customer based on their total spending

WITH customer_totals AS (
    SELECT customer_id,SUM(amount) AS total_spent FROM payment
    GROUP BY customer_id
)
SELECT customer_id,total_spent,
    CASE
        WHEN total_spent >= 150 THEN 'VIP'
        WHEN total_spent >= 100 THEN 'HIGH'
        WHEN total_spent >= 50 THEN 'MEDIUM'
        ELSE 'LOW'
    END
    AS customer_category
    FROM customer_totals
    ORDER BY total_spent DESC;