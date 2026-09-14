--Find customers who
--1.Have made more than 30 payments and
--2.Have spent more than $150

SELECT customer_id,COUNT(*) AS payment_count, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150 AND COUNT(*) > 30;