--Customers whose average payments is greater than $4

SELECT customer_id, AVG(amount) AS average_payment FROM payment
GROUP BY customer_id
HAVING AVG(amount) > 4
ORDER BY average_payment DESC;