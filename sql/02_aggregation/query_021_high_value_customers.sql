--customers who's total spending is greater than 150

SELECT customer_id, SUM(amount) AS total_spent FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150
ORDER BY total_spent DESC;