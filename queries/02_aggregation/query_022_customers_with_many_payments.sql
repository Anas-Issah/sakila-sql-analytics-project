--Customers who have made more than 30 payments

SELECT customer_id, COUNT(*) AS payment_count 
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 30
ORDER BY payment_count DESC;
