--Calculate how much each customer spent in each month

SELECT customer_id,DATE_TRUNC('Month',payment_date) AS month,SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id,DATE_TRUNC('Month',payment_date)
    ORDER BY customer_id;