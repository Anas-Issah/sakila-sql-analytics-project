--What is the average payment amount for each customer

SELECT customer_id, AVG(amount) AS average_payment
FROM payment
GROUP BY customer_id
ORDER BY average_payment DESC;