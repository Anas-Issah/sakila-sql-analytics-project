-- Create a list of customers and their total spending

WITH customer_spending AS(
    SELECT customer_id, SUM(amount) total_spent FROM payment
    GROUP BY customer_id
)
SELECT * FROM customer_spending
ORDER BY total_spent DESC;