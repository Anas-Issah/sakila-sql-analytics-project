--How much each customer has spent in total

SELECT customer_id, SUM(amount) total_revenue FROM payment
GROUP BY customer_id
ORDER BY total_revenue DESC;