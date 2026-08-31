--Create a report showing customers who have made more 30 payments

WITH customer_payment AS(
    SELECT customer_id, COUNT(*) AS payment_count,
    SUM(amount) AS total_spent FROM payment
    GROUP BY customer_id
)
SELECT customer_id, payment_count,total_spent FROM customer_payment
WHERE payment_count > 30
ORDER BY payment_count DESC;